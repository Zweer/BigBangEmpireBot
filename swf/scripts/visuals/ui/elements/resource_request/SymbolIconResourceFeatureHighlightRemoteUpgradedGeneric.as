package visuals.ui.elements.resource_request
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconResourceFeatureHighlightRemoteUpgradedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconResourceFeatureHighlightRemoteUpgraded = null;
      
      public function SymbolIconResourceFeatureHighlightRemoteUpgradedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconResourceFeatureHighlightRemoteUpgraded;
         }
         else
         {
            _nativeObject = new SymbolIconResourceFeatureHighlightRemoteUpgraded();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconResourceFeatureHighlightRemoteUpgraded) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
