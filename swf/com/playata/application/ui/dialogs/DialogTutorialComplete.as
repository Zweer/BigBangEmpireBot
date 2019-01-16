package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.hud.UiPremiumCurrencyPanel;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogTutorialCompleteGeneric;
   
   public class DialogTutorialComplete extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _callback:Function = null;
      
      private var _tooltipDatingIcon:UiTextTooltip;
      
      private var _tooltipDatingText:UiTextTooltip;
      
      public function DialogTutorialComplete(param1:Function)
      {
         Environment.audio.playFX("event_stage_unlocked.mp3");
         _callback = param1;
         var _loc2_:SymbolDialogTutorialCompleteGeneric = new SymbolDialogTutorialCompleteGeneric();
         super(_loc2_);
         _loc2_.txtDialogTitle.text = LocText.current.text("tutorial/finished/title");
         _loc2_.txtMessage.text = LocText.current.text("tutorial/finished/text");
         _loc2_.txtRewardPremiumCurrency.text = LocText.current.text("tutorial/finished/text_premium_currency_info",GameUtil.getPremiumCurrencyString(CConstant.tutorial_finished_premium_currency));
         _loc2_.txtRewardBooster.text = LocText.current.text("tutorial/finished/text_booster_info");
         if(DatingUtil.isAvailable)
         {
            _loc2_.txtRewardDating.text = LocText.current.text("dating/dating_step/reward_picture",LocText.current.text("tutorial/finished/text_dating_picture_info"));
            _loc2_.txtRewardDating.autoFontSize = true;
            _loc2_.dialogBackground.height = _loc2_.dialogBackground.height + 65;
            _loc2_.btnClose.y = _loc2_.btnClose.y + 45;
            _tooltipDatingIcon = new UiTextTooltip(_loc2_.iconRewardDating,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
            _tooltipDatingText = new UiTextTooltip(_loc2_.txtRewardDating,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         }
         else
         {
            _loc2_.txtRewardDating.visible = false;
            _loc2_.iconRewardDating.visible = false;
         }
         Application.tracking.onTutorialComplete();
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc2_.lady.alpha = 0;
         _loc2_.lady.y = _loc2_.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc2_.lady.gotoAndStop("usk18");
         }
         else
         {
            _loc2_.lady.gotoAndStop("normal");
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         if(_tooltipDatingIcon)
         {
            _tooltipDatingIcon.dispose();
            _tooltipDatingIcon = null;
         }
         if(_tooltipDatingText)
         {
            _tooltipDatingText.dispose();
            _tooltipDatingText = null;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         var _loc3_:SymbolDialogTutorialCompleteGeneric = _vo as SymbolDialogTutorialCompleteGeneric;
         var _loc2_:int = CConstant.tutorial_finished_premium_currency;
         UiPremiumCurrencyPanel.instance.offset = UiPremiumCurrencyPanel.instance.offset - _loc2_;
         UiPremiumCurrencyPanel.instance.refresh();
         try
         {
            EffectsLayer.instance.show(2,{
               "emitter":_loc3_.iconRewardPremiumCurrency,
               "amount":_loc2_
            });
            EffectsLayer.instance.show(5,{"emitter":_loc3_.iconRewardBooster});
         }
         catch(e:Error)
         {
         }
         (_vo as SymbolDialogTutorialCompleteGeneric).lady.visible = false;
         if(DatingUtil.isAvailable)
         {
            Environment.panelManager.showDialog(new DialogDatingPicture(0,1));
         }
         close(_callback);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
      
      override public function show() : void
      {
         (_vo as SymbolDialogTutorialCompleteGeneric).lady.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
         super.show();
      }
   }
}
