var HttpProxyAgent = require('http-proxy-agent');
var request = require('request');
var minimist = require('minimist');
var debug = require('debug');
var proxy = 'http://localhost:3128';
var bunyan = require('bunyan');

var agent = new HttpProxyAgent(proxy);

var argv = minimist(process.argv.slice(2));
var _url = argv['u'];

var logB = bunyan.createLogger({name: 'proxy-text'});


var log = debug('app:log');
// set this namespace to log via console.log 
log.log = console.log.bind(console); // don't forget to bind to console! 

request({
  uri: _url,
  agent: agent,
  timeout: 10000,
  followRedirect: true,
  maxRedirects: 10
}, function(error, response, body) {
   log('body');
   log('response');
   logB.info(response);
});
