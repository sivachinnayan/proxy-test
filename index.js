var debug = require('debug');
var http = require('http');

http.get({
    host: 'localhost',
    port: 3128,
    path: 'http://nodejs.org/',
  }, function (response) {
    debug(response);
  });
