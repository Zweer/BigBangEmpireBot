package com.playata.application.ui.dialogs
{
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.event.UiEventQuestItemReward;
   import com.playata.application.ui.elements.event.UiEventQuestReward;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogEventQuestIntroGeneric;
   
   public class DialogEventQuestIntro extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
      
      private static var _shownEventIdentifiers:Vector.<String> = new Vector.<String>();
       
      
      private var _eventQuest:EventQuest = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _reward1:UiEventQuestReward = null;
      
      private var _reward2:UiEventQuestReward = null;
      
      private var _reward3:UiEventQuestReward = null;
      
      private var _itemReward1:UiEventQuestItemReward = null;
      
      private var _itemReward2:UiEventQuestItemReward = null;
      
      private var _itemReward3:UiEventQuestItemReward = null;
      
      public function DialogEventQuestIntro(param1:EventQuest)
      {
         _eventQuest = param1;
         _isOpen = true;
         var _loc2_:SymbolDialogEventQuestIntroGeneric = new SymbolDialogEventQuestIntroGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = _eventQuest.name;
         _loc2_.txtDialogTitle.autoFontSize = true;
         _loc2_.txtInfo.text = _eventQuest.introText;
         _loc2_.txtCallerName.text = _eventQuest.callerName;
         _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_quest_briefing/rewards_caption");
         _loc2_.txtRewardInfo.text = LocText.current.text("dialog/event_quest_intro/rewards_info");
         _loc2_.txtInfo.autoFontSize = true;
         _loc2_.logo.setUriSprite(_eventQuest.logoImageUrl,145,145,true,1,null,true);
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _reward1 = new UiEventQuestReward(_loc2_.reward1);
         _reward2 = new UiEventQuestReward(_loc2_.reward2);
         _reward3 = new UiEventQuestReward(_loc2_.reward3);
         _reward1.refresh(_eventQuest.reward1Type,_eventQuest.reward1Factor,_eventQuest.reward1Flag);
         _reward2.refresh(_eventQuest.reward2Type,_eventQuest.reward2Factor,_eventQuest.reward2Flag);
         if(_eventQuest.rewardTitle != null && _eventQuest.rewardTitle != "" && !Titles.instance.isTitleAvailable(User.current.character,_eventQuest.rewardTitle))
         {
            _reward3.refresh(6,0,_eventQuest.rewardTitle);
         }
         else
         {
            _loc2_.reward3.visible = false;
         }
         _itemReward1 = new UiEventQuestItemReward(_loc2_.itemReward1);
         _itemReward2 = new UiEventQuestItemReward(_loc2_.itemReward2);
         _itemReward3 = new UiEventQuestItemReward(_loc2_.itemReward3);
         _itemReward1.item = _eventQuest.itemReward1;
         _itemReward2.item = _eventQuest.itemReward2;
         _itemReward3.item = _eventQuest.itemReward3;
         Environment.audio.playFX("event_duel_time_complete.mp3");
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public static function reset() : void
      {
         _shownEventIdentifiers = new Vector.<String>();
      }
      
      public static function hasBeenShown(param1:EventQuest) : Boolean
      {
         if(!param1.isUnassigned)
         {
            return true;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _shownEventIdentifiers;
         for each(var _loc2_ in _shownEventIdentifiers)
         {
            if(_loc2_ == param1.identifier)
            {
               return true;
            }
         }
         _shownEventIdentifiers.push(param1.identifier);
         return false;
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _reward1.dispose();
         _reward1 = null;
         _reward2.dispose();
         _reward2 = null;
         _reward3.dispose();
         _reward3 = null;
         _itemReward1.dispose();
         _itemReward1 = null;
         _itemReward2.dispose();
         _itemReward2 = null;
         _itemReward3.dispose();
         _itemReward3 = null;
         super.dispose();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("assignEventQuest",{"event_quest_identifier":_eventQuest.identifier},handleRequests);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("assignEventQuest" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            Environment.panelManager.showDialog(new DialogEventQuestProgress(User.current.character.eventQuest));
         }
         else if(param1.error == "errAssignEventQuestAlreadyAssigned")
         {
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
