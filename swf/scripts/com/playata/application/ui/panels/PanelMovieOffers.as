package com.playata.application.ui.panels
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Bounce;
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumDiscountButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.movie.UiMovieOffer;
   import com.playata.application.ui.elements.movie.UiSelectMovieButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelMovieOffersGeneric;
   
   public class PanelMovieOffers extends DefaultPanel
   {
       
      
      private var _btnHelp:UiButton;
      
      private var _btnRefreshOffers:UiPremiumButton;
      
      private var _offer1:UiMovieOffer;
      
      private var _offer2:UiMovieOffer;
      
      private var _offer3:UiMovieOffer;
      
      private var _timer:ITimer;
      
      private var _btnMovieVote:UiSelectMovieButton;
      
      private var _btnSkipCooldown:UiPremiumDiscountButton;
      
      public function PanelMovieOffers(param1:SymbolPanelMovieOffersGeneric)
      {
         super(param1);
         _offer1 = new UiMovieOffer(param1.offersContent.offer1,onStartMovieClicked);
         _offer2 = new UiMovieOffer(param1.offersContent.offer2,onStartMovieClicked);
         _offer3 = new UiMovieOffer(param1.offersContent.offer3,onStartMovieClicked);
         param1.offersContent.txtTitle.text = LocText.current.text("screen/movie_offers/title");
         param1.offersContent.txtInfo.text = LocText.current.text("screen/movie_offers/info");
         param1.offersContent.refresh.txtInfoAgain.text = LocText.current.text("screen/movie_offers/info_refresh_offers");
         param1.noOffersContent.txtTitleNoOffers.text = LocText.current.text("screen/movie_offers/title_no_offers");
         param1.noOffersContent.txtInfoNoOffers.text = LocText.current.text("screen/movie_offers/info_no_offers");
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnMovieVote = new UiSelectMovieButton(param1.offersContent.btnSelectMovie);
         _btnSkipCooldown = new UiPremiumDiscountButton(param1.noOffersContent.btnSkipCooldown,CConstant.movie_skip_cooldown_cost,"",LocText.current.text("screen/movie_offers/button_skip_cooldown"),"",LocText.current.text("screen/movie_offers/button_refresh_tooltip"),onSkipCooldown);
         _btnSkipCooldown.premium = true;
         _btnRefreshOffers = new UiPremiumButton(param1.offersContent.refresh.btnRefreshOffers,CConstant.movie_refresh_offers_cost,LocText.current.text("screen/movie_offers/button_refresh"),LocText.current.text("screen/movie_offers/button_refresh"),"","",onRefreshOffersClicked);
         _btnRefreshOffers.premium = true;
         param1.offersContent.refresh.addChild(_btnRefreshOffers);
         param1.noOffersContent.discountHint.level.text = "";
         param1.noOffersContent.discountHint.caption.width = param1.noOffersContent.discountHint.level.x - param1.noOffersContent.discountHint.caption.x + param1.noOffersContent.discountHint.level.width;
         param1.noOffersContent.discountHint.caption.hAlign = Align.CENTER;
         param1.noOffersContent.discountHint.caption.autoFontSize = true;
         _timer = Environment.createTimer("PanelMovieOffers::timer",1000,onTimerEvent);
         _anchorContainer.add(param1.offersContent,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.noOffersContent,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.offersContent,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.noOffersContent,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.background,0,-1,Align.RIGHT);
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            stopTimer();
            return;
         }
         var _loc1_:Character = User.current.character;
         if(_loc1_.hasMovie)
         {
            stopTimer();
            return;
         }
         if(_loc1_.hasMovieOffers)
         {
            stopTimer();
            return;
         }
         var _loc2_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         var _loc3_:int = User.current.character.remainingSecondsUntilNewMovieOffers;
         if(_loc3_ <= 0)
         {
            stopTimer();
            Environment.application.sendActionRequest("refreshMoviePool",{"use_premium":false},handleRequests);
         }
         else
         {
            _loc2_.noOffersContent.txtTimerNoOffers.text = LocText.current.text("screen/movie_offers/cooldown",TimeUtil.secondsToString(_loc3_));
         }
      }
      
      private function stopTimer() : void
      {
         if(!_timer)
         {
            return;
         }
         _timer.stop();
      }
      
      override public function refreshPanelLocalization() : void
      {
         super.refreshPanelLocalization();
         var _loc1_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         _loc1_.offersContent.txtTitle.text = LocText.current.text("screen/movie_offers/title");
         _loc1_.offersContent.txtInfo.text = LocText.current.text("screen/movie_offers/info");
         _loc1_.offersContent.refresh.txtInfoAgain.text = LocText.current.text("screen/movie_offers/info_refresh_offers");
         _loc1_.noOffersContent.txtTitleNoOffers.text = LocText.current.text("screen/movie_offers/title_no_offers");
         _loc1_.noOffersContent.txtInfoNoOffers.text = LocText.current.text("screen/movie_offers/info_no_offers");
         if(ViewManager.instance && User.current && User.current.character)
         {
            _loc1_.noOffersContent.txtRemainingMovies.text = LocText.current.text("screen/movie_offers/remaining_movies_today",User.current.character.remainingMoviesToday);
         }
         if(_btnRefreshOffers)
         {
            var _loc2_:* = LocText.current.text("screen/movie_offers/button_refresh");
            _btnRefreshOffers.nonPremiumCaption = _loc2_;
            _btnRefreshOffers.premiumCaption = _loc2_;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _btnMovieVote.dispose();
         _btnMovieVote = null;
         _btnRefreshOffers.dispose();
         _btnRefreshOffers = null;
         _btnSkipCooldown.dispose();
         _btnSkipCooldown = null;
         _offer1.dispose();
         _offer2.dispose();
         _offer3.dispose();
      }
      
      private function onRefreshOffersClicked(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("refreshMoviePool",{"use_premium":true},handleRequests);
      }
      
      private function onStartMovieClicked(param1:int) : void
      {
         Environment.application.sendActionRequest("startMovie",{"movie_id":param1},handleRequests);
      }
      
      private function onSkipCooldown(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("skipMovieCooldown",{},handleRequests);
      }
      
      override public function refresh() : void
      {
         var _loc1_:* = undefined;
         super.refresh();
         var _loc2_:Character = User.current.character;
         var _loc3_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         if(_loc2_.hasMovieOffers)
         {
            _loc1_ = _loc2_.movieOffers;
            _offer1.refresh(_loc1_[0]);
            _offer2.refresh(_loc1_[1]);
            _offer3.refresh(_loc1_[2]);
            _loc3_.offersContent.offer1.visible = true;
            _loc3_.offersContent.offer2.visible = true;
            _loc3_.offersContent.offer3.visible = true;
            _loc3_.offersContent.refresh.visible = true;
            _loc3_.offersContent.txtTitle.visible = true;
            _loc3_.offersContent.txtInfo.visible = true;
            _loc3_.noOffersContent.txtTitleNoOffers.visible = false;
            _loc3_.noOffersContent.txtInfoNoOffers.visible = false;
            _loc3_.noOffersContent.txtTimerNoOffers.visible = false;
            _loc3_.offersContent.bg.visible = true;
            _loc3_.noOffersContent.bgNoOffers.visible = false;
            _btnMovieVote.visible = false;
            _btnSkipCooldown.visible = false;
            _loc3_.noOffersContent.bgNoOffers.backgroundBig.visible = true;
            _loc3_.noOffersContent.bgNoOffers.backgroundSmall.visible = false;
            _loc3_.noOffersContent.discountHint.visible = false;
         }
         else
         {
            _loc3_.offersContent.offer1.visible = false;
            _loc3_.offersContent.offer2.visible = false;
            _loc3_.offersContent.offer3.visible = false;
            _loc3_.offersContent.refresh.visible = false;
            _loc3_.offersContent.txtTitle.visible = false;
            _loc3_.offersContent.txtInfo.visible = false;
            _loc3_.noOffersContent.txtTitleNoOffers.visible = true;
            _loc3_.noOffersContent.txtInfoNoOffers.visible = true;
            _loc3_.noOffersContent.txtTimerNoOffers.visible = true;
            _loc3_.offersContent.bg.visible = false;
            _loc3_.noOffersContent.bgNoOffers.visible = true;
            _btnMovieVote.visible = true;
            _btnMovieVote.refresh();
            onTimerEvent();
            _timer.start();
            if(_loc2_.remainingMoviesToday > 0)
            {
               _loc3_.noOffersContent.bgNoOffers.backgroundBig.visible = true;
               _loc3_.noOffersContent.bgNoOffers.backgroundSmall.visible = false;
               _btnSkipCooldown.visible = true;
               _loc3_.noOffersContent.txtRemainingMovies.visible = true;
               _loc3_.noOffersContent.txtRemainingMovies.text = LocText.current.text("screen/movie_offers/remaining_movies_today",_loc2_.remainingMoviesToday);
            }
            else
            {
               _loc3_.noOffersContent.bgNoOffers.backgroundBig.visible = false;
               _loc3_.noOffersContent.bgNoOffers.backgroundSmall.visible = true;
               _btnSkipCooldown.visible = false;
               _loc3_.noOffersContent.txtRemainingMovies.visible = false;
               _loc3_.noOffersContent.discountHint.visible = false;
            }
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         stopTimer();
      }
      
      override public function show(param1:* = null) : void
      {
         var _loc3_:int = 0;
         super.show(param1);
         loadBackgrounds();
         ViewManager.instance.setBackground(5);
         ViewManager.instance.fadeInPanel(_vo);
         if(!User.current.character.hasTutorialFlag("movie_new"))
         {
            showTutorialDialog();
         }
         var _loc2_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         if(!User.current.character.hasTutorialFlag("movie_cooldown_skiped") && User.current.character.remainingSecondsUntilNewMovieOffers > 0)
         {
            _loc3_ = 100 - CConstant.movie_skip_cooldown_cost_discount / CConstant.movie_skip_cooldown_cost * 100;
            _loc2_.noOffersContent.discountHint.caption.text = LocText.current.text("screen/movie_offers/discount_hint",_loc3_);
            _loc2_.noOffersContent.discountHint.caption.x = -_loc2_.noOffersContent.discountHint.caption.width * 0.5;
            _loc2_.noOffersContent.discountHint.bg.width = -_loc2_.noOffersContent.discountHint.caption.x * 2 + 18;
            _loc2_.noOffersContent.discountHint.visible = true;
         }
         else
         {
            _loc2_.noOffersContent.discountHint.visible = false;
         }
         _btnSkipCooldown.premiumAmount = CConstant.movie_skip_cooldown_cost;
         if(_loc2_.noOffersContent.discountHint.visible)
         {
            _loc2_.noOffersContent.discountHint.killTweens();
            Runtime.delayFunction(_btnSkipCooldown.discountTo,1,[CConstant.movie_skip_cooldown_cost_discount]);
            var _loc4_:int = 1;
            _loc2_.noOffersContent.discountHint.scaleY = _loc4_;
            _loc2_.noOffersContent.discountHint.scaleX = _loc4_;
            _loc2_.noOffersContent.discountHint.tweenFrom(1.5,{
               "delay":3,
               "scaleX":0,
               "scaleY":0,
               "ease":Bounce.easeOut
            });
            _loc2_.noOffersContent.discountHint.tweenTo(0.5,{
               "delay":8,
               "scaleX":0,
               "scaleY":0,
               "ease":Back.easeIn
            });
         }
         if(AppConfig.streamingEnabled)
         {
            if(User.current.character.fansTotal > 0 && !User.current.character.hasTutorialFlag("streaming_unlocked"))
            {
               ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/streaming_arrow_text"),"left_back","down",574 + LayoutUtil.deviceAdjustedWidthCorrection / 2,530 + LayoutUtil.deviceAdjustedHeightCorrection,1.5);
            }
         }
      }
      
      private function loadBackgrounds() : void
      {
         var _loc4_:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
         _loc4_.background.removeAllChildren();
         var _loc2_:Character = User.current.character;
         if(!_loc2_.hasGuild)
         {
            return;
         }
         var _loc1_:Guild = _loc2_.guild;
         var _loc5_:Vector.<String> = _loc1_.backgroundLayerMovieUrls;
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for each(var _loc3_ in _loc5_)
         {
            _loc4_.background.addChild(UriSprite.load(_loc3_,1120,630,true));
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/movie_new/title"),LocText.current.text("dialog/tutorial/movie_new/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("movie_new");
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "refreshMoviePool":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
               }
               else
               {
                  var tryAgain:Function = null;
                  if(response.error == "errGenerateNewMoviesNotYetAllowed")
                  {
                     if(!response.request.getBoolean("use_premium"))
                     {
                        tryAgain = function():void
                        {
                           Environment.application.sendActionRequest("refreshMoviePool",{"use_premium":false},handleRequests);
                        };
                        Runtime.delayFunction(tryAgain,1);
                     }
                  }
                  else if(response.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.movie_refresh_offers_cost);
                  }
                  else if(response.error == "errGenerateNewMoviesLimitReached")
                  {
                     if(!response.request.getBoolean("use_premium"))
                     {
                        tryAgain = function():void
                        {
                           Environment.application.sendActionRequest("refreshMoviePool",{"use_premium":false},handleRequests);
                        };
                        Runtime.delayFunction(tryAgain,1);
                     }
                  }
                  else
                  {
                     Environment.reportError(response.error,response.request);
                  }
               }
               break;
            case "startMovie":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  ViewManager.instance.showPanel("movie_progress");
               }
               else if(response.error != "errStartMovieActiveMovieFound")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "skipMovieCooldown":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  var vo:SymbolPanelMovieOffersGeneric = _vo as SymbolPanelMovieOffersGeneric;
                  var premiumAmount:int = CConstant.movie_skip_cooldown_cost;
                  if(vo.noOffersContent.discountHint.visible)
                  {
                     premiumAmount = CConstant.movie_skip_cooldown_cost_discount;
                  }
                  ViewManager.instance.showNotEnoughPremiumDialog(premiumAmount);
               }
               else if(response.error != "errSkipMovieCooldownActiveMovieFound")
               {
                  if(response.error != "errSkipMovieCooldownNoCooldown")
                  {
                     if(response.error == "errSkipMovieCooldownLimitReached")
                     {
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/skip_movie_cooldown_limit_reached/title"),LocText.current.text("dialog/skip_movie_cooldown_limit_reached/text"),LocText.current.text("general/button_ok")));
                     }
                     else
                     {
                        Environment.reportError(response.error,response.request);
                     }
                  }
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
   }
}
