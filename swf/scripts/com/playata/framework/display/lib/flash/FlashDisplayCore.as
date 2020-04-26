package com.playata.framework.display.lib.flash
{
   import com.playata.framework.assets.AssetManager;
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayContext;
   import com.playata.framework.display.IDisplayCore;
   import com.playata.framework.display.IDisplayObjectFactory;
   import flash.display.Stage;
   
   public class FlashDisplayCore implements IDisplayCore
   {
       
      
      private var _isActive:Boolean = true;
      
      private var _displayContext:IDisplayContext;
      
      private var _displayObjectFactory:IDisplayObjectFactory;
      
      private var _textureAssetLoader:IAssetLoader;
      
      private var _spineDefinitionAssetLoader:IAssetLoader;
      
      public function FlashDisplayCore(param1:Stage)
      {
         super();
         DisplayCore.current = this;
         _displayContext = new FlashDisplayContext(param1);
         _displayObjectFactory = new FlashDisplayObjectFactory();
         DisplayObjectFactory.displayObjectFactory = _displayObjectFactory;
      }
      
      public function init(param1:Function) : void
      {
      }
      
      public function dispose() : void
      {
         _displayContext.dispose();
         _displayContext = null;
      }
      
      public function get isActive() : Boolean
      {
         return _isActive;
      }
      
      public function onActivate(param1:int) : void
      {
         _isActive = true;
         _displayContext.start();
      }
      
      public function onDeactivate() : void
      {
         _isActive = false;
         _displayContext.stop(true);
      }
      
      public function set focus(param1:Object) : void
      {
         if(param1 is FlashTextInput)
         {
            (param1 as FlashTextInput).setFocus();
         }
         else if(param1 is FlashTextInputArea)
         {
            (param1 as FlashTextInputArea).setFocus();
         }
      }
      
      public function get focus() : Object
      {
         return null;
      }
      
      public function get displayContext() : IDisplayContext
      {
         return _displayContext;
      }
      
      public function get displayObjectFactory() : IDisplayObjectFactory
      {
         return _displayObjectFactory;
      }
      
      public function setupAssetLoaders(param1:AssetManager, param2:Number) : void
      {
         _textureAssetLoader = new FlashAssetLoader(AssetType.TEXTURE,param2);
         _spineDefinitionAssetLoader = new FlashSpineDefinitionsLoader();
         param1.addLoader(AssetType.TEXTURE,_textureAssetLoader);
         param1.addLoader(AssetType.SPINE_DEFINITION,_spineDefinitionAssetLoader);
      }
   }
}
