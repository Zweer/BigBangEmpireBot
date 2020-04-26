package com.playata.framework.localization.assets
{
   import com.playata.application.AppEnvironment;
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.assets.location.IAssetLocationData;
   import com.playata.framework.assets.location.StringAssetLocationData;
   import com.playata.framework.core.util.StringUtil;
   
   public class LocTextAssetLocation implements IAssetLocation
   {
       
      
      private var _testMode:Boolean = false;
      
      public function LocTextAssetLocation(param1:Boolean)
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
         var _loc3_:LocTextAssetDefinitionData = param1.data as LocTextAssetDefinitionData;
         var _loc2_:String = "text.data";
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc2_ = "textAdult.data";
         }
         _loc2_ = _loc2_ + ("?" + _loc3_.locale.version);
         if(_testMode)
         {
            _loc2_ = "textTest.data?" + _loc3_.locale.version;
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               _loc2_ = "textTestAdult.data?" + _loc3_.locale.version;
            }
         }
         if(_loc3_.format == "amf3")
         {
            _loc2_ = StringUtil.replace(_loc2_,".data",".amf.data");
         }
         return new StringAssetLocationData(Assets.assetURL("i18n/" + _loc3_.locale.locale + "/" + _loc2_));
      }
   }
}
