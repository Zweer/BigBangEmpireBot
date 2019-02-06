import DataObject from '../utils/dataObject';

export type abstractMovieRaw = {
  id: number;
  set: string;
  title: string;
  cover: string;
};

export default class AbstractMovie<T extends abstractMovieRaw> extends DataObject<T> {
  cover: string;
  id: number;
  set: string;
  title: string;
}
