import AbstractModule from '.';

export default class MailboxModule extends AbstractModule {
  async handle(): Promise<void> {
    await this.handleMessages();
    await this.handleResourceRequests();
  }

  get newMessages() {
    return this.game.newMessages;
  }

  get pendingResourceRequests() {
    return this.game.character.pendingResourceRequests;
  }

  private async handleMessages() {
    if (this.newMessages === 0) {
      return;
    }

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
