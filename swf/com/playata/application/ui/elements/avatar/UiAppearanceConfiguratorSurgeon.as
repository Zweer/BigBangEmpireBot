package com.playata.application.ui.elements.avatar
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorSurgeonGeneric;
   
   public class UiAppearanceConfiguratorSurgeon extends UiAppearanceConfigurator
   {
       
      
      private var _realContent:SymbolCharacterConfiguratorSurgeonGeneric = null;
      
      private var _btnLeftEyes:UiButton = null;
      
      private var _btnLeftHead:UiButton = null;
      
      private var _btnLeftMouth:UiButton = null;
      
      private var _btnLeftNose:UiButton = null;
      
      private var _btnLeftSkinColor:UiButton = null;
      
      private var _btnRightEyes:UiButton = null;
      
      private var _btnRightHead:UiButton = null;
      
      private var _btnRightMouth:UiButton = null;
      
      private var _btnRightNose:UiButton = null;
      
      private var _btnRightSkinColor:UiButton = null;
      
      public function UiAppearanceConfiguratorSurgeon(param1:SymbolCharacterConfiguratorSurgeonGeneric, param2:Function)
      {
         super(param1,param2,["head_type","eyes_type","nose_type","mouth_type","skin_color"]);
         _realContent = param1;
         _btnLeftEyes = new UiButton(_realContent.btnLeftEyes,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftHead = new UiButton(_realContent.btnLeftHead,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftMouth = new UiButton(_realContent.btnLeftMouth,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftNose = new UiButton(_realContent.btnLeftNose,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftSkinColor = new UiButton(_realContent.btnLeftSkinColor,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightEyes = new UiButton(_realContent.btnRightEyes,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightHead = new UiButton(_realContent.btnRightHead,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightMouth = new UiButton(_realContent.btnRightMouth,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightNose = new UiButton(_realContent.btnRightNose,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightSkinColor = new UiButton(_realContent.btnRightSkinColor,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnLeftEyes.tag = "eyes_type";
         _btnLeftHead.tag = "head_type";
         _btnLeftMouth.tag = "mouth_type";
         _btnLeftNose.tag = "nose_type";
         _btnLeftSkinColor.tag = "skin_color";
         _btnRightEyes.tag = "eyes_type";
         _btnRightHead.tag = "head_type";
         _btnRightMouth.tag = "mouth_type";
         _btnRightNose.tag = "nose_type";
         _btnRightSkinColor.tag = "skin_color";
         _realContent.txtEyes.text = LocText.current.text("screen/create_character/eyes");
         _realContent.txtHead.text = LocText.current.text("screen/create_character/head");
         _realContent.txtMouth.text = LocText.current.text("screen/create_character/mouth");
         _realContent.txtNose.text = LocText.current.text("screen/create_character/nose");
         _realContent.txtSkinColor.text = LocText.current.text("screen/create_character/skin_color");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnLeftEyes.dispose();
         _btnLeftHead.dispose();
         _btnLeftMouth.dispose();
         _btnLeftNose.dispose();
         _btnLeftSkinColor.dispose();
         _btnRightEyes.dispose();
         _btnRightHead.dispose();
         _btnRightMouth.dispose();
         _btnRightNose.dispose();
         _btnRightSkinColor.dispose();
         _btnLeftEyes = null;
         _btnLeftHead = null;
         _btnLeftMouth = null;
         _btnLeftNose = null;
         _btnLeftSkinColor = null;
         _btnRightEyes = null;
         _btnRightHead = null;
         _btnRightMouth = null;
         _btnRightNose = null;
         _btnRightSkinColor = null;
      }
      
      public function refreshPanelLocalization() : void
      {
      }
   }
}
