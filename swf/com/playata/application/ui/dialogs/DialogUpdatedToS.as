package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUpdatedToSGeneric;
   
   public class DialogUpdatedToS extends UiDialog
   {
       
      
      private var _btnContinue:UiTextButton = null;
      
      public function DialogUpdatedToS()
      {
         var _loc1_:SymbolDialogUpdatedToSGeneric = new SymbolDialogUpdatedToSGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/tos_update/title");
         _loc1_.txtInfo.htmlText = LocText.current.text("dialog/tos_update/info",AppConfig.urlToS);
         _loc1_.txtInfo.interactionEnabled = true;
         _loc1_.txtAge.text = LocText.current.text("dialog/register_user_new/age_confirmation");
         _btnContinue = new UiTextButton(_loc1_.btnContinue,LocText.current.text("dialog/tos_update_new/button_continue"),"",onClickContinue);
         _btnContinue.changeWidth(300);
         _btnContinue.fitText();
      }
      
      override public function dispose() : void
      {
         _btnContinue.dispose();
         _btnContinue = null;
         super.dispose();
      }
      
      private function onClickContinue(param1:InteractionEvent) : void
      {
         User.current.setLatestToS(onLatestToSSet);
      }
      
      private function onLatestToSSet(param1:Boolean) : void
      {
         if(param1)
         {
            close();
         }
         else
         {
            Environment.reportError("errToSNotAccepted");
         }
      }
   }
}
