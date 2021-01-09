package com.playata.framework.display
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   
   public class UriSpriteCache
   {
       
      
      private var _cache:StringMap;
      
      private var _cachePoolManager:StringMap;
      
      public function UriSpriteCache()
      {
         _cache = new StringMap();
         _cachePoolManager = new StringMap();
         super();
      }
      
      public function getUriSprite(param1:UriSpriteDefinition, param2:int) : IUriSprite
      {
         var _loc6_:* = undefined;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc5_:String = param1.cacheKey;
         if(_cache.exists(_loc5_) && param2 != -1)
         {
            _loc6_ = _cache.getData(_loc5_);
            _loc7_ = _loc6_[0] as IUriSprite;
            _loc8_ = _cachePoolManager.getData(_loc5_);
            if(_loc7_.isDownloaded)
            {
               if(param2 > _loc6_.length)
               {
                  _loc9_ = _loc7_.clone(param1.onCompleted);
                  _loc6_.push(_loc9_);
                  _cachePoolManager.setData(_loc5_,_loc8_ + 1);
                  return _loc9_;
               }
               _loc8_++;
               if(_loc8_ >= param2)
               {
                  _loc8_ = 0;
               }
               _cachePoolManager.setData(_loc5_,_loc8_);
               _loc3_ = _loc6_[_loc8_];
               if(_loc3_.isDownloaded)
               {
                  if(param1.onCompleted != null)
                  {
                     param1.onCompleted(_loc3_);
                  }
               }
               return _loc3_;
            }
            if(param2 == 1)
            {
               return _loc7_;
            }
         }
         var _loc4_:IUriSprite = DisplayObjectFactory.createUriSpriteFromSettings(param1.settings);
         _loc4_.load();
         var _loc10_:Vector.<IUriSprite> = new Vector.<IUriSprite>();
         _loc10_.push(_loc4_);
         _cache.setData(_loc5_,_loc10_);
         _cachePoolManager.setData(_loc5_,0);
         return _loc4_;
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
            _loc1_ = _cache.getData(_loc2_);
            Logger.debug("[UriSpriteCache] " + _loc2_ + ": Instances=" + _loc1_.length);
         }
      }
   }
}
