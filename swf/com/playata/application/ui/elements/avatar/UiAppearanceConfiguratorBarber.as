package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBox;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBoxPicker;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorBarberGeneric;
   
   public class UiAppearanceConfiguratorBarber extends UiAppearanceConfigurator
   {
      
      public static var HAIR_COLORS:Vector.<uint> = new <uint>[5591658,5908290,14428958,16711394,16763254,12753465,16759651,13869161,12895176,8862494,7291179,16711422,11730943,12793215,7807374,16761405,16701351,16676008,7143010,3522988,15195840,1250646,16684180,13874923];
       
      
      private var _realContent:SymbolCharacterConfiguratorBarberGeneric;
      
      private var _btnRightEyebrows:UiButton;
      
      private var _btnLeftDecoration:UiButton;
      
      private var _btnLeftEyebrows:UiButton;
      
      private var _btnLeftFacialHair:UiButton;
      
      private var _btnLeftHair:UiButton;
      
      private var _btnRightDecoration:UiButton;
      
      private var _btnRightFacialHair:UiButton;
      
      private var _btnRightHair:UiButton;
      
      private var _colorBoxIconHair:UiColorBox;
      
      private var _colorBoxPickerHair:UiColorBoxPicker;
      
      private var _colorBoxIconEyebrows:UiColorBox;
      
      private var _colorBoxPickerEyebrows:UiColorBoxPicker;
      
      private var _colorBoxIconFacialHair:UiColorBox;
      
      private var _colorBoxPickerFacialHair:UiColorBoxPicker;
      
      public function UiAppearanceConfiguratorBarber(param1:SymbolCharacterConfiguratorBarberGeneric, param2:Function)
      {
         _realContent = param1;
         super(param1,param2,["hair_type","hair_color","eyebrows_type","eyebrows_color","decoration_type","facial_hair_type","facial_hair_color"]);
         _btnLeftDecoration = new UiButton(_realContent.btnLeftDecoration,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftEyebrows = new UiButton(_realContent.btnLeftEyebrows,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftFacialHair = new UiButton(_realContent.btnLeftFacialHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftHair = new UiButton(_realContent.btnLeftHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightDecoration = new UiButton(_realContent.btnRightDecoration,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightEyebrows = new UiButton(_realContent.btnRightEyebrows,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightFacialHair = new UiButton(_realContent.btnRightFacialHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightHair = new UiButton(_realContent.btnRightHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _colorBoxIconHair = new UiColorBox(_realContent.colorBoxHair,HAIR_COLORS[_currentSettings.hair_color - 1],LocText.current.text("screen/create_character/hair_color_tooltip"),onClickChangeHairColor);
         _colorBoxIconHair.extendClickArea(36,36,18,18);
         _colorBoxPickerHair = new UiColorBoxPicker(_realContent.colorBoxPickerHair);
         _colorBoxIconEyebrows = new UiColorBox(_realContent.colorBoxEyebrows,HAIR_COLORS[_currentSettings.eyebrows_color - 1],LocText.current.text("screen/create_character/eyebrows_color_tooltip"),onClickChangeEyebrowsColor);
         _colorBoxIconEyebrows.extendClickArea(36,36,18,18);
         _colorBoxPickerEyebrows = new UiColorBoxPicker(_realContent.colorBoxPickerEyebrows);
         _colorBoxIconFacialHair = new UiColorBox(_realContent.colorBoxFacialHair,HAIR_COLORS[!!isMale?_currentSettings.facial_hair_color - 1:1],LocText.current.text("screen/create_character/facial_hair_color_tooltip"),onClickChangeFacialHairColor);
         _colorBoxIconFacialHair.extendClickArea(36,36,18,18);
         _colorBoxPickerFacialHair = new UiColorBoxPicker(_realContent.colorBoxPickerFacialHair);
         _btnLeftDecoration.tag = "decoration_type";
         _btnLeftEyebrows.tag = "eyebrows_type";
         _btnLeftFacialHair.tag = "facial_hair_type";
         _btnLeftHair.tag = "hair_type";
         _btnRightDecoration.tag = "decoration_type";
         _btnRightEyebrows.tag = "eyebrows_type";
         _btnRightFacialHair.tag = "facial_hair_type";
         _btnRightHair.tag = "hair_type";
         _colorBoxPickerHair.content.bringToTop();
         _colorBoxPickerEyebrows.content.bringToTop();
         _colorBoxPickerFacialHair.content.bringToTop();
         _realContent.txtDecoration.text = LocText.current.text("screen/create_character/decoration");
         _realContent.txtEyebrows.text = LocText.current.text("screen/create_character/eyebrows");
         _realContent.txtFacialHair.text = LocText.current.text("screen/create_character/facial_hair");
         _realContent.txtHair.text = LocText.current.text("screen/create_character/hair");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnLeftDecoration.dispose();
         _btnLeftEyebrows.dispose();
         _btnLeftFacialHair.dispose();
         _btnLeftHair.dispose();
         _btnRightDecoration.dispose();
         _btnRightEyebrows.dispose();
         _btnRightFacialHair.dispose();
         _btnRightHair.dispose();
         _colorBoxIconHair.dispose();
         _colorBoxPickerHair.dispose();
         _colorBoxIconEyebrows.dispose();
         _colorBoxPickerEyebrows.dispose();
         _colorBoxIconFacialHair.dispose();
         _colorBoxPickerFacialHair.dispose();
         _btnLeftDecoration = null;
         _btnLeftEyebrows = null;
         _btnLeftFacialHair = null;
         _btnLeftHair = null;
         _btnRightDecoration = null;
         _btnRightEyebrows = null;
         _btnRightFacialHair = null;
         _btnRightHair = null;
         _colorBoxIconHair = null;
         _colorBoxPickerHair = null;
         _colorBoxIconEyebrows = null;
         _colorBoxPickerEyebrows = null;
         _colorBoxIconFacialHair = null;
         _colorBoxPickerFacialHair = null;
      }
      
      public function refreshPanelLocalization() : void
      {
      }
      
      override public function set currentSettings(param1:AppearanceSettings) : void
      {
         .super.currentSettings = param1;
         _btnLeftFacialHair.visible = isMale;
         _btnRightFacialHair.visible = isMale;
         _realContent.txtFacialHair.visible = isMale;
         _colorBoxIconFacialHair.content.visible = isMale;
         _colorBoxPickerFacialHair.close();
         _colorBoxIconHair.color = HAIR_COLORS[_currentSettings.hair_color - 1];
         _colorBoxIconEyebrows.color = HAIR_COLORS[_currentSettings.eyebrows_color - 1];
         if(isMale)
         {
            _colorBoxIconFacialHair.color = HAIR_COLORS[_currentSettings.facial_hair_color - 1];
         }
      }
      
      private function onClickChangeHairColor(param1:UiColorBox) : void
      {
         _colorBoxPickerHair.open(HAIR_COLORS,param1.color,onColorChangeHairColor);
      }
      
      private function onColorChangeHairColor(param1:uint) : void
      {
         _currentSettings.hair_color = HAIR_COLORS.indexOf(param1) + 1;
         updatePriceTag("hair_color");
      }
      
      private function onClickChangeEyebrowsColor(param1:UiColorBox) : void
      {
         _colorBoxPickerEyebrows.open(HAIR_COLORS,param1.color,onColorChangeEyebrowsColor);
      }
      
      private function onColorChangeEyebrowsColor(param1:uint) : void
      {
         _currentSettings.eyebrows_color = HAIR_COLORS.indexOf(param1) + 1;
         updatePriceTag("eyebrows_color");
      }
      
      private function onClickChangeFacialHairColor(param1:UiColorBox) : void
      {
         _colorBoxPickerFacialHair.open(HAIR_COLORS,param1.color,onColorChangeFacialHairColor);
      }
      
      private function onColorChangeFacialHairColor(param1:uint) : void
      {
         _currentSettings.facial_hair_color = HAIR_COLORS.indexOf(param1) + 1;
         updatePriceTag("facial_hair_color");
      }
   }
}
