package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopSellAreaGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopSellArea = null;
      
      public var graphic:SymbolShopSellAreaGraphicGeneric = null;
      
      public var highlight:SymbolShopSellAreaGraphicHighlightGeneric = null;
      
      public function SymbolShopSellAreaGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopSellArea;
         }
         else
         {
            _nativeObject = new SymbolShopSellArea();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolShopSellAreaGraphicGeneric(_nativeObject.graphic);
         highlight = new SymbolShopSellAreaGraphicHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolShopSellArea) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
         if(_nativeObject.highlight)
         {
            highlight.setNativeInstance(_nativeObject.highlight);
         }
      }
   }
}
