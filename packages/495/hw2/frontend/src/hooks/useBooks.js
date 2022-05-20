import React, { useCallback, useEffect } from "react";
import { useRealmApp } from "../components/RealmApp";
import { useCollection } from "./useCollection";
import { dataSourceName } from "../realm.json";
import { useWatch } from "./useWatch";
import {
  getTodoIndex,
  addValueAtIndex,
  updateValueAtIndex,
  replaceValueAtIndex,
  removeValueAtIndex
} from "../utils";

export const useBooks = (queryLimit, pageNumber, page) => {
  const realmApp = useRealmApp();
  const [books, setBooks] = React.useState([]);
  const [loading, setLoading] = React.useState(true);
  const [totalBooks, setTotalBooks] = React.useState(0);
  const [numberOfReads, setNumberOfReads] = React.useState(0);
  const [ratedBooks, setRatedBooks] = React.useState([]);

  const bookCollection = useCollection({
    cluster: dataSourceName,
    db: "data",
    collection: "books",
  });

  const updateRatedBooks = useCallback(() => {
    bookCollection.find({ [`ratings.${realmApp.currentUser.id}`]: { $exists: true } }).then(i => setRatedBooks(i));
  }, [bookCollection, realmApp.currentUser.id]);

  const updateNumberOfReads = useCallback(() => {
    bookCollection.count({ readings: realmApp.currentUser.id }).then(i => setNumberOfReads(i));
  }, [bookCollection, realmApp.currentUser.id]);

  const updateTotalBooks = useCallback(() => {
    bookCollection.count({ favoritedBy: realmApp.currentUser.id }).then(i => setTotalBooks(i));
  }, [bookCollection, realmApp.currentUser.id]);

  const getFavoriteBooksByUser = useCallback(() => {
    if (page === "profile") {
      updateRatedBooks();
      updateNumberOfReads();
      updateTotalBooks();
      realmApp.currentUser.callFunction("getFavoriteBooksByUser", {
        limit: queryLimit || 3,
        skip: (pageNumber - 1) * (queryLimit || 3),
      }).then(books => {
        setBooks(books);
        setLoading(false);
      });
    }
  }, [pageNumber, queryLimit, realmApp, page, updateRatedBooks, updateNumberOfReads, updateTotalBooks]);

  useEffect(() => {
    if (page === "profile") {
      getFavoriteBooksByUser();
      return;
    }
    bookCollection.count().then(i => setTotalBooks(i));
    realmApp.currentUser.callFunction("getDocumentsWithLimit", {
      limit: queryLimit || 3,
      skip: (pageNumber - 1) * (queryLimit || 3),
      collection: "books"
    }).then(books => {
      setBooks(books);
      setLoading(false);
    });
  }, [bookCollection, queryLimit, pageNumber, realmApp.currentUser, page, getFavoriteBooksByUser]);

  useWatch(bookCollection, {
    onInsert: (change) => {
      setBooks((oldUsers) => {
        if (loading) {
          return oldUsers;
        }
        const idx =
          getTodoIndex(oldUsers, change.fullDocument) ?? oldUsers.length;
        if (idx === oldUsers.length) {
          return addValueAtIndex(oldUsers, idx, change.fullDocument);
        } else {
          return oldUsers;
        }
      });
    },
    onUpdate: (change) => {
      setBooks((oldUsers) => {
        if (loading) {
          return oldUsers;
        }
        const idx = getTodoIndex(oldUsers, change.fullDocument);
        return updateValueAtIndex(oldUsers, idx, () => {
          return change.fullDocument;
        });
      });
    },
    onReplace: (change) => {
      setBooks((oldUsers) => {
        if (loading) {
          return oldUsers;
        }
        const idx = getTodoIndex(oldUsers, change.fullDocument);
        return replaceValueAtIndex(oldUsers, idx, change.fullDocument);
      });
    },
    onDelete: (change) => {
      setBooks((oldUsers) => {
        if (loading) {
          return oldUsers;
        }
        const idx = getTodoIndex(oldUsers, { _id: change.documentKey._id });
        if (idx >= 0) {
          return removeValueAtIndex(oldUsers, idx);
        } else {
          return oldUsers;
        }
      });
    },
  });

  const saveBook = async (draftBook) => {
    draftBook._partition = realmApp.currentUser.id;
    try {
      await bookCollection.insertOne(draftBook);
    } catch (err) {
      if (err.error.match(/^Duplicate key error/)) {
        console.warn(
          `The following error means that we tried to insert a todo multiple times (i.e. an existing todo has the same _id). In this app we just catch the error and move on. In your app, you might want to debounce the save input or implement an additional loading state to avoid sending the request in the first place.`
        );
      }
      console.error(err);
    }
  };

  const updateBook = async (bookID, updatedFields) => {
    try {
      console.log(bookID, updatedFields);
      await bookCollection.updateOne(
        { _id: bookID },
        { $set: updatedFields }
      );
    } catch (err) {
      console.error(err);
    }
  };

  const addToFavoriteBook = async (book) => {
    try {
      await realmApp.currentUser.callFunction("addBookToFavorite", {
        bookID: String(book._id),
      });
      getFavoriteBooksByUser();
    } catch (err) {
      console.error(err);
    }
  };

  const removeFromFavoriteBook = async (book) => {
    try {
      await realmApp.currentUser.callFunction("removeBookFromFavorite", {
        bookID: String(book._id),
      });
      getFavoriteBooksByUser();
    } catch (err) {
      console.error(err);
    }
  };

  const rateABook = async (rating, book) => {
    try {
      await realmApp.currentUser.callFunction("rateABook", {
        bookID: String(book._id),
        rating: parseFloat(rating)
      });
      updateNumberOfReads();
      updateRatedBooks();
    } catch (err) {
      console.error(err);
    }
  }
  // Delete a given todo
  const deleteBook = async (book) => {
    await bookCollection.deleteOne({ _id: book._id });
  };

  return {
    loading,
    books,
    totalBooks,
    saveBook,
    deleteBook,
    updateBook,
    addToFavoriteBook,
    removeFromFavoriteBook,
    rateABook,
    numberOfReads,
    ratedBooks
  };
};