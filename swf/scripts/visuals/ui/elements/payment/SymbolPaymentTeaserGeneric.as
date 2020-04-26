package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolPaymentTeaserGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentTeaser = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var line:SymbolPaymentTeaserLineGeneric = null;
      
      public function SymbolPaymentTeaserGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentTeaser;
         }
         else
         {
            _nativeObject = new SymbolPaymentTeaser();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         line = new SymbolPaymentTeaserLineGeneric(_nativeObject.line);
      }
      
      public function setNativeInstance(param1:SymbolPaymentTeaser) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.line)
         {
            line.setNativeInstance(_nativeObject.line);
         }
      }
   }
}
