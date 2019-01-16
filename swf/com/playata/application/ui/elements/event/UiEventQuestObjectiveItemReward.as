package com.playata.application.ui.elements.event
{
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestItemRewardGeneric;
   
   public class UiEventQuestObjectiveItemReward extends UiEventQuestItemReward
   {
       
      
      public function UiEventQuestObjectiveItemReward(param1:SymbolEventQuestItemRewardGeneric)
      {
         super(param1);
      }
      
      override protected function get undefinedAttributesTooltip() : String
      {
         return LocText.current.text("dialog/event_quest_objective/item_attributes_undefined");
      }
   }
}
