import AbstractCharacter, { abstractCharacterRaw } from '../abstracts/character';

export type messageCharacterRaw = abstractCharacterRaw & {
  ts_ignore_date: number;
};

export default class MessageCharacter extends AbstractCharacter<messageCharacterRaw> {
  tsIgnoreDate: number;
}
