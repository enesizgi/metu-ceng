import React from "react";
import { useBooks } from "../../hooks/useBooks";
import {
  Container,
  Button,
  Typography,
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

export const BooksPage = ({
  handleBackButtonClick,
  isAddBookButtonClicked,
  setIsAddBookButtonClicked
}) => {
  const { loading, books, ...bookActions } = useBooks();
  const showLoader = useShowLoader(loading, 200);
  const [tempBook, setTempBook] = React.useState({
    isFiction: true,
  });
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
    publisher: "Publisher"
  };

  const handleTextFieldChange = label => e => {
    const newBook = { ...tempBook, [label]: e.target.value };
    setTempBook(newBook);
  };

  return (
    <>
      <Button
        variant="contained"
        color="secondary"
        onClick={() => {
          handleBackButtonClick();
          setIsAddBookButtonClicked(false);
        }}
      >
        Go Back
      </Button>
      <Container>
        {loading && showLoader && <LinearProgress />}
        {!loading && !showLoader && !isAddBookButtonClicked && (
          <>
            <div className="title-container">
              <h2 className="title-container">
                {`You have ${books.length} book${books.length === 1 ? "" : "s"
                  }`}
              </h2>
              <Button
                variant="contained"
                color="primary"
                startIcon={<AddIcon />}
                onClick={() => setIsAddBookButtonClicked(true)}
              >
                Add Book
              </Button>
            </div>
            <div className="main-container">
              {books.map((book) => (
                <Card style={{ width: "600px", height: "300px", padding: "24px" }}>
                  <BookItem
                    key={String(book._id)}
                    book={book}
                    bookActions={bookActions}
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
                style={{ maxWidth: "40%", maxHeight: "40%" }}
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
                onChange={handleTextFieldChange("isFiction")}
                style={textFieldStyle}
              >
                <MenuItem value={true}>Fiction</MenuItem>
                <MenuItem value={false}>Non-fiction</MenuItem>
              </Select>
              <Button
                variant="contained"
                color="primary"
                onClick={() => {
                  console.log(tempBook);
                  bookActions.saveBook(tempBook);
                  setIsAddBookButtonClicked(false);
                  setTempBook({});
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