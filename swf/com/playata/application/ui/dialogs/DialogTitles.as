package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CTitle;
   import com.playata.application.data.marriage.Marriage;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.application.data.titles.BlankTitle;
   import com.playata.application.data.titles.Title;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.title.UiTitleLine;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogTitlesGeneric;
   
   public class DialogTitles extends UiDialog
   {
      
      public static const SCROLL_VALUE:int = 5;
      
      public static var MAX_LINES:int = 10;
       
      
      private var _btnClose:UiButton;
      
      private var _btnScrollUp:UiButton;
      
      private var _btnScrollDown:UiButton;
      
      private var _btnAvailableOnly:UiCheckBox;
      
      private var _offset:int;
      
      private var _line1:UiTitleLine;
      
      private var _line2:UiTitleLine;
      
      private var _line3:UiTitleLine;
      
      private var _line4:UiTitleLine;
      
      private var _line5:UiTitleLine;
      
      private var _line6:UiTitleLine;
      
      private var _line7:UiTitleLine;
      
      private var _line8:UiTitleLine;
      
      private var _line9:UiTitleLine;
      
      private var _line10:UiTitleLine;
      
      private var _lines:Vector.<UiTitleLine>;
      
      private var _titles:Vector.<Title>;
      
      private var _character:Character;
      
      private var _onCloseCallback:Function;
      
      private var _selectedTitle:String;
      
      private var _marriageTitles:Vector.<Title>;
      
      public function DialogTitles(param1:Character, param2:Function = null)
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         _marriageTitles = new Vector.<Title>();
         _onCloseCallback = param2;
         var _loc4_:SymbolDialogTitlesGeneric = new SymbolDialogTitlesGeneric();
         super(_loc4_);
         _character = param1;
         _selectedTitle = _character.getString("title");
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/titles/title");
         _loc4_.txtNoTitles.text = LocText.current.text("dialog/titles/no_titles");
         _loc4_.txtTitleCaption.text = LocText.current.text("dialog/titles/title_caption");
         _loc4_.txtSourceCaption.text = LocText.current.text("dialog/titles/source_caption");
         _loc4_.txtAvailableOnly.text = LocText.current.text("dialog/titles/available_only");
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc4_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc4_.btnDown,"",onClickScrollDown);
         _btnAvailableOnly = new UiCheckBox(_loc4_.checkAvailableOnly,User.current.showOnlyAvailableTitles,LocText.current.text("dialog/titles/available_only_tooltip"),onAvailableOnlyClicked,null,_loc4_.txtAvailableOnly);
         _offset = 0;
         _line1 = new UiTitleLine(_loc4_.title1,onTitleSelected);
         _line2 = new UiTitleLine(_loc4_.title2,onTitleSelected);
         _line3 = new UiTitleLine(_loc4_.title3,onTitleSelected);
         _line4 = new UiTitleLine(_loc4_.title4,onTitleSelected);
         _line5 = new UiTitleLine(_loc4_.title5,onTitleSelected);
         _line6 = new UiTitleLine(_loc4_.title6,onTitleSelected);
         _line7 = new UiTitleLine(_loc4_.title7,onTitleSelected);
         _line8 = new UiTitleLine(_loc4_.title8,onTitleSelected);
         _line9 = new UiTitleLine(_loc4_.title9,onTitleSelected);
         _line10 = new UiTitleLine(_loc4_.title10,onTitleSelected);
         _lines = new <UiTitleLine>[_line1,_line2,_line3,_line4,_line5,_line6,_line7,_line8,_line9,_line10];
         var _loc3_:Vector.<Marriage> = Marriages.instance.getMarriagesOfCharacterId(_character.id);
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = new Title("title_marriage_" + _loc3_[_loc5_].id,CTitle.fromId("title_marriage"));
            _loc6_.isNew = _loc3_[_loc5_].isNew;
            _marriageTitles.push(_loc6_);
            _loc5_++;
         }
         onMouseWheel.add(handleMouseWheel);
         onAvailableOnlyClicked(_btnAvailableOnly.checked,false);
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
      
      private function onAvailableOnlyClicked(param1:Boolean, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            User.current.setSettingValue("only_available_titles",param1);
         }
         if(param1)
         {
            _titles = Titles.instance.availableTitles(_character);
         }
         else
         {
            _titles = Titles.instance.allTitles();
         }
         _loc3_ = 0;
         while(_loc3_ < _titles.length)
         {
            if(_titles[_loc3_].identifier == "title_beta_user" && !_character.hasTitle(_titles[_loc3_]))
            {
               _titles.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _marriageTitles.length)
         {
            _titles.unshift(_marriageTitles[_loc3_]);
            _loc3_++;
         }
         _titles.unshift(new BlankTitle());
         if(_offset > titleCount - MAX_LINES)
         {
            _offset = Math.max(0,titleCount - MAX_LINES);
         }
         refreshList();
      }
      
      private function onTitleSelected(param1:Title = null, param2:Boolean = false) : void
      {
         _selectedTitle = param1.identifier;
         refreshList();
         if(param2)
         {
            onClickClose();
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _line1.dispose();
         _line2.dispose();
         _line3.dispose();
         _line4.dispose();
         _line5.dispose();
         _line6.dispose();
         _line7.dispose();
         _line8.dispose();
         _line9.dispose();
         _line10.dispose();
         _btnAvailableOnly.dispose();
         _marriageTitles.length = 0;
         _marriageTitles = null;
         super.dispose();
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
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
         _offset = _offset + param1;
         if(_offset > titleCount - MAX_LINES)
         {
            _offset = titleCount - MAX_LINES;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get titleCount() : int
      {
         return _titles.length;
      }
      
      private function refreshList() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:SymbolDialogTitlesGeneric = _vo as SymbolDialogTitlesGeneric;
         _loc2_ = 0;
         while(_loc2_ < 10)
         {
            _loc3_ = _loc2_ + _offset;
            if(_loc3_ < titleCount)
            {
               _lines[_loc2_].refresh(_titles[_loc3_],_character,_loc2_ + 1,_selectedTitle);
            }
            else
            {
               _lines[_loc2_].hide();
            }
            _loc2_++;
         }
         _loc1_.txtNoTitles.visible = titleCount == 0;
         _btnScrollUp.visible = titleCount > MAX_LINES;
         _btnScrollDown.visible = titleCount > MAX_LINES;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < titleCount - MAX_LINES;
         _btnScrollUp.tooltip = LocText.current.text("dialog/titles/scroll_position",Math.ceil(_offset / MAX_LINES + 1).toString(),Math.ceil(titleCount / MAX_LINES).toString());
         _btnScrollDown.tooltip = _btnScrollUp.tooltip;
         if(_btnAvailableOnly.checked)
         {
            _loc1_.txtTitleInfo.text = LocText.current.text("dialog/titles/info_available",titleCount - 1);
         }
         else
         {
            _loc1_.txtTitleInfo.text = LocText.current.text("dialog/titles/info_total_available",Titles.instance.availableTitles(_character).length,titleCount - 1);
         }
      }
      
      private function onClickClose(param1:InteractionEvent = null) : void
      {
         if(_character.getString("title") == _selectedTitle)
         {
            close(_onCloseCallback);
         }
         else
         {
            Environment.application.sendActionRequest("useTitle",{"title":_selectedTitle},handleRequests);
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         var _loc3_:int = 0;
         _character.resetNewTitles();
         var _loc2_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < _marriageTitles.length)
         {
            if(_marriageTitles[_loc3_].isNew)
            {
               _loc2_ = true;
               break;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            Environment.application.sendActionRequest("markAllMarriagesAsSeen",{},handleRequests);
         }
         else
         {
            super.close(param1);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "useTitle":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close(_onCloseCallback);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "markAllMarriagesAsSeen":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = 0;
                  while(_loc2_ < _marriageTitles.length)
                  {
                     _marriageTitles[_loc2_].isNew = false;
                     _loc2_++;
                  }
                  close(_onCloseCallback);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose();
      }
   }
}
