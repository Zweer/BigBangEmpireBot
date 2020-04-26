package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolLocation1ClickAreaGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLocation1ClickArea = null;
      
      public function SymbolLocation1ClickAreaGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLocation1ClickArea;
         }
         else
         {
            _nativeObject = new SymbolLocation1ClickArea();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolLocation1ClickArea) : void
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
