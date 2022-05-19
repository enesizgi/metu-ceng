import React from "react";
import {
  IconButton
} from "@material-ui/core";
import ClearIcon from "@material-ui/icons/Clear";
// import {FavoriteIcon, FavoriteBorderIcon} from '@mui/icons-material';
import { Favorite, FavoriteBorder } from '@material-ui/icons';

export const BookItem = ({ book, bookActions, isAdmin, userID }) => {
  // console.log(userID);
  // const [isFavoriteClicked, setIsFavoriteClicked] = React.useState(false);
  const isFavorite = book?.favoritedBy?.includes(userID);

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
    </div>
  );
};