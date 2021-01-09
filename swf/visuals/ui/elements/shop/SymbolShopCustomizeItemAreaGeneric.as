package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopCustomizeItemAreaGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopCustomizeItemArea = null;
      
      public var graphic:SymbolShopCustomizeItemAreaGraphicGeneric = null;
      
      public var highlight:SymbolShopCustomizeItemAreaGraphicHighlightGeneric = null;
      
      public function SymbolShopCustomizeItemAreaGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopCustomizeItemArea;
         }
         else
         {
            _nativeObject = new SymbolShopCustomizeItemArea();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolShopCustomizeItemAreaGraphicGeneric(_nativeObject.graphic);
         highlight = new SymbolShopCustomizeItemAreaGraphicHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolShopCustomizeItemArea) : void
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
