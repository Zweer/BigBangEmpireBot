type offer = {
  price: number; // 2.99,
  price_string: string; // "2.99 $",
  currency: string; // "USD",
  currency_symbol: null,
  locale: string; // "en_US",
  payment_method: number; // 1,
  content: {
    premium_amount: number; // 250
  },
  display_info: {
    background: string; // "supervillain1_package.png",
    item: string; // "supervillain1_chest_<gender>_i.png",
    index: number; // 102,
    limit: number; // 999,
    name: string; // "Suspenders of the Insane Sex Bomb",
    slot_name: string; // "Chest",
    description: string; // "This package contains the epic item Suspenders of the Insane Sex Bomb from our Supervillain collection.",
    available_time_start: string; // "2017-11-06 00:00:00",
    available_time_end: string; // null,
    modify_buy_button: boolean;
    item_identifiers: string[],
    display: {
      background: string; // "supervillain1_package.png",
      item: string; // "supervillain1_chest_<gender>_i.png"
    },
    category: string; // "supervillain1",
    available_via_voucher: boolean; // true,
    min_level: number; // 0
  },
  is_base_option: null,
  index: null,
  premium_currency_amount: number,
  pricepoint_id: null,
  product_id: null
};

export interface GetStandalonePaymentOffersResponseDto {
  text: {
    [key: string]: string;
  };
  normal_offers: offer[];
  special_offers: offer[];
  consumable_offers: offer[];
}
