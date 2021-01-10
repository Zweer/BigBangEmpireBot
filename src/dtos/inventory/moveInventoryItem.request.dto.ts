import { ItemType } from '../../types/itemType';

export interface MoveInventoryItemRequestDto {
  item_id: number,
  target_slot: ItemType,
}
