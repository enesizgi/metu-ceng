import React, { useEffect, useState, useMemo } from "react";
import { Button, Card, Container, TextField } from "@material-ui/core";
import { useUsers } from "../hooks/useUsers";
import { useBooks } from "../hooks/useBooks";
import { BookItem } from "./BookItem";

export const ProfilePage = ({ currentUser }) => {
  const { loading, users, totalUsers, ...userActions } = useUsers(1);
  const [user, setUser] = useState({});
  const [userID, setUserID] = useState("");
  const [favoritesPageNumber, setFavoritesPageNumber] = useState(1);
  const { books, totalBooks, ...bookActions } = useBooks(0, favoritesPageNumber);
  const [favoriteBooks, setFavoriteBooks] = useState([]);
  const userLabels = useMemo(
    () => ({
      username: "username",
    }), []);

  useEffect(() => {
    setUserID(currentUser?.id);
  }, [currentUser]);

  const userChangeHandler = label => e => {
    const newUser = { [label]: e.target.value };
    setUser(newUser);
  };

  useEffect(() => {
    const tempBooks = books.filter(book => book?.favoritedBy?.includes(currentUser.id));
    setFavoriteBooks(tempBooks);
  }, [books, currentUser]);

  return (
    <>
      <Container
        maxWidth="sm"
        style={{
          marginTop: "32px"
        }}
      >
        <Card>
          <div
            style={{ margin: "10px", fontSize: "30px", display: "flex", justifyContent: "center" }}
          >Profile Page</div>
          <div style={{ margin: "10px", display: "flex" }}>
            Username:
            <TextField
              value={user.username || users[0]?.username}
              onChange={userChangeHandler(userLabels.username)}
              style={{ marginLeft: "16px" }}
            />
          </div>
          <Button
            variant="contained"
            color="secondary"
            onClick={() => userActions.updateUser(userID, user)}
            style={{ margin: "10px" }}
          >Save</Button>

        </Card>
      </Container>

      <>
        <div>
          <h2 className="title-container">
            {`You have ${favoriteBooks.length} favorite book${favoriteBooks.length === 1 ? "" : "s"
              }`}
          </h2>
          {/* <Button
            variant="contained"
            color="primary"
            startIcon={<AddIcon />}
            onClick={() => setIsAddBookButtonClicked(true)}
          >
            Add Book
          </Button> */}
          <div style={{margin: "10px", display: "flex", justifyContent:"center"}}>
            <Button
              variant="contained"
              color="primary"
              onClick={() => setFavoritesPageNumber(prev => Math.max(prev - 1, 1))}
              style={{margin: "10px"}}
            >
              Previous Page
            </Button>
            <Button
              variant="contained"
              color="primary"
              onClick={() => setFavoritesPageNumber(prev => Math.min(prev + 1, Math.ceil(favoriteBooks.length / 3)))}
              style={{margin: "10px"}}
            >
              Next Page
            </Button>
          </div>
        </div>
        <div className="main-container">
          {favoriteBooks.map((book) => (
            <Card style={{ margin: "16px", padding: '16px' }}>
              <BookItem
                key={String(book._id)}
                book={book}
                bookActions={bookActions}
                isDeleteDisabled={true}
                userID={currentUser?.id}
              />
            </Card>
          ))}
        </div>
      </>
    </>

  );
}