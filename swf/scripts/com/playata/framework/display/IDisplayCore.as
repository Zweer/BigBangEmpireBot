package com.playata.framework.display
{
   import com.playata.framework.assets.AssetManager;
   import com.playata.framework.core.IEnvironmentModule;
   
   public interface IDisplayCore extends IEnvironmentModule
   {
       
      
      function set focus(param1:Object) : void;
      
      function get focus() : Object;
      
      function get displayContext() : IDisplayContext;
      
      function get displayObjectFactory() : IDisplayObjectFactory;
      
      function init(param1:Function) : void;
      
      function setupAssetLoaders(param1:AssetManager, param2:Number) : void;
   }
}
