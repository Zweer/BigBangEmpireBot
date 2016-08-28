'use strict';

const config = require('config');

const BBE = require('./lib/bbe');

const bbe = new BBE(config.get('auth'));
