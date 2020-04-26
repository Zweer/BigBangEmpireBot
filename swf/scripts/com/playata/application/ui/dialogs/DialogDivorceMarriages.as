package com.playata.application.ui.dialogs
{
   import com.playata.application.data.item.Item;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDivorceMarriageGeneric;
   
   public class DialogDivorceMarriages extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnDivorce:UiTextButton = null;
      
      private var _item:Item = null;
      
      public function DialogDivorceMarriages(param1:Item)
      {
         var _loc2_:SymbolDialogDivorceMarriageGeneric = new SymbolDialogDivorceMarriageGeneric();
         super(_loc2_);
         _queued = false;
         _item = param1;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/divorce_marriages/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/divorce_marriages/info");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnDivorce = new UiTextButton(_loc2_.btnDivorce,LocText.current.text("dialog/divorce_marriages/button_divorce"),"",onClickDivorce);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnDivorce.dispose();
         _btnDivorce = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickDivorce(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("divorceMarriages",{"item_id":_item.id},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("divorceMarriages" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errDivorceMarriagesNoMarriages")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/divorce_marriages/no_marriages_title"),LocText.current.text("dialog/divorce_marriages/no_marriages_text"),LocText.current.text("general/button_ok")));
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
