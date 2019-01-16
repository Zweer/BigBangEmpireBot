package com.playata.application.ui.elements.debug
{
   import com.playata.framework.display.ui.IListItem;
   
   public class UiDebugPanelListLineItem implements IListItem
   {
      
      private static var INDEX:int = 0;
       
      
      private var _index:int = 0;
      
      private var _name:String = null;
      
      private var _functionName:String = null;
      
      private var _header:Boolean = false;
      
      private var _onClick:Function = null;
      
      private var _defaultValue = null;
      
      private var _headerItem:UiDebugPanelListLineItem = null;
      
      private var _functionItems:Vector.<UiDebugPanelListLineItem> = null;
      
      public function UiDebugPanelListLineItem(param1:String, param2:String, param3:Boolean, param4:* = null, param5:Function = null, param6:UiDebugPanelListLineItem = null)
      {
         super();
         _name = param1;
         _functionName = param2;
         _header = param3;
         _onClick = param5;
         _headerItem = param6;
         _defaultValue = param4;
         _index = INDEX;
         INDEX = Number(INDEX) + 1;
         if(_headerItem)
         {
            _headerItem.addFunctionItem(this);
         }
      }
      
      public function get itemId() : String
      {
         return _name + _functionName + _header;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get functionName() : String
      {
         return _functionName;
      }
      
      public function get header() : Boolean
      {
         return _header;
      }
      
      public function get onClick() : Function
      {
         return _onClick;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get defaultValue() : *
      {
         return _defaultValue;
      }
      
      public function addFunctionItem(param1:UiDebugPanelListLineItem) : void
      {
         if(!_functionItems)
         {
            _functionItems = new Vector.<UiDebugPanelListLineItem>();
         }
         _functionItems.push(param1);
      }
      
      public function matches(param1:String) : Boolean
      {
         var _loc2_:* = name.toLowerCase().indexOf(param1) >= 0;
         if(!_loc2_)
         {
            if(_headerItem)
            {
               _loc2_ = _headerItem.name.toLowerCase().indexOf(param1) >= 0;
            }
            else if(_functionItems)
            {
               var _loc5_:int = 0;
               var _loc4_:* = _functionItems;
               for each(var _loc3_ in _functionItems)
               {
                  _loc2_ = _loc3_.name.toLowerCase().indexOf(param1) >= 0;
                  if(!_loc2_)
                  {
                     continue;
                  }
                  break;
               }
            }
         }
         return _loc2_;
      }
   }
}
