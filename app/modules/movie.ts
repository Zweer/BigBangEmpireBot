import * as moment from 'moment';
import * as numeral from 'numeral';

import log from '../lib/log';

import character from '../models/character';
import constants from '../models/constants';
import game from '../models/game';

import AbstractModule from '.';

import Movie from '../models/movie';
import MovieQuest from '../models/movie/quest';
import VotableMovie from '../models/movie/votable';

export default class MovieModule extends AbstractModule {
  async handle(): Promise<void> {
    await this.handleVotes();

    await this.handleCurrentQuest();
    await this.handleMovieStar();
    await this.handleMovieRefresh();
    await this.handleMovieChoice();
    await this.handleMovie();
  }

  private async handleVotes(): Promise<void> {
    if (character.movieVotes === 0) {
      return;
    }

    const { movies } = await VotableMovie.getMoviesToVote();
    const [movie] = movies; // TODO: implement something to vote movies from the same guild

    await movie.voteForMovie();
  }

  private async handleCurrentQuest(): Promise<void> {
    if (!game.movie || game.movie.isFinished) {
      return;
    }

    await MovieQuest.claimMovieQuestRewards();
  }

  private async handleMovieStar(): Promise<void> {
    if (!game.movie || game.movie.isFinished) {
      return;
    }

    if (game.movie.isWaitingForClaim) {
      await Movie.claimMovieStar();

      log.info(`🎥 ${numeral(game.movie.claimedStars).format('0o')} star claimed`);
    }

    if (game.movie.isWaitingForFinish) {
      await Movie.finishMovie();

      log.info('🎥 Finished');
    }
  }

  private async handleMovieRefresh(): Promise<void> {
    if (game.movie && !game.movie.isFinished) {
      return;
    }

    if (character.tsLastMovieFinished.isAfter(moment().subtract(1, 'hour'))) {
      return;
    }

    if (character.moviesStartedToday >= constants.movieDailyLimit) {
      return;
    }

    await Movie.refreshMoviePool();
  }

  private async handleMovieChoice(): Promise<void> {
    if (game.movie || !(game.movies && game.movies.length)) {
      return;
    }

    log.debug('Choosing the next movie');

    const movie = game.movies
      .sort((a, b) => b.fans - a.fans)
      .find(m => !!m);

    await movie.startMovie();
  }

  private async handleMovie(): Promise<void> {
    if (!game.movie || !(game.movieQuests && game.movieQuests.length)) {
      return;
    }

    if (game.movie.isTimeout) {
      await Movie.extendMovieTime();
    }

    const quest = game.movieQuests.find(MovieQuest.findBestQuest);

    if (quest && quest.isDoable) {
      log.verbose(`Starting a movie quest: ${quest.rewards.movieProgress} reward`);

      await quest.startMovieQuest();
    }
  }
}
