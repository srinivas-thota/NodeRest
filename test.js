
const express = require('express');
const app = express();
const port = 3000;

// Define your routes here
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Start the server
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
can you write terraform script to create AWS S3 bucket?

