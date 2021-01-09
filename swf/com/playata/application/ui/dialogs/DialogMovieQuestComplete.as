package com.playata.application.ui.dialogs
{
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.movie.UiMovieVoteItem;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieQuestCompleteGeneric;
   
   public class DialogMovieQuestComplete extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _quest:MovieQuest = null;
      
      private var _movieVoteItemReward:UiMovieVoteItem = null;
      
      public function DialogMovieQuestComplete(param1:MovieQuest)
      {
         _isOpen = true;
         _quest = param1;
         var _loc2_:SymbolDialogMovieQuestCompleteGeneric = new SymbolDialogMovieQuestCompleteGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/movie_quest_complete/rewards");
         if(_quest.isInstantQuest)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/movie_quest_complete/title_quest");
            _loc2_.txtOutcome.text = _quest.winText;
         }
         else if(_quest.isWon)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/movie_quest_complete/title_win");
            _loc2_.txtOutcome.text = _quest.winText;
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/movie_quest_complete/title_lose");
            _loc2_.txtOutcome.text = _quest.lostText;
         }
         _loc2_.txtCoins.text = _quest.reward.gameCurrencyString;
         _loc2_.txtXp.text = _quest.reward.xpString;
         _loc2_.txtProgress.text = _quest.reward.movieProgressString;
         _loc2_.movieVoteReward.visible = param1.reward.movieVotes > 0;
         if(_loc2_.movieVoteReward.visible)
         {
            if(_movieVoteItemReward == null)
            {
               _movieVoteItemReward = new UiMovieVoteItem(_loc2_.movieVoteReward);
            }
            _movieVoteItemReward.movieVotes = param1.reward.movieVotes;
         }
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         if(_quest.isWon)
         {
            EffectsLayer.instance.show(111,{},_vo.parent,1);
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimMovieQuestRewards",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         if("claimMovieQuestRewards" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
         if(response.error == "")
         {
            Environment.application.updateData(response.data);
            showRewardEffect();
            close();
            var claimMovieQuestRewardsCompleted:Function = function():void
            {
               if(!_quest.isInstantQuest)
               {
                  ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
               }
               ViewManager.instance.showPanel("movie_progress");
            };
            Runtime.delayFunction(claimMovieQuestRewardsCompleted,1);
         }
         else if(response.error != "errClaimMovieQuestRewardsInvalidQuest")
         {
            Environment.reportError(response.error,response.request);
         }
      }
      
      private function showRewardEffect() : void
      {
         var _loc1_:SymbolDialogMovieQuestCompleteGeneric = _vo as SymbolDialogMovieQuestCompleteGeneric;
         if(_loc1_.iconCoins.visible)
         {
            EffectsLayer.instance.show(0,{"emitter":_loc1_.iconCoins});
         }
         if(_loc1_.iconXp.visible)
         {
            EffectsLayer.instance.show(1,{"emitter":_loc1_.iconXp});
         }
         if(_loc1_.iconProgress.visible)
         {
            EffectsLayer.instance.show(13,{"emitter":_loc1_.iconProgress});
         }
         if(_loc1_.movieVoteReward.visible)
         {
            EffectsLayer.instance.show(12,{
               "emitter":_loc1_.movieVoteReward,
               "movie_panel":true
            });
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
   }
}
