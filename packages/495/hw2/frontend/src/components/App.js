import React from "react";
import { AppBar, Toolbar, Button, Typography } from "@material-ui/core";
import { WelcomePage } from "./WelcomePage";
import { AdminPage } from "./AdminPage/";
import { RealmAppProvider, useRealmApp } from "./RealmApp";
import { ThemeProvider } from "./Theme";
import { AppName } from "./AppName";
import { appId } from "../realm.json";
import "./App.css";

export default function AppWithRealm() {
  return (
    <ThemeProvider>
      <RealmAppProvider appId={appId}>
        <App />
      </RealmAppProvider>
    </ThemeProvider>
  );
}

function App() {
  const { currentUser, logOut } = useRealmApp();
  const isAdmin = currentUser?.id === "6283fd2ac3ac799e65415025";

  return (
    <div className="App">
      <AppBar position="sticky">
        <Toolbar>
          <AppName />
          {currentUser && (
            <Button
              variant="contained"
              color="secondary"
              onClick={async () => {
                try {
                  await logOut();
                } catch (error) {
                  console.log('error', error);
                }
                window.location.reload();
              }}
            >
              <Typography variant="button">Log Out</Typography>
            </Button>
          )}
        </Toolbar>
      </AppBar>
      {currentUser && isAdmin && <AdminPage />}
      {!currentUser && <WelcomePage />}
    </div>
  );
}
