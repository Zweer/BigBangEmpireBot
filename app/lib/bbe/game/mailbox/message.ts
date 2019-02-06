import DataObject from '../utils/dataObject';
import MessageCharacter from "./character";

export type messageRaw = {
  id: number;
  ts_creation: number;
  character_from_id: number;
  character_to_ids: string;
  subject: string;
  message: string;
  flag: string;
  flag_value: string;
};

export default class Message extends DataObject<messageRaw> {
  id: number;
  tsCreation: number;
  characterFromId: number;
  characterToIds: string;
  subject: string;
  message: string;
  flag: string;
  flagValue: string;
  character: MessageCharacter;

  constructor(data: messageRaw, messageCharacters: { [key: string]: MessageCharacter }) {
    super(data);

    this.character = messageCharacters[this.characterFromId];
  }
}
