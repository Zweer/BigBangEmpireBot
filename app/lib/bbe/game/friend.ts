import DataObject from './utils/dataObject';

export type friendRaw = {
  user_id: number;
  character_id: number;
  character_name: string;
  character_level: number;
  character_online: boolean;
  avatar_image: string;
  platform_user_id: string;
  platform_name: string;
  platform_image_url: string;
  platform_image_width: number;
  platform_image_height: number;
  is_friend: boolean;
  is_guild_member: boolean;
};

export default class Friend extends DataObject<friendRaw> {
  userId: number;
  characterId: number;
  characterName: string;
  characterLevel: number;
  characterOnline: boolean;
  avatarImage: string;
  platformUserId: string;
  platformName: string;
  platformImageUrl: string;
  platformImageWidth: number;
  platformImageHeight: number;
  isFriend: boolean;
  isGuildMember: boolean;
}
