package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   
   public class FixedList extends List
   {
       
      
      protected var _offset:int = 0;
      
      public function FixedList(param1:Sprite, param2:Class, param3:int, param4:Direction, param5:Button, param6:Button, param7:Boolean, param8:Boolean, param9:Function = null, param10:String = null)
      {
         var _loc12_:int = 0;
         super(param1,param2,param4,param5,param6,param7,param8,param9);
         _lines = new Vector.<ListLine>();
         var _loc11_:ListLine = null;
         if(!param10)
         {
            _listContainer.removeAllChildren();
            _loc12_ = 0;
            while(_loc12_ < param3)
            {
               _loc11_ = addNewLine(null,_loc12_);
               if(param4 == Direction.VERTICAL)
               {
                  _loc11_.y = _loc12_ * _loc11_.height;
               }
               else
               {
                  _loc11_.x = _loc12_ * _loc11_.width;
               }
               _listContainer.addChild(_loc11_);
               _loc11_.visible = false;
               _loc12_++;
            }
         }
         else
         {
            _loc12_ = 0;
            while(_loc12_ < param3)
            {
               _loc11_ = addExistingLine(null,_loc12_,_listContainer.getChildByName(param10 + (_loc12_ + 1)));
               _loc11_.visible = false;
               _loc12_++;
            }
         }
      }
      
      public function get offset() : int
      {
         return _offset;
      }
      
      public function set offset(param1:int) : void
      {
         _offset = param1;
      }
      
      override public function set currentFilter(param1:IListFilter) : void
      {
         _offset = 0;
         .super.currentFilter = param1;
      }
      
      override public function clear(param1:Boolean = true) : void
      {
         _offset = 0;
         _selectedLine = null;
         _selectedItems = new Vector.<IListItem>();
         _currentListItems = new Vector.<IListItem>();
         _items = new StringMap();
         _hasItemChanges = true;
         if(param1)
         {
            refreshList();
         }
      }
      
      override protected function scrollUp(param1:int) : void
      {
         if(_btnScrollUp != null && !_btnScrollUp.visible)
         {
            return;
         }
         var _loc2_:int = _offset;
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
         }
         if(_loc2_ != _offset)
         {
            refreshList();
         }
      }
      
      override protected function scrollDown(param1:int) : void
      {
         if(_btnScrollDown != null && !_btnScrollDown.visible)
         {
            return;
         }
         var _loc2_:int = _offset;
         _offset = _offset + param1;
         if(_offset > _currentListItems.length - _lines.length)
         {
            _offset = _currentListItems.length - _lines.length;
         }
         if(_loc2_ != _offset)
         {
            refreshList();
         }
      }
      
      override protected function renderList() : void
      {
         if(_btnScrollUp != null && _btnScrollDown != null)
         {
            _btnScrollUp.enabled = _offset > 0;
            _btnScrollUp.visible = _btnScrollUp.visible || _offset > 0;
            _btnScrollDown.enabled = _offset < _currentListItems.length - _lines.length;
         }
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refresh(_currentListItems.length > _offset + _loc1_.index?_currentListItems[_offset + _loc1_.index]:null,_loc1_.index);
         }
      }
   }
}
