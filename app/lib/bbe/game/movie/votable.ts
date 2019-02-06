import * as moment from 'moment';

import AbstractMovie, { abstractMovieRaw } from '../abstracts/movie';

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
}
