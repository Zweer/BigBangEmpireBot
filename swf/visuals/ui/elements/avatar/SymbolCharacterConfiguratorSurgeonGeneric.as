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
   
   public class SymbolCharacterConfiguratorSurgeonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorSurgeon = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtHead:ILabel = null;
      
      public var btnRightHead:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftHead:SymbolButtonArrowLeftGeneric = null;
      
      public var txtEyes:ILabel = null;
      
      public var btnRightEyes:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftEyes:SymbolButtonArrowLeftGeneric = null;
      
      public var txtNose:ILabel = null;
      
      public var btnRightNose:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftNose:SymbolButtonArrowLeftGeneric = null;
      
      public var txtMouth:ILabel = null;
      
      public var btnRightMouth:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftMouth:SymbolButtonArrowLeftGeneric = null;
      
      public var txtSkinColor:ILabel = null;
      
      public var btnRightSkinColor:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftSkinColor:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_head_type:ILabel = null;
      
      public var iconCoins_head_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_eyes_type:ILabel = null;
      
      public var txtPriceCoins_nose_type:ILabel = null;
      
      public var txtPriceCoins_mouth_type:ILabel = null;
      
      public var txtPriceCoins_skin_color:ILabel = null;
      
      public var iconCoins_skin_color:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_eyes_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_nose_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_mouth_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremium_head_type:ILabel = null;
      
      public var iconPremium_head_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_eyes_type:ILabel = null;
      
      public var txtPricePremium_nose_type:ILabel = null;
      
      public var txtPricePremium_mouth_type:ILabel = null;
      
      public var txtPricePremium_skin_color:ILabel = null;
      
      public var iconPremium_skin_color:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_eyes_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_nose_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_mouth_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoinsTotal:ILabel = null;
      
      public var iconCoinsTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolCharacterConfiguratorSurgeonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorSurgeon;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorSurgeon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtHead = FlashLabel.fromNative(_nativeObject.txtHead);
         btnRightHead = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightHead);
         btnLeftHead = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftHead);
         txtEyes = FlashLabel.fromNative(_nativeObject.txtEyes);
         btnRightEyes = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightEyes);
         btnLeftEyes = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftEyes);
         txtNose = FlashLabel.fromNative(_nativeObject.txtNose);
         btnRightNose = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightNose);
         btnLeftNose = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftNose);
         txtMouth = FlashLabel.fromNative(_nativeObject.txtMouth);
         btnRightMouth = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightMouth);
         btnLeftMouth = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftMouth);
         txtSkinColor = FlashLabel.fromNative(_nativeObject.txtSkinColor);
         btnRightSkinColor = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightSkinColor);
         btnLeftSkinColor = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftSkinColor);
         txtPriceCoins_head_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_head_type);
         iconCoins_head_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_head_type);
         txtPriceCoins_eyes_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_eyes_type);
         txtPriceCoins_nose_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_nose_type);
         txtPriceCoins_mouth_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_mouth_type);
         txtPriceCoins_skin_color = FlashLabel.fromNative(_nativeObject.txtPriceCoins_skin_color);
         iconCoins_skin_color = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_skin_color);
         iconCoins_eyes_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_eyes_type);
         iconCoins_nose_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_nose_type);
         iconCoins_mouth_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_mouth_type);
         txtPricePremium_head_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_head_type);
         iconPremium_head_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_head_type);
         txtPricePremium_eyes_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_eyes_type);
         txtPricePremium_nose_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_nose_type);
         txtPricePremium_mouth_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_mouth_type);
         txtPricePremium_skin_color = FlashLabel.fromNative(_nativeObject.txtPricePremium_skin_color);
         iconPremium_skin_color = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_skin_color);
         iconPremium_eyes_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_eyes_type);
         iconPremium_nose_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_nose_type);
         iconPremium_mouth_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_mouth_type);
         txtPriceCoinsTotal = FlashLabel.fromNative(_nativeObject.txtPriceCoinsTotal);
         iconCoinsTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoinsTotal);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorSurgeon) : void
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
         FlashLabel.setNativeInstance(txtHead,_nativeObject.txtHead);
         if(_nativeObject.btnRightHead)
         {
            btnRightHead.setNativeInstance(_nativeObject.btnRightHead);
         }
         if(_nativeObject.btnLeftHead)
         {
            btnLeftHead.setNativeInstance(_nativeObject.btnLeftHead);
         }
         FlashLabel.setNativeInstance(txtEyes,_nativeObject.txtEyes);
         if(_nativeObject.btnRightEyes)
         {
            btnRightEyes.setNativeInstance(_nativeObject.btnRightEyes);
         }
         if(_nativeObject.btnLeftEyes)
         {
            btnLeftEyes.setNativeInstance(_nativeObject.btnLeftEyes);
         }
         FlashLabel.setNativeInstance(txtNose,_nativeObject.txtNose);
         if(_nativeObject.btnRightNose)
         {
            btnRightNose.setNativeInstance(_nativeObject.btnRightNose);
         }
         if(_nativeObject.btnLeftNose)
         {
            btnLeftNose.setNativeInstance(_nativeObject.btnLeftNose);
         }
         FlashLabel.setNativeInstance(txtMouth,_nativeObject.txtMouth);
         if(_nativeObject.btnRightMouth)
         {
            btnRightMouth.setNativeInstance(_nativeObject.btnRightMouth);
         }
         if(_nativeObject.btnLeftMouth)
         {
            btnLeftMouth.setNativeInstance(_nativeObject.btnLeftMouth);
         }
         FlashLabel.setNativeInstance(txtSkinColor,_nativeObject.txtSkinColor);
         if(_nativeObject.btnRightSkinColor)
         {
            btnRightSkinColor.setNativeInstance(_nativeObject.btnRightSkinColor);
         }
         if(_nativeObject.btnLeftSkinColor)
         {
            btnLeftSkinColor.setNativeInstance(_nativeObject.btnLeftSkinColor);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_head_type,_nativeObject.txtPriceCoins_head_type);
         if(_nativeObject.iconCoins_head_type)
         {
            iconCoins_head_type.setNativeInstance(_nativeObject.iconCoins_head_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_eyes_type,_nativeObject.txtPriceCoins_eyes_type);
         FlashLabel.setNativeInstance(txtPriceCoins_nose_type,_nativeObject.txtPriceCoins_nose_type);
         FlashLabel.setNativeInstance(txtPriceCoins_mouth_type,_nativeObject.txtPriceCoins_mouth_type);
         FlashLabel.setNativeInstance(txtPriceCoins_skin_color,_nativeObject.txtPriceCoins_skin_color);
         if(_nativeObject.iconCoins_skin_color)
         {
            iconCoins_skin_color.setNativeInstance(_nativeObject.iconCoins_skin_color);
         }
         if(_nativeObject.iconCoins_eyes_type)
         {
            iconCoins_eyes_type.setNativeInstance(_nativeObject.iconCoins_eyes_type);
         }
         if(_nativeObject.iconCoins_nose_type)
         {
            iconCoins_nose_type.setNativeInstance(_nativeObject.iconCoins_nose_type);
         }
         if(_nativeObject.iconCoins_mouth_type)
         {
            iconCoins_mouth_type.setNativeInstance(_nativeObject.iconCoins_mouth_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_head_type,_nativeObject.txtPricePremium_head_type);
         if(_nativeObject.iconPremium_head_type)
         {
            iconPremium_head_type.setNativeInstance(_nativeObject.iconPremium_head_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_eyes_type,_nativeObject.txtPricePremium_eyes_type);
         FlashLabel.setNativeInstance(txtPricePremium_nose_type,_nativeObject.txtPricePremium_nose_type);
         FlashLabel.setNativeInstance(txtPricePremium_mouth_type,_nativeObject.txtPricePremium_mouth_type);
         FlashLabel.setNativeInstance(txtPricePremium_skin_color,_nativeObject.txtPricePremium_skin_color);
         if(_nativeObject.iconPremium_skin_color)
         {
            iconPremium_skin_color.setNativeInstance(_nativeObject.iconPremium_skin_color);
         }
         if(_nativeObject.iconPremium_eyes_type)
         {
            iconPremium_eyes_type.setNativeInstance(_nativeObject.iconPremium_eyes_type);
         }
         if(_nativeObject.iconPremium_nose_type)
         {
            iconPremium_nose_type.setNativeInstance(_nativeObject.iconPremium_nose_type);
         }
         if(_nativeObject.iconPremium_mouth_type)
         {
            iconPremium_mouth_type.setNativeInstance(_nativeObject.iconPremium_mouth_type);
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
