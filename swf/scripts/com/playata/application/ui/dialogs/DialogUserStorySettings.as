package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.user_story.UiUserStoryLocale;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStorySettingsGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryLocaleGeneric;
   
   public class DialogUserStorySettings extends UiDialog
   {
       
      
      private var _onLocaleChangedCallback:Function = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiButton = null;
      
      private var _userStoryLocales:Vector.<UiUserStoryLocale>;
      
      private var _oldLocales:Array = null;
      
      private var _newLocales:Array = null;
      
      private var _localeChanged:Boolean = false;
      
      private var _btnDeactivate:UiTextButton = null;
      
      public function DialogUserStorySettings(param1:Function)
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         _userStoryLocales = new Vector.<UiUserStoryLocale>();
         var _loc4_:SymbolDialogUserStorySettingsGeneric = new SymbolDialogUserStorySettingsGeneric();
         super(_loc4_);
         _queued = false;
         _onLocaleChangedCallback = param1;
         _loc4_.textTitle.text = LocText.current.text("dialog/user_story_settings/title");
         _loc4_.textInfo.text = LocText.current.text("dialog/user_story_settings/info");
         _loc4_.textDeactivate.text = LocText.current.text("dialog/user_story_settings/info_deactivate");
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnSave = new UiTextButton(_loc4_.btnSave,LocText.current.text("dialog/user_story_settings/button_save"),"",onClickSave);
         _btnDeactivate = new UiTextButton(_loc4_.btnDeactivate,LocText.current.text("dialog/user_story_settings/buttonDeactivate"),"",onClickDeactivate);
         if(User.current.character.userStoryLocales && User.current.character.userStoryLocales != "")
         {
            _oldLocales = JsonUtil.decode(User.current.character.userStoryLocales);
         }
         _loc4_.placeholder.removeAllChildren();
         var _loc2_:Vector.<String> = AppConfig.userStoryLocales;
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = new UiUserStoryLocale(new SymbolUserStoryLocaleGeneric(),_loc2_[_loc5_],_oldLocales,onLocaleChanged);
            _userStoryLocales.push(_loc3_);
            _loc4_.placeholder.addChild(_loc3_);
            _loc3_.x = _loc5_ % 3 * 195;
            _loc3_.y = Math.floor(_loc5_ / 3) * 50;
            _loc5_++;
         }
         var _loc6_:int = Math.ceil(_userStoryLocales.length / 3) - 1;
         if(_loc6_ > 0)
         {
            _loc4_.background.height = _loc4_.background.height + _loc6_ * 50;
            _loc4_.btnSave.y = _loc4_.btnSave.y + _loc6_ * 50;
            _loc4_.backgroundSeperator.y = _loc4_.backgroundSeperator.y + _loc6_ * 50;
            _loc4_.btnDeactivate.y = _loc4_.btnDeactivate.y + _loc6_ * 50;
            _loc4_.textDeactivate.y = _loc4_.textDeactivate.y + _loc6_ * 50;
            _yOffset = _yOffset - _loc6_ * 50 / 2;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _btnSave.dispose();
         _btnSave = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnDeactivate.dispose();
         _btnDeactivate = null;
         _loc1_ = 0;
         while(_loc1_ < _userStoryLocales.length)
         {
            _userStoryLocales[_loc1_].dispose();
            _loc1_++;
         }
         _userStoryLocales = null;
         super.dispose();
      }
      
      private function onLocaleChanged(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _newLocales = [];
         _localeChanged = false;
         _loc2_ = 0;
         while(_loc2_ < _userStoryLocales.length)
         {
            if(_userStoryLocales[_loc2_].checked)
            {
               _newLocales.push(_userStoryLocales[_loc2_].locale);
            }
            if(!_localeChanged && (_oldLocales && _userStoryLocales[_loc2_].checked && _oldLocales.indexOf(_userStoryLocales[_loc2_].locale) < 0 || _oldLocales && !_userStoryLocales[_loc2_].checked && _oldLocales.indexOf(_userStoryLocales[_loc2_].locale) >= 0 || !_oldLocales && _userStoryLocales[_loc2_].checked))
            {
               _localeChanged = true;
            }
            _loc2_++;
         }
         if(_newLocales.length == 0)
         {
            _localeChanged = false;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         if(_localeChanged)
         {
            Environment.application.sendActionRequest("changeUserStorySettings",{"locales":JsonUtil.encode(_newLocales)},handleRequests);
         }
         else
         {
            close();
         }
      }
      
      private function onClickDeactivate(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("deactivateUserStory",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "changeUserStorySettings":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_onLocaleChangedCallback)
                  {
                     _onLocaleChangedCallback(true);
                  }
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deactivateUserStory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogUserStory))
                  {
                     (Environment.panelManager.dialogManager.getVisibleDialog(DialogUserStory) as DialogUserStory).close();
                  }
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnSave;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
