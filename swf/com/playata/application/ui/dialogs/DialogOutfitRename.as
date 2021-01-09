package com.playata.application.ui.dialogs
{
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutfitRenameGeneric;
   
   public class DialogOutfitRename extends UiDialog
   {
       
      
      private var _outfit:Outfit = null;
      
      private var _onRenameFunction:Function = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnRename:UiTextButton = null;
      
      public function DialogOutfitRename(param1:Outfit, param2:Function)
      {
         var _loc3_:SymbolDialogOutfitRenameGeneric = new SymbolDialogOutfitRenameGeneric();
         super(_loc3_);
         _outfit = param1;
         _onRenameFunction = param2;
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/outfit_rename/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/outfit_rename/info_text");
         _loc3_.txtNameCaption.text = LocText.current.text("dialog/outfit_rename/name_caption");
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnRename = new UiTextButton(_loc3_.btnRename,LocText.current.text("dialog/outfit_rename/button_rename"),"",onClickRename);
         _loc3_.inputName.text = _outfit.name;
         _tabObjects.push(_loc3_.inputName);
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRename.dispose();
         _btnRename = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogOutfitRenameGeneric = _vo as SymbolDialogOutfitRenameGeneric;
         if(StringUtil.isEmpty(_loc1_.inputName.text))
         {
            Dialog.focus = _loc1_.inputName;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogOutfitRenameGeneric = _vo as SymbolDialogOutfitRenameGeneric;
         if(StringUtil.isEmpty(_loc2_.inputName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/outfit_rename/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            _onRenameFunction(_loc2_.inputName.text);
            close();
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnRename;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
