package com.playata.application.ui.dialogs
{
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
   
   public class DialogReportUserStream extends UiDialog
   {
       
      
      private var _messageId:int;
      
      private var _senderName:String;
      
      private var _reportedCharacterId:int;
      
      private var _btnClose:UiButton;
      
      private var _btnReport:UiTextButton;
      
      private var _scrollBar:UiScrollBar;
      
      public function DialogReportUserStream(param1:int, param2:String, param3:int)
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         _messageId = param1;
         _senderName = param2;
         _reportedCharacterId = param3;
         var _loc5_:Boolean = platform.isSSO;
         var _loc6_:Sprite = !!_loc5_?new SymbolDialogReportUserSSOGeneric():new SymbolDialogReportUserGeneric();
         super(_loc6_);
         _queued = false;
         if(_loc5_)
         {
            _loc4_ = _loc6_ as SymbolDialogReportUserSSOGeneric;
            _loc4_.txtDialogTitle.text = LocText.current.text("dialog/report_character/caption");
            _loc4_.txtInfo.text = LocText.current.text("dialog/report_character/text",_senderName);
            _loc4_.txtWarning.text = LocText.current.text("dialog/report_character/warning");
            _loc4_.inputText.text = "";
            _tabObjects.push(_loc4_.inputText);
            _loc4_.txtInfoMail.text = LocText.current.text("dialog/report_character/text_mail");
            _loc4_.txtMail.text = LocText.current.text("dialog/report_character/mail_caption");
            _loc4_.inputMail.text = "";
            _tabObjects.push(_loc4_.inputMail);
            _scrollBar = new UiScrollBar(_loc4_.scrollKnob,_loc4_.scrollLine,_loc4_.inputText);
            _loc4_.inputText.verticalScrollBar = _scrollBar;
            _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
            _btnReport = new UiTextButton(_loc4_.btnReport,LocText.current.text("dialog/report_character/button_report"),"",onClickReport);
         }
         else
         {
            _loc7_ = _loc6_ as SymbolDialogReportUserGeneric;
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/report_character/caption");
            _loc7_.txtInfo.text = LocText.current.text("dialog/report_character/text",_senderName);
            _loc7_.txtWarning.text = LocText.current.text("dialog/report_character/warning");
            _loc7_.inputText.text = "";
            _tabObjects.push(_loc7_.inputText);
            _scrollBar = new UiScrollBar(_loc7_.scrollKnob,_loc7_.scrollLine,_loc7_.inputText);
            _loc7_.inputText.verticalScrollBar = _scrollBar;
            _btnClose = new UiButton(_loc7_.btnClose,"",onClickClose);
            _btnReport = new UiTextButton(_loc7_.btnReport,LocText.current.text("dialog/report_character/button_report"),"",onClickReport);
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
            "message_id":_messageId,
            "message":_loc3_,
            "email":_loc2_,
            "reported_character_id":_reportedCharacterId
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
