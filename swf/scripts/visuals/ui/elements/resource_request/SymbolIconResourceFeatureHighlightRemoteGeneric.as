package visuals.ui.elements.resource_request
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconResourceFeatureHighlightRemoteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconResourceFeatureHighlightRemote = null;
      
      public function SymbolIconResourceFeatureHighlightRemoteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconResourceFeatureHighlightRemote;
         }
         else
         {
            _nativeObject = new SymbolIconResourceFeatureHighlightRemote();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconResourceFeatureHighlightRemote) : void
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
