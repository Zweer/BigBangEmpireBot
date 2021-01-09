package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.character.LeaderboardCharacter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardCharacterGlobalTournamentLineGeneric;
   
   public class UiLeaderboardCharacterGlobalTournamentLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardCharacterGlobalTournamentLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _character:LeaderboardCharacter = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _tooltipGuild:UiTextTooltip = null;
      
      public function UiLeaderboardCharacterGlobalTournamentLine(param1:SymbolLeaderboardCharacterGlobalTournamentLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         _tooltipGuild = new UiTextTooltip(_content.txtGuildName,"");
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         if(!Environment.info.isTouchScreen)
         {
            _content.txtGuildName.onClick.add(handleGuildNameClick);
         }
         useHandCursor = false;
         _content.txtServerId.autoFontSize = true;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _tooltipGuild.dispose();
         _tooltipGuild = null;
         _onlinePoint.dispose();
         _onlinePoint = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get character() : LeaderboardCharacter
      {
         return _character;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleGuildNameClick(param1:InteractionEvent) : void
      {
         if(!_character.guildId)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
         ViewManager.instance.loadGuild(_character.guildId,closeCallback,_character.serverId);
      }
      
      private function closeCallback() : void
      {
         Environment.panelManager.dialogManager.closeLastDialog();
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
      
      public function refresh(param1:LeaderboardCharacter, param2:int) : void
      {
         _index = param2;
         _character = param1;
         if(_character == null)
         {
            _content.visible = false;
            return;
         }
         if(_character.hasGuild)
         {
            _emblem.refresh(_character.emblemSettings);
         }
         else
         {
            _emblem.refresh(null,true);
         }
         _content.visible = true;
         _content.txtRank.text = LocText.current.formatHugeNumber(_character.rank);
         _content.txtName.text = _character.name;
         _content.txtName.textColor = !!_character.isMe?245728:Number(!!_character.isMyGuildMember?16711908:14342874);
         _content.txtGuildName.htmlText = "<a href=\'event:null\'>" + StringUtil.cutLength(_character.guildName,30) + "</a>";
         _content.txtScore.text = LocText.current.formatHugeNumber(param1.tournamentValue);
         _content.iconGenderMale.visible = _character.isMale;
         _content.iconGenderFemale.visible = _character.isFemale;
         if(AppConfig.teamLocaleEnabled || !_character.isOwnServer)
         {
            if(!_character.isOwnServer)
            {
               _content.txtServerId.text = _character.serverId;
               _content.txtServerId.visible = true;
               _content.txtName.x = 157;
               _content.txtName.width = 187;
            }
            else
            {
               _content.txtServerId.visible = false;
               _content.txtName.x = 119;
               _content.txtName.width = 224;
            }
            _content.iconLocale.visible = true;
            _content.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_character.locale));
         }
         else
         {
            _content.txtServerId.visible = false;
            _content.txtName.x = 92;
            _content.txtName.width = 247;
            _content.iconLocale.visible = false;
         }
         _onlinePoint.refresh(_character.isOnline,_character.name);
         _tooltipGuild.text = "";
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
      }
   }
}
