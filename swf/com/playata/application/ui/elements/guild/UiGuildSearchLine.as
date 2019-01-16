package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.guild.GuildSearchResult;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.guild.SymbolGuildSearchLineGeneric;
   
   public class UiGuildSearchLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildSearchLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _guild:GuildSearchResult = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      public function UiGuildSearchLine(param1:SymbolGuildSearchLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
         if(AppConfig.teamLocaleEnabled)
         {
            _content.txtName.x = 63;
            _content.txtName.width = 242;
         }
         else
         {
            _content.iconLocale.visible = false;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guild() : GuildSearchResult
      {
         return _guild;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:GuildSearchResult, param2:int) : void
      {
         _index = param2;
         if(_guild && param1 && _guild.id == param1.id)
         {
            return;
         }
         _guild = param1;
         if(_guild == null)
         {
            _content.visible = false;
            return;
         }
         _emblem.refresh(_guild.emblemSettings);
         _content.visible = true;
         _content.txtName.text = _guild.name;
         _content.txtMembers.text = _guild.memberCount.toString();
         _content.txtTotalPercentage.text = _guild.fullTotalPercentage + "%";
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         if(AppConfig.teamLocaleEnabled)
         {
            AppAssetUtil.setLocaleFlag(_guild.locale,_content.iconLocale);
         }
      }
   }
}
