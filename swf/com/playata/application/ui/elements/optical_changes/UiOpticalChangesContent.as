package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesContentGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesLineGeneric;
   
   public class UiOpticalChangesContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 7;
      
      private static const SCROLL_VALUE:int = 2;
       
      
      private var _content:SymbolOpticalChangesContentGeneric = null;
      
      private var _dialog:DialogOpticalChanges = null;
      
      private var _opticalChangesInfo:UiOpticalChangeInfo = null;
      
      private var _lines:Vector.<UiOpticalChangeInfoLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnTabDecoration:UiTabButton = null;
      
      private var _btnTabCharacter:UiTabButton = null;
      
      private var _currentOpticalChangeCategorie:OpticalChangeCategorie = null;
      
      private var _offset:int = 0;
      
      private var _opticalChangeDecoCategories:Vector.<OpticalChangeCategorie>;
      
      private var _opticalChangeCharacterCategories:Vector.<OpticalChangeCategorie>;
      
      public function UiOpticalChangesContent(param1:SymbolOpticalChangesContentGeneric, param2:DialogOpticalChanges)
      {
         var _loc3_:* = null;
         _opticalChangeDecoCategories = new Vector.<OpticalChangeCategorie>();
         _opticalChangeCharacterCategories = new Vector.<OpticalChangeCategorie>();
         _content = param1;
         super(_content);
         _dialog = param2;
         var _loc5_:Vector.<OpticalChangeCategorie> = OpticalChanges.instance.opticalChangeCategories;
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(_loc5_[_loc4_].category == 1)
            {
               _opticalChangeDecoCategories.push(_loc5_[_loc4_]);
            }
            else
            {
               _opticalChangeCharacterCategories.push(_loc5_[_loc4_]);
            }
            _loc4_++;
         }
         _opticalChangesInfo = new UiOpticalChangeInfo(_content.info,param2);
         _lines = new Vector.<UiOpticalChangeInfoLine>();
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc3_ = _content.getChildByName("line" + _loc4_) as SymbolOpticalChangesLineGeneric;
            _lines.push(new UiOpticalChangeInfoLine(_loc3_,_loc4_,onSelectLine));
            _loc4_++;
         }
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnTabDecoration = new UiTabButton(_content.btnTabDeco,LocText.current.text("dialog/optical_changes/btn_tab_deco"),"",onClickCategory);
         _btnTabDecoration.tabbed = true;
         _btnTabCharacter = new UiTabButton(_content.btnTabCharacter,LocText.current.text("dialog/optical_changes/btn_tab_character"),"",onClickCategory);
         _btnTabCharacter.tabbed = false;
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
      
      private function onSelectLine(param1:UiOpticalChangeInfoLine, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         if(param1 && param1.opticalChangeCategorie)
         {
            _currentOpticalChangeCategorie = param1.opticalChangeCategorie;
         }
         _opticalChangesInfo.refresh(_currentOpticalChangeCategorie,param2);
         _loc3_ = 0;
         while(_loc3_ < _lines.length)
         {
            _lines[_loc3_].highlight(_currentOpticalChangeCategorie == _lines[_loc3_].opticalChangeCategorie);
            _loc3_++;
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
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
         if(_offset == opticalChangeCategories.length - 7)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > opticalChangeCategories.length - 7)
         {
            _offset = opticalChangeCategories.length - 7;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function onClickCategory(param1:InteractionEvent) : void
      {
         if(param1.target == _btnTabDecoration)
         {
            if(_btnTabDecoration.tabbed)
            {
               return;
            }
            _btnTabDecoration.tabbed = true;
            _btnTabCharacter.tabbed = false;
         }
         else
         {
            if(_btnTabCharacter.tabbed)
            {
               return;
            }
            _btnTabDecoration.tabbed = false;
            _btnTabCharacter.tabbed = true;
         }
         _offset = 0;
         _currentOpticalChangeCategorie = null;
         refreshList(true);
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!_content)
         {
            return;
         }
         _content.txtCount.text = LocText.current.text("dialog/optical_changes/collected_optical_changes",OpticalChanges.instance.getFullyCollectedOpticalChangeCategoriesCount(opticalChangeCategory),opticalChangeCategories.length);
         _btnScrollUp.visible = opticalChangeCategories.length > 7;
         _btnScrollDown.visible = opticalChangeCategories.length > 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < opticalChangeCategories.length - 7;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].refresh(opticalChangeCategories.length >= _offset + _loc2_ + 1?opticalChangeCategories[_offset + _loc2_]:null,_loc2_ + 1);
            _loc2_++;
         }
         if(_currentOpticalChangeCategorie != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].opticalChangeCategorie && _lines[_loc2_].opticalChangeCategorie.type == _currentOpticalChangeCategorie.type)
               {
                  onSelectLine(_lines[_loc2_]);
                  break;
               }
               _loc2_++;
            }
         }
         else if(_lines[0].opticalChangeCategorie != null && param1)
         {
            onSelectLine(_lines[0]);
         }
         _opticalChangesInfo.refresh(_currentOpticalChangeCategorie);
      }
      
      private function get opticalChangeCategories() : Vector.<OpticalChangeCategorie>
      {
         if(_btnTabDecoration.tabbed)
         {
            return _opticalChangeDecoCategories;
         }
         return _opticalChangeCharacterCategories;
      }
      
      private function get opticalChangeCategory() : int
      {
         if(_btnTabDecoration.tabbed)
         {
            return 1;
         }
         return 2;
      }
   }
}
