package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   
   public class Tab extends Button
   {
       
      
      private var _selected:Boolean;
      
      var _id:String;
      
      private var _group:TabGroup;
      
      public function Tab(param1:IDisplayObject)
      {
         super(param1,onClicked);
         onDeselected();
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(param1 == _selected)
         {
            return;
         }
         _selected = param1;
         if(_selected)
         {
            onSelected();
         }
         else
         {
            onDeselected();
         }
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set group(param1:TabGroup) : void
      {
         _group = param1;
      }
      
      public function get group() : TabGroup
      {
         return _group;
      }
      
      protected function onSelected() : void
      {
      }
      
      protected function onDeselected() : void
      {
      }
      
      protected function onClicked(param1:InteractionEvent) : void
      {
         if(!_selected && _group)
         {
            _group.onTabClicked(this);
         }
      }
   }
}
