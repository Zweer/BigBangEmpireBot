package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildChatEmoticon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import visuals.ui.elements.emoticos.SymbolGuildChatEmoticonIconGeneric;
   import visuals.ui.elements.emoticos.SymbolGuildChatEmoticonPickerGeneric;
   
   public class UiGuildChatEmoticonPicker
   {
      
      private static var MAX_HORIZONTAL_BOXES:int = 8;
      
      private static var EMOTICON_MARGIN:int = -1;
      
      private static var EMOTICON_BORDER:int = -2;
       
      
      private var _content:SymbolGuildChatEmoticonPickerGeneric = null;
      
      private var _isOpen:Boolean = false;
      
      private var _onEmoticonSelect:Function = null;
      
      private var _emoticons:Vector.<UiGuildChatEmoticonIcon> = null;
      
      private var _onOpenCallback:Function = null;
      
      private var _onCloseCallback:Function = null;
      
      public function UiGuildChatEmoticonPicker(param1:SymbolGuildChatEmoticonPickerGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         param1.applySettings(new TypedObject({"interactionEnabled":true}));
         _onOpenCallback = param2;
         _onCloseCallback = param3;
         if(Environment.info.isTouchScreen)
         {
            _content.x = _content.x - 550;
            _content.separator.visible = false;
            _content.txtInfo.visible = false;
            MAX_HORIZONTAL_BOXES = 12;
            EMOTICON_MARGIN = 10;
            EMOTICON_BORDER = 0;
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _emoticons;
         for each(var _loc1_ in _emoticons)
         {
            _loc1_.dispose();
         }
      }
      
      public function open(param1:Function = null) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         if(_isOpen)
         {
            close();
            return;
         }
         _isOpen = true;
         _onEmoticonSelect = param1;
         if(!_emoticons)
         {
            _emoticons = new Vector.<UiGuildChatEmoticonIcon>();
            _content.icons.removeAllChildren();
            _loc4_ = 0;
            _loc7_ = 0;
            _loc6_ = 0;
            _loc9_ = 24;
            _loc5_ = 24;
            if(Environment.info.isTouchScreen)
            {
               _loc9_ = 50;
               _loc5_ = 50;
            }
            var _loc11_:int = 0;
            var _loc10_:* = GuildChatEmoticon.getAllEmoticons();
            for each(var _loc8_ in GuildChatEmoticon.getAllEmoticons())
            {
               if(!_loc8_.isHidden)
               {
                  if(_loc6_ != 0 && _loc6_ % MAX_HORIZONTAL_BOXES == 0)
                  {
                     _loc4_ = 0;
                     _loc7_ = _loc7_ + (_loc5_ + EMOTICON_MARGIN);
                  }
                  _loc2_ = new UiGuildChatEmoticonIcon(new SymbolGuildChatEmoticonIconGeneric(),_loc8_,onClickSelect,onHover);
                  _loc2_.content.x = _loc4_ + Math.ceil(_loc9_ / 2);
                  _loc2_.content.y = _loc7_ + Math.ceil(_loc5_ / 2);
                  _content.icons.addChild(_loc2_.content);
                  _emoticons.push(_loc2_);
                  _loc4_ = _loc4_ + (_loc9_ + EMOTICON_MARGIN);
                  _loc6_++;
               }
            }
            _content.icons.x = EMOTICON_BORDER;
            _content.icons.y = EMOTICON_BORDER;
            _loc3_ = _content.background.height;
            _content.background.width = _content.icons.width + EMOTICON_BORDER * 2 + 15;
            _content.background.height = _content.icons.height + EMOTICON_BORDER * 2 + 30;
            if(Environment.info.isTouchScreen)
            {
               _content.background.width = _content.background.width + 50;
               _content.background.height = _content.background.height + 25;
            }
            _content.icons.y = _content.icons.y + (_loc3_ - _content.background.height);
            _content.background.y = _content.background.y + (_loc3_ - _content.background.height);
            _content.separator.x = _content.background.x + 4;
            _content.separator.width = _content.background.width - 8;
            _content.txtInfo.x = _content.separator.x;
            _content.txtInfo.width = _content.separator.width;
         }
         _content.visible = true;
         if(_onOpenCallback != null)
         {
            _onOpenCallback();
         }
      }
      
      public function close() : void
      {
         if(_isOpen)
         {
            _content.visible = false;
            if(_onCloseCallback != null)
            {
               _onCloseCallback();
            }
         }
         _isOpen = false;
      }
      
      private function onHover(param1:Boolean, param2:UiGuildChatEmoticonIcon) : void
      {
         if(param1)
         {
            _content.txtInfo.text = param2.emoticon.codes[0];
         }
         else
         {
            _content.txtInfo.text = "";
         }
      }
      
      private function onClickSelect(param1:UiGuildChatEmoticonIcon) : void
      {
         if(_onEmoticonSelect != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onEmoticonSelect(param1.emoticon);
            close();
         }
      }
      
      public function get content() : SymbolGuildChatEmoticonPickerGeneric
      {
         return _content;
      }
   }
}
