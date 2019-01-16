package com.playata.application.data.character
{
   import com.playata.application.Application;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.Cache;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   
   public class CharacterSelection
   {
       
      
      private const CACHE_KEY:String = "pstar_character_selection_data_mobile_live";
      
      private var _characterSelectionEntries:Vector.<CharacterSelectionEntry>;
      
      private var _onLoadComplete:Function = null;
      
      private var _useCache:Boolean = false;
      
      public function CharacterSelection()
      {
         _characterSelectionEntries = new Vector.<CharacterSelectionEntry>(0);
         super();
         _useCache = Environment.info.isNativeMobile;
      }
      
      private static function sortByServerId(param1:CharacterSelectionEntry, param2:CharacterSelectionEntry) : int
      {
         return AlphaNumericSortUtil.compare(param1.serverId,param2.serverId);
      }
      
      public function add(param1:CharacterSelectionEntry) : void
      {
         _characterSelectionEntries.push(param1);
         _characterSelectionEntries.sort(sortByServerId);
         if(!_useCache)
         {
            return;
         }
         var _loc2_:TypedObject = Cache.getData("pstar_character_selection_data_mobile_live");
         if(!_loc2_)
         {
            _loc2_ = TypedObject.empty;
         }
         _loc2_.setData(param1.key,param1.rawData);
         Cache.setData("pstar_character_selection_data_mobile_live",_loc2_,true);
      }
      
      public function remove(param1:CharacterSelectionEntry) : void
      {
         if(_characterSelectionEntries.indexOf(param1) == -1)
         {
            return;
         }
         _characterSelectionEntries.removeAt(_characterSelectionEntries.indexOf(param1));
         if(!_useCache)
         {
            return;
         }
         var _loc2_:TypedObject = Cache.getData("pstar_character_selection_data_mobile_live");
         if(!_loc2_)
         {
            return;
         }
         if(!_loc2_.hasData(param1.key))
         {
            return;
         }
         _loc2_.deleteData(param1.key);
         Cache.setData("pstar_character_selection_data_mobile_live",_loc2_,true);
      }
      
      public function clear() : void
      {
         _characterSelectionEntries.length = 0;
         if(!_useCache)
         {
            return;
         }
         Cache.setData("pstar_character_selection_data_mobile_live",TypedObject.empty);
      }
      
      public function load(param1:Function) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         _onLoadComplete = param1;
         if(_useCache)
         {
            _loc2_ = Cache.getData("pstar_character_selection_data_mobile_live");
            if(_loc2_)
            {
               _loc3_ = TypedObject.empty;
               var _loc7_:int = 0;
               var _loc6_:* = _loc2_.rawData;
               for each(var _loc4_ in _loc2_.rawData)
               {
                  _loc5_ = TypedObject.empty;
                  _loc5_.setInt("user_id",_loc4_.user_id);
                  _loc5_.setString("platform",_loc4_.platform);
                  _loc5_.setString("platform_user_id",_loc4_.platform_user_id);
                  _loc5_.setString("email",_loc4_.email);
                  _loc5_.setString("password",_loc4_.password);
                  _loc3_.setString(_loc4_.server_id,_loc5_.asJsonString);
               }
               Environment.application.sendActionRequest("getCharacterSelectionEntries",_loc3_.rawData,handleRequests);
               return;
            }
         }
         Environment.application.sendActionRequest("getCharacterSelection",{"platform":Environment.platform.id},handleRequests);
      }
      
      public function get characterCount() : int
      {
         return _characterSelectionEntries.length;
      }
      
      public function getCharacterByServerId(param1:String) : CharacterSelectionEntry
      {
         var _loc4_:int = 0;
         var _loc3_:* = _characterSelectionEntries;
         for each(var _loc2_ in _characterSelectionEntries)
         {
            if(_loc2_.serverId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getCharacterEntry(param1:int, param2:int) : CharacterSelectionEntry
      {
         var _loc3_:int = param2 + param1;
         if(_loc3_ > _characterSelectionEntries.length - 1)
         {
            return _characterSelectionEntries[_loc3_ - _characterSelectionEntries.length];
         }
         return _characterSelectionEntries[_loc3_];
      }
      
      public function getCharacterIndex(param1:CharacterSelectionEntry) : int
      {
         return _characterSelectionEntries.indexOf(param1);
      }
      
      public function get usedServerIds() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _characterSelectionEntries;
         for each(var _loc2_ in _characterSelectionEntries)
         {
            _loc1_.push(_loc2_.serverId);
         }
         return _loc1_;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = param1.action;
         switch(_loc7_)
         {
            case "getCharacterSelection":
            case "getCharacterSelectionEntries":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = param1.data.character_selection_data;
                  _loc4_ = param1.appResponse.redirect_url;
                  if(_loc4_)
                  {
                     Application.redirectUrl = _loc4_;
                  }
                  if(_loc2_)
                  {
                     _loc7_ = 0;
                     var _loc6_:* = _loc2_;
                     for(var _loc5_ in _loc2_)
                     {
                        _loc3_ = new CharacterSelectionEntry(_loc5_,_loc2_[_loc5_]);
                        add(_loc3_);
                     }
                  }
                  if(_onLoadComplete != null)
                  {
                     _onLoadComplete();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               return;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
