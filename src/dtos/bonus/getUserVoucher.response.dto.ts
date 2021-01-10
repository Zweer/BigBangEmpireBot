export interface GetUserVoucherResponseDto {
  voucher: {
    id: number;
    code: string;
    rewards: string;
    ts_end: number;
  };
}
