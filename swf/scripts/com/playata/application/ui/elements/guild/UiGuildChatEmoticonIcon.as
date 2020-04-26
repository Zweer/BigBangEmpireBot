package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildChatEmoticon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.emoticos.SymbolGuildChatEmoticonIconGeneric;
   
   public class UiGuildChatEmoticonIcon extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildChatEmoticonIconGeneric = null;
      
      private var _emoticon:GuildChatEmoticon = null;
      
      private var _onClickCallback:Function = null;
      
      private var _onHover:Function = null;
      
      public function UiGuildChatEmoticonIcon(param1:SymbolGuildChatEmoticonIconGeneric, param2:GuildChatEmoticon, param3:Function = null, param4:Function = null)
      {
         _content = param1;
         super(_content);
         _emoticon = param2;
         _onClickCallback = param3;
         _onHover = param4;
         if(_onClickCallback != null)
         {
            onClick.add(handleClick);
            onInteractionOver.add(handleInteractionOver);
            onInteractionOut.add(handleInteractionOut);
         }
         _content.border.visible = false;
         refresh();
      }
      
      public function get content() : SymbolGuildChatEmoticonIconGeneric
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
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         _content.border.visible = !Environment.info.isTouchScreen;
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         _content.border.visible = false;
      }
      
      public function get emoticon() : GuildChatEmoticon
      {
         return _emoticon;
      }
      
      public function refresh() : void
      {
         _content.icon.removeAllChildren();
         if(Environment.info.isTouchScreen)
         {
            _content.addChild(UriSprite.load(_emoticon.imageUrlBig,45,45,true,-1));
         }
         else
         {
            _content.addChild(UriSprite.load(_emoticon.imageUrl,16,16,true,-1));
         }
      }
   }
}
