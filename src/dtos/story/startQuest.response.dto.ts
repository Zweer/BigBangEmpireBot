import { LoginUserResponseDto } from '../init/loginUser.response.dto';
import { QuestDto } from './quest.dto';

export interface StartQuestResponseDto extends Pick<LoginUserResponseDto, 'character' | 'user'> {
  quest: Pick<QuestDto, 'id' | 'status' | 'won'>
}
