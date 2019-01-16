package com.playata.application.ui.dialogs
{
   import com.playata.application.data.mailbox.Message;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogReportUserGeneric;
   import visuals.ui.dialogs.SymbolDialogReportUserSSOGeneric;
   
   public class DialogReportUser extends UiDialog
   {
       
      
      private var _message:Message;
      
      private var _senderName:String;
      
      private var _btnClose:UiButton;
      
      private var _btnReport:UiTextButton;
      
      private var _scrollBar:UiScrollBar;
      
      public function DialogReportUser(param1:Message)
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         _message = param1;
         _senderName = _message.sender.name;
         var _loc3_:Boolean = platform.isSSO;
         var _loc4_:Sprite = !!_loc3_?new SymbolDialogReportUserSSOGeneric():new SymbolDialogReportUserGeneric();
         super(_loc4_);
         _queued = false;
         if(_loc3_)
         {
            _loc2_ = _loc4_ as SymbolDialogReportUserSSOGeneric;
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/report_character/caption");
            _loc2_.txtInfo.text = LocText.current.text("dialog/report_character/text",_senderName);
            _loc2_.txtWarning.text = LocText.current.text("dialog/report_character/warning");
            _loc2_.inputText.text = "";
            _tabObjects.push(_loc2_.inputText);
            _loc2_.txtInfoMail.text = LocText.current.text("dialog/report_character/text_mail");
            _loc2_.txtMail.text = LocText.current.text("dialog/report_character/mail_caption");
            _loc2_.inputMail.text = "";
            _tabObjects.push(_loc2_.inputMail);
            _scrollBar = new UiScrollBar(_loc2_.scrollKnob,_loc2_.scrollLine,_loc2_.inputText);
            _loc2_.inputText.verticalScrollBar = _scrollBar;
            _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
            _btnReport = new UiTextButton(_loc2_.btnReport,LocText.current.text("dialog/report_character/button_report"),"",onClickReport);
         }
         else
         {
            _loc5_ = _loc4_ as SymbolDialogReportUserGeneric;
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/report_character/caption");
            _loc5_.txtInfo.text = LocText.current.text("dialog/report_character/text",_senderName);
            _loc5_.txtWarning.text = LocText.current.text("dialog/report_character/warning");
            _loc5_.inputText.text = "";
            _tabObjects.push(_loc5_.inputText);
            _scrollBar = new UiScrollBar(_loc5_.scrollKnob,_loc5_.scrollLine,_loc5_.inputText);
            _loc5_.inputText.verticalScrollBar = _scrollBar;
            _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
            _btnReport = new UiTextButton(_loc5_.btnReport,LocText.current.text("dialog/report_character/button_report"),"",onClickReport);
         }
         setFocus();
      }
      
      private function setFocus() : void
      {
         if(platform.isSSO)
         {
            Dialog.focus = (_vo as SymbolDialogReportUserSSOGeneric).inputText;
         }
         else
         {
            Dialog.focus = (_vo as SymbolDialogReportUserGeneric).inputText;
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnReport.dispose();
         _btnReport = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         var _loc2_:String = User.current.email;
         if(platform.isSSO)
         {
            _loc2_ = (_vo as SymbolDialogReportUserSSOGeneric).inputMail.text;
            if(!StringUtil.isValidEmail(_loc2_))
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_character/error_mail_title"),LocText.current.text("dialog/report_character/error_mail_text"),LocText.current.text("general/button_ok")));
               return;
            }
         }
         var _loc3_:String = null;
         if(platform.isSSO)
         {
            _loc3_ = (_vo as SymbolDialogReportUserSSOGeneric).inputText.text;
         }
         else
         {
            _loc3_ = (_vo as SymbolDialogReportUserGeneric).inputText.text;
         }
         if(!_loc3_ || _loc3_.length == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_character/error_text_title"),LocText.current.text("dialog/report_character/error_text_text",_senderName),LocText.current.text("general/button_ok")));
            return;
         }
         Environment.application.sendActionRequest("gameReportUser",{
            "message_id":_message.id,
            "message":_loc3_,
            "email":_loc2_
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("gameReportUser" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_character_complete/title"),LocText.current.text("dialog/report_character_complete/text",_senderName),LocText.current.text("general/button_ok"),null,false));
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
