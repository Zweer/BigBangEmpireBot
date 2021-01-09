package com.playata.application.data.server
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   
   public class ServerSelectionData implements IServerSelectionData
   {
       
      
      private var _serverSelectionData:TypedObject = null;
      
      public function ServerSelectionData(param1:TypedObject)
      {
         super();
         _serverSelectionData = param1;
      }
      
      public function get defaultLocale() : String
      {
         return !!ServerInfo.isInternational?"en_WO":Environment.info.defaultLocale;
      }
      
      public function get defaultServer() : String
      {
         return ServerInfo.serverId;
      }
      
      public function get availableLocales() : Vector.<String>
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
      
      public function availableServers(param1:String) : Vector.<String>
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
      
      public function get availableServerSelectionCount() : int
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
      
      public function getAvailableNewCharacterLocales(param1:Vector.<String>) : Vector.<String>
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
      
      public function getServersForNewCharacterLocale(param1:String, param2:Vector.<String>) : Vector.<String>
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
      
      private function sortByName(param1:String, param2:String) : int
      {
         if(param1 == "en_WO")
         {
            return -1;
         }
         if(param2 == "en_WO")
         {
            return 1;
         }
         return AlphaNumericSortUtil.compare(param1,param2);
      }
   }
}
