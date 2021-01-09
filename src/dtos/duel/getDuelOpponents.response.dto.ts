import { CharacterDto } from '../models/character.dto';

import { OpponentDto } from './opponent.dto';

export interface GetDuelOpponentsResponseDto {
  character: CharacterDto;
  missed_duels: number;
  opponents: OpponentDto[];
}
