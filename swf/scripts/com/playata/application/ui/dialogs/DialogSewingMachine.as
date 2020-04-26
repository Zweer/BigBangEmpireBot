package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.elements.item.UiItemPatternContent;
   import com.playata.application.ui.elements.sewing_machine.UiSewingMachinContent;
   import com.playata.application.ui.panels.PanelShop;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSewingMachineGeneric;
   
   public class DialogSewingMachine extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabSewingMachine:UiTabButton;
      
      private var _btnTabItemPattern:UiTabButton;
      
      private var _previewAvatar:UiAvatarPreview = null;
      
      private var _sewingMachineContent:UiSewingMachinContent = null;
      
      private var _itemPatternContent:UiItemPatternContent = null;
      
      public function DialogSewingMachine(param1:Item = null)
      {
         _isOpen = true;
         var _loc2_:SymbolDialogSewingMachineGeneric = new SymbolDialogSewingMachineGeneric();
         super(_loc2_);
         _queued = false;
         _sewingMachineContent = new UiSewingMachinContent(_loc2_.sewingMachine,this);
         _itemPatternContent = new UiItemPatternContent(_loc2_.itemPattern,this);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnTabSewingMachine = new UiTabButton(_loc2_.btnTabSewingMachine,LocText.current.text("dialog/sewing_machine/tab_button_sewing_machine"),LocText.current.text("dialog/sewing_machine/tab_button_sewing_machine_tooltip"),onClickTabSewingMachine);
         _btnTabItemPattern = new UiTabButton(_loc2_.btnTabItemPattern,LocText.current.text("dialog/sewing_machine/tab_button_item_pattern"),LocText.current.text("dialog/sewing_machine/tab_button_item_pattern_tooltip"),onClickTabSewingMachine);
         _btnTabSewingMachine.setTextSize(15,2);
         _btnTabItemPattern.setTextSize(15,2);
         _loc2_.iconCount.caption.text = "!";
         _loc2_.iconCount.bringToTop();
         _previewAvatar = new UiAvatarPreview(_loc2_.avatar);
         _loc2_.avatar.x = _loc2_.avatar.x - 100;
         _loc2_.avatar.bringToTop();
         MessageRouter.addListener("ItemMessage.notifyItemDragged",handleMessages);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOver",handleMessages);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOut",handleMessages);
         refreshCounter();
         if(param1)
         {
            clickTabSewingMachine(_btnTabSewingMachine);
            _sewingMachineContent.setItem(param1);
         }
         else
         {
            clickTabSewingMachine(_btnTabItemPattern);
            _btnTabSewingMachine.buttonEnabled = false;
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnTabSewingMachine.dispose();
         _btnTabSewingMachine = null;
         _btnTabItemPattern.dispose();
         _btnTabItemPattern = null;
         _previewAvatar.dispose();
         _previewAvatar = null;
         _sewingMachineContent.dispose();
         _sewingMachineContent = null;
         _itemPatternContent.dispose();
         _itemPatternContent = null;
         MessageRouter.removeAllListeners(handleMessages);
         super.dispose();
      }
      
      public function refreshUI() : void
      {
         _sewingMachineContent.refreshUI();
      }
      
      private function onClickTabSewingMachine(param1:InteractionEvent) : void
      {
         clickTabSewingMachine(param1.target);
      }
      
      private function clickTabSewingMachine(param1:IInteractionTarget) : void
      {
         _btnTabSewingMachine.tabbed = param1 === _btnTabSewingMachine;
         _btnTabItemPattern.tabbed = param1 === _btnTabItemPattern;
         if(_btnTabSewingMachine.tabbed)
         {
            _sewingMachineContent.show();
            _itemPatternContent.hide();
         }
         else
         {
            _itemPatternContent.show();
            _sewingMachineContent.hide();
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = param1.type;
         switch(_loc4_)
         {
            case "ItemMessage.notifyItemDragged":
               _previewAvatar.hide();
               break;
            case "ItemMessage.notifyItemInteractionOver":
               _loc3_ = param1.data as UiItemGraphic;
               _loc2_ = _loc3_.item;
               if(_loc2_.type == 1 || _loc2_.type == 3 || _loc2_.type == 2 || _loc2_.type == 4 || _loc2_.type == 5)
               {
                  _previewAvatar.show(getCharacterSettings(_loc2_));
               }
               break;
            case "ItemMessage.notifyItemInteractionOut":
               _previewAvatar.hide();
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function getCharacterSettings(param1:Item) : AppearanceSettings
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings();
         if(param1.type == 1)
         {
            _loc2_.show_head_item = true;
            _loc2_.head = param1.identifier;
         }
         else if(param1.type == 2)
         {
            _loc2_.show_chest_item = true;
            _loc2_.chest = param1.identifier;
         }
         else if(param1.type == 3)
         {
            _loc2_.show_belt_item = true;
            _loc2_.belt = param1.identifier;
         }
         else if(param1.type == 4)
         {
            _loc2_.show_legs_item = true;
            _loc2_.legs = param1.identifier;
         }
         else if(param1.type == 5)
         {
            _loc2_.show_boots_item = true;
            _loc2_.boots = param1.identifier;
         }
         if(param1.type == 4 && _loc2_.chest != null && User.current.character.getItem("chest_item_id").isOutfitItem)
         {
            _loc2_.chest = null;
         }
         return _loc2_;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_sewingMachineContent)
         {
            return;
         }
         if(_sewingMachineContent.sewingInProgress())
         {
            return;
         }
         close();
      }
      
      override public function onEscape() : void
      {
         if(!_sewingMachineContent)
         {
            return;
         }
         if(_sewingMachineContent.sewingInProgress())
         {
            return;
         }
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         super.close(param1);
         if(ViewManager.instance.activePanelInstance is PanelShop)
         {
            (ViewManager.instance.activePanelInstance as PanelShop).updateCharacter();
         }
         _isOpen = false;
      }
      
      public function refreshCounter() : void
      {
         if(!_sewingMachineContent)
         {
            return;
         }
         var _loc1_:SymbolDialogSewingMachineGeneric = _vo as SymbolDialogSewingMachineGeneric;
         _loc1_.iconCount.visible = ItemPatterns.instance.hasNewItemPattern || ItemPatterns.instance.hasCollectableItemPatternValues;
         _itemPatternContent.refreshList();
      }
   }
}
