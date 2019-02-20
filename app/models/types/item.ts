export enum itemType {
  UNKNOWN,
  HEAD,
  CHEST,
  BELT,
  LEGS,
  BOOTS,
  NECKLACE,
  RING,
  GADGET,
  MISSILES,
  PIERCING,
  SURPRISE_BOX,
  SHOP_TITLE,
  RESKILL,
  WEDDING_RING,
  DIVORCE_ITEM,
}

export const outfitTypes = [
  itemType.HEAD,
  itemType.CHEST,
  itemType.BELT,
  itemType.LEGS,
  itemType.BOOTS,
  itemType.NECKLACE,
  itemType.RING,
  itemType.GADGET,
  itemType.MISSILES,
  itemType.PIERCING,
];

export const usableTypes = [
  itemType.SURPRISE_BOX,
  itemType.SHOP_TITLE,
  itemType.RESKILL,
  itemType.WEDDING_RING,
  itemType.DIVORCE_ITEM,
];
