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
      
      private var _currentItemPattern:ItemPattern = null;
      
      private var _offset:int = 0;
      
      private var _itemPattern:Vector.<ItemPattern> = null;
      
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
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
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
         if(_offset == _itemPattern.length - 7)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _itemPattern.length - 7)
         {
            _offset = _itemPattern.length - 7;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!_content)
         {
            return;
         }
         _content.txtCount.text = LocText.current.text("dialog/sewing_machine/collected_item_pattern",ItemPatterns.instance.getFullyCollectedItemPatternsCount(User.current.character.gender),ItemPatterns.instance.itemPatterns.length);
         _btnScrollUp.visible = _itemPattern.length > 7;
         _btnScrollDown.visible = _itemPattern.length > 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _itemPattern.length - 7;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].refresh(_itemPattern.length >= _offset + _loc2_ + 1?_itemPattern[_offset + _loc2_]:null,_loc2_ + 1);
            _loc2_++;
         }
         if(_currentItemPattern != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].itemPattern && _lines[_loc2_].itemPattern.identifier == _currentItemPattern.identifier)
               {
                  onSelectLine(_lines[_loc2_]);
                  break;
               }
               _loc2_++;
            }
         }
         else if(_lines[0].itemPattern != null && param1)
         {
            onSelectLine(_lines[0]);
         }
         _itemPatternInfo.refresh(_currentItemPattern);
      }
   }
}
