import * as moment from 'moment';

import AbstractQuest, { abstractQuestRaw } from '../abstracts/quest';

import log from '../../lib/log';
import request from '../../lib/request';

import game from '../game';
import character from '../character';

import { resource } from '../types/common';

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

    return b.value - a.value;
  }

  async checkForQuestCompleteAndUpdate(): Promise<void> {
    const currentQuest = await request.checkForQuestComplete();

    this.update(currentQuest);
  }

  get value(): number {
    return this.xpPerEnergy + this.rewards.nonStandardAttributes.length * 100000;
  }

  async doQuest() {
    const messageArr = [];
    messageArr.push('Starting a new quest:');
    messageArr.push(`- ${this.xpPerEnergy} xp/energy`);
    messageArr.push(`- ${this.energyCost} energy`);

    messageArr.push(...this.rewards.nonStandardAttributes.map(nonStandardAttribute => `- with a ${nonStandardAttribute}`));

    if (this.rewards.dungeonKey) {
      log.warn(`Got a new dungeonKey in ${this.energyCost} minutes`);
    }

    log.debug(messageArr.join('\n'));

    await request.startQuest(this);
  }

  async doUseResources() {
    if (character.unusedResources[resource.QUEST_REDUCTION] > 0 && (!character.usedResources || character.usedResources[resource.QUEST_REDUCTION] < 4) && this.energyCost > 8) {
      const savedSeconds = await request.useResource(resource.QUEST_REDUCTION);

      log.info(`Quest reduction resource used: ${savedSeconds} seconds saved`);
    }
  }

  get remainingTime(): string {
    const now = moment();

    if (this.tsComplete.isBefore(now)) {
      return 'no quest in progress';
    }

    return moment.duration(this.tsComplete.diff(now)).humanize();
  }
}
