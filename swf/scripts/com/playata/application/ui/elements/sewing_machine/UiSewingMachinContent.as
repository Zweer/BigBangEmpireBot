package com.playata.application.ui.elements.sewing_machine
{
   import com.playata.application.data.item.Item;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.sewing_machine.SymbolSewingMachineContentGeneric;
   
   public class UiSewingMachinContent extends InteractiveDisplayObject
   {
      
      private static const MAX_PATTERNS:int = 25;
      
      private static const SCROLL_VALUE:int = 5;
      
      private static var _item:Item = null;
       
      
      private var _currentScrollIndex:int = 0;
      
      private var _availablePatterns:Vector.<String> = null;
      
      private var _availablePatternsFiltered:Vector.<String> = null;
      
      private var _itemSlotSource:UiItemSlot = null;
      
      private var _itemSlotTarget:UiItemSlot = null;
      
      private var _itemPattern:Vector.<UiItemSlot> = null;
      
      private var _btnChangePremium:UiPremiumButton = null;
      
      private var _btnChangeGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _sewingMachineFilter:UiSewingMachineFilter = null;
      
      private var _content:SymbolSewingMachineContentGeneric = null;
      
      private var _dialog:DialogSewingMachine = null;
      
      private var _currentDropTargets:Vector.<IDropTarget> = null;
      
      public function UiSewingMachinContent(param1:SymbolSewingMachineContentGeneric, param2:DialogSewingMachine)
      {
         _content = param1;
         _dialog = param2;
         super(_content);
         _content.txtPatternsCaption.text = LocText.current.text("dialog/sewing_machine/patterns_caption");
         _content.txtNoPatterns.text = LocText.current.text("dialog/sewing_machine/no_patterns");
         _content.txtNoPatterns.visible = false;
         _btnChangePremium = new UiPremiumButton(_content.btnChangePremium,1,LocText.current.text("dialog/sewing_machine/button_change"),LocText.current.text("dialog/sewing_machine/button_change"),"","",onClickChange);
         _btnChangePremium.premium = false;
         _btnChangePremium.buttonEnabled = false;
         _btnChangeGameCurrency = new UiGameCurrencyButton(_content.btnChangeCoins,0,LocText.current.text("dialog/sewing_machine/button_change"),"",onClickChange);
         _btnChangeGameCurrency.visible = false;
         _btnScrollUp = new UiButton(_content.btnScrollUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnScrollDown,"",onClickScrollDown);
         _btnFilter = new UiButton(_content.btnFilter,"",onClickFilter);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _sewingMachineFilter = new UiSewingMachineFilter(_content.sewingMachineFilter,onFilterChanged);
         Environment.panelManager.dragDropManager.dialogDragLayer = _content.dragLayer;
         Environment.panelManager.dragDropManager.dialogDragLayer.x = Environment.panelManager.dragDropManager.dialogDragLayer.x - Environment.layout.appWidth / 2;
         Environment.panelManager.dragDropManager.dialogDragLayer.y = Environment.panelManager.dragDropManager.dialogDragLayer.y - Environment.layout.appHeight / 2;
         Environment.audio.cacheSound("sewing_machine.mp3");
         _currentDropTargets = Environment.panelManager.dragDropManager.dropTargets;
         onMouseWheel.add(handleMouseWheel);
      }
      
      public static function get sourceItem() : Item
      {
         return _item;
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         Environment.panelManager.dragDropManager.dialogDragLayer = null;
         Environment.panelManager.dragDropManager.clearDropTargets();
         var _loc4_:int = 0;
         var _loc3_:* = _currentDropTargets;
         for each(var _loc1_ in _currentDropTargets)
         {
            Environment.panelManager.dragDropManager.addDropTarget(_loc1_);
         }
         _btnChangePremium.dispose();
         _btnChangePremium = null;
         _btnChangeGameCurrency.dispose();
         _btnChangeGameCurrency = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnFilter.dispose();
         _btnFilter = null;
         _sewingMachineFilter.dispose();
         _sewingMachineFilter = null;
         if(_itemSlotSource)
         {
            _itemSlotSource.dispose();
            _itemSlotSource = null;
         }
         if(_itemSlotTarget)
         {
            _itemSlotTarget.dispose();
            _itemSlotTarget = null;
         }
         if(_itemPattern)
         {
            _loc2_ = 0;
            while(_loc2_ < _itemPattern.length)
            {
               _itemPattern[_loc2_].dispose();
               _loc2_++;
            }
            _itemPattern.length = 0;
            _itemPattern = null;
         }
         _content = null;
         _dialog = null;
         _item = null;
         super.dispose();
      }
      
      public function setItem(param1:Item) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(_item)
         {
            return;
         }
         _item = param1;
         _itemSlotSource = new UiItemSlot(_content.itemSlotSource,0);
         _itemSlotSource.item = _item;
         _itemSlotSource.locked = true;
         _itemSlotSource.itemGraphic.customTooltip = LocText.current.text("dialog/sewing_machine/source_item_slot_tooltip");
         _itemSlotSource.showBackground(false);
         _itemSlotTarget = new UiItemSlot(_content.itemSlotTarget,0);
         _itemSlotTarget.item = null;
         _itemSlotTarget.itemGraphic.customTooltip = LocText.current.text("dialog/sewing_machine/target_item_slot_tooltip");
         _itemSlotTarget.showBackground(false);
         Environment.panelManager.dragDropManager.clearDropTargets();
         Environment.panelManager.dragDropManager.addDropTarget(_itemSlotTarget);
         _itemPattern = new Vector.<UiItemSlot>();
         _loc2_ = 1;
         while(_loc2_ <= 25)
         {
            _loc3_ = _content.getChildByName("itemSlotPattern" + _loc2_) as SymbolItemSlotGeneric;
            _itemPattern.push(new UiItemSlot(_loc3_,_item.itemSlotType));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemPattern.length)
         {
            _itemPattern[_loc2_].container.visible = false;
            _loc2_++;
         }
         Environment.application.sendActionRequest("getOwnedInventoryItems",{
            "item_quality":_item.quality,
            "item_type":_item.type
         },handleRequests);
         _sewingMachineFilter.itemQuality = _item.quality;
         _content.btnFilter.iconExclamationMark.visible = UiSewingMachineFilter.isFilterActive;
         _content.txtPatternsCaption.text = LocText.current.text("dialog/sewing_machine/patterns_caption_" + _item.type);
      }
      
      public function show() : void
      {
         if(!_item)
         {
            return;
         }
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      public function refreshUI() : void
      {
         if(_itemSlotTarget.item.quality == 1 && !_item.itemSetIdentifier)
         {
            _btnChangeGameCurrency.gameCurrencyAmount = _itemSlotTarget.item.getSewPrice(_item);
            _btnChangeGameCurrency.visible = true;
            _btnChangePremium.visible = false;
         }
         else
         {
            _btnChangePremium.buttonEnabled = true;
            _btnChangePremium.premiumAmount = _itemSlotTarget.item.getSewPrice(_item);
            _btnChangePremium.premium = true;
            _btnChangeGameCurrency.visible = false;
            _btnChangePremium.visible = true;
         }
         refreshPatterns();
      }
      
      private function onClickChange(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         _btnChangeGameCurrency.visible = false;
         _btnChangePremium.visible = false;
         _loc2_ = 0;
         while(_loc2_ < _itemPattern.length)
         {
            _itemPattern[_loc2_].locked = true;
            _loc2_++;
         }
         Environment.application.sendActionRequest("sewInventoryItem",{
            "item_id":_item.id,
            "target_identifier":_itemSlotTarget.item.identifier
         },handleRequests);
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(5,true);
         }
         else
         {
            scrollDown(5,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_currentScrollIndex == 0)
         {
            return;
         }
         _currentScrollIndex = _currentScrollIndex - param1;
         if(_currentScrollIndex < 0)
         {
            _currentScrollIndex = 0;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshPatterns();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_currentScrollIndex >= _availablePatternsFiltered.length - 25)
         {
            return;
         }
         _currentScrollIndex = _currentScrollIndex + param1;
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshPatterns();
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _sewingMachineFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         _currentScrollIndex = 0;
         _availablePatternsFiltered = null;
         refreshPatterns();
      }
      
      private function refreshPatterns() : void
      {
         if(!_content)
         {
            return;
         }
         if(!_availablePatternsFiltered)
         {
            _availablePatternsFiltered = new Vector.<String>();
            var _loc4_:int = 0;
            var _loc3_:* = _availablePatterns;
            for each(var _loc2_ in _availablePatterns)
            {
               if(UiSewingMachineFilter.isAllowed(_loc2_))
               {
                  _availablePatternsFiltered.push(_loc2_);
               }
            }
            _content.btnFilter.iconExclamationMark.visible = UiSewingMachineFilter.isFilterActive;
         }
         var _loc1_:int = 0;
         if(_availablePatternsFiltered.length == 0)
         {
            if(_availablePatternsFiltered.length != _availablePatterns.length)
            {
               _content.txtNoPatterns.text = LocText.current.text("dialog/sewing_machine/filtered_no_patterns");
            }
            else
            {
               _content.txtNoPatterns.text = LocText.current.text("dialog/sewing_machine/no_patterns");
            }
            _content.txtNoPatterns.visible = true;
            _loc1_ = 0;
            while(_loc1_ < _itemPattern.length)
            {
               _itemPattern[_loc1_].container.visible = false;
               _loc1_++;
            }
            return;
         }
         _content.txtNoPatterns.visible = false;
         _loc1_ = 0;
         while(_loc1_ < _itemPattern.length)
         {
            _itemPattern[_loc1_].container.visible = _availablePatternsFiltered.length > _loc1_ + _currentScrollIndex;
            if(_itemPattern[_loc1_].container.visible)
            {
               _itemPattern[_loc1_].sewingMachinePattern = _availablePatternsFiltered[_loc1_ + _currentScrollIndex];
            }
            _loc1_++;
         }
         _btnScrollUp.visible = _availablePatternsFiltered.length > 25;
         _btnScrollDown.visible = _availablePatternsFiltered.length > 25;
         _btnScrollUp.buttonEnabled = _currentScrollIndex > 0;
         _btnScrollDown.buttonEnabled = _currentScrollIndex < Math.max(_availablePatternsFiltered.length - 25,3);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         if(!_content)
         {
            return;
         }
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "getOwnedInventoryItems":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  if(response.appResponse.hasData("owned_item_templates"))
                  {
                     _currentScrollIndex = 0;
                     _availablePatterns = response.appResponse.owned_item_templates;
                     if(_availablePatterns.indexOf(_item.identifier) != -1)
                     {
                        _availablePatterns.splice(_availablePatterns.indexOf(_item.identifier),1);
                     }
                     _availablePatternsFiltered = null;
                     refreshPatterns();
                  }
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "sewInventoryItem":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  Environment.audio.playFX("sewing_machine.mp3");
                  _content.sewingMachine.needle.tweenTo(0.1,{
                     "y":150,
                     "repeat":22
                  });
                  _content.sewingMachine.strings.tweenTo(0.1,{
                     "alpha":0,
                     "repeat":22
                  });
                  var sewAnimationCompleted:Function = function():void
                  {
                     _dialog.close();
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_done/title"),LocText.current.text("dialog/sewing_done/text"),LocText.current.text("general/button_ok")));
                  };
                  Runtime.delayFunction(sewAnimationCompleted,3);
               }
               else if(response.error == "errRemoveGameCurrencyNotEnough")
               {
                  _btnChangeGameCurrency.visible = _itemSlotTarget.item.quality == 1;
                  _btnChangePremium.visible = !_btnChangeGameCurrency.visible;
                  var i:int = 0;
                  while(i < _itemPattern.length)
                  {
                     _itemPattern[i].locked = false;
                     i = Number(i) + 1;
                  }
                  ViewManager.instance.showNotEnoughGameCurrencyDialog(_btnChangeGameCurrency.gameCurrencyAmount);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  _btnChangeGameCurrency.visible = _itemSlotTarget.item.quality == 1;
                  _btnChangePremium.visible = !_btnChangeGameCurrency.visible;
                  i = 0;
                  while(i < _itemPattern.length)
                  {
                     _itemPattern[i].locked = false;
                     i = Number(i) + 1;
                  }
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnChangePremium.premiumAmount);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
      
      public function sewingInProgress() : Boolean
      {
         return !_btnChangeGameCurrency.visible && !_btnChangePremium.visible;
      }
   }
}
