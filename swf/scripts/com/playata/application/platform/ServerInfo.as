package com.playata.application.platform
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.guild.StudioAppearanceSettings;
   import com.playata.application.data.server.ServerSelectionData;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.StringUtil;
   
   public class ServerInfo
   {
      
      private static var _defaultServerSelectionData:ServerSelectionData = new ServerSelectionData(null);
      
      private static var _leaderboardServerSelectionData:ServerSelectionData = new ServerSelectionData(null);
      
      public static const ASSET_IMAGE:String = "png";
      
      public static const ASSET_MOVIE:String = "swf";
       
      
      public function ServerInfo()
      {
         super();
      }
      
      public static function assetURL(param1:String, param2:String, param3:String = null) : String
      {
         var _loc4_:String = Assets.assetURL(param1,param2);
         if(param3)
         {
            if(_loc4_.indexOf("?") != -1)
            {
               _loc4_ = _loc4_ + ("&" + param3);
            }
            else
            {
               _loc4_ = _loc4_ + ("?" + param3);
            }
         }
         return _loc4_;
      }
      
      public static function setDefaultServerSelectionData(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         _defaultServerSelectionData = new ServerSelectionData(new TypedObject(param1));
      }
      
      public static function get defaultServerSelectionData() : ServerSelectionData
      {
         return _defaultServerSelectionData;
      }
      
      public static function setLeaderboardServerSelectionData(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         _leaderboardServerSelectionData = new ServerSelectionData(new TypedObject(param1));
      }
      
      public static function get leaderboardServerSelectionData() : ServerSelectionData
      {
         return _leaderboardServerSelectionData;
      }
      
      public static function getLocaleFromServer(param1:String) : String
      {
         if(!param1)
         {
            return null;
         }
         if(StringUtil.startsWith(param1,"fr"))
         {
            return "fr_FR";
         }
         if(StringUtil.startsWith(param1,"pl"))
         {
            return "pl_PL";
         }
         if(StringUtil.startsWith(param1,"uk"))
         {
            return "en_GB";
         }
         if(StringUtil.startsWith(param1,"es"))
         {
            return "es_ES";
         }
         if(StringUtil.startsWith(param1,"gr"))
         {
            return "el_GR";
         }
         if(StringUtil.startsWith(param1,"pt"))
         {
            return "pt_PT";
         }
         if(StringUtil.startsWith(param1,"mx"))
         {
            return "es_MX";
         }
         if(StringUtil.startsWith(param1,"br"))
         {
            return "pt_BR";
         }
         if(StringUtil.startsWith(param1,"us"))
         {
            return "en_US";
         }
         if(StringUtil.startsWith(param1,"ap"))
         {
            return "en_AP";
         }
         if(StringUtil.startsWith(param1,"la"))
         {
            return "es_LA";
         }
         if(StringUtil.startsWith(param1,"ru"))
         {
            return "ru_RU";
         }
         if(StringUtil.startsWith(param1,"it"))
         {
            return "it_IT";
         }
         if(StringUtil.startsWith(param1,"tr"))
         {
            return "tr_TR";
         }
         if(StringUtil.startsWith(param1,"bg"))
         {
            return "bg_BG";
         }
         if(StringUtil.startsWith(param1,"ro"))
         {
            return "ro_RO";
         }
         if(StringUtil.startsWith(param1,"hr"))
         {
            return "hr_HR";
         }
         if(StringUtil.startsWith(param1,"lt"))
         {
            return "lt_LT";
         }
         if(StringUtil.startsWith(param1,"cz"))
         {
            return "cs_CZ";
         }
         if(StringUtil.startsWith(param1,"de"))
         {
            return "de_DE";
         }
         if(StringUtil.startsWith(param1,"int"))
         {
            return "en_WO";
         }
         if(StringUtil.startsWith(param1,"test"))
         {
            return "de_DE";
         }
         if(StringUtil.startsWith(param1,"local"))
         {
            return "de_DE";
         }
         return null;
      }
      
      public static function get gameId() : String
      {
         return AppConfig.gameId;
      }
      
      public static function get serverId() : String
      {
         return AppConfig.serverId;
      }
      
      public static function get isInternational() : Boolean
      {
         return StringUtil.startsWith(serverId,"int");
      }
      
      public static function get isTest() : Boolean
      {
         return serverId == "test" || serverId.indexOf("test.") != -1;
      }
      
      public static function avatarImageURLByHash(param1:String) : String
      {
         param1 = param1 + ("hba:" + AppEnvironment.appPlatform.isHideBraAllowed + ";");
         param1 = param1 + ("hpa:" + AppEnvironment.appPlatform.isHidePantiesAllowed + ";");
         return Core.config.getString("urlCDNGetImage") + "getImage.php?cdn=1&hash=avatar_image%3Aimage_hash=" + encodeURIComponent(param1);
      }
      
      public static function movieCoverURLByHash(param1:String) : String
      {
         param1 = param1 + ("hba:" + AppEnvironment.appPlatform.isHideBraAllowed + ";");
         param1 = param1 + ("hpa:" + AppEnvironment.appPlatform.isHidePantiesAllowed + ";");
         param1 = param1 + "v2;";
         return Core.config.getString("urlCDNGetImage") + "getImage.php?cdn=1&hash=movie_cover%3Aimage_hash=" + encodeURIComponent(param1);
      }
      
      public static function studioBackgroundUrlsBySettings(param1:StudioAppearanceSettings) : Vector.<String>
      {
         var _loc2_:Vector.<String> = new Vector.<String>();
         if(param1.room)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.room,"png"));
         }
         if(param1.motivation)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.motivation,"png"));
         }
         if(param1.popularity)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.popularity,"png"));
         }
         if(param1.equipment)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.equipment,"png"));
         }
         if(param1.actors_right)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.actors_right,"png"));
         }
         if(param1.quarter)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.quarter,"png"));
         }
         if(param1.actors_left)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + param1.actors_left,"png"));
         }
         return _loc2_;
      }
      
      public static function movieSettingBackgroundLayerUrlsByList(param1:Vector.<String>) : Vector.<String>
      {
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(ServerInfo.assetURL("guild_backgrounds_new_new/" + _loc3_,"png"));
         }
         return _loc2_;
      }
   }
}
