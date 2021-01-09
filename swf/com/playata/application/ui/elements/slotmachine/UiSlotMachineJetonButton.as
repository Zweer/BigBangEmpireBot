package com.playata.application.ui.elements.slotmachine
{
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class UiSlotMachineJetonButton extends UiSlotMachineJetonReward implements ICitymapQuestButton
   {
       
      
      private var _content:SymbolSlotmachineJetonRewardGeneric;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      public function UiSlotMachineJetonButton(param1:SymbolSlotmachineJetonRewardGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _content = param1;
         _quest = param2;
         _callback = param3;
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _container;
      }
      
      override public function dispose() : void
      {
         destroy();
         _buttonWrapper.dispose();
         _buttonWrapper = null;
         super.dispose();
      }
      
      public function destroy() : void
      {
         _buttonWrapper.destroy();
         _content = null;
         _callback = null;
         _quest = null;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
   }
}
