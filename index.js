//var request = require('request');
//var http = require('http');
//var debug = require('debug');
//
//var r = request.defaults({'proxy':'http://localhost:3128'})
//
//http.createServer(function (req, resp) {
//  console.log(req);
//  debug(req);
//  if (req.url === '/doodle.png') {
//    r.get('http://google.com/doodle.png').pipe(resp)
//  }
//});
'use strict';
var debug = require('debug');
var http = require('http');

http.get({
    host: 'localhost',
    port: 3128,
    path: 'http://nodejs.org/'
}, function (response) {
    debug(response);
});
