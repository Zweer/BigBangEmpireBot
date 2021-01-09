package com.playata.application.data.guild
{
   public class GuildEventType
   {
      
      public static const Unknown:int = 0;
      
      public static const MemberJoined:int = 1;
      
      public static const MemberLeft:int = 2;
      
      public static const MemberKicked:int = 3;
      
      public static const MemberNewRank:int = 4;
      
      public static const MemberDonated:int = 5;
      
      public static const GuildStatChanged:int = 6;
      
      public static const DescriptionChanged:int = 7;
      
      public static const NoteChanged:int = 8;
      
      public static const EmblemChanged:int = 9;
      
      public static const MemberDeleted:int = 10;
      
      public static const MissilesRecharged:int = 11;
      
      public static const NameChanged:int = 12;
      
      public static const ArenaChanged:int = 13;
      
      public static const AutoJoinsRecharged:int = 14;
      
      public static const ArtifactReleased:int = 15;
      
      public static const LocaleChanged:int = 16;
      
      public static const OfficerNoteChanged:int = 17;
      
      public static const GuildBattle_Attack:int = 101;
      
      public static const GuildBattle_Defense:int = 102;
      
      public static const GuildBattle_JoinedAttack:int = 103;
      
      public static const GuildBattle_JoinedDefense:int = 104;
      
      public static const GuildBattle_BattleWon:int = 105;
      
      public static const GuildBattle_BattleLost:int = 106;
      
      public static const GuildBattle_ArtifactWon:int = 107;
      
      public static const GuildBattle_ArtifactLost:int = 108;
      
      public static const GuildBattle_AbortedAttack:int = 109;
      
      public static const GuildBattle_AbortedDefense:int = 110;
      
      public static const GuildBattle_PremiumCurrencyReward:int = 111;
      
      public static const GuildLeaderVote_Init:int = 301;
      
      public static const GuildLeaderVote_Finished_SameLeader:int = 302;
      
      public static const GuildLeaderVote_Finished_NewLeader:int = 303;
      
      public static const GuildCompetition_Finished:int = 401;
      
      public static const GuildCompetition_Finished_NoRewards:int = 402;
      
      public static const GuildCompetition_Finished_NoRank:int = 403;
      
      public static const SlotmachineSpin_Coins_Reward:int = 501;
      
      public static const SlotmachineSpin_Item_Reward:int = 502;
      
      public static const SlotmachineSpin_Booster_Reward:int = 503;
      
      public static const SlotmachineSpin_StatPoints_Reward:int = 504;
      
      public static const SlotmachineSpin_Xp_Reward:int = 505;
      
      public static const SlotmachineSpin_Energy_Reward:int = 506;
      
      public static const GuildBooster_Bought:int = 601;
      
      public static const GuildBooster_Extended:int = 602;
      
      public static const GuildBooster_Expired:int = 603;
       
      
      public function GuildEventType()
      {
         super();
      }
   }
}
