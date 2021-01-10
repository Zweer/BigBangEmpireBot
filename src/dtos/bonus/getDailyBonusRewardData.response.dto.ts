export interface GetDailyBonusRewardDataResponseDto {
  daily_bonus_reward_data: {
    [type: number]: {
      [value: number]: {
        reward_type: number;
        reward_value: number;
        reward_identifier: string;
      };
    };
  };
}
