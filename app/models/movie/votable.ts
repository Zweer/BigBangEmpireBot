import * as moment from 'moment';

import request from '../../lib/request';

import AbstractMovie, { abstractMovieRaw } from '../abstracts/movie';

import Reward from '../story/reward';

export type votableMovieRaw = abstractMovieRaw & {
  guild_name: string;
  character_name: string;
  custom_title: string;
  ts_completed: number;
};

export default class VotableMovie extends AbstractMovie<votableMovieRaw> {
  guildName: string;
  characterName: string;
  customTitle: string;
  tsCompleted: moment.Moment;

  setTsCompleted(tsCompleted: number) {
    this.tsCompleted = moment(tsCompleted);
  }

  static async getMoviesToVote(): Promise<{ movies: VotableMovie[], reward: Reward }> {
    return request.getMoviesToVote();
  }

  async voteForMovie(): Promise<void> {
    return request.voteForMovie(this);
  }
}
