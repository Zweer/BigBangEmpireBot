package com.playata.application.ui.elements.avatar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBox;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBoxPicker;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorUnderwearGeneric;
   
   public class UiAppearanceConfiguratorUnderwear extends UiAppearanceConfigurator
   {
       
      
      private var _realContent:SymbolCharacterConfiguratorUnderwearGeneric = null;
      
      private var _btnLeftBra:UiButton;
      
      private var _btnLeftPanties:UiButton;
      
      private var _btnLeftGenitals:UiButton;
      
      private var _btnLeftGenitalsHair:UiButton;
      
      private var _btnRightBra:UiButton;
      
      private var _btnRightPanties:UiButton;
      
      private var _btnRightGenitals:UiButton;
      
      private var _btnRightGenitalsHair:UiButton;
      
      private var _colorBoxIconGenitalsHair:UiColorBox;
      
      private var _colorBoxPickerGenitalsHair:UiColorBoxPicker;
      
      public function UiAppearanceConfiguratorUnderwear(param1:SymbolCharacterConfiguratorUnderwearGeneric, param2:Function)
      {
         super(param1,param2,["bra_type","panties_type","genitals_type","genitals_hair_type","genitals_hair_color"]);
         _realContent = param1;
         _btnLeftBra = new UiButton(_realContent.btnLeftBra,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftPanties = new UiButton(_realContent.btnLeftPanties,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftGenitals = new UiButton(_realContent.btnLeftGenitals,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftGenitalsHair = new UiButton(_realContent.btnLeftGenitalsHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightBra = new UiButton(_realContent.btnRightBra,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightPanties = new UiButton(_realContent.btnRightPanties,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightGenitals = new UiButton(_realContent.btnRightGenitals,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightGenitalsHair = new UiButton(_realContent.btnRightGenitalsHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _colorBoxIconGenitalsHair = new UiColorBox(_realContent.colorBoxGenitalsHair,UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.genitals_hair_color - 1],LocText.current.text("screen/create_character/underwear_privates_hair_color_tooltip"),onClickChangeGenitalsHairColor);
         _colorBoxIconGenitalsHair.extendClickArea(36,36,18,18);
         _colorBoxPickerGenitalsHair = new UiColorBoxPicker(_realContent.colorBoxPickerGenitalsHair);
         _btnLeftBra.tag = "bra_type";
         _btnLeftPanties.tag = "panties_type";
         _btnLeftGenitals.tag = "genitals_type";
         _btnLeftGenitalsHair.tag = "genitals_hair_type";
         _btnRightBra.tag = "bra_type";
         _btnRightPanties.tag = "panties_type";
         _btnRightGenitals.tag = "genitals_type";
         _btnRightGenitalsHair.tag = "genitals_hair_type";
         _colorBoxPickerGenitalsHair.content.bringToTop();
         _realContent.txtBra.text = LocText.current.text("screen/create_character/underwear_bra");
         _realContent.txtPanties.text = LocText.current.text("screen/create_character/underwear_panties");
         _realContent.txtGenitals.text = LocText.current.text("screen/create_character/underwear_privates");
         _realContent.txtGenitalsHair.text = LocText.current.text("screen/create_character/underwear_privates_hair");
         _btnLeftGenitals.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _btnRightGenitals.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _btnLeftGenitalsHair.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _btnRightGenitalsHair.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _colorBoxIconGenitalsHair.content.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtGenitals.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtGenitalsHair.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPriceCoins_genitals_type.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPricePremium_genitals_type.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPriceCoins_genitals_hair_type.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPricePremium_genitals_hair_type.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPriceCoins_genitals_hair_color.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
         _realContent.txtPricePremium_genitals_hair_color.visible = AppEnvironment.appPlatform.isHidePantiesAllowed;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnLeftBra.dispose();
         _btnLeftPanties.dispose();
         _btnLeftGenitals.dispose();
         _btnLeftGenitalsHair.dispose();
         _btnRightBra.dispose();
         _btnRightPanties.dispose();
         _btnRightGenitals.dispose();
         _btnRightGenitalsHair.dispose();
         _colorBoxIconGenitalsHair.dispose();
         _colorBoxPickerGenitalsHair.dispose();
         _btnLeftBra = null;
         _btnLeftPanties = null;
         _btnLeftGenitals = null;
         _btnLeftGenitalsHair = null;
         _btnRightBra = null;
         _btnRightPanties = null;
         _btnRightGenitals = null;
         _btnRightGenitalsHair = null;
         _colorBoxIconGenitalsHair = null;
         _colorBoxPickerGenitalsHair = null;
      }
      
      override public function set currentSettings(param1:AppearanceSettings) : void
      {
         .super.currentSettings = param1;
         _btnLeftBra.visible = !isMale;
         _btnRightBra.visible = !isMale;
         _realContent.txtBra.visible = !isMale;
         _realContent.txtPriceCoins_bra_type.visible = !isMale && _realContent.txtPriceCoins_bra_type.visible;
         _realContent.txtPricePremium_bra_type.visible = !isMale && _realContent.txtPricePremium_bra_type.visible;
         _realContent.iconCoins_bra_type.visible = !isMale && _realContent.iconCoins_bra_type.visible;
         _realContent.iconPremium_bra_type.visible = !isMale && _realContent.iconPremium_bra_type.visible;
         _colorBoxIconGenitalsHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.genitals_hair_color - 1];
         updatePosition();
         updateGenitalButtons();
      }
      
      private function updatePosition() : void
      {
         _realContent.btnLeftPanties.y = !!isMale?_realContent.btnLeftBra.y:Number(_realContent.btnLeftBra.y + 50);
         _realContent.btnRightPanties.y = !!isMale?_realContent.btnRightBra.y:Number(_realContent.btnRightBra.y + 50);
         _realContent.txtPanties.y = !!isMale?_realContent.txtBra.y:Number(_realContent.txtBra.y + 50);
         _realContent.txtPriceCoins_panties_type.y = !!isMale?_realContent.txtPriceCoins_bra_type.y:Number(_realContent.txtPriceCoins_bra_type.y + 50);
         _realContent.txtPricePremium_panties_type.y = !!isMale?_realContent.txtPricePremium_bra_type.y:Number(_realContent.txtPricePremium_bra_type.y + 50);
         _realContent.iconCoins_panties_type.y = !!isMale?_realContent.iconCoins_bra_type.y:Number(_realContent.iconCoins_bra_type.y + 50);
         _realContent.iconPremium_panties_type.y = !!isMale?_realContent.iconPremium_bra_type.y:Number(_realContent.iconPremium_bra_type.y + 50);
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _realContent.btnLeftGenitals.y = _realContent.btnLeftPanties.y + 50;
            _realContent.btnRightGenitals.y = _realContent.btnRightPanties.y + 50;
            _realContent.txtGenitals.y = _realContent.txtPanties.y + 50;
            _realContent.txtPriceCoins_genitals_type.y = _realContent.txtPriceCoins_panties_type.y + 50;
            _realContent.txtPricePremium_genitals_type.y = _realContent.txtPricePremium_panties_type.y + 50;
            _realContent.iconCoins_genitals_type.y = _realContent.iconCoins_panties_type.y + 50;
            _realContent.iconPremium_genitals_type.y = _realContent.iconPremium_panties_type.y + 50;
            _realContent.btnLeftGenitalsHair.y = _realContent.btnLeftGenitals.y + 50;
            _realContent.btnRightGenitalsHair.y = _realContent.btnRightGenitals.y + 50;
            _realContent.txtGenitalsHair.y = _realContent.txtGenitals.y + 50;
            _realContent.txtPriceCoins_genitals_hair_type.y = _realContent.txtPriceCoins_genitals_type.y + 50;
            _realContent.txtPricePremium_genitals_hair_type.y = _realContent.txtPricePremium_genitals_type.y + 50;
            _realContent.iconCoins_genitals_hair_type.y = _realContent.iconCoins_genitals_type.y + 50;
            _realContent.iconPremium_genitals_hair_type.y = _realContent.iconPremium_genitals_type.y + 50;
            _realContent.colorBoxGenitalsHair.y = _realContent.txtGenitalsHair.y + 11;
            _realContent.txtPriceCoins_genitals_hair_color.y = _realContent.txtPriceCoins_genitals_hair_type.y;
            _realContent.txtPricePremium_genitals_hair_color.y = _realContent.txtPricePremium_genitals_hair_type.y;
            _realContent.iconCoins_genitals_hair_color.y = _realContent.iconCoins_genitals_hair_type.y;
            _realContent.iconPremium_genitals_hair_color.y = _realContent.iconPremium_genitals_hair_type.y;
         }
      }
      
      override protected function getNextAppearanceValue(param1:String, param2:int) : int
      {
         var _loc3_:int = super.getNextAppearanceValue(param1,param2);
         if(_loc3_ == 0 && (param1 == "bra_type" && !AppEnvironment.appPlatform.isHideBraAllowed || param1 == "panties_type" && !AppEnvironment.appPlatform.isHidePantiesAllowed))
         {
            _currentSettings.setAppearance(param1,_loc3_);
            _loc3_ = super.getNextAppearanceValue(param1,param2);
         }
         return _loc3_;
      }
      
      override protected function onClickChangeAppearanceLeft(param1:InteractionEvent) : void
      {
         super.onClickChangeAppearanceLeft(param1);
         updateGenitalButtons();
      }
      
      override protected function onClickChangeAppearanceRight(param1:InteractionEvent) : void
      {
         super.onClickChangeAppearanceRight(param1);
         updateGenitalButtons();
      }
      
      private function updateGenitalButtons() : void
      {
         if(!isMale && !AppEnvironment.appPlatform.isHideBraAllowed && _currentSettings.bra_type == 0)
         {
            var _loc1_:* = LocText.current.text("screen/create_character/hidden_underwear_not_allowed");
            _btnLeftBra.tooltip = _loc1_;
            _btnRightBra.tooltip = _loc1_;
         }
         else
         {
            _loc1_ = LocText.current.text("screen/create_character/button_switch_look_tooltip");
            _btnLeftBra.tooltip = _loc1_;
            _btnRightBra.tooltip = _loc1_;
         }
         if(!AppEnvironment.appPlatform.isHidePantiesAllowed && _currentSettings.panties_type == 0)
         {
            _loc1_ = LocText.current.text("screen/create_character/hidden_underwear_not_allowed");
            _btnLeftPanties.tooltip = _loc1_;
            _btnRightPanties.tooltip = _loc1_;
         }
         else
         {
            _loc1_ = LocText.current.text("screen/create_character/button_switch_look_tooltip");
            _btnLeftPanties.tooltip = _loc1_;
            _btnRightPanties.tooltip = _loc1_;
         }
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _btnLeftGenitals.buttonEnabled = _currentSettings.panties_type == 0;
            _btnRightGenitals.buttonEnabled = _currentSettings.panties_type == 0;
            _btnLeftGenitalsHair.buttonEnabled = _currentSettings.panties_type == 0;
            _btnRightGenitalsHair.buttonEnabled = _currentSettings.panties_type == 0;
         }
      }
      
      private function onClickChangeGenitalsHairColor(param1:UiColorBox) : void
      {
         _colorBoxPickerGenitalsHair.open(UiAppearanceConfiguratorBarber.HAIR_COLORS,param1.color,onColorChangeGenitalsHairColor);
      }
      
      private function onColorChangeGenitalsHairColor(param1:uint) : void
      {
         _currentSettings.genitals_hair_color = UiAppearanceConfiguratorBarber.HAIR_COLORS.indexOf(param1) + 1;
         _colorBoxIconGenitalsHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.genitals_hair_color - 1];
      }
   }
}
