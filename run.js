'use strict';

const koa = require('koa');
const moment = require('moment');

const app = koa();

app.use(function * () {
  this.body = 'Hi, it works';
});

app.listen(9001, () => {
  console.log(`nodecv server start`);
});

setInterval(() => {
  console.log('tick', moment().format());
}, 1000);
