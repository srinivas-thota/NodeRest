const express = require('express');
const app = express();

// Your middleware and routes here

// Define your routes here
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Define your routes here
app.post('/customers', (req, res) => {
  req.body
});

module.exports = app;