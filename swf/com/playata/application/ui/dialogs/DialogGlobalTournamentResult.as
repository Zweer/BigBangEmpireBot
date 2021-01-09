package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dataobject.DOGlobalCharacterTournamentReward;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.tournament.GlobalCharacterTournamentReward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGlobalTournamentResultGeneric;
   
   public class DialogGlobalTournamentResult extends UiDialog
   {
       
      
      private var _reward:GlobalCharacterTournamentReward = null;
      
      private var _btnClose:UiTextButton = null;
      
      public function DialogGlobalTournamentResult(param1:DOGlobalCharacterTournamentReward)
      {
         _reward = new GlobalCharacterTournamentReward(param1);
         var _loc2_:SymbolDialogGlobalTournamentResultGeneric = new SymbolDialogGlobalTournamentResultGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/global_tournament_result/title");
         _loc2_.txtRewardCaption.text = LocText.current.text("dialog/global_tournament_result/reward_caption");
         _loc2_.txtInfo.text = LocText.current.text("dialog/global_tournament_result/info");
         _loc2_.txtTournamentCaption.text = LocText.current.text("dialog/global_tournament_result/tournament_caption");
         _loc2_.txtRank.text = LocText.current.text("dialog/global_tournament_result/rank",_reward.getRank(1));
         _loc2_.txtFights.text = LocText.current.text("dialog/global_tournament_result/fight_count",_reward.getValue(1));
         var _loc3_:Reward = _reward.getRewards(1);
         _loc2_.txtXPValue.visible = _loc3_ != null;
         if(_loc3_)
         {
            _loc2_.txtXPValue.text = _loc3_.xpString;
         }
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimGlobalTournamentRewards",{},handleRequests,false);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "claimGlobalTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  showRewardEffect();
                  close();
                  if(User.current.character.pendingGlobalTournamentRewards)
                  {
                     Environment.application.sendActionRequest("getGlobalTournamentRewards",{},handleRequests);
                     return;
                  }
                  Environment.panelManager.showDialog(new DialogLeaderboard());
               }
               else if(param1.error != "errClaimGlobalTournamentRewardsNoRewards")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGlobalTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.hasData("global_tournament_rewards"))
                  {
                     Environment.panelManager.showDialog(new DialogGlobalTournamentResult(param1.appResponse.global_tournament_rewards));
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogLeaderboard());
                  }
               }
               else if(param1.error == "errTournamentLocked")
               {
                  Environment.panelManager.showDialog(new DialogLeaderboard());
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function showRewardEffect() : void
      {
         var _loc1_:SymbolDialogGlobalTournamentResultGeneric = _vo as SymbolDialogGlobalTournamentResultGeneric;
         if(_reward.hasTournamentData(1))
         {
            EffectsLayer.instance.show(1,EffectOptions.fromData({"emitter":_loc1_.iconXp}));
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
