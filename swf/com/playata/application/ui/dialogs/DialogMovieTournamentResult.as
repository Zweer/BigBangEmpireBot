package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.tournament.TournamentMovieReward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.movie.UiMovieCover;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieTournamentResultGeneric;
   
   public class DialogMovieTournamentResult extends UiDialog
   {
       
      
      private var _reward:TournamentMovieReward = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _cover:UiMovieCover;
      
      private var _tooltip:UiTextTooltip;
      
      private var _tooltipTitle:UiTextTooltip;
      
      public function DialogMovieTournamentResult(param1:TypedObject)
      {
         _reward = new TournamentMovieReward(param1.getTypedObjectFromJson("movie_rewards"));
         var _loc2_:SymbolDialogMovieTournamentResultGeneric = new SymbolDialogMovieTournamentResultGeneric();
         super(_loc2_);
         _queued = false;
         _tooltip = new UiTextTooltip(_loc2_.cover,"");
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/movie_tournament_new_result/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/movie_tournament_new_result/info");
         _loc2_.txtDateCaption.text = LocText.current.text("dialog/movie_history/date_caption");
         _loc2_.txtSetCaption.text = LocText.current.text("dialog/movie_history/set_caption");
         _loc2_.txtRewardCaption.text = LocText.current.text("dialog/movie_complete/rewards_caption");
         _tooltipTitle = new UiTextTooltip(_loc2_.titleTooltip,"");
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _cover = new UiMovieCover(_loc2_.cover);
         refresh();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _tooltipTitle.dispose();
         _tooltipTitle = null;
         _cover = null;
         super.dispose();
      }
      
      private function refresh() : void
      {
         var _loc2_:SymbolDialogMovieTournamentResultGeneric = _vo as SymbolDialogMovieTournamentResultGeneric;
         var _loc1_:Reward = _reward.reward;
         _tooltip.text = _reward.title;
         _loc2_.txtInfo.text = LocText.current.text("dialog/movie_tournament_new_result/info",_reward.votes);
         _loc2_.txtDate.text = _reward.dateTime;
         if(_reward.setIdentifier != "")
         {
            _loc2_.txtSet.text = LocText.current.text("movie/setting/" + _reward.setIdentifier + "/name");
         }
         else
         {
            _loc2_.txtSet.text = "";
         }
         _loc2_.tournament.txtRank.text = LocText.current.formatHugeNumber(_reward.rank) + ".";
         var _loc3_:* = _loc1_.premiumCurrency > 0;
         _loc2_.iconPremiumCurrency.visible = _loc3_;
         _loc2_.txtPremiumCurrency.visible = _loc3_;
         _loc3_ = _loc1_.xp > 0;
         _loc2_.iconXp.visible = _loc3_;
         _loc2_.txtXp.visible = _loc3_;
         _loc3_ = _loc1_.statPoints > 0;
         _loc2_.iconStatPoints.visible = _loc3_;
         _loc2_.txtStatPoints.visible = _loc3_;
         _loc3_ = _loc1_.title != null && !Titles.instance.isTitleAvailable(User.current.character,_loc1_.title);
         _loc2_.iconTitle.visible = _loc3_;
         _loc3_ = _loc3_;
         _loc2_.txtTitleReward.visible = _loc3_;
         _loc2_.titleTooltip.visible = _loc3_;
         if(_loc1_.premiumCurrency > 0)
         {
            _loc2_.txtPremiumCurrency.text = GameUtil.getPremiumCurrencyString(_loc1_.premiumCurrency);
         }
         if(_loc1_.statPoints > 0)
         {
            _loc2_.txtStatPoints.text = GameUtil.getStatPointString(_loc1_.statPoints);
         }
         if(_loc1_.xp > 0)
         {
            _loc2_.txtXp.text = GameUtil.getXpString(_loc1_.xp);
         }
         if(_loc2_.txtTitleReward.visible)
         {
            _loc2_.txtTitleReward.text = LocText.current.text("general/title");
            _tooltipTitle.text = LocText.current.text("dialog/sewing_machine/info_progress_title",Titles.instance.getNameWithTitle(User.current.character.name,_loc1_.title));
         }
         _cover.showWithSettings(_reward.coverSettings);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimMovieTournamentRewards",{},handleRequests,null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "claimMovieTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  if(AppConfig.movieTournamentsEnabled == true && User.current.character.pendingMovieTournamentRewards)
                  {
                     Environment.application.sendActionRequest("getMovieTournamentRewards",{},handleRequests);
                     return;
                  }
                  Environment.panelManager.showDialog(new DialogLeaderboard());
               }
               else if(param1.error == "errClaimMovieTournamentRewardsNoRewards")
               {
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getMovieTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.tournament_movie_rewards)
                  {
                     Environment.panelManager.showDialog(new DialogMovieTournamentResult(param1.appResponse.tournament_movie_rewards));
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
