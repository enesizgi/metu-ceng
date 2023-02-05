import React, { useEffect, useState, useMemo } from "react";
import { Button, Card, Container, TextField } from "@material-ui/core";
import { useUsers } from "../hooks/useUsers";
import { useBooks } from "../hooks/useBooks";
import { BookItem } from "./BookItem";

export const ProfilePage = ({ currentUser, isAdmin }) => {
  const { loading, users, totalUsers, ...userActions } = useUsers(1);
  const [user, setUser] = useState({});
  const [userID, setUserID] = useState("");
  const [averageRating, setAverageRating] = useState(0);
  const [favoritesPageNumber, setFavoritesPageNumber] = useState(1);
  const { books: favoriteBooks, numberOfReads, totalBooks, ratedBooks, ...bookActions } = useBooks(0, favoritesPageNumber, "profile");
  const userLabels = useMemo(
    () => ({
      username: "username",
    }), []);

  useEffect(() => {
    setUserID(currentUser?.id);
  }, [currentUser]);

  useEffect(() => {
    if (users[0]?.isAuthor) {
      return;
    }
    if (ratedBooks.length > 0) {
      const sum = ratedBooks.reduce((acc, curr) => acc + parseFloat(curr.ratings[userID]), 0);
      setAverageRating(sum / ratedBooks.length);
    }
  }, [ratedBooks, userID, users]);

  const userChangeHandler = label => e => {
    const newUser = { [label]: e.target.value };
    setUser(newUser);
  };

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
          <div style={{ margin: "10px", display: "flex" }}>
            Number of Books Read: {numberOfReads}
          </div>
          {!users[0]?.isAuthor && (
            <div style={{ margin: "10px", display: "flex" }}>
              Average Rating: {averageRating.toFixed(2)}
            </div>
          )}
          <Button
            variant="contained"
            color="secondary"
            onClick={() => userActions.updateUser(userID, { isAuthor: true })}
            style={{ margin: "10px" }}
          >I am an author!</Button>
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
            {`You have ${totalBooks} favorite book${totalBooks === 1 ? "" : "s"
              }`}
          </h2>
          <div style={{ margin: "10px", display: "flex", justifyContent: "center" }}>
            <Button
              variant="contained"
              color="primary"
              onClick={() => setFavoritesPageNumber(prev => Math.max(prev - 1, 1))}
              style={{ margin: "10px" }}
            >
              Previous Page
            </Button>
            <Button
              variant="contained"
              color="primary"
              onClick={() => setFavoritesPageNumber(prev => Math.min(prev + 1, Math.ceil(totalBooks / 3)))}
              style={{ margin: "10px" }}
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
                isAdmin={isAdmin}
                userID={currentUser?.id}
                isReviewDisabled={true}
              />
            </Card>
          ))}
        </div>
      </>
    </>

  );
}