package com.playata.application.data.guild
{
   import com.playata.application.data.constants.CGuildArenaBackground;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.localization.LocText;
   
   public class GuildArenaSettings
   {
       
      
      public var arenaBackgroundId:int = 0;
      
      public function GuildArenaSettings(param1:int)
      {
         super();
         if(!param1)
         {
            param1 = 1;
         }
         this.arenaBackgroundId = param1;
      }
      
      public static function fromGuild(param1:Guild) : GuildArenaSettings
      {
         var _loc2_:GuildArenaSettings = new GuildArenaSettings(param1.arenaBackground);
         return _loc2_;
      }
      
      public function get arenaBackgroundMovieUrl() : String
      {
         var _loc2_:String = CGuildArenaBackground.fromId(arenaBackgroundId).assetIdentifier;
         var _loc1_:String = "swf";
         if(Environment.info.isTouchScreen)
         {
            _loc1_ = "jpg";
         }
         if(_loc2_ == "default")
         {
            return ServerInfo.assetURL("backgrounds_new/duels",_loc1_);
         }
         return ServerInfo.assetURL("backgrounds_new/guild_arena_" + _loc2_,_loc1_);
      }
      
      public function get arenaBackgroundThumbImageUrl() : String
      {
         var _loc1_:String = CGuildArenaBackground.fromId(arenaBackgroundId).assetIdentifier;
         return ServerInfo.assetURL("guild_arena_backgrounds/" + _loc1_ + "_t","jpg");
      }
      
      public function get panelBackgroundType() : int
      {
         return 6;
      }
      
      public function get backgroundNeedsGameCurrency() : Boolean
      {
         return backgroundGameCurrencyCost > 0;
      }
      
      public function get backgroundNeedsPremiumCurrency() : Boolean
      {
         return backgroundPremiumCurrencyCost > 0;
      }
      
      public function get backgroundGameCurrencyCost() : int
      {
         return CGuildArenaBackground.fromId(arenaBackgroundId).gameCurrencyCost;
      }
      
      public function get backgroundPremiumCurrencyCost() : int
      {
         return CGuildArenaBackground.fromId(arenaBackgroundId).premiumCurrencyCost;
      }
      
      public function get backgroundGameCurrencyCostString() : String
      {
         if(backgroundGameCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(backgroundGameCurrencyCost);
      }
      
      public function get backgroundPremiumCurrencyCostString() : String
      {
         if(backgroundPremiumCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(backgroundPremiumCurrencyCost);
      }
      
      public function isEqual(param1:GuildArenaSettings) : Boolean
      {
         return this.arenaBackgroundId == param1.arenaBackgroundId;
      }
   }
}
