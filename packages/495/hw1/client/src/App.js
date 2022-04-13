import React, { useState, useEffect } from 'react';
import './App.css';
import ScTable from './components/ScTable';
import DatePicker from './components/DatePicker';

function App() {
  const [tableHours, setTableHours] = useState([]);

  const generateTableHoursFromCurrentDate = () => {
    const currentDate = new Date();
    currentDate.setHours(9, 0, 0);
    const tableHours = [];
    for (let j = 0; j < 7; j++) {
      const datesForSameDay = [];
      for (let i = 0; i < 16; i++) {
        datesForSameDay.push(new Date(currentDate.getTime()));
        currentDate.setHours(currentDate.getHours() + 1);
      }
      tableHours.push(datesForSameDay);
      currentDate.setHours(currentDate.getHours() - 16);
      currentDate.setDate(currentDate.getDate() + 1);
    }
    // take transpose of tablehours matrix
    const transposedTableHours = tableHours[0].map((col, i) => tableHours.map(row => row[i]));
    return transposedTableHours;
  };

  useEffect(() => {
    setTableHours(generateTableHoursFromCurrentDate());
  }, []);

  // create a date with today at 09:00
  const date = new Date();
  date.setHours(9, 0, 0);

  return (
    <div className="App">
      <ScTable>
        <thead>
          <tr>
            {tableHours[0]?.map((i, index) => (
              <th
                className={`${index === 0 ? 'tableHeaderFirst' : (index === tableHours[0].length - 1 ? 'tableHeaderLast' : '')}`}
                key={i}>
                {i.toLocaleDateString('en-US', { day: 'numeric', month:'numeric', weekday: 'short' })}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {tableHours.map((row, i) => (
            <tr key={i}>
              {row.map((date, j) => (
                <td key={j}>
                  <DatePicker date={date} />
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </ScTable>
    </div>
  );
}

export default App;
