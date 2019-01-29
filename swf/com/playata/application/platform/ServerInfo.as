package com.playata.application.platform
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.guild.StudioAppearanceSettings;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   import com.playata.framework.core.util.StringUtil;
   
   public class ServerInfo
   {
      
      private static var _serverSelectionData:TypedObject = null;
      
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
      
      public static function set serverSelectionData(param1:Object) : void
      {
         _serverSelectionData = new TypedObject(param1);
      }
      
      public static function getServersForLocale(param1:String) : Vector.<String>
      {
         if(!_serverSelectionData)
         {
            return null;
         }
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         if(!_serverSelectionData.hasData(param1))
         {
            return _loc2_;
         }
         var _loc4_:TypedObject = _serverSelectionData.getTypedObject(param1);
         if(!_loc4_.hasData("server_ids") || _loc4_.getArray("server_ids").length == 0)
         {
            return _loc2_;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_.getArray("server_ids");
         for each(var _loc3_ in _loc4_.getArray("server_ids"))
         {
            _loc2_.push(_loc3_);
         }
         _loc2_.sort(sortByName);
         return _loc2_;
      }
      
      public static function get availableServerSelectionLocales() : Vector.<String>
      {
         var _loc3_:* = null;
         if(!_serverSelectionData)
         {
            return null;
         }
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc5_:int = 0;
         var _loc4_:* = _serverSelectionData.keys;
         for each(var _loc2_ in _serverSelectionData.keys)
         {
            _loc3_ = _serverSelectionData.getTypedObject(_loc2_);
            if(!(!_loc3_.hasData("server_ids") || _loc3_.getArray("server_ids").length == 0))
            {
               _loc1_.push(_loc2_);
            }
         }
         _loc1_.sort(sortByName);
         return _loc1_;
      }
      
      public static function get availableServerSelectionCount() : int
      {
         var _loc3_:* = null;
         if(!_serverSelectionData)
         {
            return 0;
         }
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _serverSelectionData.keys;
         for each(var _loc2_ in _serverSelectionData.keys)
         {
            _loc3_ = _serverSelectionData.getTypedObject(_loc2_);
            if(!(!_loc3_.hasData("server_ids") || _loc3_.getArray("server_ids").length == 0))
            {
               _loc1_ = _loc1_ + _loc3_.getArray("server_ids").length;
            }
         }
         return _loc1_;
      }
      
      public static function getAvailableNewCharacterLocales(param1:Vector.<String>) : Vector.<String>
      {
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         if(!_serverSelectionData)
         {
            return null;
         }
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         var _loc10_:int = 0;
         var _loc9_:* = _serverSelectionData.keys;
         for each(var _loc4_ in _serverSelectionData.keys)
         {
            _loc6_ = _serverSelectionData.getTypedObject(_loc4_);
            if(!(!_loc6_.hasData("server_ids") || _loc6_.getArray("server_ids").length == 0))
            {
               _loc3_ = false;
               var _loc8_:int = 0;
               var _loc7_:* = _loc6_.getArray("server_ids");
               for each(var _loc5_ in _loc6_.getArray("server_ids"))
               {
                  if(param1.indexOf(_loc5_) == -1)
                  {
                     _loc3_ = true;
                  }
               }
               if(_loc3_)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_.sort(sortByName);
         return _loc2_;
      }
      
      public static function getServersForNewCharacterLocale(param1:String, param2:Vector.<String>) : Vector.<String>
      {
         if(!_serverSelectionData)
         {
            return null;
         }
         var _loc3_:Vector.<String> = new Vector.<String>(0);
         if(!_serverSelectionData.hasData(param1))
         {
            return _loc3_;
         }
         var _loc5_:TypedObject = _serverSelectionData.getTypedObject(param1);
         if(!_loc5_.hasData("server_ids") || _loc5_.getArray("server_ids").length == 0)
         {
            return _loc3_;
         }
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_.getArray("server_ids");
         for each(var _loc4_ in _loc5_.getArray("server_ids"))
         {
            if(param2.indexOf(_loc4_) == -1)
            {
               _loc3_.push(_loc4_);
            }
         }
         _loc3_.sort(sortByName);
         return _loc3_;
      }
      
      private static function sortByName(param1:String, param2:String) : int
      {
         if(param1 == "en_WO")
         {
            return 1;
         }
         if(param2 == "en_WO")
         {
            return -1;
         }
         return AlphaNumericSortUtil.compare(param1,param2);
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
