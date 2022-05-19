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
        <ListItem>
            <ListItemText>Title:{book?.title}</ListItemText>
            <ListItemSecondaryAction>
                <IconButton
                    edge="end"
                    size="small"
                    onClick={() => {
                    }}
                >
                    <ClearIcon />
                </IconButton>
            </ListItemSecondaryAction>
        </ListItem>
    );
};