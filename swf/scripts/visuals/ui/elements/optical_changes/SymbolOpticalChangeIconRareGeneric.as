package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolOpticalChangeIconRareGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeIconRare = null;
      
      public function SymbolOpticalChangeIconRareGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeIconRare;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeIconRare();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeIconRare) : void
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
