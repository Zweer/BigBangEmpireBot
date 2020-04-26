import { ResponseDataDto } from '../response.data.dto';
import { locales } from '../types';

type platforms = 'standalone' | 'spielaffe' | 'kongregate' | 'facebook' | 'naszaklasa' | 'jeuxjeuxjeux' | 'draugas' | 'clickjogos' | 'vkontakte' | 'odnoklassniki' | 'miniclip' | 'wppl' | 'fog' | 'iplayer' | 'syfygames' | 'gamgos' | 'iframe' | 'idnet' | 'steam' | 'playsimo' | 'nativeapp' | 'android' | 'espritgames' | 'nutaku' | 'eroges' | 'jacquieetmichelgaming_wl' | 'naughtyempire';
type platformSetting = {
  isSSO: boolean; // false,
  hasCustomPayment: boolean; // false,
  isBannerAdvertismentAllowed: boolean; // true,
  isLogoutAdvertismentAllowed: boolean; // true,
  isVideoAdvertismentAllowed: boolean; // true,
  isOfferwallAllowed: boolean; // true,
  isUnbindAllowed: boolean; // false,
  isAutoLoginAllowed: boolean; // true,
  isPaymentGiftingAllowed: boolean; // true,
  isStandaloneLoginAllowed: boolean; // true,
  isFriendInviteAllowed: boolean; // true,
  isVoucherAllowed: boolean; // true,
  showTerms: boolean; // true,
  prerollAdvertismentAllowed: boolean; // true,
  isFriendbarSupported: boolean; // true,
  isPremiumItemShopAllowed: boolean; // true,
  isCustomAdvertismentAllowed: boolean; // true,
  isResourceRequestAllowed: boolean; // true,
  isResourceRequestViaLinkAllowed: boolean; // true,
  isForumLinkAllowed: boolean; // true,
  isSupportLinkAllowed: boolean; // true,
  openSupportInIFrame: boolean; // false,
  showIngameServerSelection: boolean; // false,
  isSSOAutoLoginAllowed: boolean; // false,
  requiredAge: number; // 0,
  hideBraAllowed: boolean; // true,
  hidePantiesAllowed: boolean; // false,
  datingFeatureEnabled: boolean; // true,
  isCharacterSelectionAllowed: boolean; // false,
  fanFotoEnabled: boolean; // false
};
type paymentCurrency = {
  currency: string; // 'EUR',
  symbol: string; // '€',
  rates: { [amount: string]: number };
};
type paymentMethod = {
  id: number;
  link: string;
  linkParams: string;
  amounts: {};
  base_options: {};
};
type paymentBonusOffer = {
  active: boolean;
  test: boolean;
  available_time_start: string; // '2012-01-01 00:00:00',
  available_time_end: string; // '2012-12-01 23:59:59',
  payment_methods: number[],
  'rates': { [locale in locales]: { [rate: string]: number } };
};

export interface ConfigEnvironmentResponseDto extends ResponseDataDto {
  version_check: 'ok',
  extendedConfig: {
    auth: string; // 'VBmalgt2',
    current_version_mobile: string; // 40,
    url_domain: string; // 'bigbangempire.com',
    url_tos: string; // 'https://us3.bigbangempire.com/tos',
    url_tos_ugc: string; // 'https://us3.bigbangempire.com/tos/ugc.php',
    url_policy: string; // 'https://us3.bigbangempire.com/policy',
    url_forum: string; // 'https://forum.us.bigbangempire.com/',
    url_support: string; // 'https://support.bigbangempire.com?setLanguage=en_US',
    url_changelog: string; // 'https://forum.us.bigbangempire.com/index.php?/topic/1215-patch-notes-2020-03-31',
    url_forum_teams: string; // 'https://forum.us.bigbangempire.com/index.php?/forum/43-classifieds-server-3/',
    url_landing_page: string; // 'https://www.bigbangempire.com/',
    url_landing_facebook: string; // 'https://landing-facebook.bigbangempire.com/',
    url_app_rating: string; // 'https://www.bigbangempire.com',
    locales: string[],
    default_locale: string; // 'en_US',
    alternative_locales: null,
    locale_names: { [locale in locales]: string }; // { 'de_DE': 'Deutsch' }
    locale_country_names: { [locale in locales]: string }; // { 'de_DE': 'Deutschland' }
    platform_settings: { [platform in platforms]: platformSetting };
    payment_alternative_locales: null,
    payment_currencies: { [locale in locales]: paymentCurrency };
    payment_methods: paymentMethod[],
    payment_use_decimals: { [locale in locales]: boolean };
    payment_bonus_offers: { [offer: string]: paymentBonusOffer };
    payment_options_overwrite: { [locale in locales]: { [id: string]: number[] } };
    payment_price_overwrite: { [locale in locales]: { [id: string]: { [amount: string]: number } } };
    payment_method_filter: {},
    payment_apple_iap_product_ids: {},
    payment_google_iap_product_ids: {},
    payment_amazon_iap_product_ids: {},
    payment_item_offer_categories: {},
    payment_geo_blocks: {},
    server_id: string; // 'us3',
    game_id: string; // 'pstar',
    registration_enabled: boolean; // true,
    dungeons_enabled: boolean; // true,
    tournaments_enabled: boolean; // false,
    movie_tournaments_enabled: boolean; // true,
    itemsets_enabled: boolean; // false,
    special_offer_shop_enabled: boolean; // true,
    socket_communication_enabled: boolean; // true,
    emoticons_enabled: boolean; // true,
    titles_enabled: boolean; // true,
    storygoals_enabled: boolean; // true,
    battle_skills_enabled: boolean; // true,
    custom_guild_backgrounds_enabled: boolean; // true,
    tattoos_enabled: boolean; // true,
    hide_bra_allowed: boolean; // false,
    hide_panties_allowed: boolean; // false,
    dating_enabled: boolean; // true,
    fan_foto_enabled: boolean; // false,
    team_locale_enabled: boolean; // false,
    multitasking_booster_enabled: boolean; // true,
    new_registration_flow_enabled: boolean; // true,
    video_advertisment_enabled: boolean; // true,
    offerwall_enabled: boolean; // true,
    xssoftware_enabled: boolean; // false,
    asset_hashes: [],
    url_store_playata: string; // 'https://www.bigbangempire.com/download/latestApk.php',
    url_store_mikandi: string; // 'https://mikandi.com/app/15207',
    whitelabel_config: {},
    video_advertisment_cooldown_tooltip_enabled: boolean; // true,
    daily_bonus_herobook_enabled: boolean; // true,
    daily_bonus_duel_enabled: boolean; // true,
    streaming_enabled: boolean; // true,
    user_story_quests_enabled: boolean; // true,
    user_story_is_global: boolean; // true,
    user_story_locales: locales[];
  },
  textures: { [id: string]: { [asset: string]: { hash: string, size: number } } };
}
