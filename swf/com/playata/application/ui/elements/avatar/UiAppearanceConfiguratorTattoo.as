package com.playata.application.ui.elements.avatar
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorTattooGeneric;
   
   public class UiAppearanceConfiguratorTattoo extends UiAppearanceConfigurator
   {
       
      
      private var _btnRightArmRight:UiButton;
      
      private var _btnLeftArmLeft:UiButton;
      
      private var _btnLeftArmRight:UiButton;
      
      private var _btnLeftBody:UiButton;
      
      private var _btnLeftLegLeft:UiButton;
      
      private var _btnLeftLegRight:UiButton;
      
      private var _btnRightArmLeft:UiButton;
      
      private var _btnRightBody:UiButton;
      
      private var _btnRightLegLeft:UiButton;
      
      private var _btnRightLegRight:UiButton;
      
      public function UiAppearanceConfiguratorTattoo(param1:SymbolCharacterConfiguratorTattooGeneric, param2:Function)
      {
         super(param1,param2,["tattoo_arm_left","tattoo_arm_right","tattoo_body","tattoo_leg_left","tattoo_leg_right"]);
         _btnLeftArmLeft = new UiButton(param1.btnLeftArmLeft,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftArmRight = new UiButton(param1.btnLeftArmRight,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftBody = new UiButton(param1.btnLeftBody,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftLegLeft = new UiButton(param1.btnLeftLegLeft,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftLegRight = new UiButton(param1.btnLeftLegRight,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightArmLeft = new UiButton(param1.btnRightArmLeft,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightArmRight = new UiButton(param1.btnRightArmRight,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightBody = new UiButton(param1.btnRightBody,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightLegLeft = new UiButton(param1.btnRightLegLeft,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightLegRight = new UiButton(param1.btnRightLegRight,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnLeftArmLeft.tag = "tattoo_arm_left";
         _btnLeftArmRight.tag = "tattoo_arm_right";
         _btnLeftBody.tag = "tattoo_body";
         _btnLeftLegLeft.tag = "tattoo_leg_left";
         _btnLeftLegRight.tag = "tattoo_leg_right";
         _btnRightArmLeft.tag = "tattoo_arm_left";
         _btnRightArmRight.tag = "tattoo_arm_right";
         _btnRightBody.tag = "tattoo_body";
         _btnRightLegLeft.tag = "tattoo_leg_left";
         _btnRightLegRight.tag = "tattoo_leg_right";
         param1.txtArmLeft.text = LocText.current.text("screen/create_character/tattoo_arm_left");
         param1.txtArmRight.text = LocText.current.text("screen/create_character/tattoo_arm_right");
         param1.txtBody.text = LocText.current.text("screen/create_character/tattoo_body");
         param1.txtLegLeft.text = LocText.current.text("screen/create_character/tattoo_leg_left");
         param1.txtLegRight.text = LocText.current.text("screen/create_character/tattoo_leg_right");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnLeftArmLeft.dispose();
         _btnLeftArmRight.dispose();
         _btnLeftBody.dispose();
         _btnLeftLegLeft.dispose();
         _btnLeftLegRight.dispose();
         _btnRightArmLeft.dispose();
         _btnRightArmRight.dispose();
         _btnRightBody.dispose();
         _btnRightLegLeft.dispose();
         _btnRightLegRight.dispose();
         _btnLeftArmLeft = null;
         _btnLeftArmRight = null;
         _btnLeftBody = null;
         _btnLeftLegLeft = null;
         _btnLeftLegRight = null;
         _btnRightArmLeft = null;
         _btnRightArmRight = null;
         _btnRightBody = null;
         _btnRightLegLeft = null;
         _btnRightLegRight = null;
      }
   }
}
