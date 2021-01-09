package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolFullscreenBackgroundGeneric;
   import visuals.ui.elements.generic.SymbolInfoMessageGeneric;
   import visuals.ui.panels.SymbolPanelsGeneric;
   
   public class SymbolApplicationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolApplication = null;
      
      public var panels:SymbolPanelsGeneric = null;
      
      public var fullscreenBackground:SymbolFullscreenBackgroundGeneric = null;
      
      public var curtain:SymbolCurtainGeneric = null;
      
      public var curtainLayer:SymbolCurtainLayerGeneric = null;
      
      public var dialogLayer:SymbolDialogLayerGeneric = null;
      
      public var mouseLayer:SymbolMouseLayerGeneric = null;
      
      public var blockerLayer:SymbolBlockerLayerGeneric = null;
      
      public var infoMessage:SymbolInfoMessageGeneric = null;
      
      public function SymbolApplicationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolApplication;
         }
         else
         {
            _nativeObject = new SymbolApplication();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         panels = new SymbolPanelsGeneric(_nativeObject.panels);
         fullscreenBackground = new SymbolFullscreenBackgroundGeneric(_nativeObject.fullscreenBackground);
         curtain = new SymbolCurtainGeneric(_nativeObject.curtain);
         curtainLayer = new SymbolCurtainLayerGeneric(_nativeObject.curtainLayer);
         dialogLayer = new SymbolDialogLayerGeneric(_nativeObject.dialogLayer);
         mouseLayer = new SymbolMouseLayerGeneric(_nativeObject.mouseLayer);
         blockerLayer = new SymbolBlockerLayerGeneric(_nativeObject.blockerLayer);
         infoMessage = new SymbolInfoMessageGeneric(_nativeObject.infoMessage);
      }
      
      public function setNativeInstance(param1:SymbolApplication) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.panels)
         {
            panels.setNativeInstance(_nativeObject.panels);
         }
         if(_nativeObject.fullscreenBackground)
         {
            fullscreenBackground.setNativeInstance(_nativeObject.fullscreenBackground);
         }
         if(_nativeObject.curtain)
         {
            curtain.setNativeInstance(_nativeObject.curtain);
         }
         if(_nativeObject.curtainLayer)
         {
            curtainLayer.setNativeInstance(_nativeObject.curtainLayer);
         }
         if(_nativeObject.dialogLayer)
         {
            dialogLayer.setNativeInstance(_nativeObject.dialogLayer);
         }
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
         if(_nativeObject.blockerLayer)
         {
            blockerLayer.setNativeInstance(_nativeObject.blockerLayer);
         }
         if(_nativeObject.infoMessage)
         {
            infoMessage.setNativeInstance(_nativeObject.infoMessage);
         }
      }
   }
}
