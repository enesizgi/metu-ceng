import React from 'react';

const DatePicker = ({ date }) => {
    const localDate = date.toLocaleTimeString('en-US', { hour: 'numeric', minute: 'numeric', hour12: false });
    
    const handleButtonClick = () => {
        console.log('clicked');
    };

    return (
        <button onClick={handleButtonClick}>
            {localDate}
        </button>
    );
};

export default DatePicker;