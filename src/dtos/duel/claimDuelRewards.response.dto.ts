import { LoginUserResponseDto } from '../init/loginUser.response.dto';
import { StartDuelResponseDto } from './startDuel.response.dto';

export interface ClaimDuelRewardsResponseDto extends Pick<LoginUserResponseDto, 'character' | 'current_goal_values' | 'daily_bonus_lookup' | 'user'>, Pick<StartDuelResponseDto, 'duel'> {
  daily_bonus_reward?: {
    id: number;
    character_id: number;
    ts_creation: number;
    status: number;
    type: number;
    value: number;
    rewards: string;
  };
}
