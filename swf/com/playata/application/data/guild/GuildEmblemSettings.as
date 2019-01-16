package com.playata.application.data.guild
{
   import com.playata.application.data.character.LeaderboardCharacter;
   import com.playata.application.data.constants.CGuildEmblemBackground;
   import com.playata.application.data.constants.CGuildEmblemColor;
   import com.playata.application.data.constants.CGuildEmblemIcon;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.localization.LocText;
   
   public class GuildEmblemSettings
   {
       
      
      public var emblemBackgroundShapeId:int = 0;
      
      public var emblemBackgroundColorIndex:int = 0;
      
      public var emblemBackgroundBorderColorIndex:int = 0;
      
      public var emblemIconShapeId:int = 0;
      
      public var emblemIconColorIndex:int = 0;
      
      public var emblemIconSize:int = 0;
      
      public function GuildEmblemSettings(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this.emblemBackgroundShapeId = param1;
         this.emblemBackgroundColorIndex = param2;
         this.emblemBackgroundBorderColorIndex = param3;
         this.emblemIconShapeId = param4;
         this.emblemIconColorIndex = param5;
         this.emblemIconSize = param6;
      }
      
      public static function fromGuild(param1:Guild) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShape,param1.emblemBackgroundColor,param1.emblemBackgroundBorderColor,param1.emblemIconShape,param1.emblemIconColor,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromGuildSearchResult(param1:GuildSearchResult) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShape,param1.emblemBackgroundColor,param1.emblemBackgroundBorderColor,param1.emblemIconShape,param1.emblemIconColor,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromGuildBattleSearchResult(param1:GuildBattleSearchResult) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShape,param1.emblemBackgroundColor,param1.emblemBackgroundBorderColor,param1.emblemIconShape,param1.emblemIconColor,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromLeaderboardCharacter(param1:LeaderboardCharacter) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShape,param1.emblemBackgroundColor,param1.emblemBackgroundBorderColor,param1.emblemIconShape,param1.emblemIconColor,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromLeaderboardGuild(param1:LeaderboardGuild) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShapeId,param1.emblemBackgroundColorIndex,param1.emblemBackgroundBorderColorIndex,param1.emblemIconShapeId,param1.emblemIconColorIndex,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromLeaderboardGuildCompetition(param1:LeaderboardGuildCompetition) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShapeId,param1.emblemBackgroundColorIndex,param1.emblemBackgroundBorderColorIndex,param1.emblemIconShapeId,param1.emblemIconColorIndex,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromLeaderboardSoloGuildCompetition(param1:LeaderboardSoloGuildCompetition) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShapeId,param1.emblemBackgroundColorIndex,param1.emblemBackgroundBorderColorIndex,param1.emblemIconShapeId,param1.emblemIconColorIndex,param1.emblemIconSize);
         return _loc2_;
      }
      
      public static function fromGuildBattleHistoryFight(param1:GuildBattleHistoryFight) : GuildEmblemSettings
      {
         var _loc2_:GuildEmblemSettings = new GuildEmblemSettings(param1.emblemBackgroundShapeId,param1.emblemBackgroundColorIndex,param1.emblemBackgroundBorderColorIndex,param1.emblemIconShapeId,param1.emblemIconColorIndex,param1.emblemIconSize);
         return _loc2_;
      }
      
      public function emblemBackgroundIdentifier(param1:String) : String
      {
         return CGuildEmblemBackground.fromId(emblemBackgroundShapeId).assetIdentifier + "_" + param1;
      }
      
      public function get emblemIconIdentifier() : String
      {
         return CGuildEmblemIcon.fromId(emblemIconShapeId).assetIdentifier;
      }
      
      public function get emblemBackgroundMovieUrl() : String
      {
         var _loc1_:String = CGuildEmblemBackground.fromId(emblemBackgroundShapeId).assetIdentifier;
         return ServerInfo.assetURL("guild_emblem_backgrounds/" + _loc1_,"swf");
      }
      
      public function get emblemIconMovieUrl() : String
      {
         var _loc1_:String = CGuildEmblemIcon.fromId(emblemIconShapeId).assetIdentifier;
         return ServerInfo.assetURL("guild_emblem_icons/" + _loc1_,"swf");
      }
      
      public function get emblemBackgroundColor() : uint
      {
         return StringUtil.hexColorToUint(CGuildEmblemColor.constantsData[emblemBackgroundColorIndex] as String);
      }
      
      public function get emblemBackgroundBorderColor() : uint
      {
         return StringUtil.hexColorToUint(CGuildEmblemColor.constantsData[emblemBackgroundBorderColorIndex] as String);
      }
      
      public function get emblemIconColor() : uint
      {
         return StringUtil.hexColorToUint(CGuildEmblemColor.constantsData[emblemIconColorIndex] as String);
      }
      
      public function get emblemColors() : Vector.<uint>
      {
         var _loc1_:Vector.<uint> = new Vector.<uint>();
         var _loc4_:int = 0;
         var _loc3_:* = CGuildEmblemColor.constantsData;
         for each(var _loc2_ in CGuildEmblemColor.constantsData)
         {
            _loc1_.push(StringUtil.hexColorToUint(_loc2_ as String));
         }
         return _loc1_;
      }
      
      public function get shapeNeedsCoins() : Boolean
      {
         return shapeGameCurrencyCost > 0;
      }
      
      public function get shapeNeedsPremiumCurrency() : Boolean
      {
         return shapePremiumCurrencyCost > 0;
      }
      
      public function get shapeGameCurrencyCost() : int
      {
         return CGuildEmblemBackground.fromId(emblemBackgroundShapeId).gameCurrencyCost;
      }
      
      public function get shapePremiumCurrencyCost() : int
      {
         return CGuildEmblemBackground.fromId(emblemBackgroundShapeId).premiumCurrencyCost;
      }
      
      public function get shapeCoinCostString() : String
      {
         if(shapeGameCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(shapeGameCurrencyCost);
      }
      
      public function get shapePremiumCurrencyCostString() : String
      {
         if(shapePremiumCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(shapePremiumCurrencyCost);
      }
      
      public function get iconNeedsGameCurrency() : Boolean
      {
         return iconGameCurrencyCost > 0;
      }
      
      public function get iconNeedsPremiumCurrency() : Boolean
      {
         return iconPremiumCurrencyCost > 0;
      }
      
      public function get iconGameCurrencyCost() : int
      {
         return CGuildEmblemIcon.fromId(emblemIconShapeId).gameCurrencyCost;
      }
      
      public function get iconPremiumCurrencyCost() : int
      {
         return CGuildEmblemIcon.fromId(emblemIconShapeId).premiumCurrencyCost;
      }
      
      public function get iconGameCurrencyCostString() : String
      {
         if(iconGameCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(iconGameCurrencyCost);
      }
      
      public function get iconPremiumCurrencyCostString() : String
      {
         if(iconPremiumCurrencyCost == 0)
         {
            return LocText.current.text("general/no_cost");
         }
         return LocText.current.formatHugeNumber(iconPremiumCurrencyCost);
      }
      
      public function isEqual(param1:GuildEmblemSettings) : Boolean
      {
         return this.emblemBackgroundShapeId == param1.emblemBackgroundShapeId && this.emblemBackgroundColorIndex == param1.emblemBackgroundColorIndex && this.emblemBackgroundBorderColorIndex == param1.emblemBackgroundBorderColorIndex && this.emblemIconShapeId == param1.emblemIconShapeId && this.emblemIconColorIndex == param1.emblemIconColorIndex && this.emblemIconSize == param1.emblemIconSize;
      }
   }
}
