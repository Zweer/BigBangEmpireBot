package com.playata.application.ui.dialogs
{
   import com.playata.application.data.movie.Movie;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogReportMovieGeneric;
   
   public class DialogReportMovies extends UiDialog
   {
       
      
      private var _btnClose:UiButton;
      
      private var _btnReport:UiTextButton;
      
      private var _ckbMovie1:UiCheckBox;
      
      private var _ckbMovie2:UiCheckBox;
      
      private var _movie1:Movie;
      
      private var _movie2:Movie;
      
      public function DialogReportMovies(param1:Movie, param2:Movie = null)
      {
         var _loc3_:SymbolDialogReportMovieGeneric = new SymbolDialogReportMovieGeneric();
         super(_loc3_);
         _queued = false;
         _movie1 = param1;
         _movie2 = param2;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/report_movie/caption");
         _loc3_.txtInfo.text = LocText.current.text("dialog/report_movie/info");
         _loc3_.txtInfo.autoFontSize = true;
         _loc3_.txtWarning.text = LocText.current.text("dialog/report_movie/warning");
         _loc3_.txtWarning.autoFontSize = true;
         _loc3_.txtMovie1Title.text = param1.title;
         _loc3_.txtMovie1Title.autoFontSize = true;
         _ckbMovie1 = new UiCheckBox(_loc3_.chkMovie1,false,"",updateButtons,null,_loc3_.txtMovie1Title);
         if(param2)
         {
            _loc3_.txtMovie2Title.text = param2.title;
            _loc3_.txtMovie2Title.autoFontSize = true;
            _ckbMovie2 = new UiCheckBox(_loc3_.chkMovie2,false,"",updateButtons,null,_loc3_.txtMovie2Title);
         }
         else
         {
            var _loc4_:Boolean = false;
            _loc3_.chkMovie2.visible = _loc4_;
            _loc3_.txtMovie2Title.visible = _loc4_;
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnReport = new UiTextButton(_loc3_.btnReport,LocText.current.text("dialog/report_movie/button_report"),"",onClickReport);
         updateButtons();
      }
      
      private function updateButtons(param1:Boolean = false) : void
      {
         _btnReport.buttonEnabled = _ckbMovie1.checked || _ckbMovie2 != null && _ckbMovie2.checked;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnReport.dispose();
         _btnReport = null;
         _ckbMovie1.dispose();
         _ckbMovie1 = null;
         if(_ckbMovie2)
         {
            _ckbMovie2.dispose();
            _ckbMovie2 = null;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         if(_ckbMovie1.checked && _ckbMovie2 && _ckbMovie2.checked)
         {
            Environment.application.sendActionRequest("reportMovieTitle",{
               "movie1_id":_movie1.id,
               "movie2_id":_movie2.id
            },handleRequests);
         }
         else if(_ckbMovie1.checked)
         {
            Environment.application.sendActionRequest("reportMovieTitle",{"movie1_id":_movie1.id},handleRequests);
         }
         else if(_ckbMovie2 && _ckbMovie2.checked)
         {
            Environment.application.sendActionRequest("reportMovieTitle",{"movie1_id":_movie2.id},handleRequests);
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/report_movie/no_movie_selected"),LocText.current.text("general/button_ok")));
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1.action;
         if("reportMovieTitle" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_movie_complete/title"),LocText.current.text("dialog/report_movie_complete/text"),LocText.current.text("general/button_ok"),null,false));
         }
         else if(param1.error.indexOf("errReportingMovieMovieAlreadyReported_") >= 0)
         {
            _loc2_ = param1.error.substr("errReportingMovieMovieAlreadyReported_".length);
            _loc3_ = "";
            if(parseInt(_loc2_) == _movie1.id)
            {
               _loc3_ = _movie1.title;
            }
            else
            {
               _loc3_ = _movie2.title;
            }
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/report_movie_already_reported/title"),LocText.current.text("dialog/report_movie_already_reported/text",_loc3_),LocText.current.text("general/button_ok"),null,false));
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
            close();
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
