package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.GuildLeaderVote;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildLeaderVoteInfoGeneric;
   
   public class DialogGuildLeaderVoteInfo extends UiDialog
   {
       
      
      private var _guildLeaderVote:GuildLeaderVote = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnKeep:UiTextButton = null;
      
      private var _btnVoteOut:UiTextButton = null;
      
      private var _btnLater:UiTextButton = null;
      
      private var _timer:ITimer = null;
      
      public function DialogGuildLeaderVoteInfo(param1:GuildLeaderVote)
      {
         _guildLeaderVote = param1;
         var _loc4_:SymbolDialogGuildLeaderVoteInfoGeneric = new SymbolDialogGuildLeaderVoteInfoGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/guild_voteout/title");
         _loc4_.txtInfo.text = LocText.current.text("dialog/guild_voteout/info",_guildLeaderVote.currentLeader.name,CConstant.guild_leader_vote_min_active_days,_guildLeaderVote.initiator.name);
         _loc4_.txtNeededVotesCaption.text = LocText.current.text("dialog/guild_voteout/needed_votes_caption");
         _loc4_.txtVoteOutVotesCaption.text = LocText.current.text("dialog/guild_voteout/voteout_votes_caption");
         _loc4_.txtKeepVotesCaption.text = LocText.current.text("dialog/guild_voteout/keep_votes_caption");
         _loc4_.txtEndTimeCaption.text = LocText.current.text("dialog/guild_voteout/endtime_caption");
         _loc4_.txtNeededVotesCaption.autoFontSize = true;
         _loc4_.txtNeededVotes.text = LocText.current.text("dialog/guild_voteout/needed_votes_value",_guildLeaderVote.neededVotes,50);
         _loc4_.txtVoteOutVotes.text = LocText.current.text("dialog/guild_voteout/voteout_votes_value",_guildLeaderVote.currentVoteOutVotes,_guildLeaderVote.currentVoteOutPercentage);
         _loc4_.txtKeepVotes.text = LocText.current.text("dialog/guild_voteout/keep_votes_value",_guildLeaderVote.currentKeepVotes,_guildLeaderVote.currentKeepPercentage);
         var _loc3_:Boolean = _guildLeaderVote.hasAlreadyVoted(User.current.character.id);
         var _loc2_:Boolean = _guildLeaderVote.isAllowedToVote(User.current.character.id);
         if(_loc3_)
         {
            _loc4_.txtInfoBottom.text = LocText.current.text("dialog/guild_voteout/vote_already_done") + " ";
         }
         if(!_loc2_)
         {
            _loc4_.txtInfoBottom.text = LocText.current.text("dialog/guild_voteout/vote_not_allowed",CConstant.guild_leader_vote_min_active_days) + " ";
         }
         if(_guildLeaderVote.isVoteResultNewLeader)
         {
            _loc4_.txtInfoBottom.text = _loc4_.txtInfoBottom.text + LocText.current.text("dialog/guild_voteout/new_leader_value",_guildLeaderVote.voteResultNewLeader.name);
         }
         else
         {
            _loc4_.txtInfoBottom.text = _loc4_.txtInfoBottom.text + LocText.current.text("dialog/guild_voteout/same_leader_value",_guildLeaderVote.currentLeader.name);
         }
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnKeep = new UiTextButton(_loc4_.btnKeep,LocText.current.text("dialog/guild_voteout/button_keep"),"",onClickKeep);
         _btnVoteOut = new UiTextButton(_loc4_.btnVoteOut,LocText.current.text("dialog/guild_voteout/button_voteout"),"",onClickVoteOut);
         _btnLater = new UiTextButton(_loc4_.btnLater,LocText.current.text("mobile/rating/button_later"),"",onClickLater);
         _btnKeep.visible = !_loc3_ && _loc2_;
         _btnVoteOut.visible = !_loc3_ && _loc2_;
         _btnLater.visible = !_loc3_ && _loc2_;
         _loc4_.txtInfoBottom.visible = _loc3_ || !_loc2_;
         _timer = Environment.createTimer("DialogGuildLeaderVoteInfo::timer",1000,onUpdateTime);
         _timer.start();
         onUpdateTime();
      }
      
      private function onUpdateTime() : void
      {
         if(!User.current)
         {
            _timer.stop();
            return;
         }
         var _loc1_:SymbolDialogGuildLeaderVoteInfoGeneric = _vo as SymbolDialogGuildLeaderVoteInfoGeneric;
         _loc1_.txtEndTime.text = TimeUtil.secondsToString(_guildLeaderVote.remainingSeconds);
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnKeep.dispose();
         _btnKeep = null;
         _btnVoteOut.dispose();
         _btnVoteOut = null;
         _btnLater.dispose();
         _btnLater = null;
         _timer.dispose();
         _timer = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickKeep(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("voteForGuildLeader",{"leader_character_id":_guildLeaderVote.currentLeader.id},handleRequests);
      }
      
      private function onClickVoteOut(param1:InteractionEvent) : void
      {
         close();
         Environment.panelManager.showDialog(new DialogGuildLeaderVoteSelection(_guildLeaderVote));
      }
      
      private function onClickLater(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("voteForGuildLeader" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
