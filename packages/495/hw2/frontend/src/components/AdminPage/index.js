import React from "react";
import { Button } from "@material-ui/core";
import { UsersPage } from "./UsersPage";
import { BooksPage } from "./BooksPage";

export const AdminPage = () => {
  const [currentPage, setCurrentPage] = React.useState("panel");
  const [isAddBookButtonClicked, setIsAddBookButtonClicked] = React.useState(false);

  const handleBooksButtonClick = () => {
    setCurrentPage("books");
  };

  const handleUsersButtonClick = () => {
    setCurrentPage("users");
  };

  const handleBackButtonClick = () => {
    console.log(isAddBookButtonClicked);
    setCurrentPage(isAddBookButtonClicked ? "books" : "panel");
  };

  const renderPage = () => {
    switch (currentPage) {
      case "panel":
        return (
          <>
            <Button
              variant="contained"
              color="secondary"
              onClick={handleBooksButtonClick}
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
          </>
        );
      case "books":
        return (
          <BooksPage
            handleBackButtonClick={handleBackButtonClick}
            isAddBookButtonClicked={isAddBookButtonClicked}
            setIsAddBookButtonClicked={setIsAddBookButtonClicked}
          />
        );
      case "users":
        return (
          <UsersPage
            handleBackButtonClick={handleBackButtonClick}
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