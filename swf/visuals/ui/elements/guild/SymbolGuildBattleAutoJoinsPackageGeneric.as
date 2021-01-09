package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.payment.SymbolGuildBattleAutoJoinsPackageDiscountGeneric;
   
   public class SymbolGuildBattleAutoJoinsPackageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleAutoJoinsPackage = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var icon:SymbolGuildBattleAutoJoinsPackageGraphicsGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable3:SymbolBackgroundScalableGeneric = null;
      
      public var txtAmountCaption:ILabel = null;
      
      public var btnBuy:SymbolButtonPremiumGeneric = null;
      
      public var discount:SymbolGuildBattleAutoJoinsPackageDiscountGeneric = null;
      
      public function SymbolGuildBattleAutoJoinsPackageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleAutoJoinsPackage;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleAutoJoinsPackage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         icon = new SymbolGuildBattleAutoJoinsPackageGraphicsGeneric(_nativeObject.icon);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         symbolBackgroundScalable3 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable3);
         txtAmountCaption = FlashLabel.fromNative(_nativeObject.txtAmountCaption);
         btnBuy = new SymbolButtonPremiumGeneric(_nativeObject.btnBuy);
         discount = new SymbolGuildBattleAutoJoinsPackageDiscountGeneric(_nativeObject.discount);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleAutoJoinsPackage) : void
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
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.symbolBackgroundScalable3)
         {
            symbolBackgroundScalable3.setNativeInstance(_nativeObject.symbolBackgroundScalable3);
         }
         FlashLabel.setNativeInstance(txtAmountCaption,_nativeObject.txtAmountCaption);
         if(_nativeObject.btnBuy)
         {
            btnBuy.setNativeInstance(_nativeObject.btnBuy);
         }
         if(_nativeObject.discount)
         {
            discount.setNativeInstance(_nativeObject.discount);
         }
      }
   }
}
