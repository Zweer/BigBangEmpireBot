package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.streaming.UiStreamingOffer;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogStreamingOffersGeneric;
   
   public class DialogStreamingOffers extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRefreshOffers:UiPremiumButton = null;
      
      private var _offer1:UiStreamingOffer = null;
      
      private var _offer2:UiStreamingOffer = null;
      
      private var _offer3:UiStreamingOffer = null;
      
      private var _roomId:int = 0;
      
      private var _streaming:Streaming = null;
      
      public function DialogStreamingOffers(param1:int)
      {
         _roomId = param1;
         var _loc2_:SymbolDialogStreamingOffersGeneric = new SymbolDialogStreamingOffersGeneric();
         super(_loc2_,false);
         _streaming = User.current.character.streaming;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/streaming_offers/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/streaming_offers/info_text");
         _loc2_.txtInfo.autoFontSize = true;
         _loc2_.refresh.txtInfoAgain.text = LocText.current.text("dialog/streaming_offers/info_refresh_offers");
         _offer1 = new UiStreamingOffer(_loc2_.streamingOffer1,onStartStreamingShowClicked);
         _offer2 = new UiStreamingOffer(_loc2_.streamingOffer2,onStartStreamingShowClicked);
         _offer3 = new UiStreamingOffer(_loc2_.streamingOffer3,onStartStreamingShowClicked);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnClose.bringToTop();
         _btnRefreshOffers = new UiPremiumButton(_loc2_.refresh.btnRefreshOffers,CConstant.streaming_refresh_offers_cost,LocText.current.text("dialog/streaming_offers/button_refresh"),LocText.current.text("dialog/streaming_offers/button_refresh"),"","",onRefreshOffersClicked);
         refresh();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRefreshOffers.dispose();
         _btnRefreshOffers = null;
         _offer1.dispose();
         _offer1 = null;
         _offer2.dispose();
         _offer2 = null;
         _offer3.dispose();
         _offer3 = null;
         super.dispose();
      }
      
      public function refresh() : void
      {
         _btnRefreshOffers.premium = TimeUtil.serverDateTime.isToday(_streaming.tsLastOfferRefresh);
         if(_streaming.streamingShowsInPool.length < 3)
         {
            Environment.application.sendActionRequest("refreshStreamingOffers",{"use_premium":false},handleRequests);
            return;
         }
         _offer1.refresh(_streaming.streamingShowsInPool[0]);
         _offer2.refresh(_streaming.streamingShowsInPool[1]);
         _offer3.refresh(_streaming.streamingShowsInPool[2]);
      }
      
      private function onStartStreamingShowClicked(param1:int) : void
      {
         Environment.application.sendActionRequest("startStreamingShow",{
            "room_id":_roomId,
            "streaming_show_id":param1
         },handleRequests);
      }
      
      private function onRefreshOffersClicked(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("refreshStreamingOffers",{"use_premium":_btnRefreshOffers.premium},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "refreshStreamingOffers":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "startStreamingShow":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("streaming_start.mp3");
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
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
