package com.playata.application.ui.elements.action_bar
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.action_bar.SymbolActionBarButtonGeneric;
   import visuals.ui.elements.action_bar.SymbolActionBarRingGeneric;
   
   public class UiActionBarRing extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolActionBarRingGeneric = null;
      
      private var _actionButton1:UiButton = null;
      
      private var _actionButton2:UiButton = null;
      
      private var _actionButton3:UiButton = null;
      
      private var _actionButton4:UiButton = null;
      
      private var _actionButton5:UiButton = null;
      
      private var _actionButton6:UiButton = null;
      
      private var _type:int = 0;
      
      private var _onAction:Function = null;
      
      private var _onClose:Function = null;
      
      public function UiActionBarRing()
      {
         _content = new SymbolActionBarRingGeneric();
         _content.visible = false;
         _actionButton1 = new UiButton(_content.action1,null,onActionButton);
         _actionButton2 = new UiButton(_content.action2,null,onActionButton);
         _actionButton3 = new UiButton(_content.action3,null,onActionButton);
         _actionButton4 = new UiButton(_content.action4,null,onActionButton);
         _actionButton5 = new UiButton(_content.action5,null,onActionButton);
         _actionButton6 = new UiButton(_content.action6,null,onActionButton);
         super(_content);
         this.onClick.add(onHandleClick);
      }
      
      public function get content() : SymbolActionBarRingGeneric
      {
         return _content;
      }
      
      public function open(param1:int, param2:Function, param3:Object = null, param4:Function = null) : void
      {
         _onAction = param2;
         _onClose = param4;
         _type = param1;
         resetActions();
         var _loc5_:Item = null;
         switch(int(_type) - 1)
         {
            case 0:
               addAction("buyEquip");
               break;
            case 1:
               _loc5_ = param3 as Item;
               addAction("unequip");
               addAction("sell");
               if(User.current.character.sewingMachineAvailable)
               {
                  addAction("sewingMachine");
               }
               if(_loc5_.type != 9)
               {
                  if(User.current.character.washingMachineAvailable)
                  {
                     addAction("washingMachine");
                  }
                  if(User.current.character.customizeItemAvailable)
                  {
                     addAction("customizeItem");
                  }
               }
               break;
            case 2:
               _loc5_ = param3 as Item;
               if(_loc5_.isUsable)
               {
                  addAction("useItem");
               }
               else
               {
                  addAction("equip");
               }
               addAction("sell");
               if(User.current.character.bankInventoryAvailable)
               {
                  addAction("moveToBankInventory");
               }
               if(!_loc5_.isUsable)
               {
                  if(User.current.character.sewingMachineAvailable)
                  {
                     addAction("sewingMachine");
                  }
               }
               if(!_loc5_.isUsable && _loc5_.type != 9)
               {
                  if(User.current.character.washingMachineAvailable)
                  {
                     addAction("washingMachine");
                  }
                  if(User.current.character.customizeItemAvailable)
                  {
                     addAction("customizeItem");
                  }
               }
               break;
            case 3:
               _loc5_ = param3 as Item;
               addAction("sell");
               addAction("moveToInventory");
               if(!_loc5_.isUsable)
               {
                  if(User.current.character.sewingMachineAvailable)
                  {
                     addAction("sewingMachine");
                  }
               }
               if(!_loc5_.isUsable && _loc5_.type != 9)
               {
                  if(User.current.character.washingMachineAvailable)
                  {
                     addAction("washingMachine");
                  }
                  if(User.current.character.customizeItemAvailable)
                  {
                     addAction("customizeItem");
                  }
               }
               if(User.current.character.bankInventory.isItemLocked(_loc5_.id))
               {
                  addAction("unlockBankItem");
               }
               else
               {
                  addAction("lockBankItem");
               }
               break;
            case 4:
               addAction("openQuest");
               addAction("abort");
               break;
            case 5:
               addAction("refreshDuelOpponents");
               addAction("abort");
               break;
            case 6:
               addAction("refillDuelStamina");
               addAction("abort");
               break;
            case 7:
               addAction("skipStoryDungeon");
               addAction("abort");
               break;
            case 8:
               addAction("moveToInventory");
               addAction("abort");
         }
         fadeInButtons();
         _content.visible = true;
      }
      
      public function close() : void
      {
         TooltipLayer.instance.tooltipVisible = false;
         _content.visible = false;
         if(_onClose != null)
         {
            _onClose(_type);
         }
      }
      
      private function onHandleClick(param1:InteractionEvent) : void
      {
         ActionBarLayer.instance.close();
      }
      
      private function onActionButton(param1:InteractionEvent) : void
      {
         var _loc2_:UiButton = param1.target as UiButton;
         if(!_loc2_)
         {
            return;
         }
         if(_onAction(_loc2_.tag))
         {
            ActionBarLayer.instance.close();
         }
      }
      
      private function resetActions() : void
      {
         _actionButton1.visible = false;
         _actionButton2.visible = false;
         _actionButton3.visible = false;
         _actionButton4.visible = false;
         _actionButton5.visible = false;
         _actionButton6.visible = false;
      }
      
      private function addAction(param1:String, param2:UiButton = null) : void
      {
         var _loc3_:* = null;
         if(param2 != null && !param2.visible)
         {
            _loc3_ = param2;
         }
         else
         {
            _loc3_ = _actionButton1;
            if(_actionButton1.visible)
            {
               _loc3_ = _actionButton2;
            }
            if(_actionButton2.visible)
            {
               _loc3_ = _actionButton3;
            }
            if(_actionButton3.visible)
            {
               _loc3_ = _actionButton4;
            }
            if(_actionButton4.visible)
            {
               _loc3_ = _actionButton5;
            }
            if(_actionButton5.visible)
            {
               _loc3_ = _actionButton6;
            }
            if(_actionButton6.visible)
            {
               return;
            }
         }
         _loc3_.tag = param1;
         _loc3_.visible = true;
         var _loc4_:SymbolActionBarButtonGeneric = _loc3_.content as SymbolActionBarButtonGeneric;
         _loc4_.gotoAndStop(param1);
      }
      
      private function fadeInButtons() : void
      {
         var _loc1_:* = 0.2;
         if(_actionButton1.visible)
         {
            _actionButton1.tweenFrom(_loc1_,{
               "alpha":0,
               "y":"7"
            });
         }
         if(_actionButton2.visible)
         {
            _actionButton2.tweenFrom(_loc1_,{
               "alpha":0,
               "x":"-5",
               "y":"3"
            });
         }
         if(_actionButton3.visible)
         {
            _actionButton3.tweenFrom(_loc1_,{
               "alpha":0,
               "x":"-5",
               "y":"-3"
            });
         }
         if(_actionButton4.visible)
         {
            _actionButton4.tweenFrom(_loc1_,{
               "alpha":0,
               "y":"-7"
            });
         }
         if(_actionButton5.visible)
         {
            _actionButton5.tweenFrom(_loc1_,{
               "alpha":0,
               "x":"5",
               "y":"-3"
            });
         }
         if(_actionButton6.visible)
         {
            _actionButton6.tweenFrom(_loc1_,{
               "alpha":0,
               "x":"5",
               "y":"3"
            });
         }
      }
   }
}
