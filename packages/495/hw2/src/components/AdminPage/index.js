import React from "react";
import { Button } from "@material-ui/core";
import { UsersPage } from "./UsersPage";
import { BooksPage } from "./BooksPage";

export const AdminPage = ({adminCurrentPage, setAdminCurrentPage}) => {
  const [isAddBookButtonClicked, setIsAddBookButtonClicked] = React.useState(false);
  const [isAddUserClicked, setIsAddUserClicked] = React.useState(false);

  const handleBooksButtonClick = () => {
    setAdminCurrentPage("books");
  };

  const handleUsersButtonClick = () => {
    setAdminCurrentPage("users");
  };

  const handleBackButtonClick = () => {
    setAdminCurrentPage(isAddBookButtonClicked ? "books" : (isAddUserClicked ? "users" : "panel"));
  };

  const renderPage = () => {
    switch (adminCurrentPage) {
      case "panel":
        return (
          <div style={{display:'flex', justifyContent: 'center', padding: '16px'}}>
            <Button
              variant="contained"
              color="secondary"
              onClick={handleBooksButtonClick}
              style={{marginRight: '16px'}}
            >
              Books
            </Button>
            <Button
              variant="contained"
              color="secondary"
              onClick={handleUsersButtonClick}
            >
              Users
            </Button>
          </div>
        );
      case "books":
        return (
          <BooksPage
            handleBackButtonClick={handleBackButtonClick}
            isAddBookButtonClicked={isAddBookButtonClicked}
            setIsAddBookButtonClicked={setIsAddBookButtonClicked}
            isAdmin={true}
          />
        );
      case "users":
        return (
          <UsersPage
            handleBackButtonClick={handleBackButtonClick}
            isAddUserClicked={isAddUserClicked}
            setIsAddUserClicked={setIsAddUserClicked}
          />
        );
      default:
        return null;
    };
  };

  return (
    <>
      {renderPage()}
    </>
  );

};