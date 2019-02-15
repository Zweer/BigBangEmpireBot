import { mapValues } from 'lodash';

import DataObject from '../utils/dataObject';

export type datingConstantRaw = {
  identifier: string;
  min_level: number;
  stage: number;
  steps: { [key: number]: datingStepConstantRaw };
};

export type datingStepConstantRaw = {
  step: number;
  gendered_image: boolean;
  usk16_image: boolean;
  usk16_gendered_image: boolean;
  unlock_points_needed: number;
  type: number;
  reference: string;
  stat_type: number;
  stat_value: number;
  reward_stat_points: number;
  reward_item_identifier_m: string;
  reward_item_identifier_f: string;
  reward_item_level_offset: number;
  skip_price: number;
  unlock_points_needed_repeat: number;
  reward_stat_points_repeat: number;
  reward_item_identifier_m_repeat: string;
  reward_item_identifier_f_repeat: string;
  reward_item_level_offset_repeat: number;
  skip_price_repeat: number;
};

export default class DatingConstant extends DataObject<datingConstantRaw> {
  identifier: string;
  minLevel: number;
  stage: number;
  steps: { [key: number]: DatingStepConstant };

  setSteps(steps: { [key: number]: datingStepConstantRaw }) {
    this.steps = mapValues(steps, s => new DatingStepConstant(s));
  }
}

export class DatingStepConstant extends DataObject<datingStepConstantRaw> {
  step: number;
  genderedImage: boolean;
  usk16Image: boolean;
  usk16GenderedImage: boolean;
  unlockPointsNeeded: number;
  type: number;
  reference: string;
  statType: number;
  statValue: number;
  rewardStatPoints: number;
  rewardItemIdentifierM: string;
  rewardItemIdentifierF: string;
  rewardItemLevelOffset: number;
  skipPrice: number;
  unlockPointsNeededRepeat: number;
  rewardStatPointsRepeat: number;
  rewardItemIdentifierMRepeat: string;
  rewardItemIdentifierFRepeat: string;
  rewardItemLevelOffsetRepeat: number;
  skipPriceRepeat: number;
}
