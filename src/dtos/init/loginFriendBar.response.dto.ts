import { UserDto } from '../models/user.dto';
import { UserFriendDto } from '../models/userFriend.dto';

export interface LoginFriendBarResponseDto {
  user: UserDto;
  friend_data: UserFriendDto[];
}
