import character from '../models/character';
import game from '../models/game';
import ResourceRequest from '../models/mailbox/resourceRequest';

import log from '../lib/log';

import AbstractModule from '.';

export default class MailboxModule extends AbstractModule {
  private oldMessages: number = 0;

  async handle(): Promise<void> {
    await this.handleMessages();
    await this.handleResourceRequests();
  }

  private async handleMessages() {
    if (game.newMessages === 0 || game.newMessages === this.oldMessages) {
      return;
    }

    this.oldMessages = game.newMessages;

    log.info(`You have ${game.newMessages} new messages (${character.pendingResourceRequests} resource requests)`);

    if (character.pendingResourceRequests > 0) {
      log.debug('Accepting all resource requests');

      await ResourceRequest.acceptAllResourceRequests();
    }
  }

  private async handleResourceRequests() {
    await ResourceRequest.createResourceRequest();
  }
}
