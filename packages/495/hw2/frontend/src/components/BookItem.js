import React, { useMemo } from "react";
import {
  IconButton,
  Button
} from "@material-ui/core";
import { Rating } from '@mui/material';
import ClearIcon from "@material-ui/icons/Clear";
import { Favorite, FavoriteBorder } from '@material-ui/icons';
import AddIcon from "@material-ui/icons/Add";

export const BookItem = ({
  book, bookActions, isAdmin, userID, isAuthor,
  setIsReviewButtonClicked, setIsAddBookButtonClicked,
  isReviewDisabled, setTempBook, isRatingDisabled, showReview,
  showRating
}) => {
  if (book.author === "asdfasdf") {
    console.log(book);
  }
  const isFavorite = book?.favoritedBy?.includes(userID);
  const rating = Object.values(book?.ratings || {});
  const ratingValue = rating.length ? rating.reduce((a, b) => a + b) / rating.length : 0;
  const review = book?.reviews?.[userID];
  const yourRating = book?.ratings?.[userID];

  const isBookReviewed = useMemo(() => {
    return Object.keys(book?.reviews || {}).includes(userID);
  }, [book, userID]);

  console.log('review', review);

  return (
    <div>
      {book.coverImageUrl && (
        <img
          src={book.coverImageUrl}
          alt="cover"
          style={{ maxWidth: "40%", maxHeight: "40%" }}
        />
      )}

      {isAdmin && (
        <IconButton
          edge="end"
          size="small"
          onClick={() => {
            bookActions.deleteBook(book);
          }}
        >
          <ClearIcon />
        </IconButton>
      )}
      {!isAdmin && (
        <IconButton
          edge="end"
          size="small"
          onClick={() => {
            if (isFavorite) {
              bookActions.removeFromFavoriteBook(book);
            } else {
              bookActions.addToFavoriteBook(book);
            }
          }}
        >
          {isFavorite && <Favorite />}
          {!isFavorite && <FavoriteBorder />}
        </IconButton>
      )}
      <p>Title: {book?.title}</p>
      <p>Author: {book?.author}</p>
      <p>Translator: {book?.translator}</p>
      <p>Editor: {book?.editor}</p>
      <p>Publisher: {book?.publisher}</p>
      <div style={{ marginBottom: "16px" }}>
        Rating:
        <Rating
          value={ratingValue}
          precision={0.1}
          readOnly
        />
      </div>
      {!isAdmin && !isAuthor && !isRatingDisabled && (
        <div>
          Click to rate:
          <Rating
            precision={0.25}
            onChange={e => {
              bookActions.rateABook(e.target.value, book);
            }}
          />
        </div>
      )}
      {!isAuthor && !isAdmin && !isReviewDisabled && (
        <Button
          variant="contained"
          color="primary"
          startIcon={!isBookReviewed && <AddIcon />}
          onClick={() => {
            setIsReviewButtonClicked(true);
            setIsAddBookButtonClicked(false);
            setTempBook({ ...book });
          }}
          style={{ margin: "10px" }}
        >
          {isBookReviewed ? "Edit Review" : "Add Review"}
        </Button>
      )}
      {showReview && (
        <div style={{width: "90%", wordWrap: "break-word", marginTop: "10px"}}>
          Your Review: {review}
        </div>
      )}
      {showRating && yourRating && (
        <div style={{width: "90%", wordWrap: "break-word", marginTop: "10px"}}>
          Your Rating: {yourRating}
        </div>
      )}
    </div>
  );
};