import { Transform, Type } from 'class-transformer';

import { Locales } from '../dtos/types';

import { User } from './user';
import { Character } from './character';
import { Inventory } from './inventory/inventory';
import { Bank } from './inventory/bank';
import { Quest } from './story/quest';
import { Item } from './inventory/item';
import { CurrentGoal } from './goal/currentGoal';

import { arrayOfObjectsOfObjectsToArrayOfModels, objectOfObjectsToArrayOfModels } from '../utils/typeConversions';
import { CollectedGoal } from './goal/collectedGoal';

export class Game {
  @Type(() => User)
  user: User;

  @Type(() => Character)
  character: Character;

  user_geo_location: string; // IT;

  has_marketing_email: boolean; // false;

  @Type(() => Inventory)
  inventory: Inventory;

  @Type(() => Bank)
  bank_inventory: Bank;

  @Type(() => Quest)
  quests: Quest[];

  get questWithMinimumEnergy() {
    const questWithMinEnergy = this.quests.sort(Quest.sort).reduce(
      (minQuest, quest) => (minQuest.energy_cost < quest.energy_cost ? minQuest : quest),
      { energy_cost: this.character.quest_energy },
    );

    return questWithMinEnergy instanceof Quest ? questWithMinEnergy : null;
  }

  @Type(() => Item)
  items: Item[];

  completed_story_dungeons: [];

  campaigns: {
    starting_premium_currency: {
      id: number; // 10;
      variation: number; // 1
    }
  };

  convention_character_data: [];

  reskill_enabled: boolean;

  advertisment_info: {
    show_advertisment: boolean; // false;
    show_preroll_advertisment: boolean; // false;
    show_left_skyscraper_advertisment: boolean; // false;
    show_pop_under_advertisment: boolean; // false;
    show_footer_billboard_advertisment: boolean; // false;
    advertisment_refresh_rate: number; // 15;
    remaining_video_advertisment_cooldown: number; // 0
  };

  show_advertisment: boolean;

  show_preroll_advertisment: boolean;

  tournament_end_timestamp: number;

  movie_tournament_end_timestamp: number;

  global_tournament_end_timestamp: number;

  @Transform(objectOfObjectsToArrayOfModels(CurrentGoal))
  current_goal_values: CurrentGoal[];

  @Transform(arrayOfObjectsOfObjectsToArrayOfModels(CollectedGoal, 'identifier', (a: CollectedGoal, b: CollectedGoal) => (a.value < b.value ? 1 : -1)))
  collected_goals: CollectedGoal[];

  current_item_pattern_values: {
    [key: string]: {
      value: 0;
      collected_items: [];
      is_new: false
    };
  };

  collected_item_pattern: [];

  current_optical_changes: {
    id: number; // 14332;
    character_id: number; // 14424;
    resource: number; // 200;
    available_chests: string; // ''
    active_options: string;// '[8;23;30;36;38;51;55;64;78;86;87;142;154;171;182;193;207;209;214];'
    unlocked_options: string; // '{"1":[8];"2":[23]}';
    use_for_quest: boolean;
    use_for_duel: boolean;
  };

  collected_optical_changes: [];

  titles: [];

  special_offers: {
    [key: string]: {
      test: boolean;
      index: number;
      active: boolean;
      available_time_start: null;
      available_time_end: null;
      notify_user: boolean;
      modify_buy_button: boolean;
      limit: number;
      name_identifier: string;
      description_identifier: string;
      user_type: number;
      display: {
        image: string;
      };
      offers: {
        [key in Locales]: {
          currency: string;
          price: number;
          game_currency_amount: number;
          payment_methods: number[]; // [1, 7, 3, 2, 8, 27]
        };
      };
    };
  };

  consumable_offers: {
    [key: string]: {
      test: boolean;
      index: number;
      active: boolean;
      available_time_start: null;
      available_time_end: null;
      limit: number;
      item_identifiers: string[]; // ['hentai_head', 'hentai_robe', 'hentai_belt', 'hentai_boots'];
      item_plus_levels: {
        hentai_head: number; // 21
        hentai_robe: number; // 21
        hentai_belt: number; // 21
        hentai_boots: number; // 21
      };
      display: {
        background: string; // 'hentai_package.png'
        item: string; // 'full_hentai_<gender>_i.png'
      };
      offers: {
        [key in Locales]: {
          currency: string;
          price: number;
          payment_methods: number[]; // [1, 7, 3, 2, 8, 27]
        };
      };
      app_offer_id: string; // 'item_offer3'
      category: string; // 'hentai'
      slot: string; // 'full_set'
    };
  };

  missed_duels: number;

  streams_info: {
    [key: string]: {
      14424: {
        id: number;
        type: string;
        unread: number;
      }
    };
  };

  new_guild_log_entries: number;

  ingame_notifications: {
    [key: string]: {
      test: boolean;
      index: number;
      active: boolean;
      available_time_start: string; // 2020-12-22 00:00:00;
      available_time_end: string; // 2021-03-20 23:59:59;
      text_identifier: string; // winter_item_set_notification;
      frequency: number;
      redirect_to_payment_dialog: boolean;
      display: {
        image: string; // winter_item_set_notification.png;
        html: boolean;
        custom_button_text: boolean;
        min_level: number;
      };
    };
  };

  tos_update_needed: boolean;

  pp_update_needed: boolean;

  new_version: boolean;

  login_count: number;

  server_timestamp_offset: number;

  completed_dating_steps: [];

  marriages: [];

  daily_bonus_lookup: {
    id: number;
    character_id: number;
    ts_last_reset: number;
    herobook_daily_completed: number;
    duel_battle_won: number;
    quest_energy_spent: number;
  };

  constants_override: {
    identifier: string; // casino_event_without_limit;
    available_time_start: string; // 2020-12-31 00:00:00;
    available_time_end: string; // 2021-01-07 23:59:59;
    constants: {
      slotmachine_max_daily_spins: number;
    }
  }[];

  ad_provider_keys: string[]; // [trialpay; atg];

  user_voucher_rewards: [];

  daily_login_bonus_rewards: object;

  daily_login_bonus_day: number;
}
