package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.error.NotImplementedException;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import flash.utils.Dictionary;
   
   public class List extends Control
   {
       
      
      protected var _selectFirst:Boolean = true;
      
      protected var _multiSelect:Boolean = true;
      
      protected var _selectedItems:Vector.<IListItem>;
      
      protected var _currentListItems:Vector.<IListItem>;
      
      protected var _filter:IListFilter = null;
      
      protected var _hasItemChanges:Boolean = true;
      
      protected var _listContainer:Sprite = null;
      
      protected var _btnScrollUp:Button = null;
      
      protected var _btnScrollDown:Button = null;
      
      protected var _direction:Direction;
      
      protected var _sortFunction:Function = null;
      
      protected var _scrollStep:int = 1;
      
      protected var _listLineClass:Class = null;
      
      protected var _selectedLine:ListLine = null;
      
      protected var _items:StringMap;
      
      protected var _lines:Vector.<ListLine>;
      
      protected var _onListUpdated:ISignal = null;
      
      protected var _onSelectionChanged:ISignal = null;
      
      protected var _onLineDoubleClick:ISignal = null;
      
      public function List(param1:Sprite, param2:Class, param3:Direction, param4:Button, param5:Button, param6:Boolean, param7:Boolean, param8:Function = null)
      {
         _selectedItems = new Vector.<IListItem>();
         _currentListItems = new Vector.<IListItem>();
         _direction = Direction.VERTICAL;
         _items = new StringMap();
         _lines = new Vector.<ListLine>();
         _listContainer = param1;
         _listLineClass = param2;
         _direction = param3;
         _sortFunction = param8;
         super(_listContainer);
         if(param4 && param5)
         {
            _btnScrollUp = param4;
            _btnScrollDown = param5;
            _btnScrollUp.onClick.add(onClickScrollUp);
            _btnScrollDown.onClick.add(onClickScrollDown);
            _btnScrollUp.visible = false;
            _btnScrollDown.visible = false;
         }
         onMouseWheel.add(onMouseWheelEvent);
         _selectFirst = param6;
         _multiSelect = param7;
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         if(_btnScrollUp && _btnScrollDown)
         {
            _btnScrollUp.dispose();
            _btnScrollUp = null;
            _btnScrollDown.dispose();
            _btnScrollDown = null;
         }
         if(_onListUpdated != null)
         {
            _onListUpdated.removeAll();
            _onListUpdated = null;
         }
         if(_onSelectionChanged != null)
         {
            _onSelectionChanged.removeAll();
            _onSelectionChanged = null;
         }
         if(_onLineDoubleClick != null)
         {
            _onLineDoubleClick.removeAll();
            _onLineDoubleClick = null;
         }
         super.dispose();
      }
      
      public function get direction() : Direction
      {
         return _direction;
      }
      
      public function set scrollStep(param1:int) : void
      {
         _scrollStep = param1;
      }
      
      public function get scrollStep() : int
      {
         return _scrollStep;
      }
      
      public function get onListUpdated() : ISignal
      {
         if(_onListUpdated == null)
         {
            _onListUpdated = new Signal();
         }
         return _onListUpdated;
      }
      
      public function get onSelectionChanged() : ISignal
      {
         if(_onSelectionChanged == null)
         {
            _onSelectionChanged = new Signal();
         }
         return _onSelectionChanged;
      }
      
      public function get onLineDoubleClick() : ISignal
      {
         if(_onLineDoubleClick == null)
         {
            _onLineDoubleClick = new Signal();
         }
         return _onLineDoubleClick;
      }
      
      public function addItem(param1:IListItem, param2:Boolean = true) : void
      {
         _items.setData(param1.itemId,param1);
         _hasItemChanges = true;
         if(param2)
         {
            refreshList(_selectFirst);
         }
      }
      
      public function removeItem(param1:IListItem, param2:Boolean = true) : void
      {
         if(_items.exists(param1.itemId))
         {
            _items.remove(param1.itemId);
         }
         _hasItemChanges = true;
         if(_selectedLine && _selectedLine.item == param1)
         {
            _selectedLine.highlight(false);
            _selectedLine = null;
         }
         if(_selectedItems && _selectedItems.indexOf(param1) != -1)
         {
            _selectedItems.removeAt(_selectedItems.indexOf(param1));
         }
         if(param2)
         {
            refreshList(_selectFirst);
         }
      }
      
      public function clear(param1:Boolean = true) : void
      {
         _selectedLine = null;
         _selectedItems = new Vector.<IListItem>();
         _currentListItems = new Vector.<IListItem>();
         _items = new StringMap();
         _lines = new Vector.<ListLine>();
         _hasItemChanges = true;
         if(param1)
         {
            refreshList();
         }
      }
      
      public function syncItemsFromVector(param1:Object, param2:Boolean = true) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:Vector.<IListItem> = new Vector.<IListItem>(0);
         var _loc9_:int = 0;
         var _loc8_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(!_items.exists(_loc3_.itemId))
            {
               _loc4_.push(_loc3_);
            }
         }
         var _loc6_:Vector.<IListItem> = new Vector.<IListItem>(0);
         var _loc13_:int = 0;
         var _loc12_:* = _items;
         for each(_loc3_ in _items)
         {
            _loc5_ = true;
            var _loc11_:int = 0;
            var _loc10_:* = param1;
            for each(var _loc7_ in param1)
            {
               if(_loc7_.itemId == _loc3_.itemId)
               {
                  _loc5_ = false;
                  break;
               }
            }
            if(_loc5_)
            {
               _loc6_.push(_loc3_);
            }
         }
         var _loc15_:int = 0;
         var _loc14_:* = _loc4_;
         for each(_loc3_ in _loc4_)
         {
            addItem(_loc3_,false);
         }
         var _loc17_:int = 0;
         var _loc16_:* = _loc6_;
         for each(_loc3_ in _loc6_)
         {
            removeItem(_loc3_,false);
         }
         if(param2)
         {
            refreshList();
         }
      }
      
      public function syncItemsFromCollection(param1:Dictionary, param2:Boolean = true) : void
      {
         var _loc4_:Vector.<IListItem> = new Vector.<IListItem>(0);
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(!_items.exists(_loc3_.itemId))
            {
               _loc4_.push(_loc3_);
            }
         }
         var _loc5_:Vector.<IListItem> = new Vector.<IListItem>(0);
         var _loc9_:int = 0;
         var _loc8_:* = _items;
         for each(_loc3_ in _items)
         {
            if(param1[_loc3_.itemId] === undefined)
            {
               _loc5_.push(_loc3_);
            }
         }
         var _loc11_:int = 0;
         var _loc10_:* = _loc4_;
         for each(_loc3_ in _loc4_)
         {
            addItem(_loc3_,false);
         }
         var _loc13_:int = 0;
         var _loc12_:* = _loc5_;
         for each(_loc3_ in _loc5_)
         {
            removeItem(_loc3_,false);
         }
         if(param2)
         {
            refreshList();
         }
      }
      
      public function getItem(param1:String) : IListItem
      {
         if(_items.getData(param1) === null)
         {
            return null;
         }
         return _items.getData(param1);
      }
      
      public function get itemCount() : int
      {
         return _items.length;
      }
      
      public function get currentItemCount() : int
      {
         return _currentListItems.length;
      }
      
      public function get selectedItems() : Vector.<IListItem>
      {
         return _selectedItems;
      }
      
      public function set selectedItem(param1:IListItem) : void
      {
         var _loc2_:ListLine = getLineForItem(param1);
         if(_loc2_ && _selectedLine != _loc2_)
         {
            selectLine(_loc2_);
         }
      }
      
      public function get selectedItem() : IListItem
      {
         if(selectedItems.length == 1)
         {
            return selectedItems[0];
         }
         return null;
      }
      
      public function get selectedItemAsObject() : Object
      {
         if(!selectedItem)
         {
            return null;
         }
         return selectedItem as Object;
      }
      
      public function addSelectedItem(param1:IListItem, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(_selectedItems.indexOf(param1) != -1)
         {
            _loc3_ = _selectedItems.indexOf(param1);
            _selectedItems.splice(_loc3_,1);
            return;
         }
         _selectedItems.push(param1);
         if(param2)
         {
            refreshList(false);
         }
      }
      
      public function clearSelection() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.highlight(false);
         }
         clearSelectedItems();
         _selectedLine = null;
         refreshList(false);
      }
      
      public function clearSelectedItems() : void
      {
         _selectedItems = new Vector.<IListItem>();
      }
      
      public function get currentFilter() : IListFilter
      {
         return _filter;
      }
      
      public function set currentFilter(param1:IListFilter) : void
      {
         _filter = param1;
         clearSelectedItems();
         _selectedLine = null;
         refreshList(false);
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         if(_selectedLine != null && selectedItems.length == 0)
         {
            addSelectedItem(_selectedLine.item);
         }
         _currentListItems = getFilteredItems(_items);
         if(_hasItemChanges && _sortFunction != null)
         {
            _currentListItems.sort(_sortFunction);
         }
         if(_btnScrollUp && _btnScrollDown)
         {
            _btnScrollUp.visible = _currentListItems.length > _lines.length;
            _btnScrollDown.visible = _currentListItems.length > _lines.length;
         }
         renderList();
         if(selectedItems.length > 0)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _lines;
            for each(var _loc2_ in _lines)
            {
               _loc2_.highlight(selectedItems.indexOf(_loc2_.item) != -1);
            }
         }
         else if(_lines.length > 0 && _lines[0].item != null && param1)
         {
            selectLine(_lines[0]);
         }
         if(_onListUpdated != null)
         {
            _onListUpdated.dispatch(this);
         }
      }
      
      public function getLineForItem(param1:IListItem) : ListLine
      {
         var _loc4_:int = 0;
         var _loc3_:* = _lines;
         for each(var _loc2_ in _lines)
         {
            if(_loc2_.item == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function get selectedItemCount() : int
      {
         return _selectedItems.length;
      }
      
      protected function onMouseWheelEvent(param1:InteractionEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1);
         }
         else
         {
            scrollDown(1);
         }
      }
      
      protected function addExistingLine(param1:IListItem, param2:int, param3:IDisplayObject) : ListLine
      {
         item = param1;
         index = param2;
         content = param3;
         var existingLine:ListLine = new _listLineClass(item,index,content);
         existingLine.onClick.add(function(param1:InteractionEvent):void
         {
            selectLine(param1.target as ListLine);
         });
         existingLine.onDoubleClick.add(function(param1:InteractionEvent):void
         {
            doubleClickLine(param1.target as ListLine);
         });
         _lines.push(existingLine);
         return existingLine;
      }
      
      protected function addNewLine(param1:IListItem, param2:int) : ListLine
      {
         item = param1;
         index = param2;
         var newLine:ListLine = new _listLineClass(item,index);
         newLine.onClick.add(function(param1:InteractionEvent):void
         {
            selectLine(param1.target as ListLine);
         });
         newLine.onDoubleClick.add(function(param1:InteractionEvent):void
         {
            doubleClickLine(param1.target as ListLine);
         });
         _lines.push(newLine);
         return newLine;
      }
      
      protected function onClickScrollUp(param1:InteractionEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         scrollUp(scrollStep);
      }
      
      protected function onClickScrollDown(param1:InteractionEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         scrollDown(scrollStep);
      }
      
      protected function scrollUp(param1:int) : void
      {
         throw new NotImplementedException();
      }
      
      protected function scrollDown(param1:int) : void
      {
         throw new NotImplementedException();
      }
      
      protected function renderList() : void
      {
         throw new NotImplementedException();
      }
      
      protected function getFilteredItems(param1:StringMap) : Vector.<IListItem>
      {
         var _loc2_:Vector.<IListItem> = new Vector.<IListItem>();
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(!currentFilter)
            {
               _loc2_.push(_loc3_);
            }
            else if(currentFilter.matches(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      protected function selectLine(param1:ListLine) : void
      {
         if(!enabled)
         {
            return;
         }
         _selectedLine = param1;
         if(_selectedLine != null)
         {
            if(!_multiSelect || !InputCore.current.keyboard.isCtrlPressed)
            {
               clearSelectedItems();
            }
            addSelectedItem(_selectedLine.item);
         }
         var _loc4_:int = 0;
         var _loc3_:* = _lines;
         for each(var _loc2_ in _lines)
         {
            _loc2_.highlight(selectedItems.indexOf(_loc2_.item) != -1);
         }
         if(_onSelectionChanged != null)
         {
            _onSelectionChanged.dispatch(_selectedLine);
         }
      }
      
      protected function doubleClickLine(param1:ListLine) : void
      {
         if(!enabled)
         {
            return;
         }
         clearSelectedItems();
         selectLine(param1);
         if(_onLineDoubleClick != null)
         {
            _onLineDoubleClick.dispatch(param1);
         }
      }
   }
}
