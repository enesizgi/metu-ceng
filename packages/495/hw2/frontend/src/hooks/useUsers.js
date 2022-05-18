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

export const useUsers = () => {
  const realmApp = useRealmApp();
  const [users, setUsers] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  const userCollection = useCollection({
    cluster: dataSourceName,
    db: "data",
    collection: "users",
  });

  useEffect(() => {
    userCollection.find({}).then((fetchedUsers) => {
      setUsers(fetchedUsers);
      setLoading(false);
    });
  }, [userCollection]);

  useWatch(userCollection, {
    onInsert: (change) => {
      setUsers((oldUsers) => {
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
      setUsers((oldUsers) => {
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
      setUsers((oldUsers) => {
        if (loading) {
          return oldUsers;
        }
        const idx = getTodoIndex(oldUsers, change.fullDocument);
        return replaceValueAtIndex(oldUsers, idx, change.fullDocument);
      });
    },
    onDelete: (change) => {
      setUsers((oldUsers) => {
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

  const saveUser = async (draftUser) => {
    if (draftUser.username) {
      draftUser._partition = realmApp.currentUser.id;
      try {
        await userCollection.insertOne(draftUser);
      } catch (err) {
        if (err.error.match(/^Duplicate key error/)) {
          console.warn(
            `The following error means that we tried to insert a todo multiple times (i.e. an existing todo has the same _id). In this app we just catch the error and move on. In your app, you might want to debounce the save input or implement an additional loading state to avoid sending the request in the first place.`
          );
        }
        console.error(err);
      }
    }
  };

  // Toggle whether or not a given todo is complete
  const toggleUser = async (user) => {
    await userCollection.updateOne(
      { _id: user._id },
      { $set: { isComplete: !user.isComplete } }
    );
  };

  // Delete a given todo
  const deleteUser = async (user) => {
    await userCollection.deleteOne({ _id: user._id });
  };

  return {
    loading,
    users,
    saveUser,
    toggleUser,
    deleteUser,
  };

};