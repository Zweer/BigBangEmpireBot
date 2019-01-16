package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolCharacterConfiguratorTattooGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorTattoo = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtArmLeft:ILabel = null;
      
      public var btnRightArmLeft:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftArmLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var txtArmRight:ILabel = null;
      
      public var btnRightArmRight:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftArmRight:SymbolButtonArrowLeftGeneric = null;
      
      public var txtBody:ILabel = null;
      
      public var btnRightBody:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBody:SymbolButtonArrowLeftGeneric = null;
      
      public var txtLegLeft:ILabel = null;
      
      public var btnRightLegLeft:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftLegLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var txtLegRight:ILabel = null;
      
      public var btnRightLegRight:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftLegRight:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_tattoo_arm_left:ILabel = null;
      
      public var iconCoins_tattoo_arm_left:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_tattoo_arm_right:ILabel = null;
      
      public var txtPriceCoins_tattoo_body:ILabel = null;
      
      public var txtPriceCoins_tattoo_leg_left:ILabel = null;
      
      public var txtPriceCoins_tattoo_leg_right:ILabel = null;
      
      public var iconCoins_tattoo_leg_right:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_tattoo_arm_right:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_tattoo_body:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_tattoo_leg_left:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremium_tattoo_arm_left:ILabel = null;
      
      public var iconPremium_tattoo_arm_left:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_tattoo_arm_right:ILabel = null;
      
      public var txtPricePremium_tattoo_body:ILabel = null;
      
      public var txtPricePremium_tattoo_leg_left:ILabel = null;
      
      public var txtPricePremium_tattoo_leg_right:ILabel = null;
      
      public var iconPremium_tattoo_leg_right:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_tattoo_arm_right:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_tattoo_body:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_tattoo_leg_left:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoinsTotal:ILabel = null;
      
      public var iconCoinsTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolCharacterConfiguratorTattooGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorTattoo;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorTattoo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtArmLeft = FlashLabel.fromNative(_nativeObject.txtArmLeft);
         btnRightArmLeft = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightArmLeft);
         btnLeftArmLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftArmLeft);
         txtArmRight = FlashLabel.fromNative(_nativeObject.txtArmRight);
         btnRightArmRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightArmRight);
         btnLeftArmRight = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftArmRight);
         txtBody = FlashLabel.fromNative(_nativeObject.txtBody);
         btnRightBody = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBody);
         btnLeftBody = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBody);
         txtLegLeft = FlashLabel.fromNative(_nativeObject.txtLegLeft);
         btnRightLegLeft = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightLegLeft);
         btnLeftLegLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftLegLeft);
         txtLegRight = FlashLabel.fromNative(_nativeObject.txtLegRight);
         btnRightLegRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightLegRight);
         btnLeftLegRight = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftLegRight);
         txtPriceCoins_tattoo_arm_left = FlashLabel.fromNative(_nativeObject.txtPriceCoins_tattoo_arm_left);
         iconCoins_tattoo_arm_left = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_tattoo_arm_left);
         txtPriceCoins_tattoo_arm_right = FlashLabel.fromNative(_nativeObject.txtPriceCoins_tattoo_arm_right);
         txtPriceCoins_tattoo_body = FlashLabel.fromNative(_nativeObject.txtPriceCoins_tattoo_body);
         txtPriceCoins_tattoo_leg_left = FlashLabel.fromNative(_nativeObject.txtPriceCoins_tattoo_leg_left);
         txtPriceCoins_tattoo_leg_right = FlashLabel.fromNative(_nativeObject.txtPriceCoins_tattoo_leg_right);
         iconCoins_tattoo_leg_right = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_tattoo_leg_right);
         iconCoins_tattoo_arm_right = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_tattoo_arm_right);
         iconCoins_tattoo_body = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_tattoo_body);
         iconCoins_tattoo_leg_left = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_tattoo_leg_left);
         txtPricePremium_tattoo_arm_left = FlashLabel.fromNative(_nativeObject.txtPricePremium_tattoo_arm_left);
         iconPremium_tattoo_arm_left = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_tattoo_arm_left);
         txtPricePremium_tattoo_arm_right = FlashLabel.fromNative(_nativeObject.txtPricePremium_tattoo_arm_right);
         txtPricePremium_tattoo_body = FlashLabel.fromNative(_nativeObject.txtPricePremium_tattoo_body);
         txtPricePremium_tattoo_leg_left = FlashLabel.fromNative(_nativeObject.txtPricePremium_tattoo_leg_left);
         txtPricePremium_tattoo_leg_right = FlashLabel.fromNative(_nativeObject.txtPricePremium_tattoo_leg_right);
         iconPremium_tattoo_leg_right = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_tattoo_leg_right);
         iconPremium_tattoo_arm_right = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_tattoo_arm_right);
         iconPremium_tattoo_body = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_tattoo_body);
         iconPremium_tattoo_leg_left = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_tattoo_leg_left);
         txtPriceCoinsTotal = FlashLabel.fromNative(_nativeObject.txtPriceCoinsTotal);
         iconCoinsTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoinsTotal);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorTattoo) : void
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
         FlashLabel.setNativeInstance(txtArmLeft,_nativeObject.txtArmLeft);
         if(_nativeObject.btnRightArmLeft)
         {
            btnRightArmLeft.setNativeInstance(_nativeObject.btnRightArmLeft);
         }
         if(_nativeObject.btnLeftArmLeft)
         {
            btnLeftArmLeft.setNativeInstance(_nativeObject.btnLeftArmLeft);
         }
         FlashLabel.setNativeInstance(txtArmRight,_nativeObject.txtArmRight);
         if(_nativeObject.btnRightArmRight)
         {
            btnRightArmRight.setNativeInstance(_nativeObject.btnRightArmRight);
         }
         if(_nativeObject.btnLeftArmRight)
         {
            btnLeftArmRight.setNativeInstance(_nativeObject.btnLeftArmRight);
         }
         FlashLabel.setNativeInstance(txtBody,_nativeObject.txtBody);
         if(_nativeObject.btnRightBody)
         {
            btnRightBody.setNativeInstance(_nativeObject.btnRightBody);
         }
         if(_nativeObject.btnLeftBody)
         {
            btnLeftBody.setNativeInstance(_nativeObject.btnLeftBody);
         }
         FlashLabel.setNativeInstance(txtLegLeft,_nativeObject.txtLegLeft);
         if(_nativeObject.btnRightLegLeft)
         {
            btnRightLegLeft.setNativeInstance(_nativeObject.btnRightLegLeft);
         }
         if(_nativeObject.btnLeftLegLeft)
         {
            btnLeftLegLeft.setNativeInstance(_nativeObject.btnLeftLegLeft);
         }
         FlashLabel.setNativeInstance(txtLegRight,_nativeObject.txtLegRight);
         if(_nativeObject.btnRightLegRight)
         {
            btnRightLegRight.setNativeInstance(_nativeObject.btnRightLegRight);
         }
         if(_nativeObject.btnLeftLegRight)
         {
            btnLeftLegRight.setNativeInstance(_nativeObject.btnLeftLegRight);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_tattoo_arm_left,_nativeObject.txtPriceCoins_tattoo_arm_left);
         if(_nativeObject.iconCoins_tattoo_arm_left)
         {
            iconCoins_tattoo_arm_left.setNativeInstance(_nativeObject.iconCoins_tattoo_arm_left);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_tattoo_arm_right,_nativeObject.txtPriceCoins_tattoo_arm_right);
         FlashLabel.setNativeInstance(txtPriceCoins_tattoo_body,_nativeObject.txtPriceCoins_tattoo_body);
         FlashLabel.setNativeInstance(txtPriceCoins_tattoo_leg_left,_nativeObject.txtPriceCoins_tattoo_leg_left);
         FlashLabel.setNativeInstance(txtPriceCoins_tattoo_leg_right,_nativeObject.txtPriceCoins_tattoo_leg_right);
         if(_nativeObject.iconCoins_tattoo_leg_right)
         {
            iconCoins_tattoo_leg_right.setNativeInstance(_nativeObject.iconCoins_tattoo_leg_right);
         }
         if(_nativeObject.iconCoins_tattoo_arm_right)
         {
            iconCoins_tattoo_arm_right.setNativeInstance(_nativeObject.iconCoins_tattoo_arm_right);
         }
         if(_nativeObject.iconCoins_tattoo_body)
         {
            iconCoins_tattoo_body.setNativeInstance(_nativeObject.iconCoins_tattoo_body);
         }
         if(_nativeObject.iconCoins_tattoo_leg_left)
         {
            iconCoins_tattoo_leg_left.setNativeInstance(_nativeObject.iconCoins_tattoo_leg_left);
         }
         FlashLabel.setNativeInstance(txtPricePremium_tattoo_arm_left,_nativeObject.txtPricePremium_tattoo_arm_left);
         if(_nativeObject.iconPremium_tattoo_arm_left)
         {
            iconPremium_tattoo_arm_left.setNativeInstance(_nativeObject.iconPremium_tattoo_arm_left);
         }
         FlashLabel.setNativeInstance(txtPricePremium_tattoo_arm_right,_nativeObject.txtPricePremium_tattoo_arm_right);
         FlashLabel.setNativeInstance(txtPricePremium_tattoo_body,_nativeObject.txtPricePremium_tattoo_body);
         FlashLabel.setNativeInstance(txtPricePremium_tattoo_leg_left,_nativeObject.txtPricePremium_tattoo_leg_left);
         FlashLabel.setNativeInstance(txtPricePremium_tattoo_leg_right,_nativeObject.txtPricePremium_tattoo_leg_right);
         if(_nativeObject.iconPremium_tattoo_leg_right)
         {
            iconPremium_tattoo_leg_right.setNativeInstance(_nativeObject.iconPremium_tattoo_leg_right);
         }
         if(_nativeObject.iconPremium_tattoo_arm_right)
         {
            iconPremium_tattoo_arm_right.setNativeInstance(_nativeObject.iconPremium_tattoo_arm_right);
         }
         if(_nativeObject.iconPremium_tattoo_body)
         {
            iconPremium_tattoo_body.setNativeInstance(_nativeObject.iconPremium_tattoo_body);
         }
         if(_nativeObject.iconPremium_tattoo_leg_left)
         {
            iconPremium_tattoo_leg_left.setNativeInstance(_nativeObject.iconPremium_tattoo_leg_left);
         }
         FlashLabel.setNativeInstance(txtPriceCoinsTotal,_nativeObject.txtPriceCoinsTotal);
         if(_nativeObject.iconCoinsTotal)
         {
            iconCoinsTotal.setNativeInstance(_nativeObject.iconCoinsTotal);
         }
         FlashLabel.setNativeInstance(txtPricePremiumTotal,_nativeObject.txtPricePremiumTotal);
         if(_nativeObject.iconPremiumTotal)
         {
            iconPremiumTotal.setNativeInstance(_nativeObject.iconPremiumTotal);
         }
      }
   }
}
