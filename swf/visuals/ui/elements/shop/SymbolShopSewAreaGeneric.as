package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopSewAreaGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopSewArea = null;
      
      public var graphic:SymbolShopSewAreaGraphicGeneric = null;
      
      public var highlight:SymbolShopSewAreaGraphicHighlightGeneric = null;
      
      public function SymbolShopSewAreaGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopSewArea;
         }
         else
         {
            _nativeObject = new SymbolShopSewArea();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolShopSewAreaGraphicGeneric(_nativeObject.graphic);
         highlight = new SymbolShopSewAreaGraphicHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolShopSewArea) : void
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
