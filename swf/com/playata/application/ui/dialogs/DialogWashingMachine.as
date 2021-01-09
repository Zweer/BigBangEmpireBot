package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.item.UiItemTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogWashingMachineGeneric;
   import visuals.ui.elements.washing_machine.SymbolWashingMachineContainerGeneric;
   
   public class DialogWashingMachine extends UiDialog
   {
       
      
      private var _item:Item = null;
      
      private var _itemSlot:UiItemSlot = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnChange:UiPremiumButton = null;
      
      public function DialogWashingMachine(param1:Item)
      {
         var _loc3_:SymbolDialogWashingMachineGeneric = new SymbolDialogWashingMachineGeneric();
         super(_loc3_);
         _queued = false;
         _item = param1;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/washing_machine/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/washing_machine/info");
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnChange = new UiPremiumButton(_loc3_.btnChange,CConstant.washing_machine_premium_currency_amount,LocText.current.text("dialog/washing_machine/button_spin"),LocText.current.text("dialog/washing_machine/button_spin"),"","",onClickChange);
         _btnChange.premium = User.current.character.washItemUsed;
         _btnChange.textTooltip.requestTextFunction = getWashItemTooltip;
         _itemSlot = new UiItemSlot(_loc3_.itemSlot,0);
         _itemSlot.locked = true;
         _itemSlot.item = param1;
         _loc3_.rotateItem.removeAllChildren();
         var _loc2_:IUriSprite = UriSprite.load(param1.iconImageUrl,60,60,true,-1);
         _loc2_.x = _loc2_.x - 30;
         _loc2_.y = _loc2_.y - 30;
         _loc3_.rotateItem.addChild(_loc2_);
         _loc3_.rotateItem.visible = false;
         if(Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.lockTooltipPosition(Environment.layout.appWidth / 2 + 150,250);
            TooltipLayer.instance.lockTooltip(_itemSlot.itemGraphic.tooltip);
         }
         Environment.audio.cacheSound("washing_machine.mp3");
      }
      
      override public function dispose() : void
      {
         if(Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.unlockTooltipPosition();
            TooltipLayer.instance.unlockTooltip();
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnChange.dispose();
         _btnChange = null;
         _itemSlot.dispose();
         _itemSlot = null;
         super.dispose();
      }
      
      private function getWashItemTooltip() : String
      {
         if(User.current.character.washItemUsed)
         {
            return LocText.current.text("dialog/washing_machine/button_spin_wait_tooltip",GameUtil.getPremiumCurrencyString(CConstant.washing_machine_premium_currency_amount),TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
         }
         return LocText.current.text("dialog/washing_machine/button_spin_default_tooltip");
      }
      
      private function onClickChange(param1:InteractionEvent) : void
      {
         _btnChange.buttonEnabled = false;
         Environment.application.sendActionRequest("washInventoryItem",{
            "item_id":_item.id,
            "use_premium":_btnChange.premium
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         if("washInventoryItem" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
         if(response.error == "")
         {
            if(_btnChange.premium)
            {
               Environment.audio.playFX("premium_currency_spend.mp3");
            }
            Environment.audio.playFX("washing_machine.mp3");
            var rotateItem:IDisplayObject = (_vo as SymbolDialogWashingMachineGeneric).rotateItem;
            var washingMachine:SymbolWashingMachineContainerGeneric = (_vo as SymbolDialogWashingMachineGeneric).washingMachine;
            rotateItem.visible = true;
            _itemSlot.container.visible = false;
            rotateItem.killTweens();
            var spinItem:Function = function():void
            {
               rotateItem.tweenTo(0.7,{"rotation":-359});
            };
            rotateItem.tweenTo(0.7,{
               "rotation":359,
               "onComplete":spinItem
            });
            var vibrateOffset:Number = 1;
            var originalX:Number = washingMachine.x;
            var originalY:Number = washingMachine.y;
            var vibrate:Function = null;
            vibrate = function():void
            {
               if(washingMachine.x > originalX + vibrateOffset)
               {
                  washingMachine.x = originalX + vibrateOffset;
               }
               if(washingMachine.x < originalX - vibrateOffset)
               {
                  washingMachine.x = originalX - vibrateOffset;
               }
               if(washingMachine.y > originalY + vibrateOffset)
               {
                  washingMachine.y = originalY + vibrateOffset;
               }
               if(washingMachine.y < originalY - vibrateOffset)
               {
                  washingMachine.y = originalY - vibrateOffset;
               }
               washingMachine.tweenTo(0.1,{
                  "y":washingMachine.y + NumberUtil.randomInt(-vibrateOffset,vibrateOffset),
                  "x":washingMachine.x + NumberUtil.randomInt(-vibrateOffset,vibrateOffset),
                  "onComplete":vibrate
               });
            };
            vibrate();
            var washInventoryItemCompleted:Function = function():void
            {
               washingMachine.killTweens();
               rotateItem.visible = false;
               _itemSlot.container.visible = true;
               washingMachine.x = originalX;
               washingMachine.y = originalY;
               User.enablePremiumCurrencySpendSound(false);
               Environment.application.updateData(response.data);
               User.enablePremiumCurrencySpendSound(true);
               if(Environment.info.isTouchScreen)
               {
                  if(_itemSlot.itemGraphic.tooltip is UiItemTooltip)
                  {
                     (_itemSlot.itemGraphic.tooltip as UiItemTooltip).refresh();
                  }
               }
               _btnChange.buttonEnabled = true;
               _btnChange.premium = User.current.character.washItemUsed;
            };
            Runtime.delayFunction(washInventoryItemCompleted,1.7);
         }
         else if(response.error == "errRemovePremiumCurrencyNotEnough")
         {
            _btnChange.buttonEnabled = true;
            ViewManager.instance.showNotEnoughPremiumDialog(CConstant.washing_machine_premium_currency_amount);
         }
         else if(response.error == "errWashItemNotYetAllowed")
         {
            _btnChange.buttonEnabled = true;
            _btnChange.premium = true;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/wash_item/not_yet_allowed/title"),LocText.current.text("dialog/wash_item/not_yet_allowed/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(response.error,response.request);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_btnChange.buttonEnabled)
         {
            return;
         }
         close();
      }
      
      override public function onEscape() : void
      {
         if(!_btnChange.buttonEnabled)
         {
            return;
         }
         close();
      }
   }
}
