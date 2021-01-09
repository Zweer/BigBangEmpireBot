package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolPaymentOfferSavePercentageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentOfferSavePercentage = null;
      
      public var txtSavePercentage:ILabel = null;
      
      public function SymbolPaymentOfferSavePercentageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentOfferSavePercentage;
         }
         else
         {
            _nativeObject = new SymbolPaymentOfferSavePercentage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtSavePercentage = FlashLabel.fromNative(_nativeObject.txtSavePercentage);
      }
      
      public function setNativeInstance(param1:SymbolPaymentOfferSavePercentage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtSavePercentage,_nativeObject.txtSavePercentage);
      }
   }
}
