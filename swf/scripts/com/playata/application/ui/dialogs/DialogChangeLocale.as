package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogChangeLocaleGeneric;
   
   public class DialogChangeLocale extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnChange:UiTextButton = null;
      
      private var _localePicker:UiLocalePicker;
      
      private var _currentUserLocale:String;
      
      public function DialogChangeLocale()
      {
         var _loc1_:SymbolDialogChangeLocaleGeneric = new SymbolDialogChangeLocaleGeneric();
         super(_loc1_);
         _queued = false;
         _currentUserLocale = User.current.locale;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/change_locale/title");
         _localePicker = new UiLocalePicker(_loc1_.localePicker,Environment.info.availableLocales,_currentUserLocale,onLocaleChange,null,true,false);
         _loc1_.txtLang.text = AppConfig.localeNames.getString(_currentUserLocale);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnChange = new UiTextButton(_loc1_.btnChangeLocale,LocText.current.text("dialog/change_locale/button_change"),"",onClickChange);
         _btnChange.buttonEnabled = false;
         _loc1_.localePicker.bringToTop();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnChange.dispose();
         _btnChange = null;
         _localePicker.dispose();
         _localePicker = null;
         super.dispose();
      }
      
      private function get defaultLocale() : String
      {
         return Environment.info.defaultLocale;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onLocaleChange(param1:String) : void
      {
         _localePicker.close();
         var _loc2_:SymbolDialogChangeLocaleGeneric = _vo as SymbolDialogChangeLocaleGeneric;
         _loc2_.txtLang.text = AppConfig.localeNames.getString(param1);
         _btnChange.buttonEnabled = _currentUserLocale != param1;
      }
      
      private function onClickChange(param1:InteractionEvent) : void
      {
         var _loc2_:String = _localePicker.activeLocale.locale;
         _btnChange.buttonEnabled = false;
         User.current.changeLocale(_loc2_,null,onChangeLocaleSuccess);
      }
      
      private function onChangeLocaleSuccess() : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnChange;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
