const fs = require('fs');


module.exports = {
  devServer: {
    https: {
      https: true,
      host: '0.0.0.0',
      hotOnly: false,
      key: fs.readFileSync('./public/path/to/example.com+6-key.pem'),
      cert: fs.readFileSync('./public/path/to/example.com+6.pem'),
    },
    // public: 'https://example.test:8080/',
  },
};