package com.playata.application.ui.elements.user_story
{
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePickOption;
   import com.playata.framework.display.InteractiveDisplayObject;
   import visuals.ui.elements.user_story.SymbolUserStoryLocaleGeneric;
   
   public class UiUserStoryLocale extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolUserStoryLocaleGeneric = null;
      
      private var _localeOption:UiLocalePickOption = null;
      
      private var _checkBox:UiCheckBox = null;
      
      private var _locale:String = null;
      
      public function UiUserStoryLocale(param1:SymbolUserStoryLocaleGeneric, param2:String, param3:Array, param4:Function)
      {
         _content = param1;
         super(_content);
         _locale = param2;
         _localeOption = new UiLocalePickOption(param1.localeOption,param2,"",null,false,false);
         param1.localeOption.dropDownBackground.visible = false;
         var _loc5_:Boolean = param3 != null && param3.indexOf(param2) >= 0;
         _checkBox = new UiCheckBox(param1.checkBox,_loc5_,"",param4,null,param1.localeOption.txtCountryName);
      }
      
      override public function dispose() : void
      {
         _checkBox.dispose();
         _checkBox = null;
         _localeOption.dispose();
         _localeOption = null;
         super.dispose();
      }
      
      public function get checked() : Boolean
      {
         return _checkBox.checked;
      }
      
      public function get locale() : String
      {
         return _locale;
      }
   }
}
