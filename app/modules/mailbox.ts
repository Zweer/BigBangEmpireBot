import game from '../models/game';

import AbstractModule from '.';

export default class MailboxModule extends AbstractModule {
  private oldMessages: number = 0;

  async handle(): Promise<void> {
    await this.handleMessages();
    await this.handleResourceRequests();
  }

  get newMessages() {
    return game.newMessages;
  }

  get pendingResourceRequests() {
    return game.character.pendingResourceRequests;
  }

  private async handleMessages() {
    if (this.newMessages === 0 || this.newMessages === this.oldMessages) {
      return;
    }

    this.oldMessages = this.newMessages;

    this.log.info(`You have ${this.newMessages} new messages (${this.pendingResourceRequests} resource requests)`);

    if (this.pendingResourceRequests > 0) {
      this.log.debug('Accepting all resource requests');

      await this.request.acceptAllResourceRequests();
    }
  }

  private async handleResourceRequests() {
    const friends = await this.request.getAvailableResourceRequestFriends();

    if (friends.length) {
      await this.request.createResourceRequest(friends);
    }
  }
}
