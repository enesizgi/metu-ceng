import React from 'react';

const Event = ({ date, selectedOption }) => {
    if (!date?.selected) {
        return null;
    }
    console.log(date);
    const boredText = selectedOption === 'bored' && date?.activity?.activity ? date?.activity?.activity : null;
    const moviesText = selectedOption === 'movies' && date?.activity?.name ?
        `${date?.activity?.name} Rating:${date?.activity?.imdbRating}/10 Duration:${date?.activity?.runtime}`
        : null;
    return (
        <div>{boredText || moviesText}</div>
    );
};

export default Event;