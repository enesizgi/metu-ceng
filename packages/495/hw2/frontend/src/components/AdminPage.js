import React from "react";
import { Button } from "@material-ui/core";

export const AdminPage = () => {
  const [currentPage, setCurrentPage] = React.useState("panel");

  const handleBooksButtonClick = () => {
    setCurrentPage("books");
  };

  const handleUsersButtonClick = () => {
    setCurrentPage("users");
  };

  const handleBackButtonClick = () => {
    setCurrentPage("panel");
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
          <Button
            variant="contained"
            color="secondary"
            onClick={handleBackButtonClick}
          >
            Go Back
          </Button>
        );
      case "users":
        return (
          <Button
            variant="contained"
            color="secondary"
            onClick={handleBackButtonClick}
          >
            Go Back
          </Button>
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