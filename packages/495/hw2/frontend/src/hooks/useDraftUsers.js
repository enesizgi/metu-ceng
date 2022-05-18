import React from "react";
import * as Realm from "realm-web";

export const useDraftUsers = (userID) => {
  const [drafts, setDrafts] = React.useState([]);

  const createDraftUser = () => {
    const draftUser = {
      _id: new Realm.BSON.ObjectID(),
      userID: userID
    };
    setDrafts((d) => [...d, draftUser]);
  }

  const deleteDraftUser = (user) => {
    setDrafts((oldDrafts) => {
      const idx = oldDrafts.findIndex((d) => d._id === user._id);
      return [...oldDrafts.slice(0, idx), ...oldDrafts.slice(idx + 1)];
    });
  };

  return {
    draftUsers: drafts,
    createDraftUser,
    deleteDraftUser
  };
};