import React from "react";
import { useBooks } from "../../hooks/useBooks";
import {
  Container,
  Button,
  LinearProgress,
  Card,
  TextField,
  InputLabel,
  Select,
  MenuItem
} from "@material-ui/core";
import AddIcon from "@material-ui/icons/Add";
import { BookItem } from "../BookItem";
import { useShowLoader } from "../../hooks/util-hooks";
import { useRealmApp } from "../RealmApp";
import { useUsers } from "../../hooks/useUsers";

export const BooksPage = ({
  handleBackButtonClick,
  isAddBookButtonClicked,
  setIsAddBookButtonClicked,
  isAdmin
}) => {
  const realmApp = useRealmApp();
  const [pageNumber, setPageNumber] = React.useState(1);
  const { loading, books, totalBooks, ...bookActions } = useBooks(0, pageNumber);
  const { users } = useUsers(1);
  const showLoader = useShowLoader(loading, 200);
  const [tempBook, setTempBook] = React.useState({
    isFiction: true,
    Genre: "Mystery"
  });
  const [isReviewButtonClicked, setIsReviewButtonClicked] = React.useState(false);
  console.log(tempBook);
  const textFieldStyle = {
    margin: "10px"
  };

  const textFieldLabels = {
    name: "Name",
    author: "Author",
    translator: "Translator",
    editor: "Editor",
    coverImageUrl: "Cover Image URL",
    publisher: "Publisher",
    year: "Year"
  };

  const dropdownLabels = {
    isFiction: "isFiction",
    genre: "Genre"
  };

  const handleTextFieldChange = label => e => {
    const newBook = { ...tempBook, [label]: e.target.value };
    setTempBook(newBook);
  };

  const reviewChangeHandler = e => {
    const reviews = tempBook?.reviews || {};
    const newReviews = { ...reviews, [realmApp.currentUser.id]: e.target.value };
    const newBook = { ...tempBook, reviews: newReviews };
    setTempBook(newBook);
  };

  return (
    <>
      {(isAdmin || isAddBookButtonClicked || isReviewButtonClicked) && (
        <Button
          variant="contained"
          color="secondary"
          onClick={() => {
            if (isAdmin) {
              handleBackButtonClick();
            }
            setIsAddBookButtonClicked(false);
            setIsReviewButtonClicked(false);
          }}
          style={{ margin: "10px" }}
        >
          Go Back
        </Button>
      )}
      <Container maxWidth={false}>
        {loading && showLoader && <LinearProgress />}
        {!loading && !showLoader && !isAddBookButtonClicked && !isReviewButtonClicked && (
          <>
            <div className="title-container">
              <h2 className="title-container">
                {`There are ${totalBooks} book${totalBooks === 1 ? "" : "s"
                  }`}
              </h2>
              {(isAdmin || users[0]?.isAuthor) && (
                <Button
                  variant="contained"
                  color="primary"
                  startIcon={<AddIcon />}
                  onClick={() => setIsAddBookButtonClicked(true)}
                >
                  Add Book
                </Button>
              )}
              <div style={textFieldStyle}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={() => setPageNumber(prev => Math.max(prev - 1, 1))}
                  style={textFieldStyle}
                >
                  Previous Page
                </Button>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={() => setPageNumber(prev => Math.min(prev + 1, Math.ceil(totalBooks / 3)))}
                  style={textFieldStyle}
                >
                  Next Page
                </Button>
              </div>
            </div>
            <div className="main-container">
              {books.map((book) => (
                <Card style={{ margin: "16px", padding: '16px' }}>
                  <BookItem
                    key={Math.random()}
                    book={book}
                    bookActions={bookActions}
                    isAdmin={isAdmin}
                    isAuthor={users[0]?.isAuthor}
                    userID={realmApp.currentUser.id}
                    setIsReviewButtonClicked={setIsReviewButtonClicked}
                    setIsAddBookButtonClicked={setIsAddBookButtonClicked}
                    setTempBook={setTempBook}
                  />
                </Card>
              ))}
            </div>
          </>
        )}
        {!loading && !showLoader && isAddBookButtonClicked && (
          <>
            {tempBook.coverImageUrl && (
              <img
                src={tempBook.coverImageUrl}
                alt="cover"
                style={{ maxWidth: "25%", maxHeight: "25%" }}
              />
            )}
            <Card>
              {Object.entries(textFieldLabels).map(([key, label]) => (
                <TextField
                  key={key}
                  label={label}
                  style={textFieldStyle}
                  onChange={handleTextFieldChange(key)}
                />
              ))}
              <InputLabel
                id="demo-simple-select-label"
                style={textFieldStyle}
              >
                Fiction or Non-fiction?
              </InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={tempBook.isFiction}
                label="Age"
                onChange={handleTextFieldChange(dropdownLabels.isFiction)}
                style={textFieldStyle}
              >
                <MenuItem value={true}>Fiction</MenuItem>
                <MenuItem value={false}>Non-fiction</MenuItem>
              </Select>
              {tempBook.isFiction && (
                <>
                  <InputLabel
                    id="demo-simple-select-label2"
                    style={textFieldStyle}
                  >
                    Genre:
                  </InputLabel>
                  <Select
                    labelId="demo-simple-select-label2"
                    id="demo-simple-select2"
                    value={tempBook.Genre}
                    label="Genre"
                    onChange={handleTextFieldChange(dropdownLabels.genre)}
                    style={textFieldStyle}
                  >
                    <MenuItem value="Mystery">Mystery</MenuItem>
                    <MenuItem value="Thriller">Thriller</MenuItem>
                    <MenuItem value="Horror">Horror</MenuItem>
                    <MenuItem value="Western">Western</MenuItem>
                    <MenuItem value="Romance">Romance</MenuItem>
                    <MenuItem value="Science">Science</MenuItem>
                  </Select>
                </>
              )}
              <Button
                variant="contained"
                color="primary"
                onClick={() => {
                  bookActions.saveBook(tempBook);
                  setIsAddBookButtonClicked(false);
                  setTempBook({
                    isFiction: true,
                    Genre: "Mystery"
                  });
                }}
                style={textFieldStyle}
              >
                Save
              </Button>
            </Card>
          </>
        )}
        {!loading && !showLoader && isReviewButtonClicked && (
          <Card>
          {/* {Object.entries(textFieldLabels).map(([key, label]) => (
            <TextField
              key={key}
              label={label}
              style={textFieldStyle}
              onChange={handleTextFieldChange(key)}
            />
          ))} */}
          <TextField
              label="review"
              style={textFieldStyle}
              onChange={reviewChangeHandler}
              multiline={true}
            />
          <Button
            variant="contained"
            color="primary"
            onClick={() => {
              bookActions.updateBook(tempBook._id, {reviews: tempBook.reviews});
              setIsAddBookButtonClicked(false);
              setIsReviewButtonClicked(false);
              setTempBook({review: ""});
            }}
            style={textFieldStyle}
          >
            Save
          </Button>
        </Card>
        )}
      </Container>
    </>
  );
};