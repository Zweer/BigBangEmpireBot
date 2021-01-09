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
   import visuals.ui.elements.guild.SymbolColorBoxGeneric;
   import visuals.ui.elements.guild.SymbolColorBoxPickerGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolCharacterConfiguratorUnderwearGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorUnderwear = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtPriceCoinsTotal:ILabel = null;
      
      public var iconCoinsTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins_genitals_hair_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_genitals_hair_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_genitals_hair_type:ILabel = null;
      
      public var txtPricePremium_genitals_hair_type:ILabel = null;
      
      public var txtGenitalsHair:ILabel = null;
      
      public var btnRightGenitalsHair:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftGenitalsHair:SymbolButtonArrowLeftGeneric = null;
      
      public var iconCoins_genitals_hair_color:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_genitals_hair_color:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_genitals_hair_color:ILabel = null;
      
      public var txtPricePremium_genitals_hair_color:ILabel = null;
      
      public var colorBoxGenitalsHair:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerGenitalsHair:SymbolColorBoxPickerGeneric = null;
      
      public var iconPremium_genitals_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_genitals_type:ILabel = null;
      
      public var txtPriceCoins_panties_type:ILabel = null;
      
      public var txtPriceCoins_genitals_type:ILabel = null;
      
      public var iconCoins_panties_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_genitals_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtGenitals:ILabel = null;
      
      public var btnRightGenitals:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftGenitals:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_bra_type:ILabel = null;
      
      public var iconPremium_bra_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_bra_type:ILabel = null;
      
      public var iconCoins_bra_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPanties:ILabel = null;
      
      public var btnRightPanties:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftPanties:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_panties_type:ILabel = null;
      
      public var iconPremium_panties_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtBra:ILabel = null;
      
      public var btnRightBra:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBra:SymbolButtonArrowLeftGeneric = null;
      
      public function SymbolCharacterConfiguratorUnderwearGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorUnderwear;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorUnderwear();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtPriceCoinsTotal = FlashLabel.fromNative(_nativeObject.txtPriceCoinsTotal);
         iconCoinsTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoinsTotal);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
         iconCoins_genitals_hair_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_genitals_hair_type);
         iconPremium_genitals_hair_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_genitals_hair_type);
         txtPriceCoins_genitals_hair_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_genitals_hair_type);
         txtPricePremium_genitals_hair_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_genitals_hair_type);
         txtGenitalsHair = FlashLabel.fromNative(_nativeObject.txtGenitalsHair);
         btnRightGenitalsHair = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightGenitalsHair);
         btnLeftGenitalsHair = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftGenitalsHair);
         iconCoins_genitals_hair_color = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_genitals_hair_color);
         iconPremium_genitals_hair_color = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_genitals_hair_color);
         txtPriceCoins_genitals_hair_color = FlashLabel.fromNative(_nativeObject.txtPriceCoins_genitals_hair_color);
         txtPricePremium_genitals_hair_color = FlashLabel.fromNative(_nativeObject.txtPricePremium_genitals_hair_color);
         colorBoxGenitalsHair = new SymbolColorBoxGeneric(_nativeObject.colorBoxGenitalsHair);
         colorBoxPickerGenitalsHair = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerGenitalsHair);
         iconPremium_genitals_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_genitals_type);
         txtPricePremium_genitals_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_genitals_type);
         txtPriceCoins_panties_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_panties_type);
         txtPriceCoins_genitals_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_genitals_type);
         iconCoins_panties_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_panties_type);
         iconCoins_genitals_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_genitals_type);
         txtGenitals = FlashLabel.fromNative(_nativeObject.txtGenitals);
         btnRightGenitals = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightGenitals);
         btnLeftGenitals = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftGenitals);
         txtPricePremium_bra_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_bra_type);
         iconPremium_bra_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_bra_type);
         txtPriceCoins_bra_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_bra_type);
         iconCoins_bra_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_bra_type);
         txtPanties = FlashLabel.fromNative(_nativeObject.txtPanties);
         btnRightPanties = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightPanties);
         btnLeftPanties = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftPanties);
         txtPricePremium_panties_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_panties_type);
         iconPremium_panties_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_panties_type);
         txtBra = FlashLabel.fromNative(_nativeObject.txtBra);
         btnRightBra = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBra);
         btnLeftBra = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBra);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorUnderwear) : void
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
         if(_nativeObject.iconCoins_genitals_hair_type)
         {
            iconCoins_genitals_hair_type.setNativeInstance(_nativeObject.iconCoins_genitals_hair_type);
         }
         if(_nativeObject.iconPremium_genitals_hair_type)
         {
            iconPremium_genitals_hair_type.setNativeInstance(_nativeObject.iconPremium_genitals_hair_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_genitals_hair_type,_nativeObject.txtPriceCoins_genitals_hair_type);
         FlashLabel.setNativeInstance(txtPricePremium_genitals_hair_type,_nativeObject.txtPricePremium_genitals_hair_type);
         FlashLabel.setNativeInstance(txtGenitalsHair,_nativeObject.txtGenitalsHair);
         if(_nativeObject.btnRightGenitalsHair)
         {
            btnRightGenitalsHair.setNativeInstance(_nativeObject.btnRightGenitalsHair);
         }
         if(_nativeObject.btnLeftGenitalsHair)
         {
            btnLeftGenitalsHair.setNativeInstance(_nativeObject.btnLeftGenitalsHair);
         }
         if(_nativeObject.iconCoins_genitals_hair_color)
         {
            iconCoins_genitals_hair_color.setNativeInstance(_nativeObject.iconCoins_genitals_hair_color);
         }
         if(_nativeObject.iconPremium_genitals_hair_color)
         {
            iconPremium_genitals_hair_color.setNativeInstance(_nativeObject.iconPremium_genitals_hair_color);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_genitals_hair_color,_nativeObject.txtPriceCoins_genitals_hair_color);
         FlashLabel.setNativeInstance(txtPricePremium_genitals_hair_color,_nativeObject.txtPricePremium_genitals_hair_color);
         if(_nativeObject.colorBoxGenitalsHair)
         {
            colorBoxGenitalsHair.setNativeInstance(_nativeObject.colorBoxGenitalsHair);
         }
         if(_nativeObject.colorBoxPickerGenitalsHair)
         {
            colorBoxPickerGenitalsHair.setNativeInstance(_nativeObject.colorBoxPickerGenitalsHair);
         }
         if(_nativeObject.iconPremium_genitals_type)
         {
            iconPremium_genitals_type.setNativeInstance(_nativeObject.iconPremium_genitals_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_genitals_type,_nativeObject.txtPricePremium_genitals_type);
         FlashLabel.setNativeInstance(txtPriceCoins_panties_type,_nativeObject.txtPriceCoins_panties_type);
         FlashLabel.setNativeInstance(txtPriceCoins_genitals_type,_nativeObject.txtPriceCoins_genitals_type);
         if(_nativeObject.iconCoins_panties_type)
         {
            iconCoins_panties_type.setNativeInstance(_nativeObject.iconCoins_panties_type);
         }
         if(_nativeObject.iconCoins_genitals_type)
         {
            iconCoins_genitals_type.setNativeInstance(_nativeObject.iconCoins_genitals_type);
         }
         FlashLabel.setNativeInstance(txtGenitals,_nativeObject.txtGenitals);
         if(_nativeObject.btnRightGenitals)
         {
            btnRightGenitals.setNativeInstance(_nativeObject.btnRightGenitals);
         }
         if(_nativeObject.btnLeftGenitals)
         {
            btnLeftGenitals.setNativeInstance(_nativeObject.btnLeftGenitals);
         }
         FlashLabel.setNativeInstance(txtPricePremium_bra_type,_nativeObject.txtPricePremium_bra_type);
         if(_nativeObject.iconPremium_bra_type)
         {
            iconPremium_bra_type.setNativeInstance(_nativeObject.iconPremium_bra_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_bra_type,_nativeObject.txtPriceCoins_bra_type);
         if(_nativeObject.iconCoins_bra_type)
         {
            iconCoins_bra_type.setNativeInstance(_nativeObject.iconCoins_bra_type);
         }
         FlashLabel.setNativeInstance(txtPanties,_nativeObject.txtPanties);
         if(_nativeObject.btnRightPanties)
         {
            btnRightPanties.setNativeInstance(_nativeObject.btnRightPanties);
         }
         if(_nativeObject.btnLeftPanties)
         {
            btnLeftPanties.setNativeInstance(_nativeObject.btnLeftPanties);
         }
         FlashLabel.setNativeInstance(txtPricePremium_panties_type,_nativeObject.txtPricePremium_panties_type);
         if(_nativeObject.iconPremium_panties_type)
         {
            iconPremium_panties_type.setNativeInstance(_nativeObject.iconPremium_panties_type);
         }
         FlashLabel.setNativeInstance(txtBra,_nativeObject.txtBra);
         if(_nativeObject.btnRightBra)
         {
            btnRightBra.setNativeInstance(_nativeObject.btnRightBra);
         }
         if(_nativeObject.btnLeftBra)
         {
            btnLeftBra.setNativeInstance(_nativeObject.btnLeftBra);
         }
      }
   }
}
