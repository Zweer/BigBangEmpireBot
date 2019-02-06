import DataObject from '../utils/dataObject';

export type abstractCharacterRaw = {
  id: number;
  name: string;
  gender: 'm' | 'f';
  online_status: onlineStatus;
};

export enum onlineStatus {
  OFFLINE = 1,
  ONLINE,
}

export default class AbstractCharacter<T extends abstractCharacterRaw> extends DataObject<T> {
  id: number;
  name: string;
  gender: 'm' | 'f';
  onlineStatus: onlineStatus;
}
