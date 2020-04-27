import { ResponseDataDto } from '../response.data.dto';
import {
  bonusInfo, ingameNotifications, locales, specialOffers,
} from '../types';

import { Character } from '../../models/character';
import { User } from '../../models/user';

export interface LoginResponseDto extends ResponseDataDto {
  user: User,
  character: Character,
  user_geo_location: string; // 'IT'
  has_marketing_email: boolean; // false
  inventory: {
    id: number; // 11777
    character_id: number; // 11830
    head_item_id: number; // 0
    chest_item_id: number; // 0
    belt_item_id: number; // 0
    legs_item_id: number; // 0
    boots_item_id: number; // 0
    necklace_item_id: number; // 0
    ring_item_id: number; // 0
    piercing_item_id: number; // 0
    gadget_item_id: number; // 0
    missiles_item_id: number; // 0
    bag_item1_id: number; // 0
    bag_item2_id: number; // 0
    bag_item3_id: number; // 0
    bag_item4_id: number; // 0
    bag_item5_id: number; // 0
    bag_item6_id: number; // 0
    bag_item7_id: number; // 0
    bag_item8_id: number; // 0
    bag_item9_id: number; // 0
    bag_item10_id: number; // 0
    bag_item11_id: number; // 0
    bag_item12_id: number; // 0
    bag_item13_id: number; // 0
    bag_item14_id: number; // 0
    bag_item15_id: number; // 0
    bag_item16_id: number; // 0
    bag_item17_id: number; // 0
    bag_item18_id: number; // 0
    shop_item1_id: number; // 1474194
    shop_item2_id: number; // 1474195
    shop_item3_id: number; // 1474196
    shop_item4_id: number; // 1474197
    shop_item5_id: number; // 1474198
    shop_item6_id: number; // 1474199
    shop_item7_id: number; // 1474200
    shop_item8_id: number; // 1474201
    shop_item9_id: number; // 1474202
    item_set_data: string; // ''
  },
  bank_inventory: {
    id: number; // 11777
    character_id: number; // 11830
    max_bank_index: number; // 0
    locked_item_ids: string; // ''
    bank_item1_id: number; // 0
    bank_item2_id: number; // 0
    bank_item3_id: number; // 0
    bank_item4_id: number; // 0
    bank_item5_id: number; // 0
    bank_item6_id: number; // 0
    bank_item7_id: number; // 0
    bank_item8_id: number; // 0
    bank_item9_id: number; // 0
    bank_item10_id: number; // 0
    bank_item11_id: number; // 0
    bank_item12_id: number; // 0
    bank_item13_id: number; // 0
    bank_item14_id: number; // 0
    bank_item15_id: number; // 0
    bank_item16_id: number; // 0
    bank_item17_id: number; // 0
    bank_item18_id: number; // 0
    bank_item19_id: number; // 0
    bank_item20_id: number; // 0
    bank_item21_id: number; // 0
    bank_item22_id: number; // 0
    bank_item23_id: number; // 0
    bank_item24_id: number; // 0
    bank_item25_id: number; // 0
    bank_item26_id: number; // 0
    bank_item27_id: number; // 0
    bank_item28_id: number; // 0
    bank_item29_id: number; // 0
    bank_item30_id: number; // 0
    bank_item31_id: number; // 0
    bank_item32_id: number; // 0
    bank_item33_id: number; // 0
    bank_item34_id: number; // 0
    bank_item35_id: number; // 0
    bank_item36_id: number; // 0
    bank_item37_id: number; // 0
    bank_item38_id: number; // 0
    bank_item39_id: number; // 0
    bank_item40_id: number; // 0
    bank_item41_id: number; // 0
    bank_item42_id: number; // 0
    bank_item43_id: number; // 0
    bank_item44_id: number; // 0
    bank_item45_id: number; // 0
    bank_item46_id: number; // 0
    bank_item47_id: number; // 0
    bank_item48_id: number; // 0
    bank_item49_id: number; // 0
    bank_item50_id: number; // 0
    bank_item51_id: number; // 0
    bank_item52_id: number; // 0
    bank_item53_id: number; // 0
    bank_item54_id: number; // 0
    bank_item55_id: number; // 0
    bank_item56_id: number; // 0
    bank_item57_id: number; // 0
    bank_item58_id: number; // 0
    bank_item59_id: number; // 0
    bank_item60_id: number; // 0
    bank_item61_id: number; // 0
    bank_item62_id: number; // 0
    bank_item63_id: number; // 0
    bank_item64_id: number; // 0
    bank_item65_id: number; // 0
    bank_item66_id: number; // 0
    bank_item67_id: number; // 0
    bank_item68_id: number; // 0
    bank_item69_id: number; // 0
    bank_item70_id: number; // 0
    bank_item71_id: number; // 0
    bank_item72_id: number; // 0
    bank_item73_id: number; // 0
    bank_item74_id: number; // 0
    bank_item75_id: number; // 0
    bank_item76_id: number; // 0
    bank_item77_id: number; // 0
    bank_item78_id: number; // 0
    bank_item79_id: number; // 0
    bank_item80_id: number; // 0
    bank_item81_id: number; // 0
    bank_item82_id: number; // 0
    bank_item83_id: number; // 0
    bank_item84_id: number; // 0
    bank_item85_id: number; // 0
    bank_item86_id: number; // 0
    bank_item87_id: number; // 0
    bank_item88_id: number; // 0
    bank_item89_id: number; // 0
    bank_item90_id: number; // 0
    bank_item91_id: number; // 0
    bank_item92_id: number; // 0
    bank_item93_id: number; // 0
    bank_item94_id: number; // 0
    bank_item95_id: number; // 0
    bank_item96_id: number; // 0
    bank_item97_id: number; // 0
    bank_item98_id: number; // 0
    bank_item99_id: number; // 0
    bank_item100_id: number; // 0
    bank_item101_id: number; // 0
    bank_item102_id: number; // 0
    bank_item103_id: number; // 0
    bank_item104_id: number; // 0
    bank_item105_id: number; // 0
    bank_item106_id: number; // 0
    bank_item107_id: number; // 0
    bank_item108_id: number; // 0
    bank_item109_id: number; // 0
    bank_item110_id: number; // 0
    bank_item111_id: number; // 0
    bank_item112_id: number; // 0
    bank_item113_id: number; // 0
    bank_item114_id: number; // 0
    bank_item115_id: number; // 0
    bank_item116_id: number; // 0
    bank_item117_id: number; // 0
    bank_item118_id: number; // 0
    bank_item119_id: number; // 0
    bank_item120_id: number; // 0
    bank_item121_id: number; // 0
    bank_item122_id: number; // 0
    bank_item123_id: number; // 0
    bank_item124_id: number; // 0
    bank_item125_id: number; // 0
    bank_item126_id: number; // 0
    bank_item127_id: number; // 0
    bank_item128_id: number; // 0
    bank_item129_id: number; // 0
    bank_item130_id: number; // 0
    bank_item131_id: number; // 0
    bank_item132_id: number; // 0
    bank_item133_id: number; // 0
    bank_item134_id: number; // 0
    bank_item135_id: number; // 0
    bank_item136_id: number; // 0
    bank_item137_id: number; // 0
    bank_item138_id: number; // 0
    bank_item139_id: number; // 0
    bank_item140_id: number; // 0
    bank_item141_id: number; // 0
    bank_item142_id: number; // 0
    bank_item143_id: number; // 0
    bank_item144_id: number; // 0
    bank_item145_id: number; // 0
    bank_item146_id: number; // 0
    bank_item147_id: number; // 0
    bank_item148_id: number; // 0
    bank_item149_id: number; // 0
    bank_item150_id: number; // 0
    bank_item151_id: number; // 0
    bank_item152_id: number; // 0
    bank_item153_id: number; // 0
    bank_item154_id: number; // 0
    bank_item155_id: number; // 0
    bank_item156_id: number; // 0
    bank_item157_id: number; // 0
    bank_item158_id: number; // 0
    bank_item159_id: number; // 0
    bank_item160_id: number; // 0
    bank_item161_id: number; // 0
    bank_item162_id: number; // 0
    bank_item163_id: number; // 0
    bank_item164_id: number; // 0
    bank_item165_id: number; // 0
    bank_item166_id: number; // 0
    bank_item167_id: number; // 0
    bank_item168_id: number; // 0
    bank_item169_id: number; // 0
    bank_item170_id: number; // 0
    bank_item171_id: number; // 0
    bank_item172_id: number; // 0
    bank_item173_id: number; // 0
    bank_item174_id: number; // 0
    bank_item175_id: number; // 0
    bank_item176_id: number; // 0
    bank_item177_id: number; // 0
    bank_item178_id: number; // 0
    bank_item179_id: number; // 0
    bank_item180_id: number; // 0
    bank_item181_id: number; // 0
    bank_item182_id: number; // 0
    bank_item183_id: number; // 0
    bank_item184_id: number; // 0
    bank_item185_id: number; // 0
    bank_item186_id: number; // 0
    bank_item187_id: number; // 0
    bank_item188_id: number; // 0
    bank_item189_id: number; // 0
    bank_item190_id: number; // 0
    bank_item191_id: number; // 0
    bank_item192_id: number; // 0
    bank_item193_id: number; // 0
    bank_item194_id: number; // 0
    bank_item195_id: number; // 0
    bank_item196_id: number; // 0
    bank_item197_id: number; // 0
    bank_item198_id: number; // 0
    bank_item199_id: number; // 0
    bank_item200_id: number; // 0
    bank_item201_id: number; // 0
    bank_item202_id: number; // 0
    bank_item203_id: number; // 0
    bank_item204_id: number; // 0
    bank_item205_id: number; // 0
    bank_item206_id: number; // 0
    bank_item207_id: number; // 0
    bank_item208_id: number; // 0
    bank_item209_id: number; // 0
    bank_item210_id: number; // 0
    bank_item211_id: number; // 0
    bank_item212_id: number; // 0
    bank_item213_id: number; // 0
    bank_item214_id: number; // 0
    bank_item215_id: number; // 0
    bank_item216_id: number; // 0
    bank_item217_id: number; // 0
    bank_item218_id: number; // 0
    bank_item219_id: number; // 0
    bank_item220_id: number; // 0
    bank_item221_id: number; // 0
    bank_item222_id: number; // 0
    bank_item223_id: number; // 0
    bank_item224_id: number; // 0
    bank_item225_id: number; // 0
    bank_item226_id: number; // 0
    bank_item227_id: number; // 0
    bank_item228_id: number; // 0
    bank_item229_id: number; // 0
    bank_item230_id: number; // 0
    bank_item231_id: number; // 0
    bank_item232_id: number; // 0
    bank_item233_id: number; // 0
    bank_item234_id: number; // 0
    bank_item235_id: number; // 0
    bank_item236_id: number; // 0
    bank_item237_id: number; // 0
    bank_item238_id: number; // 0
    bank_item239_id: number; // 0
    bank_item240_id: number; // 0
    bank_item241_id: number; // 0
    bank_item242_id: number; // 0
    bank_item243_id: number; // 0
    bank_item244_id: number; // 0
    bank_item245_id: number; // 0
    bank_item246_id: number; // 0
    bank_item247_id: number; // 0
    bank_item248_id: number; // 0
    bank_item249_id: number; // 0
    bank_item250_id: number; // 0
    bank_item251_id: number; // 0
    bank_item252_id: number; // 0
    bank_item253_id: number; // 0
    bank_item254_id: number; // 0
    bank_item255_id: number; // 0
    bank_item256_id: number; // 0
    bank_item257_id: number; // 0
    bank_item258_id: number; // 0
    bank_item259_id: number; // 0
    bank_item260_id: number; // 0
    bank_item261_id: number; // 0
    bank_item262_id: number; // 0
    bank_item263_id: number; // 0
    bank_item264_id: number; // 0
    bank_item265_id: number; // 0
    bank_item266_id: number; // 0
    bank_item267_id: number; // 0
    bank_item268_id: number; // 0
    bank_item269_id: number; // 0
    bank_item270_id: number; // 0
    bank_item271_id: number; // 0
    bank_item272_id: number; // 0
    bank_item273_id: number; // 0
    bank_item274_id: number; // 0
    bank_item275_id: number; // 0
    bank_item276_id: number; // 0
    bank_item277_id: number; // 0
    bank_item278_id: number; // 0
    bank_item279_id: number; // 0
    bank_item280_id: number; // 0
    bank_item281_id: number; // 0
    bank_item282_id: number; // 0
    bank_item283_id: number; // 0
    bank_item284_id: number; // 0
    bank_item285_id: number; // 0
    bank_item286_id: number; // 0
    bank_item287_id: number; // 0
    bank_item288_id: number; // 0
    bank_item289_id: number; // 0
    bank_item290_id: number; // 0
    bank_item291_id: number; // 0
    bank_item292_id: number; // 0
    bank_item293_id: number; // 0
    bank_item294_id: number; // 0
    bank_item295_id: number; // 0
    bank_item296_id: number; // 0
    bank_item297_id: number; // 0
    bank_item298_id: number; // 0
    bank_item299_id: number; // 0
    bank_item300_id: number; // 0
    bank_item301_id: number; // 0
    bank_item302_id: number; // 0
    bank_item303_id: number; // 0
    bank_item304_id: number; // 0
    bank_item305_id: number; // 0
    bank_item306_id: number; // 0
    bank_item307_id: number; // 0
    bank_item308_id: number; // 0
    bank_item309_id: number; // 0
    bank_item310_id: number; // 0
    bank_item311_id: number; // 0
    bank_item312_id: number; // 0
    bank_item313_id: number; // 0
    bank_item314_id: number; // 0
    bank_item315_id: number; // 0
    bank_item316_id: number; // 0
    bank_item317_id: number; // 0
    bank_item318_id: number; // 0
    bank_item319_id: number; // 0
    bank_item320_id: number; // 0
    bank_item321_id: number; // 0
    bank_item322_id: number; // 0
    bank_item323_id: number; // 0
    bank_item324_id: number; // 0
    bank_item325_id: number; // 0
    bank_item326_id: number; // 0
    bank_item327_id: number; // 0
    bank_item328_id: number; // 0
    bank_item329_id: number; // 0
    bank_item330_id: number; // 0
    bank_item331_id: number; // 0
    bank_item332_id: number; // 0
    bank_item333_id: number; // 0
    bank_item334_id: number; // 0
    bank_item335_id: number; // 0
    bank_item336_id: number; // 0
    bank_item337_id: number; // 0
    bank_item338_id: number; // 0
    bank_item339_id: number; // 0
    bank_item340_id: number; // 0
    bank_item341_id: number; // 0
    bank_item342_id: number; // 0
    bank_item343_id: number; // 0
    bank_item344_id: number; // 0
    bank_item345_id: number; // 0
    bank_item346_id: number; // 0
    bank_item347_id: number; // 0
    bank_item348_id: number; // 0
    bank_item349_id: number; // 0
    bank_item350_id: number; // 0
    bank_item351_id: number; // 0
    bank_item352_id: number; // 0
    bank_item353_id: number; // 0
    bank_item354_id: number; // 0
    bank_item355_id: number; // 0
    bank_item356_id: number; // 0
    bank_item357_id: number; // 0
    bank_item358_id: number; // 0
    bank_item359_id: number; // 0
    bank_item360_id: number; // 0
    bank_item361_id: number; // 0
    bank_item362_id: number; // 0
    bank_item363_id: number; // 0
    bank_item364_id: number; // 0
    bank_item365_id: number; // 0
    bank_item366_id: number; // 0
    bank_item367_id: number; // 0
    bank_item368_id: number; // 0
    bank_item369_id: number; // 0
    bank_item370_id: number; // 0
    bank_item371_id: number; // 0
    bank_item372_id: number; // 0
    bank_item373_id: number; // 0
    bank_item374_id: number; // 0
    bank_item375_id: number; // 0
    bank_item376_id: number; // 0
    bank_item377_id: number; // 0
    bank_item378_id: number; // 0
  },
  quests: {
    id: number; // 3728541
    character_id: number; // 11830
    identifier: string; // 'quest_stage1_time1_f'
    type: number; // 1
    stat: number; // 0
    stage: number; // 1
    level: number; // 1
    status: number; // 1
    duration_type: number; // 1
    duration_raw: number; // 60
    duration: number; // 60
    ts_complete: number; // 0
    energy_cost: number; // 1
    fight_difficulty: number; // 0
    fight_npc_identifier: string; // ''
    fight_battle_id: number; // 0
    won: boolean; // false
    rewards: string; // '{\'coins\':5,\'xp\':226,\'honor\':0,\'premium\':0,\'statPoints\':0,\'item\':0}'
  }[],
  items: {
    id: number; // 1474194
    character_id: number; // 11830
    identifier: string; // 'freshmen_boots'
    type: number; // 5
    quality: number; // 1
    required_level: number; // 1
    charges: number; // 0
    item_level: number; // 1
    ts_availability_start: number; // 0
    ts_availability_end: number; // 0
    premium_item: boolean; // false
    buy_price: number; // 9
    sell_price: number; // 5
    stat_stamina: number; // 4
    stat_strength: number; // 0
    stat_critical_rating: number; // 0
    stat_dodge_rating: number; // 0
    stat_weapon_damage: number; // 0
    display_options: number; // 0
    battle_skill: string; // ''
  }[],
  completed_story_dungeons: [],
  campaigns: [],
  convention_character_data: [],
  bonus_info: bonusInfo;
  reskill_enabled: boolean; // false
  advertisment_info: {
    show_advertisment: boolean; // false
    show_preroll_advertisment: boolean; // false
    show_left_skyscraper_advertisment: boolean; // false
    show_pop_under_advertisment: boolean; // false
    show_footer_billboard_advertisment: boolean; // false
    advertisment_refresh_rate: number; // 15
    remaining_video_advertisment_cooldown: number; // 0
  },
  show_advertisment: boolean; // false
  show_preroll_advertisment: boolean; // false
  tournament_end_timestamp: number; // 1587960000
  movie_tournament_end_timestamp: number; // 1587970800
  current_goal_values: {
    [name: string]: {
      value: number; // 1
      current_value: number; // 1
    };
  },
  collected_goals: [],
  current_item_pattern_values: {
    [name: string]: {
      value: number; // 0
      collected_items: [],
      is_new: boolean; // false
    };
  },
  collected_item_pattern: [],
  current_optical_changes: {
    id: number; // 11777
    character_id: number; // 11830
    resource: number; // 200
    available_chests: string; // ''
    active_options: string; // '[8,23,30,36,38,51,55,64,78,86,87,142,154,171,182,193,207,209,214]'
    unlocked_options: string; // '{\'1\':[8],\'2\':[23],\'3\':[30],\'4\':[36],\'5\':[38],\'6\':[51],\'7\':[55],\'8\':[64],\'9\':[78],\'10\':[86],\'11\':[87],\'12\':[142],\'13\':[154],\'14\':[171],\'15\':[182],\'16\':[193],\'17\':[207],\'19\':[209],\'18\':[214]}'
    use_for_quest: boolean; // false
    use_for_duel: boolean; // false
  },
  collected_optical_changes: [],
  titles: [],
  special_offers: specialOffers,
  consumable_offers: {
    [name: string]: {
      test: boolean; // false
      index: number; // 30
      active: boolean; // true
      available_time_start: string; // null,
      available_time_end: string; // null,
      limit: number; // 999
      item_identifiers: string[],
      item_plus_levels: {
        hentai_head: number; // 21
        hentai_robe: number; // 21
        hentai_belt: number; // 21
        hentai_boots: number; // 21
      },
      display: {
        background: string; // 'hentai_package.png'
        item: string; // 'full_hentai_<gender>_i.png'
      },
      offers: {
        [locale in locales]: {
          currency: string; // 'EUR'
          price: string; // '20.00'
          payment_methods: string[];
        };
      },
      app_offer_id: string; // 'item_offer3'
      category: string; // 'hentai'
      slot: string; // 'full_set'
    };
  },
  missed_duels: number; // 0
  streams_info: {
    [name: string]: {
      [id: string]: {
        id: number; // 11830
        type: string; // 'm'
        unread: number; // 0
      };
    };
  },
  new_guild_log_entries: number; // 0
  ingame_notifications: ingameNotifications;
  tos_update_needed: boolean; // false
  pp_update_needed: boolean; // false
  new_version: boolean; // false
  login_count: number; // 6
  server_timestamp_offset: number; // -25200
  completed_dating_steps: [],
  marriages: [],
  daily_bonus_lookup: {
    id: number; // 11777
    character_id: number; // 11830
    ts_last_reset: number; // 1587855894
    herobook_daily_completed: number; // 0
    duel_battle_won: number; // 0
  },
  ad_provider_keys: string[],
  user_voucher_rewards: [],
}
