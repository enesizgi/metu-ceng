import React from "react";
import {
  IconButton
} from "@material-ui/core";
import { Rating } from '@mui/material';
import ClearIcon from "@material-ui/icons/Clear";
import { Favorite, FavoriteBorder } from '@material-ui/icons';

export const BookItem = ({ book, bookActions, isAdmin, userID }) => {
  const isFavorite = book?.favoritedBy?.includes(userID);
  const rating = Object.values(book?.ratings || {});
  const ratingValue = rating.length ? rating.reduce((a, b) => a + b) / rating.length : 0;

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
      <div style={{marginBottom: "16px"}}>
        Rating:
        <Rating
          value={ratingValue}
          precision={0.1}
          readOnly
        />
      </div>
      {!isAdmin && (
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
    </div>
  );
};