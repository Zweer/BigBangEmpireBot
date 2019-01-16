package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.event.SymbolIconEventGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconOutfitInfoGeneric;
   import visuals.ui.elements.sewing_machine.SymbolIconItemPatternGeneric;
   
   public class SymbolItemSlotGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemSlot = null;
      
      public var border:SymbolItemSlotBorderGeneric = null;
      
      public var highlightNormal:SymbolItemSlotBorderHighlightNormalGeneric = null;
      
      public var highlightWarforged:SymbolItemSlotBorderHighlightWarforgedGeneric = null;
      
      public var betterItem:SymbolBetterItemAnimationGeneric = null;
      
      public var itemPos:SymbolPlaceholderGeneric = null;
      
      public var iconOutfit:SymbolIconOutfitInfoGeneric = null;
      
      public var iconPremiumCurrency:SymbolItemSlotPremiumCurrencyGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconEventItem:SymbolIconEventGeneric = null;
      
      public var iconItemPattern:SymbolIconItemPatternGeneric = null;
      
      public var iconEffect:SymbolDummyGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolItemSlotGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemSlot;
         }
         else
         {
            _nativeObject = new SymbolItemSlot();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         border = new SymbolItemSlotBorderGeneric(_nativeObject.border);
         highlightNormal = new SymbolItemSlotBorderHighlightNormalGeneric(_nativeObject.highlightNormal);
         highlightWarforged = new SymbolItemSlotBorderHighlightWarforgedGeneric(_nativeObject.highlightWarforged);
         betterItem = new SymbolBetterItemAnimationGeneric(_nativeObject.betterItem);
         itemPos = new SymbolPlaceholderGeneric(_nativeObject.itemPos);
         iconOutfit = new SymbolIconOutfitInfoGeneric(_nativeObject.iconOutfit);
         iconPremiumCurrency = new SymbolItemSlotPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         iconEventItem = new SymbolIconEventGeneric(_nativeObject.iconEventItem);
         iconItemPattern = new SymbolIconItemPatternGeneric(_nativeObject.iconItemPattern);
         iconEffect = new SymbolDummyGeneric(_nativeObject.iconEffect);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolItemSlot) : void
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
         if(_nativeObject.highlightNormal)
         {
            highlightNormal.setNativeInstance(_nativeObject.highlightNormal);
         }
         if(_nativeObject.highlightWarforged)
         {
            highlightWarforged.setNativeInstance(_nativeObject.highlightWarforged);
         }
         if(_nativeObject.betterItem)
         {
            betterItem.setNativeInstance(_nativeObject.betterItem);
         }
         if(_nativeObject.itemPos)
         {
            itemPos.setNativeInstance(_nativeObject.itemPos);
         }
         if(_nativeObject.iconOutfit)
         {
            iconOutfit.setNativeInstance(_nativeObject.iconOutfit);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.iconEventItem)
         {
            iconEventItem.setNativeInstance(_nativeObject.iconEventItem);
         }
         if(_nativeObject.iconItemPattern)
         {
            iconItemPattern.setNativeInstance(_nativeObject.iconItemPattern);
         }
         if(_nativeObject.iconEffect)
         {
            iconEffect.setNativeInstance(_nativeObject.iconEffect);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
