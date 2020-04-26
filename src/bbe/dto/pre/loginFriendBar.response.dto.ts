export interface LoginFriendBarResponseDto {
  user: {
    id: number; // 11836,
    registration_source: string; // "ref=;subid=;lp=;",
    ts_creation: number; // 1587639259,
    network: string; // "",
    app_version: string; // "97",
    app_version_registration: string; // "97",
    device_type: number; // 4,
    confirmed: boolean; // false,
    email: string; // "n.olivieriachille@gmail.com",
    session_id: string; // "aG4EFp9NnDlCa3IPgk4YibwCcp1e5f",
    locale: string; // "en_US",
    premium_currency: number; // 50,
    settings: string; // "{\"tos_may2018\":true,\"pp_may2018\":true}",
    trusted: boolean; // false
  },
  friend_data: {
    user_id: number; // 11836,
    character_id: number; // 11830,
    character_name: string; // "Zweera",
    character_level: number; // 2,
    character_online: boolean; // true,
    avatar_image: string; // "g:f;b:16782469;b2:1170;s:17334337;tt:0;uw:16781377;p:353412292;p2:1;",
    platform_user_id: string; // null,
    platform_name: string; // null,
    platform_image_url: string; // null,
    platform_image_width: number; // 0,
    platform_image_height: number; // 0,
    is_friend: boolean; // true,
    is_guild_member: boolean; // false
  }[];
}
