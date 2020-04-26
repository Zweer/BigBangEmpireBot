package visuals.ui.elements.debug
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   
   public class SymbolDebugPanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDebugPanel = null;
      
      public var btnToggleDebugButtons:SymbolUiButtonDefaultGeneric = null;
      
      public var content:SymbolDebugContentGeneric = null;
      
      public function SymbolDebugPanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDebugPanel;
         }
         else
         {
            _nativeObject = new SymbolDebugPanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnToggleDebugButtons = new SymbolUiButtonDefaultGeneric(_nativeObject.btnToggleDebugButtons);
         content = new SymbolDebugContentGeneric(_nativeObject.content);
      }
      
      public function setNativeInstance(param1:SymbolDebugPanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnToggleDebugButtons)
         {
            btnToggleDebugButtons.setNativeInstance(_nativeObject.btnToggleDebugButtons);
         }
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
      }
   }
}
