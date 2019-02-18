import AbstractQuest, { abstractQuestRaw } from '../abstracts/quest';

export type movieQuestRaw = abstractQuestRaw & {
  movie_id: number;
};

export default class MovieQuest extends AbstractQuest<movieQuestRaw> {
  movieId: number;
}
