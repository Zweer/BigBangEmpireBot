package com.playata.framework.display.lib.flash
{
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.assets.location.StringAssetLocationData;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.ITexture;
   import flash.display.BitmapData;
   
   public class FlashAssetLoader implements IAssetLoader
   {
       
      
      private var _assetType:AssetType;
      
      private var _assetLocations:Vector.<IAssetLocation>;
      
      private var _queuedAssetDefinitions:Vector.<AssetDefinition>;
      
      public function FlashAssetLoader(param1:AssetType, param2:Number = 1)
      {
         super();
         _assetType = param1;
         _assetLocations = new Vector.<IAssetLocation>(0);
         _queuedAssetDefinitions = new Vector.<AssetDefinition>(0);
      }
      
      public function dispose() : void
      {
      }
      
      public function addAssetLocation(param1:IAssetLocation) : void
      {
         _assetLocations.push(param1);
      }
      
      public function get assetLocations() : Vector.<IAssetLocation>
      {
         return _assetLocations;
      }
      
      public function enqueue(param1:AssetDefinition, param2:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(_assetLocations.length == 0)
         {
            Logger.debug("[Flash Asset Loader] No assets locations registered");
            return;
         }
         _queuedAssetDefinitions.push(param1);
         var _loc3_:IAssetLocation = _assetLocations[0];
         if(_loc3_.loadType == AssetLoadType.URL)
         {
            _loc4_ = (_loc3_.getLocationData(param1) as StringAssetLocationData).data;
            Logger.info("LOADING: " + _loc4_ + " (" + param1.identifier + ")");
         }
      }
      
      public function load(param1:Function, param2:Function, param3:int = 1) : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = _queuedAssetDefinitions;
         for each(var _loc5_ in _queuedAssetDefinitions)
         {
            _loc4_++;
            _loc6_ = _loc4_ / _queuedAssetDefinitions.length;
            if(_loc6_ < 1)
            {
               if(param1 != null)
               {
                  param1(_loc6_);
               }
            }
         }
         if(param1 != null)
         {
            param1(1);
         }
         param2();
         _queuedAssetDefinitions.length = 0;
      }
      
      public function getAsset(param1:String) : IAsset
      {
         var _loc2_:* = _assetType;
         if(AssetType.TEXTURE !== _loc2_)
         {
            throw new Exception("Unknown asset type \'" + _assetType + "\' for identifier \'" + param1 + "\'");
         }
         return getTexture(param1);
      }
      
      public function removeAsset(param1:String, param2:Boolean) : void
      {
         throw new Exception("Unknown asset type \'" + _assetType + "\' for identifier \'" + param1 + "\'");
      }
      
      public function get loadedAssetIdentifiers() : Vector.<String>
      {
         throw new Exception("Unknown asset type \'" + _assetType + "\'");
      }
      
      private function getTexture(param1:String) : ITexture
      {
         var _loc3_:Class = Runtime.getClass(param1);
         var _loc2_:BitmapData = new _loc3_();
         if(!_loc2_)
         {
            return null;
         }
         return FlashTexture.fromFlashTexture(_loc2_);
      }
   }
}
