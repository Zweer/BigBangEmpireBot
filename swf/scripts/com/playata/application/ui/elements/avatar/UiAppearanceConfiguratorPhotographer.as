package com.playata.application.ui.elements.avatar
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorPhotographerGeneric;
   
   public class UiAppearanceConfiguratorPhotographer extends UiAppearanceConfigurator
   {
       
      
      private var _btnLeftRect:UiButton;
      
      private var _btnLeftBorder:UiButton;
      
      private var _btnLeftBackground:UiButton;
      
      private var _btnLeftFilter:UiButton;
      
      private var _btnLeftIcon:UiButton;
      
      private var _btnRightRect:UiButton;
      
      private var _btnRightBorder:UiButton;
      
      private var _btnRightBackground:UiButton;
      
      private var _btnRightFilter:UiButton;
      
      private var _btnRightIcon:UiButton;
      
      private var _btnLeftSexuality:UiButton;
      
      private var _btnRightSexuality:UiButton;
      
      public function UiAppearanceConfiguratorPhotographer(param1:SymbolCharacterConfiguratorPhotographerGeneric, param2:Function)
      {
         super(param1,param2,["photo_rect_type","photo_border_type","photo_background_type","photo_filter_type","photo_icon_type","photo_sexuality_type"]);
         _btnLeftRect = new UiButton(param1.btnLeftRect,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftBorder = new UiButton(param1.btnLeftBorder,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftBackground = new UiButton(param1.btnLeftBackground,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftFilter = new UiButton(param1.btnLeftFilter,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftIcon = new UiButton(param1.btnLeftIcon,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnLeftSexuality = new UiButton(param1.btnLeftSexuality,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceLeft);
         _btnRightRect = new UiButton(param1.btnRightRect,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightBorder = new UiButton(param1.btnRightBorder,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightBackground = new UiButton(param1.btnRightBackground,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightFilter = new UiButton(param1.btnRightFilter,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightIcon = new UiButton(param1.btnRightIcon,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnRightSexuality = new UiButton(param1.btnRightSexuality,LocText.current.text("screen/create_character/button_switch_look_tooltip"),onClickChangeAppearanceRight);
         _btnLeftRect.tag = "photo_rect_type";
         _btnLeftBorder.tag = "photo_border_type";
         _btnLeftBackground.tag = "photo_background_type";
         _btnLeftFilter.tag = "photo_filter_type";
         _btnLeftIcon.tag = "photo_icon_type";
         _btnLeftSexuality.tag = "photo_sexuality_type";
         _btnRightRect.tag = "photo_rect_type";
         _btnRightBorder.tag = "photo_border_type";
         _btnRightBackground.tag = "photo_background_type";
         _btnRightFilter.tag = "photo_filter_type";
         _btnRightIcon.tag = "photo_icon_type";
         _btnRightSexuality.tag = "photo_sexuality_type";
         param1.txtRect.text = LocText.current.text("screen/create_character/rect");
         param1.txtBorder.text = LocText.current.text("screen/create_character/border");
         param1.txtBackground.text = LocText.current.text("screen/create_character/background");
         param1.txtFilter.text = LocText.current.text("screen/create_character/filter");
         param1.txtIcon.text = LocText.current.text("screen/create_character/icon");
         param1.txtSexuality.text = LocText.current.text("screen/create_character/sexuality");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnLeftRect.dispose();
         _btnLeftBorder.dispose();
         _btnLeftBackground.dispose();
         _btnLeftFilter.dispose();
         _btnLeftIcon.dispose();
         _btnLeftSexuality.dispose();
         _btnRightRect.dispose();
         _btnRightBorder.dispose();
         _btnRightBackground.dispose();
         _btnRightFilter.dispose();
         _btnRightIcon.dispose();
         _btnRightSexuality.dispose();
         _btnLeftRect = null;
         _btnLeftBorder = null;
         _btnLeftBackground = null;
         _btnLeftFilter = null;
         _btnLeftIcon = null;
         _btnLeftSexuality = null;
         _btnRightRect = null;
         _btnRightBorder = null;
         _btnRightBackground = null;
         _btnRightFilter = null;
         _btnRightIcon = null;
         _btnRightSexuality = null;
      }
   }
}
