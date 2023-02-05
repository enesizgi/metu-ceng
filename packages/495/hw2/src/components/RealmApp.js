import React from "react";
import * as Realm from "realm-web";
import { baseUrl } from "../realm.json";

function createRealmApp(id) {
  return new Realm.App({ id, baseUrl });
}

const RealmAppContext = React.createContext(null);

export function RealmAppProvider({ appId, children }) {
  // Store Realm.App in React state. If appId changes, all children will rerender and use the new realmApp.
  const [realmApp, setRealmApp] = React.useState(createRealmApp(appId));
  React.useEffect(() => {
    setRealmApp(createRealmApp(appId));
  }, [appId]);
  // Store the app's current user in state and wrap the built-in auth functions to modify this state
  const [currentUser, setCurrentUser] = React.useState(realmApp.currentUser);
  // Wrap the base logIn function to save the logged in user in state
  const logIn = React.useCallback(
    async (credentials) => {
      await realmApp.logIn(credentials);
      setCurrentUser(realmApp.currentUser);
    },
    [realmApp]
  );
  // Wrap the current user's logOut function to remove the logged out user from state
  const logOut = React.useCallback(async () => {
    await currentUser?.logOut();
    await realmApp.removeUser(currentUser);
    setCurrentUser(realmApp.currentUser);
  }, [realmApp, currentUser]);

  const switchToAdmin = React.useCallback(() => {
    const authenticatedUsers = Object.values(realmApp.allUsers).filter(
      (user) => user.isLoggedIn
    );
    realmApp.switchUser(authenticatedUsers.find((user) => user.id === "6283fd2ac3ac799e65415025"));
    setCurrentUser(realmApp.currentUser);
  }, [realmApp]);

  const switchUser = React.useCallback(
    (userId) => {
      const user = Object.values(realmApp.allUsers).find((user) => user.id === userId);
      if (user) {
        realmApp.switchUser(user);
        setCurrentUser(realmApp.currentUser);
      }
    },
    [realmApp]
  );

  const removeUser = React.useCallback(
    async (userId) => {
      const userToRemove = Object.values(realmApp.allUsers).find(user => user.isLoggedIn);
      await userToRemove.logOut();
      await realmApp.removeUser(userToRemove);
      setCurrentUser(realmApp.currentUser);
      return;
    },
    [realmApp]
  );

  // Override the App's currentUser & logIn properties + include the app-level logout function
  const realmAppContext = React.useMemo(() => {
    return { ...realmApp, switchUser, currentUser, logIn, logOut, switchToAdmin, removeUser };
  }, [realmApp, switchUser, currentUser, logIn, logOut, switchToAdmin, removeUser]);

  return (
    <RealmAppContext.Provider value={realmAppContext}>
      {children}
    </RealmAppContext.Provider>
  );
}

export function useRealmApp() {
  const realmApp = React.useContext(RealmAppContext);
  if (!realmApp) {
    throw new Error(
      `No Realm App found. Make sure to call useRealmApp() inside of a <RealmAppProvider />.`
    );
  }
  return realmApp;
}
