package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.hud.UiPremiumCurrencyPanel;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogStageUnlockedGeneric;
   
   public class DialogStageUnlocked extends UiDialog
   {
      
      private static var _isShowing:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _stage:int = 0;
      
      private var _infoOnly:Boolean = false;
      
      private var _callback:Function;
      
      public function DialogStageUnlocked(param1:int, param2:Boolean = false, param3:Function = null)
      {
         _isShowing = true;
         _callback = param3;
         var _loc4_:SymbolDialogStageUnlockedGeneric = new SymbolDialogStageUnlockedGeneric();
         super(_loc4_);
         _queued = true;
         _stage = param1;
         _infoOnly = param2;
         _loc4_.txtCongratulations.text = LocText.current.text("dialog/stage_unlocked/title");
         _loc4_.txtStageName.text = LocText.current.text("dialog/stage_unlocked/stage" + param1 + "_title");
         _loc4_.txtStageIntro.text = LocText.current.text("dialog/stage_unlocked/stage" + param1 + "_description");
         if(param1 > 1 && param1 <= CConstant.quest_max_stage)
         {
            _loc4_.txtReward.text = LocText.current.text("dialog/stage_unlocked/reward_text",GameUtil.getPremiumCurrencyString(CConstant.stage_level_up_premium_amount));
         }
         else
         {
            _loc4_.txtCongratulations.visible = false;
            _loc4_.iconReward.visible = false;
            _loc4_.txtReward.visible = false;
         }
         _loc4_.unlockedIcon.visible = _loc4_.unlockedIcon.visible && !param2;
         _loc4_.txtCongratulations.visible = _loc4_.txtCongratulations.visible && !param2;
         _loc4_.iconReward.visible = _loc4_.iconReward.visible && !param2;
         _loc4_.txtReward.visible = _loc4_.txtReward.visible && !param2;
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         if(param2)
         {
            _loc4_.txtStageIntro.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _btnClose.y = _loc4_.txtStageIntro.y + _loc4_.txtStageIntro.textHeight + 40;
            _loc4_.dialogBackground.y = _loc4_.txtStageName.y - 36;
            _loc4_.dialogBackground.height = -_loc4_.dialogBackground.y + _btnClose.y + _btnClose.height + 20;
         }
      }
      
      public static function get isShowing() : Boolean
      {
         return _isShowing;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         if(!_infoOnly && _stage > 1)
         {
            Environment.audio.playFX("event_stage_unlocked.mp3");
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:SymbolDialogStageUnlockedGeneric = _vo as SymbolDialogStageUnlockedGeneric;
         if(_loc3_.iconReward.visible)
         {
            _loc2_ = CConstant.stage_level_up_premium_amount;
            UiPremiumCurrencyPanel.instance.offset = UiPremiumCurrencyPanel.instance.offset - _loc2_;
            UiPremiumCurrencyPanel.instance.refresh();
            EffectsLayer.instance.show(2,{
               "emitter":_loc3_.iconReward,
               "amount":_loc2_
            });
         }
         close();
         if(platform.isFacebook && _stage > 1)
         {
            platform.publishFeed(ServerInfo.assetURL("facebook/zone-" + _stage.toString(),"png"),LocText.current.text("dialog/stage_unlocked/stage" + _stage + "_title"),LocText.current.text("dialog/stage_unlocked/stage" + _stage + "_description"));
         }
         if(_callback != null)
         {
            _callback();
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function close(param1:Function = null) : void
      {
         _isShowing = false;
         super.close(param1);
      }
   }
}
