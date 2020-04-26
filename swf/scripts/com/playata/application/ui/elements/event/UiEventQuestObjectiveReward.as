package com.playata.application.ui.elements.event
{
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import visuals.ui.elements.event.SymbolEventQuestRewardGeneric;
   
   public class UiEventQuestObjectiveReward
   {
       
      
      private var _content:SymbolEventQuestRewardGeneric = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _itemReward:UiEventQuestObjectiveItemReward = null;
      
      private var _itemSlot:UiItemSlot;
      
      public function UiEventQuestObjectiveReward(param1:SymbolEventQuestRewardGeneric)
      {
         super();
         _content = param1;
         _tooltip = null;
         _itemReward = new UiEventQuestObjectiveItemReward(_content.iconItem);
         _itemSlot = new UiItemSlot(_content.itemSlot,0);
      }
      
      public function dispose() : void
      {
         if(_tooltip != null)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         _itemReward.dispose();
         _itemReward = null;
      }
      
      public function refresh(param1:EventQuestObjective) : void
      {
         _content.iconXP.visible = param1.rewardType == 4;
         _content.iconStatPoints.visible = param1.rewardType == 3;
         _content.iconPremiumCurrency.visible = param1.rewardType == 2;
         _content.iconGameCurrency.visible = param1.rewardType == 1;
         _content.iconItem.visible = param1.rewardType == 5;
         _content.itemSlot.visible = param1.rewardType == 5;
         _content.iconBooster.visible = false;
         _content.iconTitle.visible = false;
         switch(int(param1.rewardType) - 1)
         {
            case 0:
               setValue(param1.rewardType,param1.rewardText);
               break;
            case 1:
               setValue(param1.rewardType,param1.rewardText);
               break;
            case 2:
               setValue(param1.rewardType,param1.rewardText);
               break;
            case 3:
               setValue(param1.rewardType,param1.rewardText);
               break;
            case 4:
               if(param1.rewardItem)
               {
                  _itemSlot.item = param1.rewardItem;
                  _content.iconItem.visible = false;
               }
               else
               {
                  _itemReward.item = param1.rewardReference;
                  _content.itemSlot.visible = false;
               }
               setValue(param1.rewardType,param1.rewardText);
         }
      }
      
      private function setValue(param1:int, param2:String, param3:String = null) : void
      {
         _content.iconXP.visible = param1 == 4;
         _content.iconStatPoints.visible = param1 == 3;
         _content.iconPremiumCurrency.visible = param1 == 2;
         _content.iconGameCurrency.visible = param1 == 1;
         _content.iconItem.visible = param1 == 5;
         _content.iconBooster.visible = false;
         _content.iconTitle.visible = false;
         _content.txtValue.text = param2;
         if(param3)
         {
            if(_tooltip == null)
            {
               _tooltip = new UiTextTooltip(_content,param3);
            }
            else
            {
               _tooltip.text = param3;
            }
         }
      }
   }
}
