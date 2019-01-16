package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildLeaderVote;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogGuildLeaderVoteInfo;
   import com.playata.application.ui.dialogs.DialogGuildLeaderVoteSelection;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildLeaderVoteInfoGeneric;
   
   public class UiGuildLeaderVoteInfo
   {
       
      
      private var _content:SymbolGuildLeaderVoteInfoGeneric = null;
      
      private var _guildLeaderVote:GuildLeaderVote = null;
      
      private var _btnVote:UiTextButton = null;
      
      private var _timer:ITimer = null;
      
      public function UiGuildLeaderVoteInfo(param1:SymbolGuildLeaderVoteInfoGeneric)
      {
         super();
         _content = param1;
         _content.txtInfo.text = LocText.current.text("screen/guild/voteout_text_info");
         _btnVote = new UiTextButton(_content.btnVote,LocText.current.text("screen/guild/button_vote"),"",onClickVote);
         _content.visible = false;
      }
      
      public function dispose() : void
      {
         _btnVote.dispose();
         _btnVote = null;
         _timer.stop();
         _timer = null;
      }
      
      public function get isActive() : Boolean
      {
         if(!_timer)
         {
            return false;
         }
         return _timer.isRunning;
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide(param1:Boolean = true) : void
      {
         if(_timer && param1)
         {
            _timer.stop();
         }
         _content.visible = false;
      }
      
      public function refresh(param1:Guild) : void
      {
         if(!param1 || !param1.isOwnGuild || !param1.hasPendingLeaderVote)
         {
            hide();
            return;
         }
         _content.visible = true;
         _guildLeaderVote = param1.leaderVote;
         if(!_timer)
         {
            _timer = Environment.createTimer("UiGuildLeaderVoteInfo::timer",1000,onTimerUpdate);
         }
         _timer.start();
         onTimerUpdate();
      }
      
      private function onTimerUpdate() : void
      {
         if(!User.current)
         {
            _timer.stop();
            return;
         }
         if(_guildLeaderVote.remainingSeconds <= 0)
         {
            hide();
            return;
         }
         _content.txtEndTime.text = LocText.current.text("screen/guild/voteout_end_info",TimeUtil.secondsToString(_guildLeaderVote.remainingSeconds));
      }
      
      private function onClickVote(param1:InteractionEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:Boolean = false;
         if(_guildLeaderVote.isSupportInitiated)
         {
            _loc3_ = _guildLeaderVote.hasAlreadyVoted(User.current.character.id);
            _loc2_ = _guildLeaderVote.isAllowedToVote(User.current.character.id);
            if(_loc3_)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_vote_new_leader/title"),LocText.current.text("dialog/guild_voteout/vote_already_done"),LocText.current.text("general/button_ok")));
            }
            else if(!_loc2_)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_vote_new_leader/title"),LocText.current.text("dialog/guild_voteout/vote_not_allowed",CConstant.guild_leader_vote_min_active_days),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.panelManager.showDialog(new DialogGuildLeaderVoteSelection(_guildLeaderVote));
            }
         }
         else if(_guildLeaderVote && _guildLeaderVote.currentLeader)
         {
            Environment.panelManager.showDialog(new DialogGuildLeaderVoteInfo(_guildLeaderVote));
         }
      }
   }
}
