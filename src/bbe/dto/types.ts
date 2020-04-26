export type locales = 'de_DE' | 'fr_FR' | 'pl_PL' | 'en_GB' | 'es_ES' | 'el_GR' | 'pt_BR' | 'en_US' | 'en_AP' | 'tr_TR' | 'it_IT' | 'ru_RU' | 'cs_CZ' | 'bg_BG' | 'ro_RO' | 'hr_HR' | 'lt_LT';

export type specialOffers = {
  [name: string]: {
    test: boolean; // false
    index: number; // 0
    active: boolean; // true
    available_time_start: string; // null,
    available_time_end: string; // null,
    notify_user: boolean; // false
    modify_buy_button: boolean; // false
    limit: number; // 1
    name_identifier: string; // 'starter_package'
    description_identifier: string; // 'starter_package'
    user_type: number; // 1
    display: {
      image: string; // 'starter_package.png'
    },
    offers: {
      [locale in locales]: {
        currency: string; // 'EUR'
        price: string; // '4.99'
        game_currency_amount: number; // 1250
        payment_methods: string[];
      };
    };
  };
};

export type ingameNotifications = {
  [name: string]: {
    test: boolean; // false
    index: number; // 0
    active: boolean; // true
    available_time_start: string; // '2020-03-21 00:00:00'
    available_time_end: string; // '2020-06-20 23:59:59'
    text_identifier: string; // 'spring_item_set_notification'
    frequency: number; // 1
    redirect_to_payment_dialog: boolean; // false
    display: {
      image: string; // 'spring_item_set_notification.png'
      html: boolean; // true
      custom_button_text: boolean; // false
      min_level: number; // 5
    };
  };
};

export type bonusInfo = {
  bonus_datas: {
    event_id: string; // 'waifus_and_husbandos_event_nad'
    date: number; // 1587452400
    type: number; // 8
    value: number; // 2
  }[];
};
