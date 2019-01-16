package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeResourceRewardGeneric;
   
   public class UiOpticalChangeResourceButton implements ICitymapQuestButton
   {
       
      
      private var _content:SymbolOpticalChangeResourceRewardGeneric;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      protected var _tooltip:UiTextTooltip = null;
      
      public function UiOpticalChangeResourceButton(param1:SymbolOpticalChangeResourceRewardGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super();
         _content = param1;
         _quest = param2;
         _callback = param3;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
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
         return _content;
      }
      
      public function dispose() : void
      {
         _content = null;
         _buttonWrapper.dispose();
         _callback = null;
         _quest = null;
         _tooltip.dispose();
         _tooltip = null;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
      
      public function set amount(param1:int) : void
      {
         _content.txtAmount.text = param1.toString();
         _tooltip.text = GameUtil.getOpticalChangeResourceString(param1);
      }
   }
}
