import { ItemType } from '../../types/itemType';

export class Item {
  id: number; // 1545658,

  character_id: number; // 14424,

  identifier: string; // 'freshmen_boots',

  type: ItemType; // 5,

  isUsable() {
    return [
      ItemType.SURPRISE_BOX,
      ItemType.SHOP_TITLE,
      ItemType.RESKILL,
      ItemType.WEDDING_RING,
      ItemType.DIVORCE_ITEM,
    ].includes(this.type);
  }

  quality: number; // 1,

  required_level: number; // 1,

  charges: number; // 0,

  item_level: number; // 1,

  ts_availability_start: number; // 0,

  ts_availability_end: number; // 0,

  premium_item: boolean; // false,

  buy_price: number; // 9,

  sell_price: number; // 5,

  stat_stamina: number; // 0,

  stat_strength: number; // 0,

  stat_critical_rating: number; // 0,

  stat_dodge_rating: number; // 4,

  stat_weapon_damage: number; // 0,

  get stat_missile_damage() {
    if (this.type !== ItemType.MISSILES) {
      return 0;
    }

    return 0;
  }

  get stat_total() {
    return this.stat_stamina + this.stat_strength + this.stat_critical_rating + this.stat_dodge_rating + this.stat_weapon_damage + this.stat_missile_damage;
  }

  display_options: number; // 0,

  battle_skill: string; // ''
}
