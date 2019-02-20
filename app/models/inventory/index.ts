import { camelCase } from 'lodash';

import { itemType } from '../types/item';

import DataObject from '../utils/dataObject';

import request from '../../lib/request';
import Item from './item';

export type inventoryRaw = {
  id: number,
  character_id: number,
  head_item_id: number,
  chest_item_id: number,
  belt_item_id: number,
  legs_item_id: number,
  boots_item_id: number,
  necklace_item_id: number,
  ring_item_id: number,
  piercing_item_id: number,
  gadget_item_id: number,
  missiles_item_id: number,
  bag_item1_id: number,
  bag_item2_id: number,
  bag_item3_id: number,
  bag_item4_id: number,
  bag_item5_id: number,
  bag_item6_id: number,
  bag_item7_id: number,
  bag_item8_id: number,
  bag_item9_id: number,
  bag_item10_id: number,
  bag_item11_id: number,
  bag_item12_id: number,
  bag_item13_id: number,
  bag_item14_id: number,
  bag_item15_id: number,
  bag_item16_id: number,
  bag_item17_id: number,
  bag_item18_id: number,
  shop_item1_id: number,
  shop_item2_id: number,
  shop_item3_id: number,
  shop_item4_id: number,
  shop_item5_id: number,
  shop_item6_id: number,
  shop_item7_id: number,
  shop_item8_id: number,
  shop_item9_id: number,
  item_set_data: string,
};

export class Inventory extends DataObject<inventoryRaw> {
  id: number;

  characterId: number;

  headItemId: number;
  get headItem(): Item { return Item.getItem(this.headItemId); }
  chestItemId: number;
  get chestItem(): Item { return Item.getItem(this.chestItemId); }
  beltItemId: number;
  get beltItem(): Item { return Item.getItem(this.beltItemId); }
  legsItemId: number;
  get legsItem(): Item { return Item.getItem(this.legsItemId); }
  bootsItemId: number;
  get bootsItem(): Item { return Item.getItem(this.bootsItemId); }
  necklaceItemId: number;
  get necklaceItem(): Item { return Item.getItem(this.necklaceItemId); }
  ringItemId: number;
  get ringItem(): Item { return Item.getItem(this.ringItemId); }
  piercingItemId: number;
  get piercingItem(): Item { return Item.getItem(this.piercingItemId); }
  gadgetItemId: number;
  get gadgetItem(): Item { return Item.getItem(this.gadgetItemId); }
  missilesItemId: number;
  get missilesItem(): Item { return Item.getItem(this.missilesItemId); }

  bagItem1Id: number;
  get bagItem1(): Item { return Item.getItem(this.bagItem1Id); }
  bagItem2Id: number;
  get bagItem2(): Item { return Item.getItem(this.bagItem2Id); }
  bagItem3Id: number;
  get bagItem3(): Item { return Item.getItem(this.bagItem3Id); }
  bagItem4Id: number;
  get bagItem4(): Item { return Item.getItem(this.bagItem4Id); }
  bagItem5Id: number;
  get bagItem5(): Item { return Item.getItem(this.bagItem5Id); }
  bagItem6Id: number;
  get bagItem6(): Item { return Item.getItem(this.bagItem6Id); }
  bagItem7Id: number;
  get bagItem7(): Item { return Item.getItem(this.bagItem7Id); }
  bagItem8Id: number;
  get bagItem8(): Item { return Item.getItem(this.bagItem8Id); }
  bagItem9Id: number;
  get bagItem9(): Item { return Item.getItem(this.bagItem9Id); }
  bagItem10Id: number;
  get bagItem10(): Item { return Item.getItem(this.bagItem10Id); }
  bagItem11Id: number;
  get bagItem11(): Item { return Item.getItem(this.bagItem11Id); }
  bagItem12Id: number;
  get bagItem12(): Item { return Item.getItem(this.bagItem12Id); }
  bagItem13Id: number;
  get bagItem13(): Item { return Item.getItem(this.bagItem13Id); }
  bagItem14Id: number;
  get bagItem14(): Item { return Item.getItem(this.bagItem14Id); }
  bagItem15Id: number;
  get bagItem15(): Item { return Item.getItem(this.bagItem15Id); }
  bagItem16Id: number;
  get bagItem16(): Item { return Item.getItem(this.bagItem16Id); }
  bagItem17Id: number;
  get bagItem17(): Item { return Item.getItem(this.bagItem17Id); }
  bagItem18Id: number;
  get bagItem18(): Item { return Item.getItem(this.bagItem18Id); }

  shopItem1Id: number;
  get shopItem1(): Item { return Item.getItem(this.shopItem1Id); }
  shopItem2Id: number;
  get shopItem2(): Item { return Item.getItem(this.shopItem2Id); }
  shopItem3Id: number;
  get shopItem3(): Item { return Item.getItem(this.shopItem3Id); }
  shopItem4Id: number;
  get shopItem4(): Item { return Item.getItem(this.shopItem4Id); }
  shopItem5Id: number;
  get shopItem5(): Item { return Item.getItem(this.shopItem5Id); }
  shopItem6Id: number;
  get shopItem6(): Item { return Item.getItem(this.shopItem6Id); }
  shopItem7Id: number;
  get shopItem7(): Item { return Item.getItem(this.shopItem7Id); }
  shopItem8Id: number;
  get shopItem8(): Item { return Item.getItem(this.shopItem8Id); }
  shopItem9Id: number;
  get shopItem9(): Item { return Item.getItem(this.shopItem9Id); }

  itemSetData: string;

  get outfitItemsId() {
    return [
      this.headItemId,
      this.chestItemId,
      this.beltItemId,
      this.legsItemId,
      this.bootsItemId,
      this.necklaceItemId,
      this.ringItemId,
      this.piercingItemId,
      this.gadgetItemId,
      this.missilesItemId,
    ];
  }

  get outfitItems() {
    return this.outfitItemsId.map(i => Item.getItem(i));
  }

  get bagItemsId() {
    return [
      this.bagItem1Id,
      this.bagItem2Id,
      this.bagItem3Id,
      this.bagItem4Id,
      this.bagItem5Id,
      this.bagItem6Id,
      this.bagItem7Id,
      this.bagItem8Id,
      this.bagItem9Id,
      this.bagItem10Id,
      this.bagItem11Id,
      this.bagItem12Id,
      this.bagItem13Id,
      this.bagItem14Id,
      this.bagItem15Id,
      this.bagItem16Id,
      this.bagItem17Id,
      this.bagItem18Id,
    ];
  }

  get bagItems() {
    return this.bagItemsId.map(i => Item.getItem(i));
  }

  get shopItemsId() {
    return [
      this.shopItem1Id,
      this.shopItem2Id,
      this.shopItem3Id,
      this.shopItem4Id,
      this.shopItem5Id,
      this.shopItem6Id,
      this.shopItem7Id,
      this.shopItem8Id,
      this.shopItem9Id,
    ];
  }

  get shopItems() {
    return this.shopItemsId.map(i => Item.getItem(i));
  }

  getItemBySlot(slot: string | number): number {
    const slotName = typeof slot === 'number' ? camelCase(itemType[slot]) : slot;

    return this[`${slotName}ItemId`];
  }

  get firstAvailableSlot(): number {
    const firstEmptyIndex = this.bagItemsId.findIndex(bagItemId => !bagItemId);

    return 20 + firstEmptyIndex;
  }

  static async refreshShopItems(usePremium: boolean = false): Promise<void> {
    return request.refreshShopItems(usePremium);
  }
}

export default new Inventory();
