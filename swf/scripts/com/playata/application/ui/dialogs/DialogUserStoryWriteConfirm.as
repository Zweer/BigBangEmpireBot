package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStoryWriteConfirmGeneric;
   
   public class DialogUserStoryWriteConfirm extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _btnSave:UiPremiumButton = null;
      
      private var _btnInfoToS:UiButton = null;
      
      private var _btnInfo:UiButton = null;
      
      private var _onSaveCallback:Function = null;
      
      public function DialogUserStoryWriteConfirm(param1:Function)
      {
         var _loc2_:SymbolDialogUserStoryWriteConfirmGeneric = new SymbolDialogUserStoryWriteConfirmGeneric();
         super(_loc2_);
         _queued = false;
         _onSaveCallback = param1;
         _loc2_.textTitle.text = LocText.current.text("dialog/user_story_write_confirm/title");
         _loc2_.textInfoToS.htmlText = LocText.current.text("dialog/user_story_write_confirm/info_ToS");
         _loc2_.textInfoToS.autoFontSize = true;
         _loc2_.textInfo.htmlText = LocText.current.text("dialog/user_story_write_confirm/info");
         _loc2_.textInfo.autoFontSize = true;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/user_story_write_confirm/btn_cancle"),"",onClickClose);
         _btnSave = new UiPremiumButton(_loc2_.btnCreate,CConstant.user_story_creation_cost,"",LocText.current.text("dialog/user_story_write_confirm/btn_create"),"","",onClickSave);
         _btnSave.premium = true;
         _btnInfoToS = new UiButton(_loc2_.textInfoToS,"",onClickInfoToS);
         _btnInfoToS.interactionOverMode = "none";
         _btnInfo = new UiButton(_loc2_.textInfo,"",onClickInfo);
         _btnInfo.interactionOverMode = "none";
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _btnInfoToS.dispose();
         _btnInfoToS = null;
         _btnInfo.dispose();
         _btnInfo = null;
         super.dispose();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         _onSaveCallback();
         close();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickInfoToS(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlToSUgc);
      }
      
      private function onClickInfo(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStoryUnlock());
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
