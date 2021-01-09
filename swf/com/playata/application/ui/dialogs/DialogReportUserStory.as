package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogReportUserStoryGeneric;
   
   public class DialogReportUserStory extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnReport:UiTextButton = null;
      
      private var _btnView:UiTextButton = null;
      
      private var _btnToS:UiButton = null;
      
      private var _userStory:UserStory = null;
      
      private var _onUserStoryReportedCallback:Function = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      public function DialogReportUserStory(param1:UserStory, param2:Function = null, param3:Boolean = false)
      {
         var _loc4_:SymbolDialogReportUserStoryGeneric = new SymbolDialogReportUserStoryGeneric();
         super(_loc4_);
         _queued = false;
         _userStory = param1;
         _onUserStoryReportedCallback = param2;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/report_user_story/caption");
         _loc4_.txtInfoReport.text = LocText.current.text("dialog/report_user_story/report_info");
         _loc4_.txtInfoReport.autoFontSize = true;
         _loc4_.txtWarning.text = LocText.current.text("dialog/report_user_story/warning");
         _loc4_.txtWarning.autoFontSize = true;
         _loc4_.txtToSLink.htmlText = "<u>" + LocText.current.text("dialog/report_user_story/tos_link_text") + "</u>";
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnReport = new UiTextButton(_loc4_.btnReport,LocText.current.text("dialog/report_user_story/button_report"),"",onClickReport);
         _btnView = new UiTextButton(_loc4_.btnView,LocText.current.text("dialog/report_user_story/button_view_user_story"),"",onClickViewUserStory);
         _btnView.visible = param3;
         _btnToS = new UiButton(_loc4_.txtToSLink,"",onClickToS);
         _btnToS.interactionOverMode = "none";
         if(!_btnView.visible)
         {
            _loc4_.btnReport.x = 0;
         }
         _loc4_.inputText.text = "";
         _tabObjects.push(_loc4_.inputText);
         _scrollBar = new UiScrollBar(_loc4_.scrollKnob,_loc4_.scrollLine,_loc4_.inputText);
         _loc4_.inputText.verticalScrollBar = _scrollBar;
         _loc4_.inputText.text = LocText.current.text("dialog/report_user_story/report_input_text");
         _loc4_.inputText.onClick.add(handleReportInputClick);
         if(platform.isSSO)
         {
            _loc4_.txtInfoMail.text = LocText.current.text("dialog/report_user_story/text_mail");
            _loc4_.txtInfoMail.autoFontSize = true;
            _loc4_.txtMail.text = LocText.current.text("dialog/report_user_story/mail_caption");
            _loc4_.txtMail.autoFontSize = true;
            _loc4_.inputMail.text = "";
            _tabObjects.push(_loc4_.inputMail);
         }
         else
         {
            _loc4_.txtInfoMail.visible = false;
            _loc4_.txtMail.visible = false;
            _loc4_.inputMail.visible = false;
            _loc4_.backgroundGuildPage.visible = false;
            _loc4_.btnReport.y = _loc4_.btnReport.y - 100;
            _loc4_.btnView.y = _loc4_.btnView.y - 100;
            _loc4_.dialogBackground.height = _loc4_.dialogBackground.height - 100;
            _yOffset = _yOffset + 50;
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnReport.dispose();
         _btnReport = null;
         _btnView.dispose();
         _btnView = null;
         _scrollBar.dispose();
         _scrollBar = null;
         _btnToS.dispose();
         _btnToS = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         var _loc2_:String = User.current.email;
         var _loc3_:SymbolDialogReportUserStoryGeneric = _vo as SymbolDialogReportUserStoryGeneric;
         if(platform.isSSO)
         {
            _loc2_ = _loc3_.inputMail.text;
            if(!StringUtil.isValidEmail(_loc2_))
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_user_story/error_mail_title"),LocText.current.text("dialog/report_user_story/error_mail_text"),LocText.current.text("general/button_ok")));
               return;
            }
         }
         var _loc4_:String = StringUtil.trim(_loc3_.inputText.text);
         if(!_loc4_ || _loc4_.length == 0 || _loc4_ == LocText.current.text("dialog/report_user_story/report_input_text"))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_user_story/error_text_title"),LocText.current.text("dialog/report_user_story/error_text_text",_userStory.getData("title")),LocText.current.text("general/button_ok")));
            return;
         }
         Environment.application.sendActionRequest("reportUserStory",{
            "user_story_id":_userStory.id,
            "message":_loc4_,
            "email":_loc2_
         },handleRequests);
      }
      
      private function onClickViewUserStory(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStoryRead(_userStory,null,false));
      }
      
      private function onClickToS(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlToSUgc);
      }
      
      private function handleReportInputClick(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReportUserStoryGeneric = _vo as SymbolDialogReportUserStoryGeneric;
         if(_loc2_.inputText.text == LocText.current.text("dialog/report_user_story/report_input_text"))
         {
            _loc2_.inputText.text = "";
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("reportUserStory" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogUserStory))
            {
               (Environment.panelManager.dialogManager.getVisibleDialog(DialogUserStory) as DialogUserStory).refreshContent();
            }
            if(_onUserStoryReportedCallback)
            {
               _onUserStoryReportedCallback();
            }
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_user_story_completed/title"),LocText.current.text("dialog/report_user_story_completed/text",_userStory.getData("title")),LocText.current.text("general/button_ok"),null,false));
            close();
         }
         else if(param1.error == "errReportUserStoryAlreadyReported" || param1.error == "errReportUserStoryInvalidStatus")
         {
            close();
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
