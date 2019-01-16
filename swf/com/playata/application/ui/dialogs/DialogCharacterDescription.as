package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.IScrollable;
   import com.playata.framework.display.ui.controls.ITextField;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCharacterDescriptionGeneric;
   
   public class DialogCharacterDescription extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _btnTabDescription:UiTabButton = null;
      
      private var _btnTabNote:UiTabButton = null;
      
      private var _ourCharacter:Boolean = false;
      
      private var _currentDescriptionText:String = null;
      
      private var _currentNoteText:String = null;
      
      public function DialogCharacterDescription(param1:Character)
      {
         var _loc3_:SymbolDialogCharacterDescriptionGeneric = new SymbolDialogCharacterDescriptionGeneric();
         super(_loc3_);
         _queued = false;
         _ourCharacter = param1 == User.current.character;
         _currentDescriptionText = param1.description;
         _loc3_.txtText.text = "";
         _loc3_.inputText.text = "";
         var _loc2_:Boolean = _ourCharacter;
         var _loc4_:IScrollable = _loc2_ || !Environment.info.isNativeMobile?_loc3_.inputText:_loc3_.txtText;
         _loc3_.inputText.readOnly = !_loc2_;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/character_description/title");
         if(_loc2_)
         {
            _loc3_.inputText.onChange.add(onUpdateDescription);
         }
         _scrollBar = new UiScrollBar(_loc3_.scrollKnob,_loc3_.scrollLine,_loc4_);
         _loc4_.verticalScrollBar = _scrollBar;
         _scrollBar.refresh();
         if(Environment.info.isNativeMobile)
         {
            textField.width = textField.width + 15;
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnSave = new UiTextButton(_loc3_.btnSave,LocText.current.text("dialog/character_description/button_save"),"",onClickSave);
         _btnTabDescription = new UiTabButton(_loc3_.btnTabDescription,LocText.current.text("dialog/character_description/button_tab_description"),LocText.current.text("dialog/character_description/button_tab_description_tooltip"),onTabSwitch);
         _btnTabNote = new UiTabButton(_loc3_.btnTabNote,LocText.current.text("dialog/character_description/button_tab_note"),LocText.current.text("dialog/character_description/button_tab_note_tooltip"),onTabSwitch);
         _btnSave.visible = _loc2_;
         if(!_loc2_)
         {
            _btnTabDescription.visible = false;
            _btnTabNote.visible = false;
         }
         else
         {
            _currentNoteText = param1.note;
         }
         if(_loc2_)
         {
            _tabObjects.push(textField);
         }
         tabSwitch(_btnTabDescription);
         if(_loc2_)
         {
            setFocus();
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _btnTabDescription.dispose();
         _btnTabDescription = null;
         _btnTabNote.dispose();
         _btnTabNote = null;
         _scrollBar.dispose();
         _scrollBar = null;
         super.dispose();
      }
      
      private function onUpdateDescription(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogCharacterDescriptionGeneric = _vo as SymbolDialogCharacterDescriptionGeneric;
         if(!_btnTabDescription.tabbed)
         {
            _currentNoteText = textField.text;
            return;
         }
         _currentDescriptionText = textField.text;
      }
      
      private function onTabSwitch(param1:InteractionEvent) : void
      {
         tabSwitch(param1.target);
      }
      
      private function get textField() : ITextField
      {
         var _loc1_:SymbolDialogCharacterDescriptionGeneric = _vo as SymbolDialogCharacterDescriptionGeneric;
         return _ourCharacter || !Environment.info.isNativeMobile?_loc1_.inputText:_loc1_.txtText;
      }
      
      private function tabSwitch(param1:IInteractionTarget) : void
      {
         var _loc2_:SymbolDialogCharacterDescriptionGeneric = _vo as SymbolDialogCharacterDescriptionGeneric;
         _btnTabDescription.tabbed = _btnTabDescription == param1;
         _btnTabNote.tabbed = _btnTabNote == param1;
         if(_btnTabDescription.tabbed)
         {
            textField.text = _currentDescriptionText;
            if(_ourCharacter)
            {
               _loc2_.inputText.selectRange(_loc2_.inputText.text.length,_loc2_.inputText.text.length);
            }
            _scrollBar.refresh();
         }
         else
         {
            textField.text = _currentNoteText;
            _scrollBar.refresh();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogCharacterDescriptionGeneric = _vo as SymbolDialogCharacterDescriptionGeneric;
         Environment.application.sendActionRequest("setCharacterDescription",{
            "description":_currentDescriptionText,
            "note":_currentNoteText
         },handleRequests);
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogCharacterDescriptionGeneric = _vo as SymbolDialogCharacterDescriptionGeneric;
         Dialog.focus = _loc1_.inputText;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterDescription" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errSetDescriptionTooLong")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/character_description/description_too_long_title"),LocText.current.text("dialog/character_description/description_too_long_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(param1.error == "errSetNoteTooLong")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/character_description/note_too_long_title"),LocText.current.text("dialog/character_description/note_too_long_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
