package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogWorkCompleteGeneric;
   
   public class DialogWorkCompleteNew extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _callback:Function = null;
      
      private var _gameCurrencyReward:int;
      
      public function DialogWorkCompleteNew(param1:String, param2:int, param3:int, param4:Function)
      {
         _gameCurrencyReward = param2;
         _callback = param4;
         var _loc5_:SymbolDialogWorkCompleteGeneric = new SymbolDialogWorkCompleteGeneric();
         super(_loc5_);
         _queued = false;
         _loc5_.txtDialogTitle.text = LocText.current.text("dialog/work_complete/title");
         _loc5_.txtOutcome.text = LocText.current.text("work/" + param1 + "/complete");
         _loc5_.txtRewardsCaption.text = LocText.current.text("dialog/work_complete/text",TimeUtil.secondsToString(param3));
         _loc5_.txtCoins.text = GameUtil.getGameCurrencyString(param2);
         _btnClose = new UiTextButton(_loc5_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("event_guild_donated.mp3");
         EffectsLayer.instance.show(110,{},_vo.parent,1);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         _callback();
         ViewManager.instance.baseUserPanel.refreshGameCurrencyPanel(-_gameCurrencyReward);
         EffectsLayer.instance.show(0,{"emitter":SymbolDialogWorkCompleteGeneric(_vo).iconCoins});
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
