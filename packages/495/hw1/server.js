import express from 'express';
import bodyParser from 'body-parser';
import path from 'path';
import fetch from 'node-fetch';
import cors from 'cors';
import axios from 'axios';
import { mapSeries } from 'async';

const app = express();

app.use(cors());

app.use(bodyParser.json());

const port = process.env.PORT || 4000;

// Serve static React files
if (process.env.NODE_ENV === 'production') {
    app.use(express.static('client/build'));

    app.get('/', (req, res) => {
        res.sendFile(path.resolve(path.resolve(), 'client', 'build', 'index.html'));
    });
}

app.post('/api/bored', async (req, res) => {
    const tableHours = req.body.tableHours;

    const tableHoursWithEvents = await mapSeries(tableHours, async (row) => {
        const rowWithActivity = await mapSeries(row, async (newTableHour) => {
            // console.log(newTableHour);
            if (!newTableHour.selected) {
                return { ...newTableHour, activity: {} };
            }

            const randInt = Math.floor(Math.random() * 5) + 1;
            const response = await axios(`https://www.boredapi.com/api/activity/?participants=${randInt}`);
            // console.log(response);
            // console.log(response.data);
            if (response.status !== 200) {
                return { ...newTableHour, activity: {} };
            };
            const data = response.data;
            console.log(data);
            return { ...newTableHour, activity: data };
        });
        // console.log(row);

        return rowWithActivity;
    });

    res.send(tableHoursWithEvents);
});

app.post('/api/movies', async (req, res) => {
    const tableHours = req.body.tableHours;
    console.log(JSON.stringify(tableHours));
    const tableHoursWithMovies = await mapSeries(tableHours, async (row) => {
        const rowWithActivity = await mapSeries(row, async (newTableHour) => {
            // console.log(newTableHour);
            if (!newTableHour.selected) {
                return { ...newTableHour, activity: {} };
            }
            const response = await axios(`https://k2maan-moviehut.herokuapp.com/api/random`);
            if (response.status !== 200) {
                return { ...newTableHour, activity: {} };
            };
            const data = response.data;
            console.log(data);
            return { ...newTableHour, activity: data };
        });
        // console.log(row);

        return rowWithActivity;
    });

    res.send(tableHoursWithMovies);
});

app.listen(port, () => console.log(`Listening on port ${port}`));