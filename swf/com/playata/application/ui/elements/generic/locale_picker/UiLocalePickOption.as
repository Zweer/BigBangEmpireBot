package com.playata.application.ui.elements.generic.locale_picker
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.generic.SymbolLocalePickOptionGeneric;
   
   public class UiLocalePickOption extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLocalePickOptionGeneric = null;
      
      private var _asiaAsUSA:Boolean = true;
      
      private var _locale:String = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _onClickCallback:Function = null;
      
      private var _showCountryNames:Boolean;
      
      public function UiLocalePickOption(param1:SymbolLocalePickOptionGeneric, param2:String, param3:String, param4:Function = null, param5:Boolean = true, param6:Boolean = true)
      {
         _content = param1;
         super(_content);
         _asiaAsUSA = param5;
         _locale = param2;
         _tooltip = new UiTextTooltip(_content,param3);
         _onClickCallback = param4;
         _showCountryNames = param6;
         var _loc7_:String = _locale;
         if(_loc7_ == "en_AP" && _asiaAsUSA)
         {
            _loc7_ = "en_US";
         }
         _content.active.visible = false;
         if(_showCountryNames)
         {
            _content.txtCountryName.htmlText = "<a href=\'event:null\'>" + AppConfig.localeCountryNames.getString(_loc7_) + "</a>";
         }
         else
         {
            _content.txtCountryName.htmlText = "<a href=\'event:null\'>" + AppConfig.localeNames.getString(_loc7_) + "</a>";
         }
         if(_onClickCallback != null)
         {
            onClick.add(handleClick);
         }
         refresh();
      }
      
      override public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         super.dispose();
      }
      
      public function get content() : SymbolLocalePickOptionGeneric
      {
         return _content;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_onClickCallback != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onClickCallback(this);
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         _content.active.visible = param1;
      }
      
      public function get active() : Boolean
      {
         return _content.active.visible;
      }
      
      public function get locale() : String
      {
         return _locale;
      }
      
      public function set locale(param1:String) : void
      {
         if(_locale == param1)
         {
            return;
         }
         _locale = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         _content.iconLocale.removeAllChildren();
         var _loc1_:String = _locale;
         if(_loc1_ == "en_AP" && _asiaAsUSA)
         {
            _loc1_ = "en_US";
         }
         AppAssetUtil.setLocaleFlag(_loc1_,_content.iconLocale);
      }
   }
}
