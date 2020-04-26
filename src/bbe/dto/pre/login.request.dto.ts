export interface LoginRequestDto {
  email: string;
  password: string;
  platform: string; // '',
  platform_user_id: string; // '',
  client_id: string; // 'us31587855894'
  app_version: number; // 97
  device_info: string; // '{"language":"en","pixelAspectRatio":1,"screenDPI":72,"screenResolutionX":1920,"screenResolutionY":1080,"touchscreenType":0,"os":"HTML5","version":"WEB 8,9,5,0"}',
  device_id: string; // 'web',
}
