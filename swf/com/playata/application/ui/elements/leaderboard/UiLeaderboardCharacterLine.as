package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.character.LeaderboardCharacter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiCharacterTooltip;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardLineGeneric;
   
   public class UiLeaderboardCharacterLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _character:LeaderboardCharacter = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _tooltip:UiCharacterTooltip;
      
      private var _tooltipFans:UiTextTooltip;
      
      public function UiLeaderboardCharacterLine(param1:SymbolLeaderboardLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         _tooltip = new UiCharacterTooltip(param1.txtName);
         _tooltipFans = new UiTextTooltip(param1.txtFans,"");
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
         _tooltip.dispose();
         _tooltip = null;
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
         var _loc5_:Boolean = _content.txtName.setTextToFit(_character.nameWithTitle,"...");
         _content.txtName.textColor = !!_character.isMe?245728:Number(!!_character.isMyGuildMember?16711908:14342874);
         _content.txtGuildName.htmlText = "<a href=\'event:null\'>" + StringUtil.cutLength(_character.guildName,15) + "</a>";
         _content.txtLevel.text = _character.level.toString();
         _content.txtHonor.text = LocText.current.formatHugeNumber(_character.honor);
         _content.txtFans.text = LocText.current.shortenHugeNumber(_character.fans);
         _content.iconGenderMale.visible = _character.isMale;
         _content.iconGenderFemale.visible = _character.isFemale;
         _onlinePoint.refresh(_character.isOnline,_character.name,!!_loc5_?4:8);
         var _loc3_:String = AppConfig.titlesEnabled && _loc5_?param1.nameWithTitle:"";
         var _loc4_:String = "";
         if(_character.isOwnServer && _character.attackedCount > 0 && _character.attackedCount >= _character.maxAttackCount)
         {
            _loc4_ = LocText.current.text("dialog/leaderboard/not_allowed_to_attack",_character.attackedCount,_character.maxAttackCount);
         }
         else if(_character.isOwnServer && _character.attackedCount > 0)
         {
            _loc4_ = LocText.current.text("dialog/leaderboard/allowed_to_attack",_character.attackedCount,_character.maxAttackCount);
         }
         _tooltip.setText(_loc3_,param1,_loc4_);
         if(_character.fans > 0)
         {
            _tooltipFans.text = LocText.current.text("dialog/leaderboard/hint_fans",_character.name,LocText.current.formatHugeNumber(_character.fans),LocText.current.formatHugeNumber(_character.movies));
         }
         else
         {
            _tooltipFans.text = "";
         }
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
      }
   }
}
