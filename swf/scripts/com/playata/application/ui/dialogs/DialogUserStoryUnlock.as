package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStoryUnlockGeneric;
   
   public class DialogUserStoryUnlock extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnUnlock:UiTextButton = null;
      
      private var _btnToS:UiButton = null;
      
      private var _btnDeactivate:UiTextButton = null;
      
      private var _ckbAcceptTerms:UiCheckBox = null;
      
      public function DialogUserStoryUnlock()
      {
         var _loc1_:SymbolDialogUserStoryUnlockGeneric = new SymbolDialogUserStoryUnlockGeneric();
         super(_loc1_);
         _queued = false;
         if(User.current.character.userStoryActivated)
         {
            _loc1_.textTitle.text = LocText.current.text("dialog/user_story_unlock/title_unlocked");
         }
         else
         {
            _loc1_.textTitle.text = LocText.current.text("dialog/user_story_unlock/title");
         }
         _loc1_.textMessage.text = LocText.current.text("dialog/user_story_unlock/info",CConstant.user_story_creation_cost,CConstant.user_story_hall_of_fame_limit,CConstant.user_story_hall_of_fame_reward);
         _loc1_.textMessage.autoFontSize = true;
         _loc1_.txtToSLink.htmlText = "<u>" + LocText.current.text("dialog/user_story_unlock/tos_link_text") + "</u>";
         _loc1_.textDeactivate.text = LocText.current.text("dialog/user_story_settings/info_deactivate");
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnUnlock = new UiTextButton(_loc1_.btnUnlock,LocText.current.text("dialog/user_story_unlock/button_unlock"),"",onClickUnlock);
         _btnToS = new UiButton(_loc1_.txtToSLink,"",onClickToS);
         _btnToS.interactionOverMode = "none";
         _btnDeactivate = new UiTextButton(_loc1_.btnDeactivate,LocText.current.text("dialog/user_story_settings/buttonDeactivate"),"",onClickDeactivate);
         _loc1_.txtAcceptTerms.text = LocText.current.text("dialog/user_story_unlock/accept_tos");
         _loc1_.txtAcceptTerms.autoFontSize = true;
         _ckbAcceptTerms = new UiCheckBox(_loc1_.checkAcceptTerms,false,"",null,null,_loc1_.txtAcceptTerms);
         var _loc2_:* = !User.current.character.userStoryActivated;
         _btnUnlock.visible = _loc2_;
         _loc2_ = _loc2_;
         _ckbAcceptTerms.visible = _loc2_;
         _loc1_.txtAcceptTerms.visible = _loc2_;
         _loc2_ = User.current.character.userStoryActivated;
         _btnDeactivate.visible = _loc2_;
         _loc2_ = _loc2_;
         _loc1_.textDeactivate.visible = _loc2_;
         _loc1_.backgroundSeperator.visible = _loc2_;
      }
      
      override public function dispose() : void
      {
         _btnUnlock.dispose();
         _btnUnlock = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnToS.dispose();
         _btnToS = null;
         _btnDeactivate.dispose();
         _btnDeactivate = null;
         _ckbAcceptTerms.dispose();
         _ckbAcceptTerms = null;
         onMouseWheel.removeAll();
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickUnlock(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogUserStoryUnlockGeneric = _vo as SymbolDialogUserStoryUnlockGeneric;
         if(!_ckbAcceptTerms.checked)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/user_story_unlock/accept_tos_title"),LocText.current.text("dialog/user_story_unlock/accept_tos_text"),LocText.current.text("general/button_ok")));
            return;
         }
         Environment.application.sendActionRequest("activateUserStory",{},handleRequests);
      }
      
      private function onClickToS(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlToSUgc);
      }
      
      private function onClickDeactivate(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("deactivateUserStory",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "activateUserStory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  Environment.panelManager.showDialog(new DialogUserStory());
                  if(AppConfig.userStoryLocales.length > 0)
                  {
                     Environment.panelManager.showDialog(new DialogUserStorySettings(null));
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deactivateUserStory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogUserStory))
                  {
                     (Environment.panelManager.dialogManager.getVisibleDialog(DialogUserStory) as DialogUserStory).close();
                  }
                  if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogQuestBriefing))
                  {
                     (Environment.panelManager.dialogManager.getVisibleDialog(DialogQuestBriefing) as DialogQuestBriefing).close();
                  }
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
