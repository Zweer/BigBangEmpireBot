import { CharacterDto } from '../models/character.dto';
import { UserDto } from '../models/user.dto';
import { OpponentDto } from './opponent.dto';
import { ItemDto } from '../inventory/item.dto';
import { InventoryDto } from '../inventory/inventory.dto';

export interface StartDuelResponseDto {
  battle: {
    id: number;
    profile_a_stats: string;
    profile_b_stats: string;
    rounds: string;
    ts_creation: number;
    winner: string;
  };
  character: CharacterDto;
  user: UserDto;
  duel: {
    id: number;
    ts_creation: number;
    battle_id: number;
    character_a_id: number;
    character_b_id: number;
    character_a_status: number;
    character_b_status: number;
    character_a_rewards: string;
    character_b_rewards: string;
  };
  opponent: OpponentDto;
  opponent_inventory: Pick<InventoryDto, 'belt_item_id' | 'boots_item_id' | 'chest_item_id' | 'head_item_id' | 'id' | 'legs_item_id' | 'missiles_item_id'>;
  opponent_inventory_items: Pick<ItemDto, 'id' | 'identifier'>[]
}
