import React from "react";
import {
    IconButton,
    ListItem,
    ListItemSecondaryAction,
    ListItemText,
} from "@material-ui/core";
import ClearIcon from "@material-ui/icons/Clear";

export const UserItem = ({ user, userActions }) => {
    console.log(user);
    return (
        <ListItem>
            <ListItemText>{user.username}</ListItemText>
            <ListItemSecondaryAction>
                <IconButton
                    edge="end"
                    size="small"
                    onClick={() => {
                        if (user.username !== "admin") {
                            userActions.deleteUser(user);
                        }
                    }}
                >
                    <ClearIcon />
                </IconButton>
            </ListItemSecondaryAction>
        </ListItem>
    );
};