package com.playata.application.ui.elements.user_story
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiRadioButton;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.display.ui.controls.TabGroup;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.user_story.SymbolUserStoryFilterGeneric;
   
   public class UiUserStoryFilter
   {
      
      private static const ALL_LOCALE:String = "all_locale";
      
      private static const SETTING_LOCALE:String = "setting_locale";
      
      private static const SPECIFIC_LOCALE:String = "specific_locale";
      
      private static var _selectionId:String = "setting_locale";
       
      
      private var _content:SymbolUserStoryFilterGeneric = null;
      
      private var _selectionGroup:TabGroup = null;
      
      private var _ckbAllLocale:UiRadioButton = null;
      
      private var _ckbSettingLocale:UiRadioButton = null;
      
      private var _ckbSpecificLocale:UiRadioButton = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      private var _callback:Function = null;
      
      private var _initialHight:Number = 0;
      
      private var _initialButtonSaveY:Number = 0;
      
      public function UiUserStoryFilter(param1:SymbolUserStoryFilterGeneric, param2:Function)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         _content.txtAllLocale.text = LocText.current.text("dialog/user_story/filter/all_locale");
         _content.txtAllLocale.autoFontSize = true;
         _content.txtSettingLocale.text = LocText.current.text("dialog/user_story/filter/setting_locale");
         _content.txtSettingLocale.autoFontSize = true;
         _content.txtSpecificLocale.text = LocText.current.text("dialog/user_story/filter/specific_locale");
         _content.txtSpecificLocale.autoFontSize = true;
         _content.txtCaptionLocale.text = LocText.current.text("dialog/user_story/filter/caption_locale");
         _content.txtCaptionLocale.autoFontSize = true;
         _selectionGroup = new TabGroup();
         _ckbAllLocale = new UiRadioButton(_content.ckbAllLocale,_content.txtAllLocale);
         _ckbSettingLocale = new UiRadioButton(_content.ckbSettingLocale,_content.txtSettingLocale);
         _ckbSpecificLocale = new UiRadioButton(_content.ckbSpecificLocale,_content.txtSpecificLocale);
         _selectionGroup.addTab("all_locale",_ckbAllLocale);
         _selectionGroup.addTab("setting_locale",_ckbSettingLocale);
         _selectionGroup.addTab("specific_locale",_ckbSpecificLocale);
         _selectionGroup.onTabSelected.add(onSelectionChanged);
         _localePicker = new UiLocalePicker(_content.localePicker,AppConfig.userStoryLocales,User.current.character.locale,onLocaleChange,null,false,false);
         _content.localePicker.bringToTop();
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/user_story/filter/button_save"),handleSaveSettingsClick);
         _content.dialogBackground.applySettings(new TypedObject({"interactionEnabled":true}));
         _initialHight = _content.dialogBackground.height;
         _initialButtonSaveY = _content.btnSaveSettings.y;
         if(User.current.hasSetting("user_story_filter_settings"))
         {
            _loc3_ = User.current.getSettingValue("user_story_filter_settings");
            _localePicker.setActiveLocale(_loc3_.locale);
            _selectionGroup.activateTab(_loc3_.selection_id,true);
         }
         else
         {
            _loc4_ = User.current.locale;
            if(_loc4_ == "en_US")
            {
               _loc4_ = "en_GB";
            }
            _localePicker.setActiveLocale(_loc4_);
            _selectionGroup.activateTab("setting_locale",true);
         }
         updateElements();
      }
      
      public static function get areAllLocalesSelected() : Boolean
      {
         var _loc1_:* = null;
         if(_selectionId != null && _selectionId == "all_locale")
         {
            return true;
         }
         if(_selectionId != null && _selectionId == "setting_locale")
         {
            _loc1_ = null;
            if(User.current && User.current.character && User.current.character.userStoryLocales && User.current.character.userStoryLocales != "")
            {
               _loc1_ = JsonUtil.decode(User.current.character.userStoryLocales);
            }
            return _loc1_ && _loc1_.length == AppConfig.userStoryLocales.length;
         }
         return false;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return _selectionId != null && _selectionId != "all_locale" && _selectionId != "setting_locale";
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbAllLocale.dispose();
         _ckbAllLocale = null;
         _ckbSettingLocale.dispose();
         _ckbSettingLocale = null;
         _ckbSpecificLocale.dispose();
         _ckbSpecificLocale = null;
         _localePicker.dispose();
         _localePicker = null;
         _content = null;
         _selectionId = "all_locale";
      }
      
      public function get locales() : Array
      {
         var _loc1_:* = null;
         var _loc2_:* = _selectionId;
         switch(_loc2_)
         {
            case "all_locale":
               return null;
            case "setting_locale":
               if(User.current.character.userStoryLocales && User.current.character.userStoryLocales != "")
               {
                  return JsonUtil.decode(User.current.character.userStoryLocales);
               }
               return null;
            case "specific_locale":
               if(User.current.hasSetting("user_story_filter_settings"))
               {
                  _loc1_ = User.current.getSettingValue("user_story_filter_settings");
                  return [_loc1_.locale];
               }
            default:
               return null;
         }
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      private function onSelectionChanged(param1:String) : void
      {
         _selectionId = param1;
         updateElements();
      }
      
      private function onLocaleChange(param1:String) : void
      {
         updateElements();
      }
      
      private function updateElements() : void
      {
         var _loc1_:* = null;
         if(!User.current.hasSetting("user_story_filter_settings"))
         {
            _btnSaveSettings.buttonEnabled = _selectionId != "setting_locale";
         }
         else
         {
            _loc1_ = User.current.getSettingValue("user_story_filter_settings");
            _btnSaveSettings.buttonEnabled = _selectionId != _loc1_.selection_id || _localePicker.activeLocale.locale != _loc1_.locale;
         }
         _content.localePicker.visible = _selectionId == "specific_locale";
         _content.txtCaptionLocale.visible = _content.localePicker.visible;
         _content.localeBackground.visible = _content.localePicker.visible;
         _content.dialogBackground.height = _initialHight;
         _content.btnSaveSettings.y = _initialButtonSaveY;
         if(!_content.localePicker.visible)
         {
            _content.dialogBackground.height = _content.dialogBackground.height - 50;
            _content.btnSaveSettings.y = _content.btnSaveSettings.y - 50;
         }
      }
      
      private function handleSaveSettingsClick(param1:InteractionEvent) : void
      {
         var _loc2_:Object = {
            "selection_id":_selectionId,
            "locale":_localePicker.activeLocale.locale
         };
         User.current.setSettingValue("user_story_filter_settings",_loc2_);
         updateElements();
         _callback(true);
         hide();
      }
   }
}
