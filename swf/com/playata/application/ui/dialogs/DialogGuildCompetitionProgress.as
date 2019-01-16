package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildCompetition;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionProgressBar;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionProgressTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.dialogs.SymbolDialogGuildCompetitionProgressGeneric;
   import visuals.ui.elements.guild_competition.SymbolGuildCompetitionScoreInfoGeneric;
   
   public class DialogGuildCompetitionProgress extends UiDialog
   {
      
      private static var LAST_UPDATE:int = 0;
      
      private static const REFRESH_TIME:int = 30;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _guild:Guild = null;
      
      private var _guildEmblemLower:UiGuildEmblem;
      
      private var _guildEmblemHigher:UiGuildEmblem;
      
      private var _progressBar:UiGuildCompetitionProgressBar;
      
      private var _timerTooltip:UiTextTooltip;
      
      private var _rankTooltip:UiTextTooltip;
      
      private var _progressTooltip:UiGuildCompetitionProgressTooltip;
      
      private var _timer:ITimer;
      
      private var _tooltip:UiTextTooltip;
      
      public function DialogGuildCompetitionProgress()
      {
         var _loc1_:SymbolDialogGuildCompetitionProgressGeneric = new SymbolDialogGuildCompetitionProgressGeneric();
         super(_loc1_);
         _queued = false;
         _guild = User.current.character.guild;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/guild_competition_progress/title");
         _loc1_.txtNotAllowedInfo.text = LocText.current.text("dialog/guild_competition_progress/info_not_allowed");
         _loc1_.txtNotAllowedInfo.autoFontSize = true;
         _btnClose = new UiTextButton(_loc1_.btnClose,LocText.current.text("dialog/guild_competition_progress/button_close"),"",onClickClose);
         _guildEmblemLower = new UiGuildEmblem(_loc1_.guildEmplem1,null,50,50,null,false,2);
         _guildEmblemHigher = new UiGuildEmblem(_loc1_.guildEmplem2,null,50,50,null,false,2);
         _progressBar = new UiGuildCompetitionProgressBar(_loc1_.progressBar);
         _timerTooltip = new UiTextTooltip(_loc1_.txtTimer,"");
         _rankTooltip = new UiTextTooltip(_loc1_.txtRank,"");
         _progressTooltip = new UiGuildCompetitionProgressTooltip(_loc1_.txtProgress);
         refresh();
         if(LAST_UPDATE < TimeUtil.now - 30)
         {
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboardGuildsAroundOwnGuild",{},handleRequests);
         }
         _timer = Environment.createTimer("DialogGuildCompetitionProgress::timer",1000,onUpdateTime);
         _timer.start();
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _timer.stop();
         _timer = null;
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         super.dispose();
      }
      
      private function refresh() : void
      {
         var _loc8_:int = 0;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(_btnClose == null)
         {
            return;
         }
         var _loc4_:GuildCompetition = _guild.guildCompetition;
         if(!_loc4_ || !_loc4_.isActive)
         {
            close();
            return;
         }
         var _loc7_:SymbolDialogGuildCompetitionProgressGeneric = _vo as SymbolDialogGuildCompetitionProgressGeneric;
         if(_loc4_.tsStart > _guild.getMemberById(User.current.character.id).tsGuildJoined)
         {
            _loc7_.txtNotAllowedInfo.visible = false;
            _loc8_ = 0;
            while(_loc8_ < 4)
            {
               _loc1_ = _loc7_.getChildByName("scoreInfo" + (_loc8_ + 1)) as SymbolGuildCompetitionScoreInfoGeneric;
               if(_loc8_ < _loc4_.objectives.length)
               {
                  _loc1_.txtInfo.htmlText = _loc4_.getScoreInfoText(_loc4_.objectives[_loc8_]);
                  _loc1_.visible = true;
               }
               else
               {
                  _loc1_.visible = false;
               }
               _loc8_++;
            }
         }
         else
         {
            _loc7_.txtNotAllowedInfo.visible = true;
            _loc8_ = 0;
            while(_loc8_ < 4)
            {
               _loc7_.getChildByName("scoreInfo" + (_loc8_ + 1)).visible = false;
               _loc8_++;
            }
         }
         updatePosition(_loc4_);
         _loc7_.txtFlavor.text = _loc4_.flavorText;
         _loc7_.txtFlavor.autoFontSize = true;
         _loc7_.txtDesciption.text = _loc4_.descriptionText;
         _loc7_.txtDesciption.autoFontSize = true;
         _loc7_.npc.setUriSprite(_loc4_.npcImageUrl,348,670,true);
         var _loc2_:int = 0;
         var _loc3_:int = _loc4_.score;
         var _loc9_:int = 0;
         if(_loc4_.score >= CConstant.guild_competition_min_score)
         {
            _loc7_.iconGuildCompetition.visible = false;
            _loc7_.txtSameRankBefore.visible = false;
            _loc7_.txtSameRankBehinde.visible = false;
            _loc7_.txtSameRankEqual.visible = false;
            _loc7_.txtRank.text = LocText.current.formatHugeNumber(_loc4_.rank);
            _rankTooltip.text = LocText.current.text("screen/guild/button_guild_competition",LocText.current.formatHugeNumber(_loc4_.score),LocText.current.formatHugeNumber(_loc4_.rank));
            if(_loc4_.hasGuildsLowerScore)
            {
               _guildEmblemLower.refresh(_loc4_.guildsLowerScoreEmplemSettings);
               _loc2_ = _loc4_.guildsLowerScoreScore;
               _loc7_.txtSameRankBehinde.visible = _loc4_.guildsLowerScoreGuildCount > 0;
               _loc7_.txtSameRankBehinde.text = "+" + _loc4_.guildsLowerScoreGuildCount;
               if(_loc4_.guildsLowerScoreGuildCount > 0)
               {
                  _guildEmblemLower.tooltip = LocText.current.text("dialog/guild_competition_progress/lower_guilds_tooltip",_loc4_.guildsLowerScoreGuildName,_loc4_.guildsLowerScoreGuildCount,LocText.current.formatHugeNumber(_loc4_.guildsLowerScoreScore));
               }
               else
               {
                  _guildEmblemLower.tooltip = LocText.current.text("dialog/guild_competition_progress/lower_guild_tooltip",_loc4_.guildsLowerScoreGuildName,LocText.current.formatHugeNumber(_loc4_.guildsLowerScoreScore));
               }
            }
            else if(_loc4_.hasGuildsHigherScore)
            {
               _loc2_ = CConstant.guild_competition_min_score;
               _guildEmblemLower.refresh(_guild.emblemSettings);
               _guildEmblemLower.tooltip = LocText.current.text("dialog/guild_competition_progress/no_lower_guilds_tooltip");
            }
            else
            {
               _loc2_ = CConstant.guild_competition_min_score;
               _guildEmblemLower.refresh(null);
               _guildEmblemLower.tooltip = "";
            }
            if(_loc4_.hasGuildsHigherScore)
            {
               _guildEmblemHigher.refresh(_loc4_.guildsHigherScoreEmplemSettings);
               _loc9_ = _loc4_.guildsHigherScoreScore;
               _loc7_.txtSameRankBefore.visible = _loc4_.guildsHigherScoreGuildCount > 0;
               _loc7_.txtSameRankBefore.text = "+" + _loc4_.guildsHigherScoreGuildCount;
               if(_loc4_.guildsHigherScoreGuildCount > 0)
               {
                  _guildEmblemHigher.tooltip = LocText.current.text("dialog/guild_competition_progress/higher_guilds_tooltip",_loc4_.guildsHigherScoreGuildName,_loc4_.guildsHigherScoreGuildCount,LocText.current.formatHugeNumber(_loc4_.guildsHigherScoreScore));
               }
               else
               {
                  _guildEmblemHigher.tooltip = LocText.current.text("dialog/guild_competition_progress/higher_guild_tooltip",_loc4_.guildsHigherScoreGuildName,LocText.current.formatHugeNumber(_loc4_.guildsHigherScoreScore));
               }
            }
            else
            {
               _loc9_ = _loc4_.score;
               _guildEmblemHigher.refresh(_guild.emblemSettings);
               _guildEmblemHigher.tooltip = LocText.current.text("dialog/guild_competition_progress/no_higher_guilds_tooltip");
            }
            _loc7_.txtSameRankEqual.visible = _loc4_.hasGuildsSameScore;
            if(_loc7_.txtSameRankEqual.visible)
            {
               _loc7_.txtSameRankEqual.text = "+" + _loc4_.guildsSameScore;
            }
         }
         else
         {
            _loc7_.iconGuildCompetition.visible = true;
            _loc7_.txtSameRankBefore.visible = false;
            _loc7_.txtSameRankBehinde.visible = false;
            _loc7_.txtSameRankEqual.visible = false;
            _loc7_.txtRank.text = "";
            _rankTooltip.text = LocText.current.text("screen/guild/button_guild_competition_below_min",LocText.current.formatHugeNumber(_loc4_.score),CConstant.guild_competition_min_score);
            _loc2_ = 0;
            _guildEmblemLower.refresh(_guild.emblemSettings);
            _loc9_ = CConstant.guild_competition_min_score;
            _guildEmblemHigher.refresh(null);
         }
         _loc7_.txtProgress.text = _loc3_ + "/" + _loc9_;
         _progressBar.value = (_loc3_ - _loc2_) / (_loc9_ - _loc2_) * 100;
         _progressTooltip.guildCompetition = _loc4_;
         onUpdateTime();
         if(Environment.info.isTouchScreen && _loc4_.hasConventionData)
         {
            _loc5_ = _loc4_.conventionStartTimes;
            if(_loc5_ != "")
            {
               _tooltip = new UiTextTooltip(_loc7_.progressBar,LocText.current.text("screen/guild/button_guild_competition_convention_tooltip",_loc5_,_loc4_.remainingConventionStartTimes));
            }
            _loc6_ = _loc7_.txtDialogTitle.textBounds;
            UiInfoTooltipButton.assign(_loc7_,_tooltip,_loc7_.txtDialogTitle.x + _loc6_.x + _loc7_.txtDialogTitle.textWidth + 15,_loc7_.txtDialogTitle.y + _loc6_.y);
         }
      }
      
      private function updatePosition(param1:GuildCompetition) : void
      {
         var _loc7_:int = 0;
         var _loc6_:SymbolDialogGuildCompetitionProgressGeneric = _vo as SymbolDialogGuildCompetitionProgressGeneric;
         var _loc3_:int = 16;
         var _loc4_:int = -119;
         var _loc2_:int = 136;
         var _loc5_:int = 105;
         var _loc9_:int = 94;
         if(_loc6_.txtNotAllowedInfo.visible)
         {
            _loc9_ = _loc6_.txtNotAllowedInfo.y;
         }
         else
         {
            _loc7_ = 3;
            while(_loc7_ >= 0)
            {
               if(_loc6_["scoreInfo" + (_loc7_ + 1)].visible)
               {
                  _loc6_["scoreInfo" + (_loc7_ + 1)].y = _loc9_;
                  _loc9_ = _loc9_ - 23;
               }
               _loc7_--;
            }
            _loc9_ = _loc9_ + 23;
         }
         var _loc8_:int = _loc9_ - _loc3_;
         _loc6_.txtFlavor.height = _loc5_ + _loc8_ / 2;
         _loc6_.txtDesciption.y = _loc4_ + _loc8_ / 2;
         _loc6_.txtDesciption.height = _loc2_ + _loc8_ / 2;
      }
      
      private function onUpdateTime() : void
      {
         if(!Application.userController.isLoggedIn)
         {
            _timer.stop();
            return;
         }
         var _loc1_:GuildCompetition = _guild.guildCompetition;
         var _loc2_:SymbolDialogGuildCompetitionProgressGeneric = _vo as SymbolDialogGuildCompetitionProgressGeneric;
         if(_loc1_.remainingSeconds <= 0)
         {
            _loc2_.txtTimer.visible = false;
            _timer.stop();
            return;
         }
         _timerTooltip.text = LocText.current.text("dialog/guild_competition_progress/timer_tooltip",_loc1_.timeRemainingString);
         _loc2_.txtTimer.visible = true;
         _loc2_.txtTimer.text = _loc1_.timeRemainingStringShort;
         _loc2_.txtTimer.autoFontSize = true;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("retrieveGuildCompetitionTournamentLeaderboardGuildsAroundOwnGuild" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            LAST_UPDATE = TimeUtil.now;
            refresh();
         }
         else if(param1.error == "errTournamentLocked")
         {
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
