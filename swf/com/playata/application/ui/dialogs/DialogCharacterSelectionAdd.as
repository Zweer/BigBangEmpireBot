package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.account_settings.UiCharacterSelectionAddExisting;
   import com.playata.application.ui.elements.account_settings.UiCharacterSelectionCreateNew;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCharacterSelectionAddGeneric;
   
   public class DialogCharacterSelectionAdd extends UiDialog
   {
       
      
      private var _btnTabNew:UiTabButton = null;
      
      private var _btnTabExisting:UiTabButton = null;
      
      private var _btnOk:UiTextButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _createNew:UiCharacterSelectionCreateNew = null;
      
      private var _addExisting:UiCharacterSelectionAddExisting = null;
      
      public function DialogCharacterSelectionAdd(param1:Vector.<String>)
      {
         var _loc2_:SymbolDialogCharacterSelectionAddGeneric = new SymbolDialogCharacterSelectionAddGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/character_selection/title");
         _btnTabNew = new UiTabButton(_loc2_.btnTabNew,LocText.current.text("dialog/character_selection_add/button_new"),"",onClickTab);
         _btnTabExisting = new UiTabButton(_loc2_.btnTabExisting,LocText.current.text("dialog/character_selection_add/button_existing"),"",onClickTab);
         _btnOk = new UiTextButton(_loc2_.btnOk,LocText.current.text("dialog/new_character/create_character"),"",onClickOk);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _createNew = new UiCharacterSelectionCreateNew(_loc2_.createNew,param1,this);
         _addExisting = new UiCharacterSelectionAddExisting(_loc2_.addExisting,param1,this);
         switchTab(_btnTabNew);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnOk.dispose();
         _btnOk = null;
         _btnTabNew.dispose();
         _btnTabNew = null;
         _btnTabExisting.dispose();
         _btnTabExisting = null;
         _createNew.dispose();
         _createNew = null;
         _addExisting.dispose();
         _addExisting = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickOk(param1:InteractionEvent) : void
      {
         if(_btnTabNew.tabbed)
         {
            _createNew.onAction();
         }
         else
         {
            _addExisting.onAction();
         }
      }
      
      private function onClickTab(param1:InteractionEvent) : void
      {
         switchTab(param1.target as UiTabButton);
      }
      
      private function switchTab(param1:UiTabButton) : void
      {
         _btnTabNew.tabbed = param1 == _btnTabNew;
         _btnTabExisting.tabbed = param1 == _btnTabExisting;
         _createNew.content.visible = _btnTabNew.tabbed;
         _addExisting.content.visible = _btnTabExisting.tabbed;
         if(_btnTabNew.tabbed)
         {
            _btnOk.caption = LocText.current.text("dialog/new_character/create_character");
         }
         else
         {
            _btnOk.caption = LocText.current.text("dialog/character_selection_add/add_character");
         }
      }
   }
}
