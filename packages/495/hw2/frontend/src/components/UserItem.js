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
        <div>
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
            <p>Username: {user?.username}</p>
            <p>Email: {user?.data?.email}</p>
        </div>
    );
};