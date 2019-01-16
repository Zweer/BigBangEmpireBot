package com.playata.application.ui.elements.generic.locale_picker
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import flash.display.Loader;
   import visuals.ui.elements.generic.SymbolLocalePickOptionGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   
   public class UiLocalePicker
   {
       
      
      private const BOX_HEIGHT:int = 37;
      
      private const BOX_BORDER:int = 10;
      
      private var _content:SymbolLocalePickerGeneric = null;
      
      private var _asiaAsUSA:Boolean = true;
      
      private var _onLocaleChange:Function = null;
      
      private var _onOpen:Function = null;
      
      private var _isOpen:Boolean = false;
      
      private var _localeBoxes:Vector.<UiLocalePickOption>;
      
      private var _originalX:Number = 0;
      
      private var _originalWidth:Number = 0;
      
      private var _originalHeight:Number = 0;
      
      private var _availableLocales:Vector.<String> = null;
      
      private var _currentLocale:UiLocalePickOption = null;
      
      private var _tooltipLayer:InteractiveDisplayObject = null;
      
      private var _enabled:Boolean = true;
      
      private var _showCountryNames:Boolean = true;
      
      public function UiLocalePicker(param1:SymbolLocalePickerGeneric, param2:Vector.<String>, param3:String, param4:Function = null, param5:Function = null, param6:Boolean = true, param7:Boolean = true)
      {
         var _loc8_:* = null;
         _localeBoxes = new Vector.<UiLocalePickOption>();
         super();
         _content = param1;
         _asiaAsUSA = param6;
         _onLocaleChange = param4;
         _onOpen = param5;
         _availableLocales = param2;
         _showCountryNames = param7;
         _originalX = _content.x;
         _originalWidth = _content.width;
         _originalHeight = _content.height;
         _tooltipLayer = new InteractiveDisplayObject(_content.tooltipLayer);
         _tooltipLayer.onInteractionOut.add(handleInteractionOut);
         _currentLocale = new UiLocalePickOption(param1.iconSelectedLocale,param3,"",onClickPickLocale,_asiaAsUSA,_showCountryNames);
         _currentLocale.content.txtCountryName.visible = false;
         _content.locales.visible = false;
         _content.selectionPopupBackground.visible = false;
         _content.tooltipLayer.visible = false;
         _localeBoxes = new Vector.<UiLocalePickOption>();
         _content.locales.removeAllChildren();
         var _loc12_:int = 0;
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 6;
         var _loc15_:int = 0;
         var _loc14_:* = _availableLocales;
         for each(var _loc11_ in _availableLocales)
         {
            _loc8_ = new UiLocalePickOption(new SymbolLocalePickOptionGeneric(),_loc11_,"",onClickSelect,_asiaAsUSA,_showCountryNames);
            if(_content.locales.numChildren > 0 && _content.locales.numChildren % _loc13_ == 0)
            {
               _loc12_ = _loc12_ + int(_loc8_.content.width);
               _loc10_ = 0;
            }
            _loc8_.content.x = _loc12_;
            _loc8_.content.y = _loc10_;
            _loc8_.content.dropDownBackground.visible = false;
            if(_loc11_ == _currentLocale.locale)
            {
               _loc8_.active = true;
            }
            _content.locales.addChild(_loc8_.content);
            _localeBoxes.push(_loc8_);
            _loc9_++;
            _loc10_ = _loc10_ + 37;
         }
         _content.selectionPopupBackground.height = (_content.locales.numChildren > _loc13_?_loc13_:int(_content.locales.numChildren)) * 37 + 10;
         _content.selectionPopupBackground.width = _content.selectionPopupBackground.width + _loc12_;
         _content.tooltipLayer.x = _content.selectionPopupBackground.x;
         _content.tooltipLayer.y = _content.selectionPopupBackground.y;
         _content.tooltipLayer.width = _content.selectionPopupBackground.width;
         _content.tooltipLayer.height = _content.selectionPopupBackground.height;
         if(!_availableLocales || _availableLocales.length <= 1)
         {
            _currentLocale.useHandCursor = false;
            _currentLocale.content.dropDownBackground.visible = false;
         }
         else
         {
            _currentLocale.useHandCursor = true;
            _currentLocale.content.dropDownBackground.visible = true;
         }
      }
      
      public function dispose() : void
      {
         _tooltipLayer.dispose();
         var _loc3_:int = 0;
         var _loc2_:* = _localeBoxes;
         for each(var _loc1_ in _localeBoxes)
         {
            _loc1_.dispose();
         }
         _currentLocale.dispose();
         _currentLocale = null;
      }
      
      private function onClickPickLocale(param1:UiLocalePickOption) : void
      {
         if(!_availableLocales || _availableLocales.length <= 1 || !_enabled)
         {
            return;
         }
         if(_onOpen != null)
         {
            _onOpen();
         }
         open();
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         try
         {
            if(param1.rawEvent.relatedObject is Loader)
            {
               return;
            }
            if(param1.rawEvent.relatedObject is SymbolLocalePickOption)
            {
               return;
            }
            if(param1.rawEvent.relatedObject.parent != null && param1.rawEvent.relatedObject.parent.name == "active")
            {
               return;
            }
            if(param1.rawEvent.relatedObject.parent != null && param1.rawEvent.relatedObject.parent.name == "iconLocale")
            {
               return;
            }
            close();
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function open() : void
      {
         if(_isOpen)
         {
            close();
            return;
         }
         _isOpen = true;
         _content.locales.visible = true;
         _content.selectionPopupBackground.visible = true;
         _content.tooltipLayer.visible = true;
      }
      
      public function close() : void
      {
         if(_isOpen)
         {
            _content.locales.visible = false;
            _content.selectionPopupBackground.visible = false;
            _content.tooltipLayer.visible = false;
         }
         _isOpen = false;
      }
      
      private function onClickSelect(param1:UiLocalePickOption) : void
      {
         if(_onLocaleChange != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            var _loc4_:int = 0;
            var _loc3_:* = _localeBoxes;
            for each(var _loc2_ in _localeBoxes)
            {
               _loc2_.active = param1 == _loc2_;
            }
            _onLocaleChange(param1.locale);
            _currentLocale.locale = param1.locale;
         }
      }
      
      public function get content() : SymbolLocalePickerGeneric
      {
         return _content;
      }
      
      public function get activeLocale() : UiLocalePickOption
      {
         var _loc3_:int = 0;
         var _loc2_:* = _localeBoxes;
         for each(var _loc1_ in _localeBoxes)
         {
            if(_loc1_.active)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function setActiveLocale(param1:String) : void
      {
         if(_availableLocales.indexOf(param1) < 0)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _localeBoxes;
         for each(var _loc2_ in _localeBoxes)
         {
            _loc2_.active = _loc2_.locale == param1;
         }
         if(activeLocale)
         {
            _currentLocale.locale = activeLocale.locale;
         }
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
      }
   }
}
