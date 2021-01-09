package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.GuildLeaderVote;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.guild.UiGuildLeaderVoteSelectionList;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildLeaderVoteSelectionGeneric;
   
   public class DialogGuildLeaderVoteSelection extends UiDialog
   {
       
      
      private var _guildLeaderVote:GuildLeaderVote = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnVote:UiTextButton = null;
      
      private var _btnEnclose:UiTextButton = null;
      
      private var _list:UiGuildLeaderVoteSelectionList = null;
      
      public function DialogGuildLeaderVoteSelection(param1:GuildLeaderVote)
      {
         _guildLeaderVote = param1;
         var _loc2_:SymbolDialogGuildLeaderVoteSelectionGeneric = new SymbolDialogGuildLeaderVoteSelectionGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_vote_new_leader/title");
         if(_guildLeaderVote.isSupportInitiated)
         {
            _loc2_.txtInfo.text = LocText.current.text("dialog/guild_vote_new_leader/support_initiated_info");
         }
         else
         {
            _loc2_.txtInfo.text = LocText.current.text("dialog/guild_vote_new_leader/info",_guildLeaderVote.currentLeader.name);
         }
         _loc2_.txtNameCaption.text = LocText.current.text("dialog/leaderboard/column_name");
         _loc2_.txtRankCaption.text = LocText.current.text("dialog/leaderboard/column_rank");
         _loc2_.txtLevelCaption.text = LocText.current.text("dialog/leaderboard/column_level");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnVote = new UiTextButton(_loc2_.btnVote,LocText.current.text("dialog/guild_vote_new_leader/button_choose"),"",onClickVote);
         _btnEnclose = new UiTextButton(_loc2_.btnEnclose,LocText.current.text("dialog/guild_vote_new_leader/button_enclose"),"",onClickEnclose);
         _list = new UiGuildLeaderVoteSelectionList(_loc2_,_guildLeaderVote,onListUpdated);
         _list.refresh();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnVote.dispose();
         _btnVote = null;
         _btnEnclose.dispose();
         _btnEnclose = null;
         _list.dispose();
         _list = null;
         super.dispose();
      }
      
      private function onListUpdated() : void
      {
         _btnVote.buttonEnabled = _list.selectedItem != null;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickVote(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("voteForGuildLeader",{"leader_character_id":_list.selectedItemAsObject.id},handleRequests);
      }
      
      private function onClickEnclose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("voteForGuildLeader",{"leader_character_id":0},handleRequests);
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
         onClickClose(null);
      }
   }
}
