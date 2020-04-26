package com.playata.framework.display.lib.flash
{
   import com.playata.framework.assets.AssetLoaderBase;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.ClassAssetLocationData;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.display.assets.SpineAssetDefinitionData;
   import com.playata.framework.display.assets.SpineDefinitionAsset;
   import spine.SkeletonJson;
   import spine.atlas.Atlas;
   import spine.attachments.AtlasAttachmentLoader;
   import spine.flash.FlashTextureLoader;
   
   public class FlashSpineDefinitionsLoader extends AssetLoaderBase
   {
       
      
      public function FlashSpineDefinitionsLoader()
      {
         super();
      }
      
      override protected function processAsset(param1:AssetDefinition, param2:IByteArray) : IAsset
      {
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc9_:* = null;
         var _loc6_:* = null;
         try
         {
            _loc8_ = AssetLoaderBase.getStringFromData(param2);
            _loc4_ = param1.data as SpineAssetDefinitionData;
            _loc10_ = (assetLocations[0].getLocationData(new AssetDefinition(_loc4_.identifier + "Atlas")) as ClassAssetLocationData).data;
            _loc7_ = (assetLocations[0].getLocationData(new AssetDefinition(_loc4_.identifier + "Texture")) as ClassAssetLocationData).data;
            _loc5_ = new Atlas(new _loc10_(),new FlashTextureLoader(new _loc7_()));
            _loc3_ = new AtlasAttachmentLoader(_loc5_);
            _loc9_ = new SkeletonJson(_loc3_);
            _loc9_.scale = _loc4_.scale;
            _loc6_ = new SpineDefinitionAsset(_loc9_.readSkeletonData(_loc8_));
            var _loc12_:* = _loc6_;
            return _loc12_;
         }
         catch(e:Error)
         {
            throw new Exception("Failed to load Spine Definition (invalid json): " + param1.identifier + " " + e.message);
         }
         return null;
      }
   }
}
