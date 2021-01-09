package visuals.ui.elements.server_picker
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolServerPickerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerPicker = null;
      
      public var selectionPopupBackground:SymbolBackgroundScalableGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var servers:SymbolPlaceholderGeneric = null;
      
      public var iconSelectedServer:SymbolServerPickOptionGeneric = null;
      
      public function SymbolServerPickerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerPicker;
         }
         else
         {
            _nativeObject = new SymbolServerPicker();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         selectionPopupBackground = new SymbolBackgroundScalableGeneric(_nativeObject.selectionPopupBackground);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         servers = new SymbolPlaceholderGeneric(_nativeObject.servers);
         iconSelectedServer = new SymbolServerPickOptionGeneric(_nativeObject.iconSelectedServer);
      }
      
      public function setNativeInstance(param1:SymbolServerPicker) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.selectionPopupBackground)
         {
            selectionPopupBackground.setNativeInstance(_nativeObject.selectionPopupBackground);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.servers)
         {
            servers.setNativeInstance(_nativeObject.servers);
         }
         if(_nativeObject.iconSelectedServer)
         {
            iconSelectedServer.setNativeInstance(_nativeObject.iconSelectedServer);
         }
      }
   }
}
