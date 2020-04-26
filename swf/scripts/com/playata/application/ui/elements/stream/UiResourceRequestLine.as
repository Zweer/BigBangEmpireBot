package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolResourceRequestGeneric;
   
   public class UiResourceRequestLine extends ListLine
   {
       
      
      private var _rawContent:SymbolResourceRequestGeneric = null;
      
      private var _resourceRequest:ResourceRequest = null;
      
      private var _onAcceptDecline:Function = null;
      
      private var _btnAccept:UiTextButton = null;
      
      private var _btnDecline:UiButton = null;
      
      public function UiResourceRequestLine(param1:ResourceRequest, param2:int, param3:SymbolResourceRequestGeneric = null)
      {
         _resourceRequest = param1;
         if(!param3)
         {
            _rawContent = new SymbolResourceRequestGeneric();
         }
         else
         {
            _rawContent = param3;
         }
         super(_rawContent,param2);
         _btnAccept = new UiTextButton(_rawContent.btnAccept,LocText.current.text("dialog/mailbox_requests/button_accept"),"",onClickAccept);
         _btnDecline = new UiButton(_rawContent.btnDecline,LocText.current.text("dialog/mailbox_requests/button_decline"),onClickDecline);
      }
      
      public function refreshLocalization() : void
      {
         _btnAccept.caption = LocText.current.text("dialog/mailbox_requests/button_accept");
         _btnDecline.tooltip = LocText.current.text("dialog/mailbox_requests/button_decline");
      }
      
      override public function dispose() : void
      {
         _btnAccept.dispose();
         _btnDecline.dispose();
         _btnAccept = null;
         _btnDecline = null;
         super.dispose();
      }
      
      public function get content() : SymbolResourceRequestGeneric
      {
         return _rawContent;
      }
      
      public function get onAcceptDecline() : Function
      {
         return _onAcceptDecline;
      }
      
      public function set onAcceptDecline(param1:Function) : void
      {
         _onAcceptDecline = param1;
      }
      
      private function onClickAccept(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("acceptResourceRequest",{"id":_resourceRequest.id},handleRequests);
      }
      
      private function onClickDecline(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("declineResourceRequest",{"id":_resourceRequest.id},handleRequests);
      }
      
      public function get resourceRequest() : ResourceRequest
      {
         return _resourceRequest;
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _resourceRequest = param1 as ResourceRequest;
         if(!_resourceRequest.hasData("feature_type"))
         {
            _rawContent.visible = false;
            return;
         }
         _rawContent.visible = true;
         _rawContent.txtTitle.text = _resourceRequest.title;
         _rawContent.txtInfo.text = _resourceRequest.message;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "acceptResourceRequest":
               if(param1.error == "")
               {
                  _onAcceptDecline(_resourceRequest,param1.data);
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
                  _onAcceptDecline(_resourceRequest,param1.data);
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
