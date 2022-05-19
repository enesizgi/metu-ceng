import React from "react";
import {
    IconButton,
    ListItem,
    ListItemSecondaryAction,
    ListItemText,
} from "@material-ui/core";
import ClearIcon from "@material-ui/icons/Clear";

export const BookItem = ({ book, bookActions }) => {
    console.log(book);
    return (
        <div>
            {book.coverImageUrl && (
                <img
                    src={book.coverImageUrl}
                    alt="cover"
                    style={{ maxWidth: "40%", maxHeight: "40%" }}
                />
            )}

            <IconButton
                edge="end"
                size="small"
                onClick={() => {
                    bookActions.deleteBook(book);
                }}
            >
                <ClearIcon />
            </IconButton>
            <p>Title: {book?.title}</p>
            <p>Author: {book?.author}</p>
            <p>Translator: {book?.translator}</p>
            <p>Editor: {book?.editor}</p>
            <p>Publisher: {book?.publisher}</p>
            <p>ISBN: {book?.isbn}</p>
            <p>ISBN13: {book?.isbn13}</p>
            <p>Pages: {book?.pages}</p>
            <p>Price: {book?.price}</p>
        </div>
    );
};