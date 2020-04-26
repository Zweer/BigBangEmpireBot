package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Quart;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.fan_foto.UiFansThermometer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogConventionShowCompleteGeneric;
   
   public class DialogConventionShowComplete extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _fansBar:UiFansThermometer = null;
      
      private var _rewardGameCurrency:int;
      
      private var _tooltipXp:UiTextTooltip;
      
      private var _tooltipRewards:UiTextTooltip;
      
      public function DialogConventionShowComplete(param1:ConventionShow)
      {
         _isOpen = true;
         var _loc2_:SymbolDialogConventionShowCompleteGeneric = new SymbolDialogConventionShowCompleteGeneric();
         super(_loc2_);
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/convention_show_completed/title");
         _loc2_.txtFans.text = LocText.current.text("dialog/convention_show_completed/fans_caption");
         _loc2_.txtInfo.text = param1.winText();
         _loc2_.txtFansTotal.text = LocText.current.text("dialog/convention_show_completed/fans_brought",LocText.current.formatHugeNumber(param1.fans));
         _loc2_.txtShowCountTotal.text = LocText.current.text("dialog/convention_show_completed/show_count_total",LocText.current.text("convention/show",param1.convention.showCount));
         _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/convention_show_briefing/rewards_caption");
         _loc2_.txtCoins.text = GameUtil.getGameCurrencyString(param1.rewardValue);
         _loc2_.txtXp.text = GameUtil.getXpString(param1.convention.ownXpRewardTotal);
         _tooltipXp = new UiTextTooltip(_loc2_.txtXp,LocText.current.text("dialog/convention_show_completed/reward_xp_tooltip",GameUtil.getXpString(param1.convention.ownXpRewardTotal)));
         _tooltipRewards = new UiTextTooltip(_loc2_.txtRewardsCaption,LocText.current.text("convention/reward_info_tooltip"));
         if(param1.convention.ownRanking == 0)
         {
            _loc2_.txtShowCountOwn.text = LocText.current.text("dialog/convention_show_completed/show_count_own_none",param1.convention.ownShowCount);
         }
         else
         {
            _loc2_.txtShowCountOwn.text = LocText.current.text("dialog/convention_show_completed/show_count_own",param1.convention.ownShowCount,LocText.current.formatHugeNumber(param1.convention.ownRanking));
         }
         _fansBar = new UiFansThermometer(_loc2_.progress,param1.convention.fansTotal,param1.convention.fansCurrent,false);
         _rewardGameCurrency = param1.rewardValue;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc2_.conventionBannerLeft.removeAllChildren();
         var _loc4_:IDisplayObject = UriSprite.load(param1.convention.bannerLeftUrl,130,290,true);
         _loc4_.x = -130;
         _loc2_.conventionBannerLeft.addChild(_loc4_);
         _loc2_.conventionBannerRight.removeAllChildren();
         var _loc3_:IDisplayObject = UriSprite.load(param1.convention.bannerRightUrl,130,290,true);
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
         _fansBar.dispose();
         _fansBar = null;
         _tooltipXp.dispose();
         _tooltipXp = null;
         _tooltipRewards.dispose();
         _tooltipRewards = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         EffectsLayer.instance.show(105,{"mode":"show"},_vo.parent,1);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         var _loc2_:IDisplayObject = SymbolDialogConventionShowCompleteGeneric(_vo).iconGameCurrency;
         if(_loc2_.visible)
         {
            EffectsLayer.instance.show(0,{"emitter":_loc2_});
         }
         ViewManager.instance.baseUserPanel.refreshGameCurrencyPanel(-_rewardGameCurrency);
         if(User.current.character.activeQuest)
         {
            Environment.application.sendActionRequest("setCharacterStage",{
               "stage":User.current.character.activeQuest.stage,
               "on_map":false
            },handleRequests);
            return;
         }
         ViewManager.instance.showPanel("quests");
         close();
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
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterStage" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            ViewManager.instance.showPanel("quests");
            close();
         }
         else if(param1.error != "errSetCharacterStageInvalidQuestStage")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
