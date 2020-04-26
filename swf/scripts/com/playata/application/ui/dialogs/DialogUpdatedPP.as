package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUpdatedPPGeneric;
   
   public class DialogUpdatedPP extends UiDialog
   {
       
      
      private var _btnContinue:UiTextButton = null;
      
      public function DialogUpdatedPP()
      {
         var _loc1_:SymbolDialogUpdatedPPGeneric = new SymbolDialogUpdatedPPGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/pp_update/title");
         _loc1_.txtTerms.htmlText = LocText.current.text("dialog/pp_update/info",AppConfig.urlPolicy);
         _loc1_.txtTerms.interactionEnabled = true;
         _loc1_.txtInfo.autoFontSize = true;
         _loc1_.txtInfo.text = LocText.current.text("dialog/register_user_accept_terms/info_text");
         _btnContinue = new UiTextButton(_loc1_.btnContinue,LocText.current.text("dialog/pp_update/button_continue"),"",onClickContinue);
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
         User.current.setLatestPP(onLatestPPSet);
      }
      
      private function onLatestPPSet(param1:Boolean) : void
      {
         if(param1)
         {
            close();
         }
         else
         {
            Environment.reportError("errPPNotAccepted");
         }
      }
   }
}
