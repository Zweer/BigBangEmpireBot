package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.dungeon.SymbolDungeonKeyRewardGeneric;
   
   public class UiDungeonKeyRewardButton extends UiDungeonKeyReward implements ICitymapQuestButton
   {
       
      
      private var _callback:Function = null;
      
      private var _quest:Quest = null;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      public function UiDungeonKeyRewardButton(param1:SymbolDungeonKeyRewardGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super(param1);
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
         _quest = param2;
         _callback = param3;
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
         _quest = null;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
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
   }
}
