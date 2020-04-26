package com.playata.application.task.assets
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   
   public class UriDisplayObjectAssetCache
   {
       
      
      private var _cache:StringMap;
      
      private var _cachePoolManager:StringMap;
      
      public function UriDisplayObjectAssetCache()
      {
         _cache = new StringMap();
         _cachePoolManager = new StringMap();
         super();
      }
      
      public function getUriDisplayObjectAsset(param1:UriDisplayObjectAssetDefinition, param2:int) : UriDisplayObjectAsset
      {
         var _loc6_:* = undefined;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc5_:String = param1.cacheKey;
         if(_cache.exists(_loc5_) && param2 != -1)
         {
            _loc6_ = _cache.getData(_loc5_) as Vector.<UriDisplayObjectAsset>;
            _loc3_ = _loc6_[0] as UriDisplayObjectAsset;
            _loc7_ = _cachePoolManager.getData(_loc5_) as int;
            if(_loc3_.isDownloaded)
            {
               if(param2 > _loc6_.length)
               {
                  _loc8_ = _loc3_.clone(param1.onCompleted);
                  _loc6_.push(_loc8_);
                  _cachePoolManager.setData(_loc5_,_loc7_ + 1);
                  return _loc8_;
               }
               _loc7_++;
               if(_loc7_ >= param2)
               {
                  _loc7_ = 0;
               }
               _cachePoolManager.setData(_loc5_,_loc7_);
               _loc4_ = _loc6_[_loc7_];
               if(_loc4_.isDownloaded)
               {
                  if(param1.onCompleted != null)
                  {
                     param1.onCompleted(_loc4_);
                  }
               }
               return _loc4_;
            }
            if(param2 == 1)
            {
               return _loc3_;
            }
         }
         var _loc10_:UriDisplayObjectAsset = new UriDisplayObjectAsset(param1.settings);
         _loc10_.loadAsset();
         var _loc9_:Vector.<UriDisplayObjectAsset> = new Vector.<UriDisplayObjectAsset>();
         _loc9_.push(_loc10_);
         _cache.setData(_loc5_,_loc9_);
         _cachePoolManager.setData(_loc5_,0);
         return _loc10_;
      }
      
      public function clearCache(param1:String = null) : void
      {
         if(param1 == null)
         {
            _cache = new StringMap();
         }
         else if(param1 && _cache.exists(param1))
         {
            _cache.remove(param1);
         }
      }
      
      public function printCachedObjects() : void
      {
         var _loc1_:* = undefined;
         var _loc4_:int = 0;
         var _loc3_:* = _cache;
         for(var _loc2_ in _cache)
         {
            _loc1_ = _cache.getData(_loc2_) as Vector.<UriDisplayObjectAsset>;
            Logger.debug("[UriDisplayObjectAssetCache] " + (_loc2_ as String) + ": Instances=" + _loc1_.length);
         }
      }
   }
}
