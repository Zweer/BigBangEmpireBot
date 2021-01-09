package com.playata.framework.assets.location
{
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.util.StringUtil;
   
   public class UrlAssetLocation implements IAssetLocation
   {
       
      
      protected var _baseUrl:String;
      
      public function UrlAssetLocation(param1:String)
      {
         super();
         _baseUrl = param1;
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
         return new StringAssetLocationData(Assets.assetURL(StringUtil.replace(_baseUrl,"{identifier}",param1.identifier)));
      }
   }
}
