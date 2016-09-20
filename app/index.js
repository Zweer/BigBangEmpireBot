'use strict';

const config = require('config');

const BBE = require('./lib/bbe');
const BBET = require('./lib/telegram');

const bbe = new BBE(config.get('bbe'));
const bbet = new BBET(config.get('telegram'), bbe);
