package com.playata.framework.data.constants
{
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.assets.location.IAssetLocationData;
   import com.playata.framework.assets.location.StringAssetLocationData;
   
   public class ConstantsAssetLocation implements IAssetLocation
   {
       
      
      private var _testMode:Boolean = false;
      
      public function ConstantsAssetLocation(param1:Boolean)
      {
         super();
         _testMode = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get loadType() : AssetLoadType
      {
         return AssetLoadType.URL;
      }
      
      public function get supportsLookup() : Boolean
      {
         return false;
      }
      
      public function containsAsset(param1:String) : Boolean
      {
         return false;
      }
      
      public function getLocationData(param1:AssetDefinition) : IAssetLocationData
      {
         var _loc3_:ConstantsAssetDefinitionData = param1.data as ConstantsAssetDefinitionData;
         var _loc2_:String = "constants.data";
         _loc2_ = _loc2_ + ("?" + _loc3_.version);
         return new StringAssetLocationData(Assets.assetURL("data/" + _loc2_));
      }
   }
}
