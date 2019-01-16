package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Quart;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.convention.UiConventionReward;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.display.MovieClip;
   import visuals.ui.dialogs.SymbolDialogConventionCompleteGeneric;
   
   public class DialogConventionComplete extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _reward1:UiConventionReward;
      
      private var _convention:Convention = null;
      
      public function DialogConventionComplete(param1:Convention)
      {
         _convention = param1;
         _isOpen = true;
         var _loc2_:SymbolDialogConventionCompleteGeneric = new SymbolDialogConventionCompleteGeneric();
         super(_loc2_);
         _queued = false;
         if(_convention.isSuccessful)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention_complete/title_successful");
            _loc2_.txtFailed.visible = false;
            _loc2_.txtSuccessful.visible = true;
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention_complete/title_failed");
            _loc2_.txtFailed.visible = true;
            _loc2_.txtSuccessful.visible = false;
         }
         _loc2_.txtNpcName.text = _convention.name;
         _loc2_.txtFailed.text = LocText.current.text("dialog/convention_complete/failed");
         _loc2_.txtSuccessful.text = LocText.current.text("dialog/convention_complete/successful");
         _loc2_.conventionLogo.setUriSprite(_convention.logoImageUrl,200,250,false,1,null,true);
         _loc2_.txtStatisticCaption.text = LocText.current.text("dialog/convention_complete/statistic_caption");
         _loc2_.txtFansTotal.text = LocText.current.text("dialog/convention_complete/fans_total",LocText.current.formatHugeNumber(_convention.fansCurrent));
         _loc2_.txtShowCountTotal.text = LocText.current.text("dialog/convention_complete/show_count_total",LocText.current.text("convention/show",_convention.showCount));
         if(_convention.ownRanking == 0)
         {
            _loc2_.txtShowCountOwn.text = LocText.current.text("dialog/convention_complete/show_count_own_none",_convention.ownShowCount);
         }
         else
         {
            _loc2_.txtShowCountOwn.text = LocText.current.text("dialog/convention_complete/show_count_own",_convention.ownShowCount,LocText.current.formatHugeNumber(_convention.ownRanking));
         }
         _loc2_.txtTopCaption.text = LocText.current.text("dialog/convention_complete/top_caption");
         _loc2_.txtTopShows.text = LocText.current.text("dialog/convention_complete/top_star",StringUtil.cutLength(_convention.topStarName,12),LocText.current.text("convention/show",_convention.topStarShowCount));
         _loc2_.txtWinningShow.text = LocText.current.text("dialog/convention_complete/winning_star",StringUtil.cutLength(_convention.winningStarName,12));
         _loc2_.iconWinningShow.visible = !StringUtil.isEmpty(_convention.winningStarName);
         _loc2_.txtWinningShow.visible = _loc2_.iconWinningShow.visible;
         if(_convention.isSuccessful || _convention.ownShowCount == 0)
         {
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/convention_complete/rewards_caption");
         }
         else
         {
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/convention_complete/rewards_failed_caption");
         }
         _loc2_.txtNoRewardText.text = LocText.current.text("dialog/convention_complete/no_rewards");
         if(_convention.ownShowCount == 0 || _convention.reward == null)
         {
            _loc2_.itemReward.visible = false;
            _loc2_.iconXp.visible = false;
            _loc2_.txtXp.visible = false;
            _loc2_.txtNoRewardText.visible = true;
            _loc2_.reward1.visible = false;
         }
         else
         {
            _loc2_.txtNoRewardText.visible = false;
            _loc2_.itemReward.visible = _convention.reward.itemId != 0;
            if(_convention.reward.itemId != 0)
            {
               _itemReward = new UiItemSlot(_loc2_.itemReward,0);
               _itemReward.item = User.current.character.getItemById(_convention.reward.itemId);
            }
            _loc2_.iconXp.visible = _convention.reward.xp > 0;
            _loc2_.txtXp.visible = _convention.reward.xp > 0;
            _loc2_.txtXp.text = _convention.reward.xpString;
            _reward1 = new UiConventionReward(_loc2_.reward1);
            _reward1.refresh(1,_convention.reward.questEnergy);
            _loc2_.reward1.visible = _convention.reward.questEnergy > 0;
         }
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc2_.conventionBannerLeft.removeAllChildren();
         var _loc4_:IDisplayObject = UriSprite.load(_convention.bannerLeftUrl,130,290,true);
         _loc4_.x = -130;
         _loc2_.conventionBannerLeft.addChild(_loc4_);
         _loc2_.conventionBannerRight.removeAllChildren();
         var _loc3_:IDisplayObject = UriSprite.load(_convention.bannerRightUrl,130,290,true);
         _loc2_.conventionBannerRight.addChild(_loc3_);
         _loc2_.conventionBannerLeft.tweenFrom(0.5,{
            "delay":0.5,
            "x":130.toString(),
            "ease":Quart.easeOut
         });
         _loc2_.conventionBannerLeft.tweenFrom(1,{
            "delay":0.5,
            "rotation":"-20",
            "ease":Back.easeOut
         });
         _loc2_.conventionBannerRight.tweenFrom(0.5,{
            "delay":0.5,
            "x":(-130).toString(),
            "ease":Quart.easeOut
         });
         _loc2_.conventionBannerRight.tweenFrom(1,{
            "delay":0.5,
            "rotation":"20",
            "ease":Back.easeOut
         });
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         if(_reward1 != null)
         {
            _reward1.dispose();
            _reward1 = null;
         }
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         if(_convention.isSuccessful)
         {
            Environment.audio.playFX("event_convention_show_complete.mp3");
            EffectsLayer.instance.show(105,{"mode":"convention"},_vo.parent,1);
         }
         else
         {
            Environment.audio.playFX("event_convention_failed.mp3");
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimConventionRewards",{
            "convention_id":_convention.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         DialogConventionInfo.removeFinishedConventionId(_convention.id);
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimConventionRewards",{
            "convention_id":_convention.id,
            "discard_item":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimConventionRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            close();
            if(ViewManager.instance.activePanel == "quests")
            {
               (ViewManager.instance.activePanelInstance as PanelQuests).checkForConventionInfo();
            }
            else if(ViewManager.instance.activePanel == "citymap" || ViewManager.instance.activePanel == "dungeon")
            {
               PanelCitymap.checkForConventionInfo();
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errApplyInvalidStatus")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            _loc3_ = SymbolDialogConventionCompleteGeneric(_vo).iconXp;
            if(_loc3_.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_loc3_});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_convention.reward.itemId);
               EffectsLayer.instance.show(3,{
                  "emitter":MovieClip(_vo).itemReward,
                  "imageUrl":_loc2_.iconImageUrl
               });
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
