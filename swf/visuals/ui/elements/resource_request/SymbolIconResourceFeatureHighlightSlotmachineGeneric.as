package visuals.ui.elements.resource_request
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconResourceFeatureHighlightSlotmachineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconResourceFeatureHighlightSlotmachine = null;
      
      public function SymbolIconResourceFeatureHighlightSlotmachineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconResourceFeatureHighlightSlotmachine;
         }
         else
         {
            _nativeObject = new SymbolIconResourceFeatureHighlightSlotmachine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconResourceFeatureHighlightSlotmachine) : void
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
