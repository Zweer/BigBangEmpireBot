package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   
   public class SymbolPaymentMethodMoreGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentMethodMore = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var btnPaymentMethods:SymbolButtonPaymentMethodGeneric = null;
      
      public var symbolButtonArrowRight:SymbolButtonArrowRightGeneric = null;
      
      public var txtMore:ILabelArea = null;
      
      public var clickLayerMore:SymbolDummyGeneric = null;
      
      public function SymbolPaymentMethodMoreGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentMethodMore;
         }
         else
         {
            _nativeObject = new SymbolPaymentMethodMore();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         btnPaymentMethods = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnPaymentMethods);
         symbolButtonArrowRight = new SymbolButtonArrowRightGeneric(_nativeObject.symbolButtonArrowRight);
         txtMore = FlashLabelArea.fromNative(_nativeObject.txtMore);
         clickLayerMore = new SymbolDummyGeneric(_nativeObject.clickLayerMore);
      }
      
      public function setNativeInstance(param1:SymbolPaymentMethodMore) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.btnPaymentMethods)
         {
            btnPaymentMethods.setNativeInstance(_nativeObject.btnPaymentMethods);
         }
         if(_nativeObject.symbolButtonArrowRight)
         {
            symbolButtonArrowRight.setNativeInstance(_nativeObject.symbolButtonArrowRight);
         }
         FlashLabelArea.setNativeInstance(txtMore,_nativeObject.txtMore);
         if(_nativeObject.clickLayerMore)
         {
            clickLayerMore.setNativeInstance(_nativeObject.clickLayerMore);
         }
      }
   }
}
