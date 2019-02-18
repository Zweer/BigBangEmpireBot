import Booster, { boosterRaw } from '../booster';

import DataObject from '../utils/dataObject';

export type voucherRewardRaw = {
  quest_energy: number;
  game_currency: number;
  premium_currency: number;
  premium_currency_donatable: number;
  stat_points: number;
  quest_booster: boosterRaw;
  stats_booster: boosterRaw;
  work_booster: boosterRaw;
  sense_booster: boosterRaw;
  multitasking_booster: boosterRaw;
};

export default class VoucherReward extends DataObject<voucherRewardRaw> {
  questEnergy: number;
  gameCurrency: number;
  premiumCurrency: number;
  premiumCurrencyDonatable: number;
  statPoints: number;
  questBooster: Booster;
  statsBooster: Booster;
  workBooster: Booster;
  senseBooster: Booster;
  multitaskingBooster: Booster;

  setQuestBooster(booster: boosterRaw) {
    this.questBooster = new Booster(booster);
  }

  setStatsBooster(booster: boosterRaw) {
    this.statsBooster = new Booster(booster);
  }

  setWorkBooster(booster: boosterRaw) {
    this.workBooster = new Booster(booster);
  }

  setSenseBooster(booster: boosterRaw) {
    this.senseBooster = new Booster(booster);
  }

  setMultitaskingBooster(booster: boosterRaw) {
    this.multitaskingBooster = new Booster(booster);
  }

  toString() {
    return Object.keys(this)
      .filter(prop => !!this[prop])
      .map(prop => typeof this[prop] !== 'object' ? `${prop}: ${this[prop]}` : prop)
      .map(str => `- ${str}`)
      .join('\n');
  }
}
