'use strict';

module.exports = {
  auth: {
    delaySyncGame: 10000,

    platform: 'steam',
    platform_user_id: 'your steam id',
    steam_access_token: 'steam generated password',
  },

  telegram: {
    id: 'telegram api',
    options: {
      polling: true,
    },
  },
};
