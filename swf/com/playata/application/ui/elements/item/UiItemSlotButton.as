package com.playata.application.ui.elements.item
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import flash.display.Sprite;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class UiItemSlotButton extends UiItemSlot implements ICitymapQuestButton
   {
       
      
      private var _content:SymbolItemSlotGeneric;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      public function UiItemSlotButton(param1:SymbolItemSlotGeneric, param2:Quest, param3:int, param4:Function, param5:Function, param6:Function)
      {
         super(param1,param3);
         (FlashDisplayObject.getNativeDisplayObject(param1) as Sprite).mouseChildren = true;
         _content = param1;
         _quest = param2;
         _callback = param4;
         _buttonWrapper = new UiButtonWrapper(_content,handleClick,param5,param6);
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         if(_itemGraphic)
         {
            return _itemGraphic.tooltip;
         }
         return null;
      }
      
      override public function dispose() : void
      {
         _content = null;
         _buttonWrapper.dispose();
         _callback = null;
         _quest = null;
         super.dispose();
      }
      
      override public function set item(param1:Item) : void
      {
         .super.item = param1;
         if(_itemGraphic)
         {
            _itemGraphic.itemSlot.useHandCursor = true;
         }
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
