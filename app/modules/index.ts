import TelegramBot from '../lib/telegram';

export default abstract class AbstractModule {
  constructor(readonly bot: TelegramBot) {}

  abstract async handle(): Promise<void>;
}
