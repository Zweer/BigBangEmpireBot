package com.playata.application.ui.elements.guild_competition
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.GuildCompetition;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiGuildCompetitionProgressTooltipGeneric;
   
   public class UiGuildCompetitionProgressTooltip extends UiClosableTooltip
   {
      
      protected static var _tooltipContent:SymbolUiGuildCompetitionProgressTooltipGeneric = null;
      
      private static var _currentGuildCompetition:GuildCompetition;
      
      private static var _currentTsLastUpdate:int = 0;
       
      
      private var _guildCompetition:GuildCompetition;
      
      public function UiGuildCompetitionProgressTooltip(param1:IInteractiveDisplayObject, param2:GuildCompetition = null)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiGuildCompetitionProgressTooltipGeneric();
            _tooltipContent.tooltip.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _tooltipContent.txtNoRewards.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(_guildCompetition)
         {
            _loc3_ = _guildCompetition.tsLastUpdate;
         }
         if(_currentGuildCompetition == _guildCompetition && _currentTsLastUpdate == _loc3_)
         {
            return;
         }
         _currentGuildCompetition = _guildCompetition;
         _currentTsLastUpdate = _loc3_;
         if(_guildCompetition == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.txtRewardsCaption.text = LocText.current.text("dialog/guild_competition_reward/reward_caption");
         _tooltipContent.txtNoRewards.visible = false;
         if(_guildCompetition.score >= CConstant.guild_competition_min_score)
         {
            _tooltipContent.txtRewardsCaption.visible = true;
            if(_guildCompetition.hasGuildsSameScore)
            {
               _tooltipContent.tooltip.text = LocText.current.text("dialog/guild_competition_progress/progress_tooltip_same_scores",LocText.current.formatHugeNumber(_guildCompetition.score),LocText.current.formatHugeNumber(_guildCompetition.rank),_guildCompetition.guildsSameScore);
            }
            else
            {
               _tooltipContent.tooltip.text = LocText.current.text("dialog/guild_competition_progress/progress_tooltip",LocText.current.formatHugeNumber(_guildCompetition.score),LocText.current.formatHugeNumber(_guildCompetition.rank));
            }
            if(_guildCompetition.rank > CConstant.guild_competition_min_rank_reward)
            {
               var _loc7_:* = false;
               _tooltipContent.iconXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.iconStatPoints.visible = _loc7_;
               _tooltipContent.iconPremiumCurrency.visible = _loc7_;
               _loc7_ = false;
               _tooltipContent.txtXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.txtStatPoints.visible = _loc7_;
               _tooltipContent.txtPremiumCurrency.visible = _loc7_;
               _tooltipContent.txtNoRewards.visible = true;
               _tooltipContent.txtNoRewards.text = LocText.current.text("dialog/guild_competition_progress/no_reward_tooltip",CConstant.guild_competition_min_rank_reward);
            }
            else if(_guildCompetition.hasGuildsWithRewards)
            {
               _loc7_ = true;
               _tooltipContent.iconXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.iconStatPoints.visible = _loc7_;
               _tooltipContent.iconPremiumCurrency.visible = _loc7_;
               _loc7_ = true;
               _tooltipContent.txtXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.txtStatPoints.visible = _loc7_;
               _tooltipContent.txtPremiumCurrency.visible = _loc7_;
               _loc6_ = CConstant.new_guild_competition_reward_xp;
               _loc1_ = CConstant.new_guild_competition_reward_stat_points;
               _loc4_ = CConstant.new_guild_competition_reward_guild_premium_curremcy;
               _loc2_ = Math.max(Math.max(1 - _guildCompetition.rank / _guildCompetition.guildsWithRewards * 1.1,0.05),1.625 - _guildCompetition.rank * 0.15);
               _tooltipContent.txtPremiumCurrency.text = GameUtil.getGuildPremiumCurrencyString(Math.ceil(_loc2_ * _loc4_));
               _tooltipContent.txtStatPoints.text = GameUtil.getStatPointString(Math.ceil(_loc2_ * _loc1_));
               _tooltipContent.txtXP.text = GameUtil.getXpString(Math.ceil(_loc2_ * _loc6_));
            }
            else
            {
               _tooltipContent.txtRewardsCaption.visible = false;
               _loc7_ = false;
               _tooltipContent.iconXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.iconStatPoints.visible = _loc7_;
               _tooltipContent.iconPremiumCurrency.visible = _loc7_;
               _loc7_ = false;
               _tooltipContent.txtXP.visible = _loc7_;
               _loc7_ = _loc7_;
               _tooltipContent.txtStatPoints.visible = _loc7_;
               _tooltipContent.txtPremiumCurrency.visible = _loc7_;
            }
         }
         else
         {
            _tooltipContent.txtRewardsCaption.visible = false;
            _loc7_ = false;
            _tooltipContent.iconXP.visible = _loc7_;
            _loc7_ = _loc7_;
            _tooltipContent.iconStatPoints.visible = _loc7_;
            _tooltipContent.iconPremiumCurrency.visible = _loc7_;
            _loc7_ = false;
            _tooltipContent.txtXP.visible = _loc7_;
            _loc7_ = _loc7_;
            _tooltipContent.txtStatPoints.visible = _loc7_;
            _tooltipContent.txtPremiumCurrency.visible = _loc7_;
            _tooltipContent.tooltip.text = LocText.current.text("dialog/guild_competition_progress/progress_tooltip_below_min",LocText.current.formatHugeNumber(CConstant.guild_competition_min_score - _guildCompetition.score));
         }
         var _loc5_:Number = _tooltipContent.tooltip.y + _tooltipContent.tooltip.textHeight;
         if(_tooltipContent.txtRewardsCaption.visible)
         {
            _tooltipContent.txtRewardsCaption.y = _loc5_ + 6;
            if(_tooltipContent.txtNoRewards.visible)
            {
               _tooltipContent.txtNoRewards.y = _tooltipContent.txtRewardsCaption.y + 22;
               _loc5_ = _tooltipContent.txtNoRewards.y + _tooltipContent.txtNoRewards.textHeight;
            }
            else
            {
               _loc7_ = _tooltipContent.txtRewardsCaption.y + 26;
               _tooltipContent.iconStatPoints.y = _loc7_;
               _tooltipContent.iconPremiumCurrency.y = _loc7_;
               _loc7_ = _tooltipContent.txtRewardsCaption.y + 26;
               _tooltipContent.txtStatPoints.y = _loc7_;
               _tooltipContent.txtPremiumCurrency.y = _loc7_;
               _tooltipContent.iconXP.y = _tooltipContent.iconPremiumCurrency.y + 33;
               _tooltipContent.txtXP.y = _tooltipContent.txtPremiumCurrency.y + 29;
               _loc5_ = _tooltipContent.iconXP.y + _tooltipContent.iconXP.height;
            }
         }
         _tooltipContent.background.height = int(_loc5_ + 25);
      }
      
      public function set guildCompetition(param1:GuildCompetition) : void
      {
         _guildCompetition = param1;
      }
   }
}
