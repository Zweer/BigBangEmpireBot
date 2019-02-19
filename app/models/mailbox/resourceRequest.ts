import request from '../../lib/request';

import Friend from '../friend';

export default class ResourceRequest {
  static async acceptAllResourceRequests() {
    return request.acceptAllResourceRequests();
  }

  static async getAvailableResourceRequestFriends(): Promise<Friend[]> {
    return request.getAvailableResourceRequestFriends();
  }

  static async createResourceRequest(featureType: number = 1) {
    const friends = await ResourceRequest.getAvailableResourceRequestFriends();

    if (friends.length) {
      await request.createResourceRequest(friends, featureType);
    }
  }
}
