import React from "react";
import {
    IconButton,
} from "@material-ui/core";
import ClearIcon from "@material-ui/icons/Clear";

export const ReviewItem = ({ review, reviewActions }) => {
    return (
        <div>
            <p>Username: {review?.username}</p>
            <p>Email: {review?.data?.email}</p>
        </div>
    );
};