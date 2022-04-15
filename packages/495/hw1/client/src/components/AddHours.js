import React from "react";
import moment from "moment";

const AddHours = ({ id, tableHours, removeHandler, startDate, endDate, setStartDate, setEndDate }) => {
    const minValue = moment(new Date()).format('YYYY-MM-DDThh:mm');
    const maxValue = moment(tableHours?.at(-1)?.at(-1).date).format('YYYY-MM-DDThh:mm');
    // console.log('AddHours', startDate, endDate);
    // console.log(tableHours?.at(-1)?.at(-1).date);
    return (
        <div>
            <input
                type='datetime-local'
                value={startDate.format("YYYY-MM-DDTHH:mm")}
                min={minValue}
                max={maxValue}
                onChange={(e) => setStartDate(id, moment(e.target.value))}
                step={'120'}
            />
            <input
                type='datetime-local'
                value={endDate.format("YYYY-MM-DDTHH:mm")}
                min={minValue}
                max={maxValue}
                onChange={(e) => setEndDate(id, moment(e.target.value))}
            />
            <button onClick={removeHandler}>Remove</button>
        </div>
    );
};

export default AddHours;