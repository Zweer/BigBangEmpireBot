import Character, { characterRaw } from './character';
import Inventory, { inventoryRaw } from './inventory';
import Quest, { questRaw, questStatus } from './quest';
import User, { userRaw } from './user';

import DataObject from './utils/dataObject';

export type gameRaw = {
  saved_seconds: number,
  quest: questRaw,
  convention_show: object, // Convention
  character: characterRaw,
  custom_banner_advertisments: object[], // CustomBannerAdvertisement
  video_advertisment_id: number,
  success: boolean,
  user: object, // User
  valid: boolean,
  inventory: inventoryRaw,
  quests: questRaw[],
  items: object[], // Item[]
  win_messages: string[],
  reward: string,
  item: object, // Item
  slotmachine_slot1: number,
  slotmachine_slot2: number,
  slotmachine_slot3: number,
  slotmachine_reward_quality: number,
  work: object, // Work
  movie_vote_reward: string,
  available: boolean,
  alternative: string,
  requested_character: characterRaw,
  requested_character_inventory: inventoryRaw,
  requested_character_inventory_items: object[], // Item[]
  requested_character_guild: object, // Guild
  marriages: object[], // Marriage[]
  requested_character_optical_changes: object,
  requested_character_current_goal_values: object,
  requested_character_collected_goals: object,
  max_spendable_amount: number,
  character_selection_data: object[], // CharacterSelectionEntry[]
  redirect_url: string,
  character_selection_entry: object, // CharacterSelectionEntry
  convention_previous_stars: string[],
  convention: object, // Convention
  convention_reward: object[], // ConventionReward[]
  battle: object, // Battle
  current_goal_value: object,
  convention_character_data: object[],
  dating_lookup: object, // Dating
  dating_step: object[], // DatingStep[]
  completed_dating_steps: string[],
  event_quest: object, // EventQuest
  guild: object, // Guild
  guild_competition_data: object, // GuildCompetition
  story_dungeons: object[], // StoryDungeon[]
  fan_foto: object, // FanPhoto
  current_item_pattern_values: object,
  dungeon: object, // Dungeon
  herobook_objectives: object[], // HerobookObjective[]
  pending_guild_battle_attack: object, // GuildBattle
  pending_guild_battle_defense: object, // GuildBattle
  movie: object, // Movie
  dungeon_level: object, // DungeonLevel
  dungeon_levels: object[], // DungeonLevel[]
  dungeon_quest: object, // DungeonQuest
  hash: string,
  collected_item_pattern: object,
  is_enabled: boolean,
  duel: object, // Duel
  missed_duels: number,
  opponents: object[], // Opponent[]
  missed_duel: object, // Duel
  missed_duel_battle: object, // Battle
  decrease_counter: boolean,
  missed_duel_data: object[], // MissedDuel[]
  missed_duel_opponents: object[], // DuelOpponent[]
  opponent: characterRaw,
  opponent_inventory: inventoryRaw,
  opponent_inventory_items: object[], // Item[]
  title: object, // Title
  new_fan_foto_id: number,
  friend_data: object[], // Friend[]
  text: object,
  synced: boolean,
  sync_states: object,
  platform_friends: object[], // PlatformFriend[]
  version_check: string,
  config_overwrites: object,
  extendedConfig: object,
  textures: object,
  constants: object,
  server_selection_data: object,
  new_messages: number,
  new_guild_log_entries: number,
  guild_members: object[], // GuildMember[]
  conventions: object[], // Convention[]
  convention_rewards: object[], // ConventionReward[]
  ingame_notifications: object,
  special_offers: object[],
  daily_login_bonus_rewards: object,
  daily_login_bonus_day: number,
  bonus_info: object, // BonusInfo
  guild_leader_vote: object, // GuildLeaderVote
  sync_timestamp: number,
  expired_guild_boosters: string[],
  constants_override: object[], // Constant[]
  client_info: object, // ClientSessionInfo
  collected_goals: object,
  guild_battle_guilds: object[], // Guild[]
  requested_guild: object, // Guild
  requested_guild_members: object[], // GuildMember[]
  guild_history_battle: object, // GuildBattle
  guild_history_battles: object[], // GuildHistoryBattle[]
  guild_battle_entries: object[], // GuildBattleListEntry[]
  guild_entries: object[], // GuildListEntry
  guild_log: object,
  tournament_guild_competition_reward: object, // TournamentGuildCompetitionReward
  tournament_solo_guild_competition_reward: object, // TournamentSoloGuildCompetitionReward
  leaderboard_guilds: object[], // LeaderboardGuild[]
  max_guilds: number,
  centered_rank: number,
  bank_inventory: object, // BankInventory
  owned_item_templates: string[]
  leaderboard_characters: object[], // LeaderboardCharacter[]
  max_characters: number,
  message: object, // Message
  marriage: object, // Marriage
  messages_character_info: object,
  messages: object[], // Message[]
  messages_read: object[],
  messages_ignored_character_info: object,
  messages_sent_count: number,
  messages_received_count: number,
  movie_quests: object[], // MovieQuest[]
  movie_history: object[], // MovieHistory[]
  movies_count: number,
  movies: object[], // Movie[]
  movie_quest: object, // MovieQuest
  movie_battle: object, // Battle
  movies_to_select: object[], // Movie[]
  selected_movie: object, // Movie
  movies_to_vote: object[], // VoteMovie
  current_optical_changes: object, // OpticalChanges
  collected_optical_changes: object,
  chests: object[], // OpticalChangeChest[]
  outfit: object, // Outfit
  outfits: object[], // Outfit[]
  last_payment_confirmed: boolean,
  consumable_offers: object[],
  payment_promotion_data: object, // PaymentPromotion
  normal_offers: object[],
  payment_id: number,
  payment_link: string,
  story_dungeon: object, // StoryDungeon
  resource_requests: object[], // ResourceRequest[]
  friend_user_ids: number,
  resource_request: object, // ResourceRequest
  from_character_name: string,
  resource_request_friends: object[], // Friend
  completed_story_dungeons: number,
  movie_tournament_end_timestamp: number,
  tournament_end_timestamp: number,
  tournament_movie_rewards: object,
  tournament_rewards: object, // TournamentReward
  leaderboard_guild_competitions: object[], // LeaderboardGuildCompetition[]
  max_guild_competitions: number,
  guilds_with_rewards: number,
  guild_competition_tournament_end_timestamp: number,
  leaderboard_movies: object[], // LeaderboardMovie[]
  max_movies: number,
  leaderboard_solo_guild_competitions: object[], // LeaderboardSoloGuildCOmpetition[]
  max_solo_guild_competitions: number,
  reactivation_code: string,
  campaigns: object,
  user_geo_location: string,
  finished_guild_battle_attack: object, // GuildBattle
  finished_guild_battle_defense: object, // GuildBattle
  guild_battle_rewards: object[], // GuildBattleReward[]
  battles: object[], // Battle[]
  ref: string,
  reskill_enabled: boolean,
  advertisment_info: object,
  show_advertisment: boolean,
  show_preroll_advertisment: boolean,
  titles: object[], // Title[]
  expired_boosters: string[],
  tos_update_needed: boolean,
  pp_update_needed: boolean,
  new_version: boolean,
  login_count: number,
  server_timestamp_offset: number,
  ad_provider_keys: string[],
  user_voucher_rewards: object,
  isValid: boolean,
  voucher: object, // Voucher
  collected_work: object, // CollectedWork
};

export default class Game extends DataObject<gameRaw> {
  public savedSeconds: number;
  public quest: Quest;
  public conventionShow: object; // Convention
  public character: Character;
  public customBannerAdvertisments: object[]; // CustomBannerAdvertisement
  public videoAdvertismentId: number;
  public success: boolean;
  public user: User;
  public valid: boolean;
  public inventory: Inventory;
  public quests: Quest[];
  public items: object[]; // Item[]
  public winMessages: string[];
  public reward: string;
  public item: object; // Item
  public slotmachineSlot1: number;
  public slotmachineSlot2: number;
  public slotmachineSlot3: number;
  public slotmachineRewardQuality: number;
  public work: object; // Work
  public movieVoteReward: string;
  public available: boolean;
  public alternative: string;
  public requestedCharacter: Character;
  public requestedCharacterInventory: Inventory;
  public requestedCharacterInventoryItems: object[]; // Item[]
  public requestedCharacterGuild: object; // Guild
  public marriages: object[]; // Marriage[]
  public requestedCharacterOpticalChanges: object;
  public requestedCharacterCurrentGoalValues: object;
  public requestedCharacterCollectedGoals: object;
  public maxSpendableAmount: number;
  public characterSelectionData: object[]; // CharacterSelectionEntry[]
  public redirectUrl: string;
  public characterSelectionEntry: object; // CharacterSelectionEntry
  public conventionPreviousStars: string[];
  public convention: object; // Convention
  public conventionReward: object[]; // ConventionReward[]
  public battle: object; // Battle
  public currentGoalValue: object;
  public conventionCharacterData: object[];
  public datingLookup: object; // Dating
  public datingStep: object[]; // DatingStep[]
  public completedDatingSteps: string[];
  public eventQuest: object; // EventQuest
  public guild: object; // Guild
  public guildCompetitionData: object; // GuildCompetition
  public storyDungeons: object[]; // StoryDungeon[]
  public fanFoto: object; // FanPhoto
  public currentItemPatternValues: object;
  public dungeon: object; // Dungeon
  public herobookObjectives: object[]; // HerobookObjective[]
  public pendingGuildBattleAttack: object; // GuildBattle
  public pendingGuildBattleDefense: object; // GuildBattle
  public movie: object; // Movie
  public dungeonLevel: object; // DungeonLevel
  public dungeonLevels: object[]; // DungeonLevel[]
  public dungeonQuest: object; // DungeonQuest
  public hash: string;
  public collectedItemPattern: object;
  public isEnabled: boolean;
  public duel: object; // Duel
  public missedDuels: number;
  public opponents: object[]; // Opponent[]
  public missedDuel: object; // Duel
  public missedDuelBattle: object; // Battle
  public decreaseCounter: boolean;
  public missedDuelData: object[]; // MissedDuel[]
  public missedDuelOpponents: object[]; // DuelOpponent[]
  public opponent: Character;
  public opponentInventory: Inventory;
  public opponentInventoryItems: object[]; // Item[]
  public title: object; // Title
  public newFanFotoId: number;
  public friendData: object[]; // Friend[]
  public text: object;
  public synced: boolean;
  public syncStates: object;
  public platformFriends: object[]; // PlatformFriend[]
  public versionCheck: string;
  public configOverwrites: object;
  public extendedConfig: object;
  public textures: object;
  public constants: object;
  public serverSelectionData: object;
  public newMessages: number;
  public newGuildLogEntries: number;
  public guildMembers: object[]; // GuildMember[]
  public conventions: object[]; // Convention[]
  public conventionRewards: object[]; // ConventionReward[]
  public ingameNotifications: object;
  public specialOffers: object[];
  public dailyLoginBonusRewards: object;
  public dailyLoginBonusDay: number;
  public bonusInfo: object; // BonusInfo
  public guildLeaderVote: object; // GuildLeaderVote
  public syncTimestamp: number;
  public expiredGuildBoosters: string[];
  public constantsOverride: object[]; // Constant[]
  public clientInfo: object; // ClientSessionInfo
  public collectedGoals: object;
  public guildBattleGuilds: object[]; // Guild[]
  public requestedGuild: object; // Guild
  public requestedGuildMembers: object[]; // GuildMember[]
  public guildHistoryBattle: object; // GuildBattle
  public guildHistoryBattles: object[]; // GuildHistoryBattle[]
  public guildBattleEntries: object[]; // GuildBattleListEntry[]
  public guildEntries: object[]; // GuildListEntry
  public guildLog: object;
  public tournamentGuildCompetitionReward: object; // TournamentGuildCompetitionReward
  public tournamentSoloGuildCompetitionReward: object; // TournamentSoloGuildCompetitionReward
  public leaderboardGuilds: object[]; // LeaderboardGuild[]
  public maxGuilds: number;
  public centeredRank: number;
  public bankInventory: object; // BankInventory
  public ownedItemTemplates: string[]
  public leaderboardCharacters: object[]; // LeaderboardCharacter[]
  public maxCharacters: number;
  public message: object; // Message
  public marriage: object; // Marriage
  public messagesCharacterInfo: object;
  public messages: object[]; // Message[]
  public messagesRead: object[];
  public messagesIgnoredCharacterInfo: object;
  public messagesSentCount: number;
  public messagesReceivedCount: number;
  public movieQuests: object[]; // MovieQuest[]
  public movieHistory: object[]; // MovieHistory[]
  public moviesCount: number;
  public movies: object[]; // Movie[]
  public movieQuest: object; // MovieQuest
  public movieBattle: object; // Battle
  public moviesToSelect: object[]; // Movie[]
  public selectedMovie: object; // Movie
  public moviesToVote: object[]; // VoteMovie
  public currentOpticalChanges: object; // OpticalChanges
  public collectedOpticalChanges: object;
  public chests: object[]; // OpticalChangeChest[]
  public outfit: object; // Outfit
  public outfits: object[]; // Outfit[]
  public lastPaymentConfirmed: boolean;
  public consumableOffers: object[];
  public paymentPromotionData: object; // PaymentPromotion
  public normalOffers: object[];
  public paymentId: number;
  public paymentLink: string;
  public storyDungeon: object; // StoryDungeon
  public resourceRequests: object[]; // ResourceRequest[]
  public friendUserIds: number;
  public resourceRequest: object; // ResourceRequest
  public fromCharacterName: string;
  public resourceRequestFriends: object[]; // Friend
  public completedStoryDungeons: number;
  public movieTournamentEndTimestamp: number;
  public tournamentEndTimestamp: number;
  public tournamentMovieRewards: object;
  public tournamentRewards: object; // TournamentReward
  public leaderboardGuildCompetitions: object[]; // LeaderboardGuildCompetition[]
  public maxGuildCompetitions: number;
  public guildsWithRewards: number;
  public guildCompetitionTournamentEndTimestamp: number;
  public leaderboardMovies: object[]; // LeaderboardMovie[]
  public maxMovies: number;
  public leaderboardSoloGuildCompetitions: object[]; // LeaderboardSoloGuildCOmpetition[]
  public maxSoloGuildCompetitions: number;
  public reactivationCode: string;
  public campaigns: object;
  public userGeoLocation: string;
  public finishedGuildBattleAttack: object; // GuildBattle
  public finishedGuildBattleDefense: object; // GuildBattle
  public guildBattleRewards: object[]; // GuildBattleReward[]
  public battles: object[]; // Battle[]
  public ref: string;
  public reskillEnabled: boolean;
  public advertismentInfo: object;
  public showAdvertisment: boolean;
  public showPrerollAdvertisment: boolean;
  public titles: object[]; // Title[]
  public expiredBoosters: string[];
  public tosUpdateNeeded: boolean;
  public ppUpdateNeeded: boolean;
  public newVersion: boolean;
  public loginCount: number;
  public serverTimestampOffset: number;
  public adProviderKeys: string[];
  public userVoucherRewards: object;
  public isValid: boolean;
  public voucher: object; // Voucher
  public collectedWork: object; // CollectedWork

  setCharacter(character: characterRaw) {
    if (this.character) {
      this.character.update(character);
    } else {
      this.character = new Character(character);
    }
  }

  setInventory(inventory: inventoryRaw) {
    this.inventory = new Inventory(inventory);
  }

  setOpponent(opponent: characterRaw) {
    this.opponent = new Character(opponent);
  }

  setOpponentInventory(inventory: inventoryRaw) {
    this.opponentInventory = new Inventory(inventory);
  }

  setQuests(quests: questRaw[]) {
    this.quests = quests
      .map(quest => new Quest(quest))
      .sort(Quest.sort);
  }

  setRequestedCharacter(requestedCharacter: characterRaw) {
    this.requestedCharacter = new Character(requestedCharacter);
  }

  setRequestedCharacterInventory(inventory: inventoryRaw) {
    this.requestedCharacterInventory = new Inventory(inventory);
  }

  setUser(user: userRaw) {
    this.user = new User(user);
  }

  get currentQuest() {
    return this.quests.find(quest => quest.status !== questStatus.CREATED);
  }
}
