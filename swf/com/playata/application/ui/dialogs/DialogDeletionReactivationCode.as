package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDeletionReactivationCodeGeneric;
   
   public class DialogDeletionReactivationCode extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      public function DialogDeletionReactivationCode(param1:String)
      {
         var _loc2_:SymbolDialogDeletionReactivationCodeGeneric = new SymbolDialogDeletionReactivationCodeGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/reactivation_code/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/reactivation_code/info");
         _loc2_.txtReactivationCodeCaption.text = LocText.current.text("dialog/reactivation_code/code_caption");
         _loc2_.txtReactivationCode.text = param1;
         _loc2_.txtReactivationCode.readOnly = true;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
