package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.event.UiEventQuestReward;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogEventQuestOutroGeneric;
   
   public class DialogEventQuestOutro extends UiDialog
   {
       
      
      private var _eventQuest:EventQuest = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _reward1:UiEventQuestReward = null;
      
      private var _reward2:UiEventQuestReward = null;
      
      private var _reward3:UiEventQuestReward = null;
      
      private var _itemReward1:UiItemSlot = null;
      
      private var _itemReward2:UiItemSlot = null;
      
      private var _itemReward3:UiItemSlot = null;
      
      public function DialogEventQuestOutro(param1:EventQuest)
      {
         _eventQuest = param1;
         var _loc2_:SymbolDialogEventQuestOutroGeneric = new SymbolDialogEventQuestOutroGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = _eventQuest.name;
         _loc2_.txtDialogTitle.autoFontSize = true;
         _loc2_.txtCallerName.text = _eventQuest.callerName;
         _reward1 = new UiEventQuestReward(_loc2_.reward1);
         _reward2 = new UiEventQuestReward(_loc2_.reward2);
         _reward3 = new UiEventQuestReward(_loc2_.reward3);
         _itemReward1 = new UiItemSlot(_loc2_.itemReward1,0);
         _itemReward2 = new UiItemSlot(_loc2_.itemReward2,0);
         _itemReward3 = new UiItemSlot(_loc2_.itemReward3,0);
         if(_eventQuest.isCompleted(true))
         {
            _loc2_.txtInfo.text = _eventQuest.outroWonText;
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_quest_briefing/rewards_caption");
            _loc2_.txtRewardInfo.text = LocText.current.text("dialog/event_quest_outro/rewards_info");
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
            _itemReward1.item = _eventQuest.itemReward1Item;
            _itemReward2.item = _eventQuest.itemReward2Item;
            _itemReward3.item = _eventQuest.itemReward3Item;
            _itemReward1.onClick.add(handleItemRewardClick);
            _itemReward2.onClick.add(handleItemRewardClick);
            _itemReward3.onClick.add(handleItemRewardClick);
         }
         else
         {
            _loc2_.txtInfo.text = _eventQuest.outroLostText;
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/no_rewards");
            _loc2_.txtRewardInfo.text = LocText.current.text("dialog/event_quest_outro/rewards_lost_info");
            _reward1.setValue(4,_eventQuest.reward.xpString);
            _reward2.setValue(1,_eventQuest.reward.gameCurrencyString);
            _loc2_.reward3.visible = false;
            _itemReward1.item = _eventQuest.itemReward1Item;
            _itemReward2.container.visible = false;
            _itemReward3.container.visible = false;
            _loc2_.reward1.x = _loc2_.reward1.x + 90;
            _loc2_.reward2.x = _loc2_.reward2.x + 90;
            _loc2_.itemReward1.x = _loc2_.itemReward1.x + 90;
         }
         _loc2_.txtInfo.autoFontSize = true;
         _loc2_.logo.setUriSprite(_eventQuest.logoImageUrl,145,145,true,1,null,true);
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         Environment.audio.playFX("event_duel_time_complete.mp3");
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
      
      private function handleItemRewardClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         _itemReward1.check = (param1.target as IInteractiveDisplayObject).name == "itemReward1";
         _itemReward2.check = (param1.target as IInteractiveDisplayObject).name == "itemReward2";
         _itemReward3.check = (param1.target as IInteractiveDisplayObject).name == "itemReward3";
      }
      
      private function get selectedRewardItemId() : int
      {
         if(!_eventQuest.isCompleted(true))
         {
            return _itemReward1.item.id;
         }
         if(_itemReward1.isChecked)
         {
            return _itemReward1.item.id;
         }
         if(_itemReward2.isChecked)
         {
            return _itemReward2.item.id;
         }
         if(_itemReward3.isChecked)
         {
            return _itemReward3.item.id;
         }
         return 0;
      }
      
      private function get selectedRewardItem() : Item
      {
         if(!_eventQuest.isCompleted(true))
         {
            return _itemReward1.item;
         }
         if(_itemReward1.isChecked)
         {
            return _itemReward1.item;
         }
         if(_itemReward2.isChecked)
         {
            return _itemReward2.item;
         }
         if(_itemReward3.isChecked)
         {
            return _itemReward3.item;
         }
         return null;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_eventQuest.isAborted)
         {
            if(selectedRewardItemId == 0)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/event_quest_outro/no_selection/title"),LocText.current.text("error/event_quest_outro/no_selection/text"),LocText.current.text("general/button_ok")));
               return;
            }
         }
         Environment.application.sendActionRequest("claimEventQuestRewards",{
            "reward_item_id":selectedRewardItemId,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimEventQuestRewards",{
            "reward_item_id":selectedRewardItemId,
            "discard_item":true
         },handleRequests);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimEventQuestRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            if(_btnClose == null)
            {
               return;
            }
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(selectedRewardItem.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
