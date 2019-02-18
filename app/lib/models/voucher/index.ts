import DataObject from '../utils/dataObject';

export type voucherRaw = {
  id: number;
  user_id: number;
  ts_creation: number;
  ts_claim: number;
  code: string;
  status: number;
  rewards: string;
  ts_end: number;
  category: string;
};

export default class Voucher extends DataObject<voucherRaw> {
  id: number;
  userId: number;
  tsCreation: number;
  tsClaim: number;
  code: string;
  status: number;
  rewards: string;
  tsEnd: number;
  category: string;
}
