'use strict';

const koa = require('koa');
const moment = require('moment');
const cors = require('koa-cors');
const koaLogger = require('koa-logger');
const bodyParser = require('koa-bodyparser');
const staticMiddleware = require('koa-static');

const app = koa();

app.use(cors());

app.use(bodyParser());

app.use(function * () {
  this.body = 'Hi, it works';
});

app.listen(9001, () => {
  console.log(`nodecv server start`);
});

setInterval(() => {
  console.log('tick', moment().format());
}, 1000);
