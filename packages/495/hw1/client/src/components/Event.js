import React from 'react';

const Event = ({ date, selectedOption }) => {
    if (!date?.selected) {
        return null;
    }
    const boredText = selectedOption === 'bored' ? date?.activity?.activity : null;
    const moviesText = selectedOption === 'movies' ?
        `${date?.activity?.name} Rating:${date?.activity?.imdbRating}/10 Duration:${date?.activity?.runtime}`
        : null;
    return (
        <div>{boredText || moviesText}</div>
    );
};

export default Event;