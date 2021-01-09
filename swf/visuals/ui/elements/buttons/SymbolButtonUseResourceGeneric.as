package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceFeatureGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceFeatureHighlightRemoteGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceFeatureHighlightRemoteUpgradedGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceFeatureHighlightSlotmachineGeneric;
   
   public class SymbolButtonUseResourceGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonUseResource = null;
      
      public var icon:SymbolIconResourceFeatureGeneric = null;
      
      public var highlightSlotmachine:SymbolIconResourceFeatureHighlightSlotmachineGeneric = null;
      
      public var highlightRemoteUpgraded:SymbolIconResourceFeatureHighlightRemoteUpgradedGeneric = null;
      
      public var highlightRemote:SymbolIconResourceFeatureHighlightRemoteGeneric = null;
      
      public var counter:SymbolCounterGeneric = null;
      
      public function SymbolButtonUseResourceGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonUseResource;
         }
         else
         {
            _nativeObject = new SymbolButtonUseResource();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconResourceFeatureGeneric(_nativeObject.icon);
         highlightSlotmachine = new SymbolIconResourceFeatureHighlightSlotmachineGeneric(_nativeObject.highlightSlotmachine);
         highlightRemoteUpgraded = new SymbolIconResourceFeatureHighlightRemoteUpgradedGeneric(_nativeObject.highlightRemoteUpgraded);
         highlightRemote = new SymbolIconResourceFeatureHighlightRemoteGeneric(_nativeObject.highlightRemote);
         counter = new SymbolCounterGeneric(_nativeObject.counter);
      }
      
      public function setNativeInstance(param1:SymbolButtonUseResource) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.highlightSlotmachine)
         {
            highlightSlotmachine.setNativeInstance(_nativeObject.highlightSlotmachine);
         }
         if(_nativeObject.highlightRemoteUpgraded)
         {
            highlightRemoteUpgraded.setNativeInstance(_nativeObject.highlightRemoteUpgraded);
         }
         if(_nativeObject.highlightRemote)
         {
            highlightRemote.setNativeInstance(_nativeObject.highlightRemote);
         }
         if(_nativeObject.counter)
         {
            counter.setNativeInstance(_nativeObject.counter);
         }
      }
   }
}
