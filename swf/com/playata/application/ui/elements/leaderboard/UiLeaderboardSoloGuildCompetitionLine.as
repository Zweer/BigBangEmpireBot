package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.LeaderboardSoloGuildCompetition;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardSoloGuildCompetitionLineGeneric;
   
   public class UiLeaderboardSoloGuildCompetitionLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardSoloGuildCompetitionLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _character:LeaderboardSoloGuildCompetition = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _tooltipStatPoints:UiTextTooltip = null;
      
      public function UiLeaderboardSoloGuildCompetitionLine(param1:SymbolLeaderboardSoloGuildCompetitionLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         _tooltipStatPoints = new UiTextTooltip(_content.tooltipStatPoints,"");
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         if(!Environment.info.isTouchScreen)
         {
            _content.txtGuildName.onClick.add(handleGuildNameClick);
         }
         useHandCursor = false;
         _content.visible = false;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _tooltipStatPoints.dispose();
         _tooltipStatPoints = null;
         _onlinePoint.dispose();
         _onlinePoint = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get character() : LeaderboardSoloGuildCompetition
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
         ViewManager.instance.loadGuild(_character.guildId,closeCallback);
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
      
      public function refresh(param1:LeaderboardSoloGuildCompetition, param2:int) : void
      {
         _index = param2;
         _character = param1;
         if(_character == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         if(_character.guildId > 0)
         {
            _emblem.visible = true;
            _content.txtGuildName.visible = true;
            _emblem.refresh(_character.emblemSettings);
            _content.txtGuildName.text = _character.guildName;
         }
         else
         {
            _emblem.visible = false;
            _content.txtGuildName.visible = false;
         }
         _content.txtRank.text = LocText.current.formatHugeNumber(_character.rank);
         _content.txtScore.text = LocText.current.formatHugeNumber(_character.score);
         _content.txtName.text = _character.name;
         _content.txtName.textColor = !!_character.isMyGuildMember?245728:14342874;
         _content.iconGenderMale.visible = _character.isMale;
         _content.iconGenderFemale.visible = _character.isFemale;
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
         _onlinePoint.refresh(_character.isOnline,_character.name);
         updateTooltips(_character.rank);
      }
      
      private function updateTooltips(param1:int) : void
      {
         var _loc2_:int = getStatPointsRewardForRank(param1);
         _tooltipStatPoints.text = GameUtil.getStatPointString(_loc2_);
         _content.txtStatPoints.text = LocText.current.formatHugeNumber(_loc2_);
         _content.txtStatPoints.visible = _loc2_ > 0;
         _content.iconRewardStatPoint.visible = _loc2_ > 0;
      }
      
      private function getStatPointsRewardForRank(param1:int) : int
      {
         if(param1 <= 3)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_3;
         }
         if(param1 <= 10)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_10;
         }
         if(param1 <= 20)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_20;
         }
         if(param1 <= 30)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_30;
         }
         if(param1 <= 40)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_40;
         }
         if(param1 <= 50)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_50;
         }
         if(param1 <= 100)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_100;
         }
         if(param1 <= 150)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_150;
         }
         if(param1 <= 200)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_200;
         }
         if(param1 <= 300)
         {
            return CConstant.solo_guild_competition_reward_stat_points_top_300;
         }
         return 0;
      }
   }
}
