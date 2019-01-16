package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolArrowBlackGeneric;
   
   public class SymbolDiscountHintGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDiscountHint = null;
      
      public var symbolArrowBlack:SymbolArrowBlackGeneric = null;
      
      public var bg:SymbolDiscountHintBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public var level:ILabel = null;
      
      public function SymbolDiscountHintGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDiscountHint;
         }
         else
         {
            _nativeObject = new SymbolDiscountHint();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolArrowBlack = new SymbolArrowBlackGeneric(_nativeObject.symbolArrowBlack);
         bg = new SymbolDiscountHintBackgroundGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         level = FlashLabel.fromNative(_nativeObject.level);
      }
      
      public function setNativeInstance(param1:SymbolDiscountHint) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolArrowBlack)
         {
            symbolArrowBlack.setNativeInstance(_nativeObject.symbolArrowBlack);
         }
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
         FlashLabel.setNativeInstance(level,_nativeObject.level);
      }
   }
}
