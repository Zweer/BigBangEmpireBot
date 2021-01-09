package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.elements.dating.UiDatingGirl;
   import com.playata.application.ui.elements.dating.UiDatingStepReward;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDatingStepUnlockedGeneric;
   
   public class DialogDatingStepUnlocked extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _datingIndex:int = 0;
      
      private var _datingStepIndex:int = 1;
      
      private var _reward:UiDatingStepReward;
      
      private var _girl:UiDatingGirl;
      
      private var _onNewStepStarted:Function;
      
      private var _repeat:Boolean;
      
      public function DialogDatingStepUnlocked(param1:int, param2:int, param3:Function, param4:Boolean = false)
      {
         var _loc6_:int = 0;
         var _loc5_:SymbolDialogDatingStepUnlockedGeneric = new SymbolDialogDatingStepUnlockedGeneric();
         super(_loc5_);
         _isOpen = true;
         _onNewStepStarted = param3;
         _datingIndex = param1;
         _datingStepIndex = param2;
         _repeat = param4;
         _loc5_.txtDialogTitle.text = DatingUtil.getName(_datingIndex);
         _loc5_.txtInfo.text = DatingUtil.getIntroText(_datingIndex);
         _loc5_.txtInfo.autoFontSize = true;
         _reward = new UiDatingStepReward(_loc5_.reward,_datingIndex,_datingStepIndex,_repeat);
         _girl = new UiDatingGirl(_loc5_.girl);
         _girl.refresh(_datingIndex,_datingStepIndex);
         _loc6_ = 1;
         while(_loc6_ <= 5)
         {
            if(param2 > _loc6_)
            {
               _loc5_["hearth" + _loc6_].gotoAndStop(2);
            }
            else
            {
               _loc5_["hearth" + _loc6_].gotoAndStop(1);
            }
            _loc6_++;
         }
         if(param2 == 1)
         {
            _loc5_.balloon.visible = false;
         }
         else
         {
            _loc5_.balloon.caption.text = DatingUtil.getBalloonText(_datingIndex,_datingStepIndex);
            _loc5_.balloon.caption.y = _loc5_.balloon.caption.y + (_loc5_.balloon.caption.height - _loc5_.balloon.caption.textHeight >> 1);
            _loc5_.balloon.alpha = 0;
            _loc5_.balloon.tweenTo(0.5,{
               "delay":2.5,
               "alpha":1
            });
         }
         _btnClose = new UiTextButton(_loc5_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("event_dungeon_unlocked.mp3");
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _reward.dispose();
         _reward = null;
         _girl.dispose();
         _girl = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(_repeat && _datingStepIndex == 1)
         {
            close();
         }
         else
         {
            Environment.application.sendActionRequest("startNewDatingStep",{
               "dating_index":_datingIndex,
               "step_index":_datingStepIndex
            },handleRequests);
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("startNewDatingStep" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _onNewStepStarted();
         }
         else if(param1.error == "errStartDatingStepAnotherActive")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_another_step_active/title"),LocText.current.text("dialog/start_new_dating_step_another_step_active/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errStartDatingStepLastStepNotFinished")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_another_step_active/title"),LocText.current.text("dialog/start_new_story_dungeon_active_battle_found/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errStartDatingStepInvalidLevel")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_invalid_level/title"),LocText.current.text("dialog/start_new_dating_step_invalid_level/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error != "errStartDatingStepAlreadyStarted")
         {
            if(param1.error != "errStartDatingStepAlreadyCompleted")
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
         close();
      }
   }
}
