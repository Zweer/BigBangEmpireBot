package com.playata.application.ui.elements.item
{
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternContentGeneric;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternLineGeneric;
   
   public class UiItemPatternContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 7;
      
      private static const SCROLL_VALUE:int = 4;
       
      
      private var _content:SymbolItemPatternContentGeneric = null;
      
      private var _dialog:DialogSewingMachine = null;
      
      private var _itemPatternInfo:UiItemPatternInfo = null;
      
      private var _lines:Vector.<UiItemPatternInfoLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _itemPatternFilter:UiItemPatternFilter = null;
      
      private var _currentItemPattern:ItemPattern = null;
      
      private var _offset:int = 0;
      
      private var _itemPattern:Vector.<ItemPattern> = null;
      
      private var _itemPatternFiltered:Vector.<ItemPattern> = null;
      
      public function UiItemPatternContent(param1:SymbolItemPatternContentGeneric, param2:DialogSewingMachine)
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _content = param1;
         super(_content);
         _dialog = param2;
         _itemPattern = ItemPatterns.instance.itemPatterns;
         _itemPatternInfo = new UiItemPatternInfo(_content.info,param2);
         _lines = new Vector.<UiItemPatternInfoLine>();
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc3_ = _content.getChildByName("line" + _loc4_) as SymbolItemPatternLineGeneric;
            _lines.push(new UiItemPatternInfoLine(_loc3_,_loc4_,onSelectLine));
            _loc4_++;
         }
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnFilter = new UiButton(_content.btnFilter,"",onClickFilter);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _content.btnFilter.iconExclamationMark.visible = UiItemPatternFilter.isFilterActive;
         _itemPatternFilter = new UiItemPatternFilter(_content.itemPatternFilter,onFilterChanged);
         _content.txtNoPatterns.text = LocText.current.text("dialog/item_pattern/no_patterns");
         _content.txtNoPatterns.visible = false;
         onMouseWheel.add(handleMouseWheel);
      }
      
      public function show() : void
      {
         _content.visible = true;
         refreshList(true);
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnFilter.dispose();
         _btnFilter = null;
         _itemPatternFilter.dispose();
         _itemPatternFilter = null;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines.length = 0;
         _lines = null;
         _content = null;
         _dialog = null;
         super.dispose();
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onSelectLine(param1:UiItemPatternInfoLine) : void
      {
         var _loc2_:int = 0;
         if(param1 && param1.itemPattern)
         {
            _currentItemPattern = param1.itemPattern;
         }
         _itemPatternInfo.refresh(_currentItemPattern);
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentItemPattern == _lines[_loc2_].itemPattern);
            _loc2_++;
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(4,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(4,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_offset == _itemPatternFiltered.length - 7)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _itemPatternFiltered.length - 7)
         {
            _offset = _itemPatternFiltered.length - 7;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _itemPatternFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         var _loc1_:int = 0;
         _offset = 0;
         refreshFilteredList();
         if(_itemPatternFiltered.indexOf(_currentItemPattern) < 0)
         {
            _currentItemPattern = null;
         }
         else if(_itemPatternFiltered.indexOf(_currentItemPattern) > 7)
         {
            _offset = Math.min(_itemPatternFiltered.indexOf(_currentItemPattern) - 7 / 2,_itemPatternFiltered.length - 7);
         }
         _loc1_ = 0;
         while(_loc1_ < _itemPattern.length)
         {
            _itemPattern[_loc1_].resetItemPatternsFiltered();
            _loc1_++;
         }
         refreshList(true,true);
      }
      
      private function refreshFilteredList() : void
      {
         var _loc1_:int = 0;
         if(!_itemPatternFiltered)
         {
            _itemPatternFiltered = new Vector.<ItemPattern>();
         }
         else
         {
            _itemPatternFiltered.length = 0;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemPattern.length)
         {
            if(UiItemPatternFilter.isAllowed(_itemPattern[_loc1_]))
            {
               _itemPatternFiltered.push(_itemPattern[_loc1_]);
            }
            _loc1_++;
         }
         _content.btnFilter.iconExclamationMark.visible = UiItemPatternFilter.isFilterActive;
      }
      
      public function refreshList(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!_content)
         {
            return;
         }
         var _loc3_:int = 0;
         if(!_itemPatternFiltered)
         {
            refreshFilteredList();
         }
         if(_itemPatternFiltered.length <= 0)
         {
            _content.txtNoPatterns.visible = true;
            _loc3_ = 0;
            while(_loc3_ < _lines.length)
            {
               _lines[_loc3_].visible = false;
               _loc3_++;
            }
            _itemPatternInfo.hide();
            _btnScrollUp.visible = false;
            _btnScrollDown.visible = false;
            _content.txtCount.visible = false;
            return;
         }
         _content.txtNoPatterns.visible = false;
         _loc3_ = 0;
         while(_loc3_ < _lines.length)
         {
            _lines[_loc3_].visible = true;
            _loc3_++;
         }
         _itemPatternInfo.show();
         _content.txtCount.visible = true;
         _content.txtCount.text = LocText.current.text("dialog/sewing_machine/collected_item_pattern",ItemPatterns.instance.getFullyCollectedItemPatternsCount(User.current.character.gender),ItemPatterns.instance.itemPatterns.length);
         _btnScrollUp.visible = _itemPatternFiltered.length > 7;
         _btnScrollDown.visible = _itemPatternFiltered.length > 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _itemPatternFiltered.length - 7;
         _loc3_ = 0;
         while(_loc3_ < _lines.length)
         {
            _lines[_loc3_].refresh(_itemPatternFiltered.length >= _offset + _loc3_ + 1?_itemPatternFiltered[_offset + _loc3_]:null,_loc3_ + 1);
            _loc3_++;
         }
         if(_currentItemPattern != null)
         {
            _loc3_ = 0;
            while(_loc3_ < _lines.length)
            {
               if(_lines[_loc3_].itemPattern && _lines[_loc3_].itemPattern.identifier == _currentItemPattern.identifier)
               {
                  onSelectLine(_lines[_loc3_]);
                  break;
               }
               _loc3_++;
            }
         }
         else if(_lines[0].itemPattern != null && param1)
         {
            onSelectLine(_lines[0]);
         }
         _itemPatternInfo.refresh(_currentItemPattern,param2);
      }
   }
}
