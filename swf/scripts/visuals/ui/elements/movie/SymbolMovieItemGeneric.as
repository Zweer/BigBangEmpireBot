package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.item.SymbolItemSlotBorderGeneric;
   
   public class SymbolMovieItemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieItem = null;
      
      public var border:SymbolItemSlotBorderGeneric = null;
      
      public var itemPos:SymbolPlaceholderGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolMovieItemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieItem;
         }
         else
         {
            _nativeObject = new SymbolMovieItem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         border = new SymbolItemSlotBorderGeneric(_nativeObject.border);
         itemPos = new SymbolPlaceholderGeneric(_nativeObject.itemPos);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolMovieItem) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.border)
         {
            border.setNativeInstance(_nativeObject.border);
         }
         if(_nativeObject.itemPos)
         {
            itemPos.setNativeInstance(_nativeObject.itemPos);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
