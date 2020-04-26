package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogClaimMovieStarGeneric;
   
   public class DialogClaimMovieStar extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _callback:Function = null;
      
      private var _reward:Reward;
      
      private var _claimedStar:int;
      
      public function DialogClaimMovieStar(param1:Movie, param2:Function)
      {
         _isOpen = true;
         _callback = param2;
         var _loc3_:SymbolDialogClaimMovieStarGeneric = new SymbolDialogClaimMovieStarGeneric();
         super(_loc3_);
         _queued = false;
         _reward = param1.claimableReward;
         _claimedStar = param1.claimableStar;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/claim_movie_star/title");
         switch(int(_claimedStar) - 1)
         {
            case 0:
               _loc3_.txtInfo.text = LocText.current.text("dialog/claim_movie_star/info1");
               break;
            case 1:
               _loc3_.txtInfo.text = LocText.current.text("dialog/claim_movie_star/info2");
               break;
            case 2:
               _loc3_.txtInfo.text = LocText.current.text("dialog/claim_movie_star/info3");
         }
         _loc3_.txtInfo.autoFontSize = true;
         _loc3_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/rewards");
         _loc3_.rating.gotoAndStop(_claimedStar + 1);
         _loc3_.itemReward.visible = _reward.itemId != 0;
         if(_reward.itemId != 0)
         {
            _itemReward = new UiItemSlot(_loc3_.itemReward,0);
            _itemReward.item = User.current.character.getItemById(_reward.itemId);
         }
         _loc3_.iconCoins.visible = _reward.gameCurrency > 0;
         _loc3_.txtCoins.visible = _reward.gameCurrency > 0;
         _loc3_.txtCoins.text = _reward.gameCurrencyString;
         _loc3_.iconXp.visible = _reward.xp > 0;
         _loc3_.txtXp.visible = _reward.xp > 0;
         _loc3_.txtXp.text = _reward.xpString;
         _loc3_.iconPremiumCurrency.visible = _reward.premiumCurrency > 0;
         _loc3_.txtPremiumCurrency.visible = _reward.premiumCurrency > 0;
         _loc3_.txtPremiumCurrency.text = _reward.premiumCurrencyString;
         _loc3_.iconStatPoints.visible = _reward.statPoints > 0;
         _loc3_.txtStatPoints.visible = _reward.statPoints > 0;
         _loc3_.txtStatPoints.text = _reward.statPointsString;
         _btnClose = new UiTextButton(_loc3_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         switch(int(_claimedStar) - 1)
         {
            case 0:
               Environment.audio.playFX("movie_star_1.mp3");
               break;
            case 1:
               Environment.audio.playFX("movie_star_2.mp3");
               break;
            case 2:
               Environment.audio.playFX("movie_star_3.mp3");
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         EffectsLayer.instance.show(112,{},_vo.parent,1);
      }
      
      override public function dispose() : void
      {
         _isOpen = false;
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
         Environment.application.sendActionRequest("claimMovieStar",{"discard_item":false},handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimMovieStar",{"discard_item":true},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimMovieStar" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            showRewardEffect(!param1.request.rawData.discard_item);
            close(_callback);
            if(User.current.character.movie.isOpen)
            {
               switch(int(_claimedStar) - 1)
               {
                  case 0:
                     Environment.panelManager.showDialog(new DialogMovieTitle());
                     break;
                  case 1:
                     Environment.panelManager.showDialog(new DialogMovieCover());
               }
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errClaimMovieStarAlreadyClaimed")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogClaimMovieStarGeneric = _vo as SymbolDialogClaimMovieStarGeneric;
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
         if(param1 && _itemReward != null)
         {
            _loc2_ = User.current.character.getItemById(_reward.itemId);
            EffectsLayer.instance.show(3,{
               "emitter":_loc3_.itemReward,
               "imageUrl":_loc2_.iconImageUrl
            });
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
