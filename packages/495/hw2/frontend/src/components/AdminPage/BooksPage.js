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

export const BooksPage = ({
  handleBackButtonClick,
  isAddBookButtonClicked,
  setIsAddBookButtonClicked,
  isAdmin
}) => {
  const realmApp = useRealmApp();
  const [pageNumber, setPageNumber] = React.useState(1);
  const { loading, books, totalBooks, ...bookActions } = useBooks(0, pageNumber);
  const showLoader = useShowLoader(loading, 200);
  const [tempBook, setTempBook] = React.useState({
    isFiction: true
  });

  const textFieldStyle = {
    margin: "10px"
  };

  const textFieldLabels = {
    name: "Name",
    author: "Author",
    translator: "Translator",
    editor: "Editor",
    coverImageUrl: "Cover Image URL",
    publisher: "Publisher"
  };

  const dropdownLabels = {
    isFiction: "isFiction",
    genre: "Genre"
  };

  const handleTextFieldChange = label => e => {
    const newBook = { ...tempBook, [label]: e.target.value };
    setTempBook(newBook);
  };

  return (
    <>
      {isAdmin && (
        <Button
          variant="contained"
          color="secondary"
          onClick={() => {
            handleBackButtonClick();
            setIsAddBookButtonClicked(false);
          }}
          style={{ margin: "10px" }}
        >
          Go Back
        </Button>
      )}
      <Container maxWidth={false}>
        {loading && showLoader && <LinearProgress />}
        {!loading && !showLoader && !isAddBookButtonClicked && (
          <>
            <div className="title-container">
              <h2 className="title-container">
                {`You have ${totalBooks} book${totalBooks === 1 ? "" : "s"
                  }`}
              </h2>
              {isAdmin && (
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
                    userID={realmApp.currentUser.id}
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
                    value={tempBook.genre}
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
                    isFiction: true
                  });
                }}
                style={textFieldStyle}
              >
                Save
              </Button>
            </Card>
          </>
        )}
      </Container>
    </>
  );
};