package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.AppConfig;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.guild.LeaderboardGuild;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildArtifactTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildLineGeneric;
   
   public class UiLeaderboardGuildLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardGuildLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _guild:LeaderboardGuild = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _tooltipArtifacts:UiGuildArtifactTooltip = null;
      
      private var _tooltipActiveDefense:UiTextTooltip = null;
      
      private var _tooltipFans:UiTextTooltip;
      
      private var _tooltipOpen:UiTextTooltip = null;
      
      private var _tooltipNotOpen:UiTextTooltip = null;
      
      public function UiLeaderboardGuildLine(param1:SymbolLeaderboardGuildLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _tooltipArtifacts = new UiGuildArtifactTooltip(new InteractiveDisplayObject(_content.iconGuildArtifact));
         _tooltipActiveDefense = new UiTextTooltip(_content.iconActiveGuildDefense,LocText.current.text("dialog/leaderboard_guild/active_defense"));
         _tooltipFans = new UiTextTooltip(_content.txtFans,"");
         _tooltipOpen = new UiTextTooltip(_content.iconOpen,LocText.current.text("dialog/leaderboard_guild/apply_open"));
         _tooltipNotOpen = new UiTextTooltip(_content.iconNotOpen,LocText.current.text("dialog/leaderboard_guild/apply_not_open"));
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
         _content.txtServerId.autoFontSize = true;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _tooltipArtifacts.dispose();
         _tooltipArtifacts = null;
         _tooltipActiveDefense.dispose();
         _tooltipActiveDefense = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guild() : LeaderboardGuild
      {
         return _guild;
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
      
      public function refresh(param1:LeaderboardGuild, param2:int) : void
      {
         _index = param2;
         _guild = param1;
         if(_guild == null)
         {
            _content.visible = false;
            return;
         }
         _emblem.refresh(_guild.emblemSettings);
         _content.visible = true;
         _content.txtRank.text = LocText.current.formatHugeNumber(_guild.rank);
         _content.txtGuildName.text = _guild.name;
         _content.txtHonor.text = LocText.current.formatHugeNumber(_guild.honor);
         _content.txtFans.text = LocText.current.shortenHugeNumber(_guild.fans);
         _content.txtTotalPercentage.text = Math.floor(_guild.totalPercentage * 100) + "%";
         _content.iconGuildArtifact.visible = _guild.hasArtifacts;
         _content.iconActiveGuildDefense.visible = _guild.hasActiveDefense;
         _content.iconOpen.visible = _guild.acceptMembers && _guild.isOpen;
         _content.iconNotOpen.visible = _guild.acceptMembers && !_guild.isOpen;
         if(_guild.fans > 0)
         {
            _tooltipFans.text = LocText.current.text("dialog/leaderboard/hint_guild_fans",_guild.name,LocText.current.formatHugeNumber(_guild.fans),LocText.current.formatHugeNumber(_guild.movies));
         }
         else
         {
            _tooltipFans.text = "";
         }
         if(_content.iconGuildArtifact.visible)
         {
            _tooltipArtifacts.artifactIds = _guild.artifactIds;
         }
         _content.txtGuildName.textColor = !!_guild.isMyGuild?245728:14342874;
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
         if(AppConfig.teamLocaleEnabled || !_guild.isOwnServer)
         {
            if(!_guild.isOwnServer)
            {
               _content.txtServerId.text = _guild.serverId;
               _content.txtServerId.visible = true;
               _content.txtGuildName.x = 154;
               _content.txtGuildName.width = 288;
            }
            else
            {
               _content.txtServerId.visible = false;
               _content.txtGuildName.x = 120;
               _content.txtGuildName.width = 320;
            }
            _content.iconLocale.visible = true;
            _content.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_guild.locale));
         }
         else
         {
            _content.txtServerId.visible = false;
            _content.txtGuildName.x = 93;
            _content.txtGuildName.width = 346;
            _content.iconLocale.visible = false;
         }
      }
   }
}
