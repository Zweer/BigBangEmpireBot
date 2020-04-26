package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.movie.UiMovieVoteInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieVoteGeneric;
   
   public class DialogMovieVote extends UiDialog
   {
      
      public static var _open:Boolean = false;
       
      
      private var _itemReward:UiItemSlot;
      
      private var _btnVote1:UiTextButton;
      
      private var _btnVote2:UiTextButton;
      
      private var _btnOk:UiTextButton;
      
      private var _btnReportMovies:UiButton;
      
      private var _movieInfo1:UiMovieVoteInfo;
      
      private var _movieInfo2:UiMovieVoteInfo;
      
      private var _movie1:Movie;
      
      private var _movie2:Movie;
      
      private var _reward:Reward;
      
      private var _btnRefreshMovies:UiPremiumButton;
      
      public function DialogMovieVote()
      {
         var _loc1_:SymbolDialogMovieVoteGeneric = new SymbolDialogMovieVoteGeneric();
         super(_loc1_);
         _queued = false;
         _open = true;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/movie_vote/title");
         _loc1_.txtRewardsCaption.text = LocText.current.text("dialog/movie_vote/rewards_caption");
         _loc1_.txtReportMovie.htmlText = "<u>" + LocText.current.text("dialog/movie_vote/report_movie") + "</u>";
         _btnOk = new UiTextButton(_loc1_.btnOk,LocText.current.text("general/button_ok"),"",onClickClose);
         _btnVote1 = new UiTextButton(_loc1_.btnVote1,LocText.current.text("dialog/movie_vote/vote1"),"",onClickVote1);
         _btnVote2 = new UiTextButton(_loc1_.btnVote2,LocText.current.text("dialog/movie_vote/vote2"),"",onClickVote2);
         _btnReportMovies = new UiButton(_loc1_.txtReportMovie,LocText.current.text("dialog/movie_vote/report_movie_tooltip"),onClickReportMovie);
         _btnRefreshMovies = new UiPremiumButton(_loc1_.btnRefreshMovies,CConstant.movie_vote_refresh_premium_amount,"",LocText.current.text("dialog/movie_vote/refresh"),"",LocText.current.text("dialog/movie_vote/refresh_tooltip",GameUtil.getPremiumCurrencyString(CConstant.movie_vote_refresh_premium_amount)),onClickRefreshMovies);
         _btnRefreshMovies.premium = true;
         _movieInfo1 = new UiMovieVoteInfo(_loc1_.movie1);
         _movieInfo2 = new UiMovieVoteInfo(_loc1_.movie2);
         _itemReward = new UiItemSlot(_loc1_.itemReward,0);
         if(User.current.character.movieVotes > 0)
         {
            _loc1_.vsAnimation.visible = false;
            _loc1_.bgMovies.visible = false;
            _loc1_.movie1.visible = false;
            _loc1_.movie2.visible = false;
            _loc1_.iconCoins.visible = false;
            _loc1_.iconPremiumCurrency.visible = false;
            _loc1_.iconXp.visible = false;
            _loc1_.iconStatPoints.visible = false;
            _loc1_.itemReward.visible = false;
            _loc1_.txtReward.visible = false;
            _btnVote1.visible = false;
            _btnVote2.visible = false;
            _btnRefreshMovies.visible = false;
            _loc1_.txtRewardsCaption.visible = false;
            _loc1_.txtInfo.visible = false;
            _btnReportMovies.visible = false;
            _loc1_.txtInfoError.visible = false;
            _btnOk.visible = false;
            Environment.application.sendActionRequest("getMoviesToVote",{"refresh":false},handleRequests);
         }
         else
         {
            refreshNoVotes(LocText.current.text("dialog/movie_vote/no_movie_votes"));
         }
      }
      
      override public function show() : void
      {
         super.show();
      }
      
      override public function dispose() : void
      {
         _open = false;
         _btnOk.dispose();
         _btnVote1.dispose();
         _btnVote2.dispose();
         _btnRefreshMovies.dispose();
         _btnReportMovies.dispose();
         _itemReward.dispose();
         _movieInfo1.dispose();
         _movieInfo2.dispose();
         _btnOk = null;
         _btnVote1 = null;
         _btnVote2 = null;
         _btnRefreshMovies = null;
         _btnReportMovies = null;
         _itemReward = null;
         _movieInfo1 = null;
         _movieInfo2 = null;
         super.dispose();
      }
      
      private function refreshNoVotes(param1:String) : void
      {
         var _loc3_:SymbolDialogMovieVoteGeneric = _vo as SymbolDialogMovieVoteGeneric;
         _loc3_.vsAnimation.visible = false;
         _loc3_.bgMovies.visible = false;
         _loc3_.movie1.visible = false;
         _loc3_.movie2.visible = false;
         _loc3_.iconCoins.visible = false;
         _loc3_.iconPremiumCurrency.visible = false;
         _loc3_.iconXp.visible = false;
         _loc3_.iconStatPoints.visible = false;
         _loc3_.itemReward.visible = false;
         _loc3_.txtReward.visible = false;
         _btnVote1.visible = false;
         _btnVote2.visible = false;
         _btnRefreshMovies.visible = false;
         _loc3_.txtRewardsCaption.visible = false;
         _loc3_.txtInfo.visible = false;
         _loc3_.loader.visible = false;
         _btnReportMovies.visible = false;
         _loc3_.txtInfoError.visible = true;
         _btnOk.visible = true;
         _loc3_.txtInfoError.text = param1;
         _loc3_.txtInfoError.autoFontSize = true;
         _loc3_.txtInfoError.y = -_loc3_.txtInfoError.height >> 1;
         _loc3_.txtDialogTitle.y = _loc3_.txtInfoError.y - _loc3_.txtDialogTitle.height - 15;
         var _loc2_:Number = _loc3_.btnOk.y;
         var _loc4_:Number = -_loc3_.txtInfoError.y + 45;
         _btnOk.y = _loc4_ - _loc2_;
         _loc3_.dialogBackground.y = _loc3_.dialogBackground.y + 45;
         _loc3_.dialogBackground.height = _loc3_.txtInfoError.textHeight + 210;
      }
      
      private function refresh(param1:Movie, param2:Movie, param3:Reward) : void
      {
         var _loc4_:* = null;
         if(_vo == null)
         {
            return;
         }
         User.current.character.setTutorialFlag("movie_votes");
         var _loc5_:SymbolDialogMovieVoteGeneric = _vo as SymbolDialogMovieVoteGeneric;
         _loc5_.vsAnimation.visible = true;
         _loc5_.bgMovies.visible = true;
         _loc5_.movie1.visible = true;
         _loc5_.movie2.visible = true;
         _loc5_.iconCoins.visible = true;
         _loc5_.iconPremiumCurrency.visible = true;
         _loc5_.iconXp.visible = true;
         _loc5_.iconStatPoints.visible = true;
         _loc5_.itemReward.visible = true;
         _loc5_.txtReward.visible = true;
         _btnVote1.visible = true;
         _btnVote2.visible = true;
         _btnRefreshMovies.visible = true;
         _loc5_.txtRewardsCaption.visible = true;
         _loc5_.txtInfo.visible = true;
         _loc5_.loader.visible = false;
         _loc5_.txtInfo.text = LocText.current.text("dialog/movie_vote/movie_votes_info_new");
         _movie1 = param1;
         _movie2 = param2;
         _reward = param3;
         _movieInfo1.refresh(param1);
         _movieInfo2.refresh(param2);
         _loc5_.iconCoins.visible = param3.gameCurrency > 0;
         _loc5_.iconPremiumCurrency.visible = param3.premiumCurrency > 0;
         _loc5_.iconXp.visible = param3.xp > 0;
         _loc5_.iconStatPoints.visible = param3.statPoints > 0;
         _loc5_.itemReward.visible = param3.itemId > 0;
         if(param3.itemId > 0)
         {
            _itemReward.item = User.current.character.getItemById(param3.itemId);
            _loc5_.txtReward.visible = false;
         }
         else
         {
            _loc4_ = "";
            if(param3.gameCurrency > 0)
            {
               _loc4_ = GameUtil.getGameCurrencyString(param3.gameCurrency);
            }
            else if(param3.premiumCurrency > 0)
            {
               _loc4_ = GameUtil.getPremiumCurrencyString(param3.premiumCurrency);
            }
            else if(param3.statPoints > 0)
            {
               _loc4_ = GameUtil.getStatPointString(param3.statPoints);
            }
            else if(param3.xp > 0)
            {
               _loc4_ = GameUtil.getXpString(param3.xp);
            }
            _loc5_.txtReward.text = _loc4_;
            _loc5_.txtReward.visible = true;
         }
         _btnReportMovies.visible = param1.isCustomTitle || param2.isCustomTitle;
      }
      
      private function onClickVote1(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("voteForMovie",{
            "movie_id":_movie1.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickVote2(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("voteForMovie",{
            "movie_id":_movie2.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickReportMovie(param1:InteractionEvent) : void
      {
         _btnReportMovies.visible = false;
         Environment.panelManager.showDialog(new DialogReportMovies(_movie1,_movie2));
      }
      
      private function onClickRefreshMovies(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogMovieVoteGeneric = _vo as SymbolDialogMovieVoteGeneric;
         Environment.application.sendActionRequest("getMoviesToVote",{"refresh":true},handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         if(!_vo)
         {
            return;
         }
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "getMoviesToVote":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  var movie1:Movie = new Movie(response.data.movies_to_vote[0]);
                  var movie2:Movie = new Movie(response.data.movies_to_vote[1]);
                  var reward:Reward = new Reward(response.appResponse.movie_vote_reward);
                  refresh(movie1,movie2,reward);
               }
               else if(response.error == "errGetMoviesToVoteWithoutVotes")
               {
                  close();
               }
               else if(response.error == "errGetMoviesNoMovies")
               {
                  refreshNoVotes(LocText.current.text("dialog/movie_vote/no_movies"));
               }
               else if(response.error == "errTournamentLocked")
               {
                  refreshNoVotes(LocText.current.text("movie_tournament/tournament_locked/info"));
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.movie_vote_refresh_premium_amount);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "voteForMovie":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  showRewardEffect(!response.request.rawData.discard_item);
                  close();
               }
               else if(response.error == "errInventoryNoEmptySlot")
               {
                  var movieId:int = response.request.rawData.movie_id;
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,function():void
                  {
                     onClickDiscardItem(movieId);
                  },false));
               }
               else if(response.error != "errVoteForMovieWithoutActiveVote")
               {
                  if(response.error == "errTournamentLocked")
                  {
                     refreshNoVotes(LocText.current.text("movie_tournament/tournament_locked/info"));
                  }
                  else
                  {
                     close();
                     Environment.reportError(response.error,response.request);
                  }
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_vo == null)
         {
            return;
         }
         var _loc3_:SymbolDialogMovieVoteGeneric = _vo as SymbolDialogMovieVoteGeneric;
         if(_loc3_.iconCoins.visible)
         {
            EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
         }
         if(_loc3_.iconXp.visible)
         {
            EffectsLayer.instance.show(1,{"emitter":_loc3_.iconXp});
         }
         if(_loc3_.iconPremiumCurrency.visible)
         {
            EffectsLayer.instance.show(2,{"emitter":_loc3_.iconPremiumCurrency});
         }
         if(_loc3_.iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,{"emitter":_loc3_.iconStatPoints});
         }
         if(param1 && _reward.itemId > 0)
         {
            _loc2_ = User.current.character.getItemById(_reward.itemId);
            EffectsLayer.instance.show(3,{
               "emitter":_loc3_.itemReward,
               "imageUrl":_loc2_.iconImageUrl
            });
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem(param1:int) : void
      {
         Environment.application.sendActionRequest("voteForMovie",{
            "movie_id":param1,
            "discard_item":true
         },handleRequests);
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
