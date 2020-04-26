package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopWashAreaGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopWashArea = null;
      
      public var graphic:SymbolShopWashAreaGraphicGeneric = null;
      
      public var highlight:SymbolShopWashAreaGraphicHighlightGeneric = null;
      
      public function SymbolShopWashAreaGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopWashArea;
         }
         else
         {
            _nativeObject = new SymbolShopWashArea();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolShopWashAreaGraphicGeneric(_nativeObject.graphic);
         highlight = new SymbolShopWashAreaGraphicHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolShopWashArea) : void
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
