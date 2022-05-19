import React from "react";
import { useBooks } from "../../hooks/useBooks";
import {
  Container,
  Button,
  Typography,
  LinearProgress,
  Card,
} from "@material-ui/core";
import AddIcon from "@material-ui/icons/Add";
import { BookItem } from "../BookItem";
import { useShowLoader } from "../../hooks/util-hooks";

export const BooksPage = ({ handleBackButtonClick }) => {
  const { loading, books, ...bookActions } = useBooks();
  const showLoader = useShowLoader(loading, 200);

  return (
    <>
      <Button
        variant="contained"
        color="secondary"
        onClick={handleBackButtonClick}
      >
        Go Back
      </Button>
      <Container className="main-container" maxWidth="sm">
        {(loading && showLoader) ? (
          <LinearProgress />
        ) : (
          <div className="todo-items-container">
            <Typography component="p" variant="h5">
              {`You have ${books.length} book${books.length === 1 ? "" : "s"
                }`}
            </Typography>
            <Button
              variant="contained"
              color="primary"
              startIcon={<AddIcon />}
              onClick={() => {
                
              }}
            >
              Add User
            </Button>

            {books.map((book) => (
              <Card style={{ width: "600px", height: "300px" }}>
                <BookItem
                  key={String(book._id)}
                  book={book}
                  bookActions={bookActions}
                />
              </Card>
            ))}
          </div>
        )}
      </Container>
    </>
  );
};