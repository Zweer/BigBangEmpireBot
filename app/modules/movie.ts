import * as moment from 'moment';
import * as numeral from 'numeral';

import log from '../lib/log';
import request from '../lib/request';

import game from '../models/game';

import AbstractModule from '.';

import { movieStatus } from '../models/movie';
import { questType } from '../models/abstracts/quest';

export default class MovieModule extends AbstractModule {
  async handle(): Promise<void> {
    await this.handleVotes();

    await this.handleCurrentQuest();
    await this.handleMovieStar();
    await this.handleMovieRefresh();
    await this.handleMovieChoice();
    await this.handleMovie();
  }

  get movie() {
    return game.movie;
  }

  get movies() {
    return game.movies;
  }

  get movieQuests() {
    return game.movieQuests;
  }

  get movieEnergy() {
    return game.character.movieEnergy;
  }

  get movieVotes() {
    return game.character.movieVotes;
  }

  get tsLastMovieFinished() {
    return game.character.tsLastMovieFinished;
  }

  private async handleVotes(): Promise<void> {
    if (this.movieVotes === 0) {
      return;
    }

    const { movies } = await request.getMoviesToVote();
    const [movie] = movies; // TODO: implement something to vote movies from the same guild

    await request.voteForMovie(movie);
  }

  private async handleCurrentQuest(): Promise<void> {
    if (!this.movie) {
      return;
    }

    try {
      await request.claimMovieQuestRewards();
    } catch (error) {
      // do nothing
    }
  }

  private async handleMovieStar(): Promise<void> {
    if (!this.movie) {
      return;
    }

    if (this.movie.isWaitingForClaim) {
      await request.claimMovieStar();

      log.info(`🎥 ${numeral(this.movie.claimedStars).format('0o')} star claimed`);
    }

    if (this.movie.isWaitingForFinish) {
      await request.finishMovie();

      log.info('🎥 Finished');
    }
  }

  private async handleMovieRefresh(): Promise<void> {
    if (this.movie && this.movie.status !== movieStatus.FINISHED) {
      return;
    }

    if (this.tsLastMovieFinished.isAfter(moment().subtract(1, 'hour'))) {
      return;
    }

    await request.refreshMoviePool();
  }

  private async handleMovieChoice(): Promise<void> {
    if (this.movie || !(this.movies && this.movies.length)) {
      return;
    }

    log.debug('Choosing the next movie');

    const movie = this.movies
      .sort((a, b) => b.fans - a.fans)
      .find(m => !!m);

    await request.startMovie(movie);
  }

  private async handleMovie(): Promise<void> {
    if (!this.movie || !(this.movieQuests && this.movieQuests.length)) {
      return;
    }

    if (this.movie.status === movieStatus.TIMEUP) {
      await request.extendMovieTime();
    }

    const quest = this.movieQuests.find(q => q.type === questType.STAT);

    if (quest && this.movieEnergy >= quest.energyCost) {
      log.verbose(`Starting a movie quest: ${quest.rewards.movieProgress} reward`);

      await request.startMovieQuest(quest);
    }
  }
}
