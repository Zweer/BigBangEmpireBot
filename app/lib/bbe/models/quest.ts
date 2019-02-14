import AbstractQuest, { abstractQuestRaw } from './abstracts/quest';

export type questRaw = abstractQuestRaw & {
  stage: number,
  level: number,
  duration_type: number,
  duration_raw: number,
  duration: number,
};

export default class Quest extends AbstractQuest<questRaw> {
  stage: number;
  level: number;
  durationType: number;
  durationRaw: number;
  duration: number;

  get xpPerEnergy(): number {
    return Math.round((this.rewards.xp / this.energyCost) * 100) / 100;
  }

  static sort(a: Quest, b: Quest): number {
    const deltaPremium = b.rewards.premium - a.rewards.premium;
    if (deltaPremium !== 0) {
      return deltaPremium;
    }

    const deltaNonStandardAttributes = b.rewards.nonStandardAttributes.length - a.rewards.nonStandardAttributes.length;
    if (deltaNonStandardAttributes !== 0) {
      return deltaNonStandardAttributes;
    }

    return b.xpPerEnergy - a.xpPerEnergy;
  }
}
