'use strict';
var HttpProxyAgent = require('http-proxy-agent');
var HttpsProxyAgent = require('https-proxy-agent');
var request = require('request');
var minimist = require('minimist');
var debug = require('debug');
var proxy = 'http://localhost:3128';
var bunyan = require('bunyan');

var agent = new HttpProxyAgent(proxy);
var agents = new HttpsProxyAgent(proxy);

var argv = minimist(process.argv.slice(2));
var url = argv.u;

var logB = bunyan.createLogger({ name: 'proxy-text' });
var log = debug('app:log');
log.log = console.log.bind(console);
var config = {
    uri: url,
    agent: agents,
    timeout: 10000,
    followRedirect: true,
    maxRedirects: 10,
  };

request(config, function (error, response) {
    if (error) {
      log(error);
    }

    log('body');
    log('response');
    logB.info(response);
  });
