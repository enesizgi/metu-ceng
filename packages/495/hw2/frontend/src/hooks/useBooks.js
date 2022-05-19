import React, { useEffect } from "react";
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

export const useBooks = (pageNumber) => {
  const realmApp = useRealmApp();
  const [books, setBooks] = React.useState([]);
  const [loading, setLoading] = React.useState(true);
  const [totalBooks, setTotalBooks] = React.useState(0);

  const bookCollection = useCollection({
    cluster: dataSourceName,
    db: "data",
    collection: "books",
  });

  useEffect(() => {
    bookCollection.count().then(i => setTotalBooks(i));
    realmApp.currentUser.callFunction("getDocumentsWithLimit", {
      limit: 3,
      skip: (pageNumber - 1) * 3,
      collection: "books"
    }).then(books => {
      console.log(books);
      setBooks(books);
      setLoading(false);
    });
  }, [bookCollection, pageNumber, realmApp.currentUser]);

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

  // Delete a given todo
  const deleteBook = async (book) => {
    await bookCollection.deleteOne({ _id: book._id });
  };

  return {
    loading,
    books,
    totalBooks,
    saveBook,
    deleteBook
  };
};