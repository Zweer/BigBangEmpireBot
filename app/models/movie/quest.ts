import request from '../../lib/request';

import AbstractQuest, { abstractQuestRaw, questType } from '../abstracts/quest';

import character from '../character';

export type movieQuestRaw = abstractQuestRaw & {
  movie_id: number;
};

export default class MovieQuest extends AbstractQuest<movieQuestRaw> {
  movieId: number;

  static ERROR_CODE_INVALID_CLAIM = 'errClaimMovieQuestRewardsInvalidQuest';

  static async claimMovieQuestRewards(): Promise<void> {
    try {
      await request.claimMovieQuestRewards();
    } catch (error) {
      if (error.code !== MovieQuest.ERROR_CODE_INVALID_CLAIM) {
        throw error;
      }
    }
  }

  async startMovieQuest(): Promise<void> {
    return request.startMovieQuest(this);
  }

  static findBestQuest(quest: MovieQuest): boolean {
    return quest.type === questType.STAT;
  }

  get isDoable() {
    return character.movieEnergy >= this.energyCost;
  }
}
