package com.playata.framework.assets
{
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.core.IDisposable;
   
   public interface IAssetLoader extends IDisposable
   {
       
      
      function addAssetLocation(param1:IAssetLocation) : void;
      
      function get assetLocations() : Vector.<IAssetLocation>;
      
      function enqueue(param1:AssetDefinition, param2:Boolean = false) : void;
      
      function load(param1:Function, param2:Function, param3:int = 1) : void;
      
      function getAsset(param1:String) : IAsset;
      
      function removeAsset(param1:String, param2:Boolean) : void;
      
      function get loadedAssetIdentifiers() : Vector.<String>;
   }
}
