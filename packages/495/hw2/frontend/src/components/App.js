import React, { useEffect } from "react";
import { AppBar, Toolbar, Button, Typography } from "@material-ui/core";
import { WelcomePage } from "./WelcomePage";
import { AdminPage } from "./AdminPage/";
import { ProfilePage } from "./ProfilePage";
import { BooksPage } from "./AdminPage/BooksPage";
import { ReviewsPage } from './ReviewsPage';
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
  const [isAdmin, setIsAdmin] = React.useState(false);
  const [currentPage, setCurrentPage] = React.useState("home");
  const [adminCurrentPage, setAdminCurrentPage] = React.useState("panel"); // State for adminPage
  const [isAddBookButtonClicked, setIsAddBookButtonClicked] = React.useState(false); // for author books add button
  const marginStyle = {
    margin: "10px"
  };

  const pages = {
    home: "home",
    profile: "profile",
    admin: "admin",
    books: "books",
    reviews: "reviews"
  };

  useEffect(() => {
    const adminID = "6283fd2ac3ac799e65415025";
    setIsAdmin(currentUser?.id === adminID);
    if (currentUser?.id === adminID) {
      setCurrentPage(pages.admin);
    }
  }, [currentUser, pages.admin]);

  return (
    <div className="App">
      <AppBar position="sticky">
        <Toolbar>
          <AppName />
          {currentUser && (
            <>
              <Button
                variant="contained"
                color="secondary"
                onClick={async () => {
                  setCurrentPage(isAdmin ? pages.admin : pages.home);
                  if (isAdmin) {
                    setAdminCurrentPage("panel");
                  }
                }}
                style={marginStyle}
              >
                <Typography variant="button">Home</Typography>
              </Button>
              {!isAdmin &&
                <Button
                  variant="contained"
                  color="secondary"
                  onClick={async () => {
                    setCurrentPage(pages.reviews);
                  }}
                  style={marginStyle}
                >
                  <Typography variant="button">Reviews</Typography>
                </Button>
              }
              {!isAdmin &&
                <Button
                  variant="contained"
                  color="secondary"
                  onClick={async () => {
                    setCurrentPage(pages.books);
                  }}
                  style={marginStyle}
                >
                  <Typography variant="button">Books</Typography>
                </Button>
              }
              {!isAdmin &&
                <Button
                  variant="contained"
                  color="secondary"
                  onClick={async () => {
                    setCurrentPage(pages.profile);
                  }}
                  style={marginStyle}
                >
                  <Typography variant="button">Profile</Typography>
                </Button>
              }
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
                style={marginStyle}
              >
                <Typography variant="button">Log Out</Typography>
              </Button>
            </>
          )}
        </Toolbar>
      </AppBar>
      {currentUser && isAdmin && currentPage === pages.admin &&
        <AdminPage
          adminCurrentPage={adminCurrentPage}
          setAdminCurrentPage={setAdminCurrentPage}
        />
      }
      {!currentUser && !isAdmin && currentPage === pages.home && <WelcomePage />}
      {currentUser && !isAdmin && currentPage === pages.reviews && (
        <ReviewsPage
          isAddBookButtonClicked={isAddBookButtonClicked}
          setIsAddBookButtonClicked={setIsAddBookButtonClicked}
        />
      )}
      {currentUser && !isAdmin && currentPage === pages.books && (
        <BooksPage
          isAddBookButtonClicked={isAddBookButtonClicked}
          setIsAddBookButtonClicked={setIsAddBookButtonClicked}
        />
      )}
      {!isAdmin && currentUser && currentPage === pages.profile &&
        <ProfilePage
          currentUser={currentUser}
          isAdmin={isAdmin}
        />}
    </div>
  );
}
