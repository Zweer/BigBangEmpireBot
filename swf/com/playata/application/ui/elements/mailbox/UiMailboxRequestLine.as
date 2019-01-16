package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.mail.SymbolMailboxRequestLineGeneric;
   
   public class UiMailboxRequestLine
   {
       
      
      private var _content:SymbolMailboxRequestLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _resourceRequest:ResourceRequest = null;
      
      private var _onAcceptDecline:Function = null;
      
      private var _btnAccept:UiTextButton = null;
      
      private var _btnDecline:UiButton = null;
      
      public function UiMailboxRequestLine(param1:SymbolMailboxRequestLineGeneric, param2:int, param3:Function)
      {
         super();
         _content = param1;
         _index = param2;
         _onAcceptDecline = param3;
         _btnAccept = new UiTextButton(_content.btnAccept,LocText.current.text("dialog/mailbox_requests/button_accept"),"",onClickAccept);
         _btnDecline = new UiButton(_content.btnDecline,LocText.current.text("dialog/mailbox_requests/button_decline"),onClickDecline);
      }
      
      public function dispose() : void
      {
         _btnAccept.dispose();
         _btnDecline.dispose();
         _btnAccept = null;
         _btnDecline = null;
      }
      
      public function get content() : SymbolMailboxRequestLineGeneric
      {
         return _content;
      }
      
      private function onClickAccept(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("acceptResourceRequest",{"id":_resourceRequest.id},handleRequests);
      }
      
      private function onClickDecline(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("declineResourceRequest",{"id":_resourceRequest.id},handleRequests);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get resourceRequest() : ResourceRequest
      {
         return _resourceRequest;
      }
      
      public function refresh(param1:ResourceRequest, param2:int) : void
      {
         _index = param2;
         _resourceRequest = param1;
         if(_resourceRequest == null || !_resourceRequest.hasData("feature_type"))
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtTitle.text = _resourceRequest.title;
         _content.txtInfo.text = _resourceRequest.message;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "acceptResourceRequest":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onAcceptDecline(_resourceRequest);
               }
               else if(param1.error == "errAcceptInvalidStatus")
               {
                  _onAcceptDecline(_resourceRequest);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "declineResourceRequest":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onAcceptDecline(_resourceRequest);
               }
               else if(param1.error == "errDeclineInvalidStatus")
               {
                  _onAcceptDecline(_resourceRequest);
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
   }
}
