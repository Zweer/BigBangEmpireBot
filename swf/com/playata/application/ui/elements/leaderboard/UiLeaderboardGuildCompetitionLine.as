package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.LeaderboardGuildCompetition;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildCompetitionLineGeneric;
   
   public class UiLeaderboardGuildCompetitionLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardGuildCompetitionLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _guild:LeaderboardGuildCompetition = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _tooltipXP:UiTextTooltip = null;
      
      private var _tooltipStatPoints:UiTextTooltip = null;
      
      private var _tooltipPremium:UiTextTooltip = null;
      
      public function UiLeaderboardGuildCompetitionLine(param1:SymbolLeaderboardGuildCompetitionLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _emblem = new UiGuildEmblem(_content.emblem,null,22,22,null,false,12);
         _tooltipXP = new UiTextTooltip(_content.iconRewardXP,"");
         _tooltipStatPoints = new UiTextTooltip(_content.iconRewardStatPoint,"");
         _tooltipPremium = new UiTextTooltip(_content.iconRewardPremium,"");
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         _content.visible = false;
      }
      
      override public function dispose() : void
      {
         _emblem.dispose();
         _emblem = null;
         _tooltipXP.dispose();
         _tooltipXP = null;
         _tooltipStatPoints.dispose();
         _tooltipStatPoints = null;
         _tooltipPremium.dispose();
         _tooltipPremium = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guild() : LeaderboardGuildCompetition
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
      
      public function refresh(param1:LeaderboardGuildCompetition, param2:int, param3:int) : void
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
         _content.txtScore.text = LocText.current.formatHugeNumber(_guild.score);
         _content.txtGuildName.text = _guild.name;
         _content.txtGuildName.textColor = !!_guild.isMyGuild?245728:14342874;
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
         if(param1.rank <= CConstant.guild_competition_min_rank_reward && param3 > 0)
         {
            updateTooltips(param1.rank,param3);
            _content.iconRewardPremium.visible = getPremiumRewardForRank(param1.rank,param3) > 0;
            _content.iconRewardStatPoint.visible = getStatPointsRewardForRank(param1.rank,param3) > 0;
            _content.iconRewardXP.visible = getXpRewardForRank(param1.rank,param3) > 0;
         }
         else
         {
            _content.iconRewardPremium.visible = false;
            _content.iconRewardStatPoint.visible = false;
            _content.iconRewardXP.visible = false;
         }
      }
      
      private function updateTooltips(param1:int, param2:int) : void
      {
         var _loc5_:int = getXpRewardForRank(guild.rank,param2);
         var _loc4_:int = getStatPointsRewardForRank(guild.rank,param2);
         var _loc3_:int = getPremiumRewardForRank(guild.rank,param2);
         _tooltipXP.text = GameUtil.getXpString(_loc5_);
         _tooltipStatPoints.text = GameUtil.getStatPointString(_loc4_);
         _tooltipPremium.text = GameUtil.getGuildPremiumCurrencyString(_loc3_);
      }
      
      private function getPremiumRewardForRank(param1:int, param2:int) : int
      {
         var _loc4_:int = CConstant.new_guild_competition_reward_guild_premium_curremcy;
         var _loc3_:Number = Math.max(Math.max(1 - param1 / param2 * 1.1,0.05),1.625 - param1 * 0.15);
         return Math.ceil(_loc3_ * _loc4_);
      }
      
      private function getXpRewardForRank(param1:int, param2:int) : int
      {
         var _loc4_:int = CConstant.new_guild_competition_reward_xp;
         var _loc3_:Number = Math.max(Math.max(1 - param1 / param2 * 1.1,0.05),1.625 - param1 * 0.15);
         return Math.ceil(_loc3_ * _loc4_);
      }
      
      private function getStatPointsRewardForRank(param1:int, param2:int) : int
      {
         var _loc3_:int = CConstant.new_guild_competition_reward_stat_points;
         var _loc4_:Number = Math.max(Math.max(1 - param1 / param2 * 1.1,0.05),1.625 - param1 * 0.15);
         return Math.ceil(_loc4_ * _loc3_);
      }
   }
}
