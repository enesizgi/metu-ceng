const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();

app.use(bodyParser.json());

const port = process.env.PORT || 4000;

// Serve static React files
if (process.env.NODE_ENV === 'production') {
    app.use(express.static('client/build'));

    app.get('*', (req, res) => {
        res.sendFile(path.resolve(__dirname, 'client', 'build', 'index.html'));
    });
}

app.get('/api/date', (req, res) => {
    res.send(new Date());
});

app.listen(port, () => console.log(`Listening on port ${port}`));