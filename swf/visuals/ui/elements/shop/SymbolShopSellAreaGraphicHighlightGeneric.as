package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopSellAreaGraphicHighlightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopSellAreaGraphicHighlight = null;
      
      public function SymbolShopSellAreaGraphicHighlightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopSellAreaGraphicHighlight;
         }
         else
         {
            _nativeObject = new SymbolShopSellAreaGraphicHighlight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolShopSellAreaGraphicHighlight) : void
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
