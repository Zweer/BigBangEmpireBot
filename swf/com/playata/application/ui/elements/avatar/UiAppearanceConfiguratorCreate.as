package com.playata.application.ui.elements.avatar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CPredefinedCharacterAppearance;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBox;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBoxPicker;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorCreateGeneric;
   
   public class UiAppearanceConfiguratorCreate extends UiAppearanceConfigurator
   {
       
      
      private var _realContent:SymbolCharacterConfiguratorCreateGeneric = null;
      
      private var _btnGenderFemale:UiButton = null;
      
      private var _btnGenderMale:UiButton = null;
      
      private var _btnRandomize:UiButton = null;
      
      private var _btnRightEyebrows:UiButton = null;
      
      private var _btnLeftDecoration:UiButton = null;
      
      private var _btnLeftEyebrows:UiButton = null;
      
      private var _btnLeftEyes:UiButton = null;
      
      private var _btnLeftFacialHair:UiButton = null;
      
      private var _btnLeftHair:UiButton = null;
      
      private var _btnLeftHead:UiButton = null;
      
      private var _btnLeftMouth:UiButton = null;
      
      private var _btnLeftNose:UiButton = null;
      
      private var _btnLeftSkinColor:UiButton = null;
      
      private var _btnRightDecoration:UiButton = null;
      
      private var _btnRightEyes:UiButton = null;
      
      private var _btnRightFacialHair:UiButton = null;
      
      private var _btnRightHair:UiButton = null;
      
      private var _btnRightHead:UiButton = null;
      
      private var _btnRightMouth:UiButton = null;
      
      private var _btnRightNose:UiButton = null;
      
      private var _btnRightSkinColor:UiButton = null;
      
      private var _colorBoxIconHair:UiColorBox;
      
      private var _colorBoxPickerHair:UiColorBoxPicker;
      
      private var _colorBoxIconEyebrows:UiColorBox;
      
      private var _colorBoxPickerEyebrows:UiColorBoxPicker;
      
      private var _colorBoxIconFacialHair:UiColorBox;
      
      private var _colorBoxPickerFacialHair:UiColorBoxPicker;
      
      private var _predefinedMaleRandom:int = 0;
      
      private var _predefinedFemaleRandom:int = 0;
      
      public function UiAppearanceConfiguratorCreate(param1:SymbolCharacterConfiguratorCreateGeneric, param2:Function)
      {
         super(param1,param2,[]);
         _realContent = param1;
         _btnGenderMale = new UiButton(_realContent.btnGenderMale,LocText.current.text("screen/create_character/gender_male"),onClickGender);
         _btnGenderMale.tag = true;
         _btnGenderFemale = new UiButton(_realContent.btnGenderFemale,LocText.current.text("screen/create_character/gender_female"),onClickGender);
         _btnGenderFemale.tag = false;
         _btnRandomize = new UiButton(_realContent.btnRandomize,LocText.current.text("screen/create_character/button_random_tooltip"),onClickRandomize);
         _btnLeftDecoration = new UiButton(_realContent.btnLeftDecoration,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftEyebrows = new UiButton(_realContent.btnLeftEyebrows,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftEyes = new UiButton(_realContent.btnLeftEyes,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftFacialHair = new UiButton(_realContent.btnLeftFacialHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftHair = new UiButton(_realContent.btnLeftHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftHead = new UiButton(_realContent.btnLeftHead,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftMouth = new UiButton(_realContent.btnLeftMouth,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftNose = new UiButton(_realContent.btnLeftNose,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftSkinColor = new UiButton(_realContent.btnLeftSkinColor,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightDecoration = new UiButton(_realContent.btnRightDecoration,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightEyebrows = new UiButton(_realContent.btnRightEyebrows,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightEyes = new UiButton(_realContent.btnRightEyes,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightFacialHair = new UiButton(_realContent.btnRightFacialHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightHair = new UiButton(_realContent.btnRightHair,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightHead = new UiButton(_realContent.btnRightHead,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightMouth = new UiButton(_realContent.btnRightMouth,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightNose = new UiButton(_realContent.btnRightNose,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightSkinColor = new UiButton(_realContent.btnRightSkinColor,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _colorBoxIconHair = new UiColorBox(_realContent.colorBoxHair,UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.hair_color - 1],LocText.current.text("screen/create_character/hair_color_tooltip"),onClickChangeHairColor);
         _colorBoxIconHair.extendClickArea(36,36,18,18);
         _colorBoxPickerHair = new UiColorBoxPicker(_realContent.colorBoxPickerHair);
         _colorBoxIconEyebrows = new UiColorBox(_realContent.colorBoxEyebrows,UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.eyebrows_color - 1],LocText.current.text("screen/create_character/eyebrows_color_tooltip"),onClickChangeEyebrowsColor);
         _colorBoxIconEyebrows.extendClickArea(36,36,18,18);
         _colorBoxPickerEyebrows = new UiColorBoxPicker(_realContent.colorBoxPickerEyebrows);
         _colorBoxIconFacialHair = new UiColorBox(_realContent.colorBoxFacialHair,UiAppearanceConfiguratorBarber.HAIR_COLORS[!!isMale?_currentSettings.facial_hair_color - 1:1],LocText.current.text("screen/create_character/facial_hair_color_tooltip"),onClickChangeFacialHairColor);
         _colorBoxIconFacialHair.extendClickArea(36,36,18,18);
         _colorBoxPickerFacialHair = new UiColorBoxPicker(_realContent.colorBoxPickerFacialHair);
         _colorBoxIconFacialHair.content.visible = isMale;
         _btnLeftDecoration.tag = "decoration_type";
         _btnLeftEyebrows.tag = "eyebrows_type";
         _btnLeftEyes.tag = "eyes_type";
         _btnLeftFacialHair.tag = "facial_hair_type";
         _btnLeftHair.tag = "hair_type";
         _btnLeftHead.tag = "head_type";
         _btnLeftMouth.tag = "mouth_type";
         _btnLeftNose.tag = "nose_type";
         _btnLeftSkinColor.tag = "skin_color";
         _btnRightDecoration.tag = "decoration_type";
         _btnRightEyebrows.tag = "eyebrows_type";
         _btnRightEyes.tag = "eyes_type";
         _btnRightFacialHair.tag = "facial_hair_type";
         _btnRightHair.tag = "hair_type";
         _btnRightHead.tag = "head_type";
         _btnRightMouth.tag = "mouth_type";
         _btnRightNose.tag = "nose_type";
         _btnRightSkinColor.tag = "skin_color";
         _colorBoxPickerHair.content.bringToTop();
         _colorBoxPickerEyebrows.content.bringToTop();
         _colorBoxPickerFacialHair.content.bringToTop();
         _realContent.txtDecoration.text = LocText.current.text("screen/create_character/decoration");
         _realContent.txtEyebrows.text = LocText.current.text("screen/create_character/eyebrows");
         _realContent.txtEyes.text = LocText.current.text("screen/create_character/eyes");
         _realContent.txtFacialHair.text = LocText.current.text("screen/create_character/facial_hair");
         _realContent.txtHair.text = LocText.current.text("screen/create_character/hair");
         _realContent.txtHead.text = LocText.current.text("screen/create_character/head");
         _realContent.txtMouth.text = LocText.current.text("screen/create_character/mouth");
         _realContent.txtNose.text = LocText.current.text("screen/create_character/nose");
         _realContent.txtSkinColor.text = LocText.current.text("screen/create_character/skin_color");
         _btnLeftFacialHair.visible = isMale;
         _btnRightFacialHair.visible = isMale;
         _realContent.txtFacialHair.visible = isMale;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnGenderFemale.dispose();
         _btnGenderMale.dispose();
         _btnRandomize.dispose();
         _btnLeftDecoration.dispose();
         _btnLeftEyebrows.dispose();
         _btnLeftEyes.dispose();
         _btnLeftFacialHair.dispose();
         _btnLeftHair.dispose();
         _btnLeftHead.dispose();
         _btnLeftMouth.dispose();
         _btnLeftNose.dispose();
         _btnLeftSkinColor.dispose();
         _btnRightDecoration.dispose();
         _btnRightEyebrows.dispose();
         _btnRightEyes.dispose();
         _btnRightFacialHair.dispose();
         _btnRightHair.dispose();
         _btnRightHead.dispose();
         _btnRightMouth.dispose();
         _btnRightNose.dispose();
         _btnRightSkinColor.dispose();
         _colorBoxIconHair.dispose();
         _colorBoxPickerHair.dispose();
         _colorBoxIconEyebrows.dispose();
         _colorBoxPickerEyebrows.dispose();
         _colorBoxIconFacialHair.dispose();
         _colorBoxPickerFacialHair.dispose();
         _btnGenderFemale = null;
         _btnGenderMale = null;
         _btnRandomize = null;
         _btnLeftDecoration = null;
         _btnLeftEyebrows = null;
         _btnLeftEyes = null;
         _btnLeftFacialHair = null;
         _btnLeftHair = null;
         _btnLeftHead = null;
         _btnLeftMouth = null;
         _btnLeftNose = null;
         _btnLeftSkinColor = null;
         _btnRightDecoration = null;
         _btnRightEyebrows = null;
         _btnRightEyes = null;
         _btnRightFacialHair = null;
         _btnRightHair = null;
         _btnRightHead = null;
         _btnRightMouth = null;
         _btnRightNose = null;
         _btnRightSkinColor = null;
         _colorBoxIconHair = null;
         _colorBoxPickerHair = null;
         _colorBoxIconEyebrows = null;
         _colorBoxPickerEyebrows = null;
         _colorBoxIconFacialHair = null;
         _colorBoxPickerFacialHair = null;
      }
      
      override public function set currentSettings(param1:AppearanceSettings) : void
      {
         updateSexuality(param1);
         .super.currentSettings = param1;
         _btnLeftFacialHair.visible = isMale;
         _btnRightFacialHair.visible = isMale;
         _realContent.txtFacialHair.visible = isMale;
         _colorBoxIconFacialHair.content.visible = isMale;
         _colorBoxPickerFacialHair.close();
         _colorBoxIconHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.hair_color - 1];
         _colorBoxIconEyebrows.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.eyebrows_color - 1];
         if(isMale)
         {
            _colorBoxIconFacialHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.facial_hair_color - 1];
         }
      }
      
      private function onClickGender(param1:InteractionEvent) : void
      {
         if(_currentSettings.gender == ((param1.target as UiButton).tag == true?"m":"f"))
         {
            return;
         }
         _currentSettings.gender = (param1.target as UiButton).tag == true?"m":"f";
         if(_currentSettings.hasData("sexuality"))
         {
            _currentSettings.deleteData("sexuality");
         }
         initAppearances();
         _btnLeftFacialHair.visible = isMale;
         _btnRightFacialHair.visible = isMale;
         _realContent.txtFacialHair.visible = isMale;
         _colorBoxIconFacialHair.content.visible = isMale;
         §§push(_onUpdate(currentSettings));
      }
      
      override public function refreshLocalization() : void
      {
         _btnGenderMale.tooltip = LocText.current.text("screen/create_character/gender_male");
         _btnGenderFemale.tooltip = LocText.current.text("screen/create_character/gender_female");
         _btnRandomize.tooltip = LocText.current.text("screen/create_character/button_random_tooltip");
         _btnLeftDecoration.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftEyebrows.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftEyes.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftFacialHair.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftHair.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftHead.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftMouth.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftNose.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnLeftSkinColor.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightDecoration.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightEyebrows.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightEyes.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightFacialHair.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightHair.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightHead.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightMouth.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightNose.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _btnRightSkinColor.tooltip = LocText.current.text("screen/create_character/button_switch_look_tooltip");
         _realContent.txtDecoration.text = LocText.current.text("screen/create_character/decoration");
         _realContent.txtEyebrows.text = LocText.current.text("screen/create_character/eyebrows");
         _realContent.txtEyes.text = LocText.current.text("screen/create_character/eyes");
         _realContent.txtFacialHair.text = LocText.current.text("screen/create_character/facial_hair");
         _realContent.txtHair.text = LocText.current.text("screen/create_character/hair");
         _realContent.txtHead.text = LocText.current.text("screen/create_character/head");
         _realContent.txtMouth.text = LocText.current.text("screen/create_character/mouth");
         _realContent.txtNose.text = LocText.current.text("screen/create_character/nose");
         _realContent.txtSkinColor.text = LocText.current.text("screen/create_character/skin_color");
      }
      
      public function show() : void
      {
         _predefinedMaleRandom = 0;
         _predefinedFemaleRandom = 0;
         overridePredefinedAppearances();
      }
      
      private function onClickRandomize(param1:InteractionEvent) : void
      {
         initAppearances();
      }
      
      override protected function initAppearances() : void
      {
         updateSexuality(_currentSettings);
         super.initAppearances();
         overridePredefinedAppearances();
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _currentSettings.panties_type = 0;
            _currentSettings.genitals_hair_type = 0;
            _currentSettings.genitals_hair_color = 1;
            if(_currentSettings.gender == "m")
            {
               _currentSettings.genitals_type = 6;
            }
            else
            {
               _currentSettings.genitals_type = 8;
               _currentSettings.bra_type = 0;
            }
         }
         if(_colorBoxIconHair)
         {
            _colorBoxIconHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.hair_color - 1];
            _colorBoxIconEyebrows.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.eyebrows_color - 1];
            if(isMale)
            {
               _colorBoxIconFacialHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.facial_hair_color - 1];
            }
         }
      }
      
      private function overridePredefinedAppearances() : void
      {
         var _loc5_:* = null;
         if(_currentSettings.isMale)
         {
            _predefinedMaleRandom = Number(_predefinedMaleRandom) + 1;
            if(_predefinedMaleRandom > 3 && _predefinedMaleRandom % 2 == 0)
            {
               return;
            }
         }
         else
         {
            _predefinedFemaleRandom = Number(_predefinedFemaleRandom) + 1;
            if(_predefinedFemaleRandom > 3 && _predefinedFemaleRandom % 2 == 0)
            {
               return;
            }
         }
         var _loc1_:CPredefinedCharacterAppearance = CPredefinedCharacterAppearance.fromId(_currentSettings.gender);
         var _loc3_:int = _loc1_.appearanceHairType.length;
         var _loc4_:int = NumberUtil.randomInt(0,_loc3_ - 1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc1_.constantKeys;
         for each(var _loc2_ in _loc1_.constantKeys)
         {
            _loc5_ = StringUtil.replace(_loc2_,"appearance_","");
            _currentSettings.setAppearance(_loc5_,_loc1_.getData(_loc2_)[_loc4_]);
         }
      }
      
      private function updateSexuality(param1:AppearanceSettings) : void
      {
         if(!param1.hasData("sexuality"))
         {
            param1.sexuality = param1.gender == "m"?"f":"m";
         }
      }
      
      private function onClickChangeHairColor(param1:UiColorBox) : void
      {
         _colorBoxPickerHair.open(UiAppearanceConfiguratorBarber.HAIR_COLORS,param1.color,onColorChangeHairColor);
      }
      
      private function onColorChangeHairColor(param1:uint) : void
      {
         _currentSettings.hair_color = UiAppearanceConfiguratorBarber.HAIR_COLORS.indexOf(param1) + 1;
         _colorBoxIconHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.hair_color - 1];
      }
      
      private function onClickChangeEyebrowsColor(param1:UiColorBox) : void
      {
         _colorBoxPickerEyebrows.open(UiAppearanceConfiguratorBarber.HAIR_COLORS,param1.color,onColorChangeEyebrowsColor);
      }
      
      private function onColorChangeEyebrowsColor(param1:uint) : void
      {
         _currentSettings.eyebrows_color = UiAppearanceConfiguratorBarber.HAIR_COLORS.indexOf(param1) + 1;
         _colorBoxIconEyebrows.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.eyebrows_color - 1];
      }
      
      private function onClickChangeFacialHairColor(param1:UiColorBox) : void
      {
         _colorBoxPickerFacialHair.open(UiAppearanceConfiguratorBarber.HAIR_COLORS,param1.color,onColorChangeFacialHairColor);
      }
      
      private function onColorChangeFacialHairColor(param1:uint) : void
      {
         _currentSettings.facial_hair_color = UiAppearanceConfiguratorBarber.HAIR_COLORS.indexOf(param1) + 1;
         _colorBoxIconFacialHair.color = UiAppearanceConfiguratorBarber.HAIR_COLORS[_currentSettings.facial_hair_color - 1];
      }
   }
}
