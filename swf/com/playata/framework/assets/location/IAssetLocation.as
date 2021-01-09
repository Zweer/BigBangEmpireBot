package com.playata.framework.assets.location
{
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.IDisposable;
   
   public interface IAssetLocation extends IDisposable
   {
       
      
      function get loadType() : AssetLoadType;
      
      function get supportsLookup() : Boolean;
      
      function containsAsset(param1:String) : Boolean;
      
      function getLocationData(param1:AssetDefinition) : IAssetLocationData;
   }
}
