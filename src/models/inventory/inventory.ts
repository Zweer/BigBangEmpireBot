import { ItemType } from '../../types/itemType';

export class Inventory {
  id: number; // 14339,

  character_id: number; // 14424,

  head_item_id: number; // 0,

  chest_item_id: number; // 0,

  belt_item_id: number; // 0,

  legs_item_id: number; // 0,

  boots_item_id: number; // 0,

  necklace_item_id: number; // 0,

  ring_item_id: number; // 0,

  piercing_item_id: number; // 0,

  gadget_item_id: number; // 0,

  missiles_item_id: number; // 0,

  bag_item1_id: number; // 0,

  bag_item2_id: number; // 0,

  bag_item3_id: number; // 0,

  bag_item4_id: number; // 0,

  bag_item5_id: number; // 0,

  bag_item6_id: number; // 0,

  bag_item7_id: number; // 0,

  bag_item8_id: number; // 0,

  bag_item9_id: number; // 0,

  bag_item10_id: number; // 0,

  bag_item11_id: number; // 0,

  bag_item12_id: number; // 0,

  bag_item13_id: number; // 0,

  bag_item14_id: number; // 0,

  bag_item15_id: number; // 0,

  bag_item16_id: number; // 0,

  bag_item17_id: number; // 0,

  bag_item18_id: number; // 0,

  shop_item1_id: number; // 1545658,

  shop_item2_id: number; // 1545659,

  shop_item3_id: number; // 1545660,

  shop_item4_id: number; // 1545661,

  shop_item5_id: number; // 1545662,

  shop_item6_id: number; // 1545663,

  shop_item7_id: number; // 1545664,

  shop_item8_id: number; // 1545665,

  shop_item9_id: number; // 1545666,

  item_set_data: number; // '',

  getCharacterSlot(type: ItemType) {
    switch (type) {
      case ItemType.HEAD:
        return this.head_item_id;

      case ItemType.CHEST:
        return this.chest_item_id;

      case ItemType.BELT:
        return this.belt_item_id;

      case ItemType.LEGS:
        return this.legs_item_id;

      case ItemType.BOOTS:
        return this.boots_item_id;

      case ItemType.NECKLACE:
        return this.necklace_item_id;

      case ItemType.RING:
        return this.ring_item_id;

      case ItemType.GADGET:
        return this.gadget_item_id;

      case ItemType.MISSILES:
        return this.missiles_item_id;

      case ItemType.PIERCING:
        return this.piercing_item_id;

      default:
        return null;
    }
  }

  get bagSlots() {
    return [
      this.bag_item1_id,
      this.bag_item2_id,
      this.bag_item3_id,
      this.bag_item4_id,
      this.bag_item5_id,
      this.bag_item6_id,
      this.bag_item7_id,
      this.bag_item8_id,
      this.bag_item9_id,
      this.bag_item10_id,
      this.bag_item11_id,
      this.bag_item12_id,
      this.bag_item13_id,
      this.bag_item14_id,
      this.bag_item15_id,
      this.bag_item16_id,
      this.bag_item17_id,
      this.bag_item18_id,
    ];
  }

  get shopSlots() {
    return [
      this.shop_item1_id,
      this.shop_item2_id,
      this.shop_item3_id,
      this.shop_item4_id,
      this.shop_item5_id,
      this.shop_item6_id,
      this.shop_item7_id,
      this.shop_item8_id,
      this.shop_item9_id,
    ];
  }
}
