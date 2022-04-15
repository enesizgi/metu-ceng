import React, { useState, useEffect } from 'react';
import './App.css';
import ScTable from './components/ScTable';
import Event from './components/Event';
import AddHours from './components/AddHours';
import moment from 'moment';
import mapLimit from 'async/mapLimit';

function App() {
  const [tableHours, setTableHours] = useState([]);
  const [rowTitles, setRowTitles] = useState([]);
  const [addHoursList, setAddHoursList] = useState({});
  const [selectedOption, setSelectedOption] = useState('bored');
  const [isLoading, setIsLoading] = useState(false);
  useEffect(() => {
    const generateTableHoursFromCurrentDate = () => {
      const currentDate = new Date();
      currentDate.setHours(9, 0, 0);
      const tableHours = [];
      for (let j = 0; j < 7; j++) {
        const datesForSameDay = [];
        for (let i = 0; i < 15; i++) {
          datesForSameDay.push({ date: new Date(currentDate.getTime()) });
          currentDate.setHours(currentDate.getHours() + 1);
        }
        tableHours.push(datesForSameDay);
        currentDate.setHours(9, 0, 0);
      }
      // take transpose of tablehours matrix
      const transposedTableHours = tableHours[0].map((col, i) => tableHours.map(row => row[i]));
      return transposedTableHours;
    };

    const transposedTableHours = generateTableHoursFromCurrentDate();

    const rowTitles = transposedTableHours.map((row, i) => {
      const tempDate = new Date(row[0].date.getTime());
      const options = { hour: 'numeric', minute: 'numeric', hour12: false };
      const firstPart = tempDate.toLocaleTimeString('tr-TR', options);
      tempDate.setHours(tempDate.getHours() + 1);
      const secondPart = tempDate.toLocaleTimeString('tr-TR', options);
      return `${firstPart} - ${secondPart}`;
    });

    const initialAddHoursList = () => {
      const newAddHoursList = {};
      const id = Math.random();
      newAddHoursList[id] = { startDate: moment(), endDate: moment(transposedTableHours?.at(-1)?.at(-1).date) };
      setAddHoursList(newAddHoursList);
    };

    initialAddHoursList();

    setRowTitles(rowTitles);
    setTableHours(transposedTableHours);
  }, []);

  const addHoursRemoveHandler = id => () => {
    const newAddHoursList = { ...addHoursList };
    delete newAddHoursList[id];
    setAddHoursList(newAddHoursList);
  };

  const addHoursAddHandler = (e, startDate = moment(), endDate = moment(tableHours?.at(-1)?.at(-1).date)) => {
    const newAddHoursList = { ...addHoursList };
    const id = Math.random();
    newAddHoursList[id] = { startDate, endDate };
    setAddHoursList(newAddHoursList);
  };

  const setStartDate = (id, startDate) => {
    const newAddHoursList = { ...addHoursList };
    newAddHoursList[id].startDate = startDate;
    setAddHoursList(newAddHoursList);
  };

  const setEndDate = (id, endDate) => {
    const newAddHoursList = { ...addHoursList };
    newAddHoursList[id].endDate = endDate;
    setAddHoursList(newAddHoursList);
  };

  const selectedOptionChangeHandler = e => {
    setSelectedOption(e.target.value);
  };

  const scheduleButtonHandler = async (e) => {
    setIsLoading(true);
    const newTableHours = tableHours.map(row => row.map(cell => {
      const momentDate = moment(cell.date);
      const skipCounter = 0;
      const selected = Object.values(addHoursList).reduce((acc, curr) => {
        switch (selectedOption) {
          case 'bored':
            return momentDate.isBetween(curr.startDate, curr.endDate) ? true : acc;
          case 'movies':
            return momentDate.isBetween(curr.startDate, moment(curr.endDate).subtract(3, 'hours')) ? true : acc;
          default:
            return acc;
        }
      }, false);
      return { date: cell.date, selected };
    }));
    console.log(newTableHours);
    switch (selectedOption) {
      case 'bored':
        // console.log(newTableHours);
        const tableHoursWithEvents = await mapLimit(newTableHours, 10, async (row) => {
          const rowWithActivity = await mapLimit(row, 5, async (newTableHour) => {
            // console.log(newTableHour);
            if (!newTableHour.selected) {
              return { ...newTableHour, activity: {} };
            }
            const randInt = Math.floor(Math.random() * 5) + 1;
            const response = await fetch(`https://www.boredapi.com/api/activity/?participants=${randInt}`);
            if (!response.ok) {
              return { ...newTableHour, activity: {} };
            };
            const data = await response.json();
            // console.log(data);
            return { ...newTableHour, activity: data };
          });
          // console.log(row);

          return rowWithActivity;
        });

        setTableHours(tableHoursWithEvents);
        break;
      case 'movies':
        const tableHoursWithMovies = await mapLimit(newTableHours, 10, async (row) => {
          const rowWithActivity = await mapLimit(row, 5, async (newTableHour) => {
            // console.log(newTableHour);
            if (!newTableHour.selected) {
              return { ...newTableHour, activity: {} };
            }
            const response = await fetch(`https://k2maan-moviehut.herokuapp.com/api/random`);
            if (!response.ok) {
              return { ...newTableHour, activity: {} };
            };
            const data = await response.json();
            // console.log(data);
            return { ...newTableHour, activity: data };
          });
          // console.log(row);

          return rowWithActivity;
        });

        const transposedTableHoursWithMovies = tableHoursWithMovies[0].map((col, i) => tableHoursWithMovies.map(row => row[i]));
        const updatedTableHoursWithMovies = transposedTableHoursWithMovies.map(row => {
          let skipCounter = 0;
          return row.map(cell => {
            if (skipCounter === 1 || skipCounter === 2) {
              skipCounter++;
              return {...cell, selected:false};
            }
            if (skipCounter === 3) {
              skipCounter = 1;
              return cell;
            }
            if (cell.selected) {
              skipCounter++;
              return cell;
            }
            return cell;
          });
        });

        const originalTableHours = updatedTableHoursWithMovies[0].map((col, i) => updatedTableHoursWithMovies.map(row => row[i]));

        console.log(originalTableHours);
        setTableHours(originalTableHours);

        break;
      default:
        break;
    }
    setIsLoading(false);
  };

  return (
    <div className="App">
      {isLoading ? <div>Please wait, we are fetching data!</div> : null}
      <ScTable>
        <thead>
          <tr>
            <td></td>
            {tableHours[0]?.map((i) => (
              <th
                key={i.date}>
                {i?.date?.toLocaleDateString('en-US', { day: 'numeric', month: 'numeric', weekday: 'short' })}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {tableHours.map((row, i) => (
            <tr key={i}>
              <th scope="row">{rowTitles[i]}</th>
              {row.map((date, j) => (
                <td key={j}>
                  <Event
                    date={date}
                    selectedOption={selectedOption}
                  />
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </ScTable>
      <>
        <div>
          Add your free hours
          <button onClick={addHoursAddHandler}>Add</button>
          <label htmlFor='options'>Options</label>
          <select
            value={selectedOption}
            id='options'
            onChange={selectedOptionChangeHandler}
          >
            <option value="bored">I'm bored!</option>
            <option value="movies">I want to watch movies!</option>
          </select>
        </div>
        {Object.entries(addHoursList).map(([id, { startDate, endDate }]) => (
          <AddHours
            id={id}
            key={id}
            startDate={startDate}
            endDate={endDate}
            setStartDate={setStartDate}
            setEndDate={setEndDate}
            removeHandler={addHoursRemoveHandler(id)}
            tableHours={tableHours}
          />
        ))}
        <button onClick={scheduleButtonHandler}>Schedule</button>
      </>
    </div>
  );
}

export default App;
