package com.playata.framework.assets
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.collection.GenericMap;
   
   public class AssetManager implements IDisposable
   {
       
      
      private var _loaders:GenericMap;
      
      public function AssetManager()
      {
         super();
         _loaders = new GenericMap();
      }
      
      public function addLoader(param1:AssetType, param2:IAssetLoader) : void
      {
         _loaders.setData(param1,param2);
      }
      
      public function getLoader(param1:AssetType) : IAssetLoader
      {
         if(!_loaders.exists(param1))
         {
            return null;
         }
         return _loaders.getData(param1);
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _loaders;
         for each(var _loc1_ in _loaders)
         {
            _loc1_.dispose();
         }
         _loaders = null;
      }
   }
}
