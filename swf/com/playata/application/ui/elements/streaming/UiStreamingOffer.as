package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingOfferGeneric;
   
   public class UiStreamingOffer
   {
       
      
      private var _content:SymbolStreamingOfferGeneric = null;
      
      private var _callback:Function = null;
      
      private var _streamingShow:StreamingShow = null;
      
      private var _btnStart:UiTextButton = null;
      
      private var _tooltipGameCurrency:UiTextTooltip = null;
      
      private var _tooltipStreamingResource:UiTextTooltip = null;
      
      private var _tooltipStreamingShow:UiTextTooltip = null;
      
      private var _tooltipDuration:UiTextTooltip = null;
      
      private var _itemSlot:UiItemSlot = null;
      
      public function UiStreamingOffer(param1:SymbolStreamingOfferGeneric, param2:Function)
      {
         super();
         _content = param1;
         _callback = param2;
         _btnStart = new UiTextButton(_content.btnStartStreaming,LocText.current.text("dialog/streaming_offers/btn_start_streaming_show"),"",onStartStreamingShowClicked);
         _itemSlot = new UiItemSlot(_content.itemSlot,0);
         _content.txtSetting.autoFontSize = true;
         _tooltipDuration = new UiTextTooltip(_content.tooltipDuration,"");
         _tooltipStreamingShow = new UiTextTooltip(_content.tooltipStreamingShow,"");
         _tooltipGameCurrency = new UiTextTooltip(_content.iconGameCurrency,"");
         _tooltipStreamingResource = new UiTextTooltip(_content.iconStreamingResource,"");
         refresh(null);
      }
      
      public function refresh(param1:StreamingShow) : void
      {
         if(!param1)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _streamingShow = param1;
         _content.txtSetting.text = LocText.current.text("streaming/pose/" + _streamingShow.animationId + "/title");
         _content.txtDuration.text = LocText.current.text("dialog/streaming_offers/duration",TimeUtil.secondsToStringFormat(_streamingShow.duration,"H:m:s"));
         _content.iconGameCurrency.visible = _streamingShow.reward.gameCurrency > 0;
         _content.iconStreamingResource.visible = _streamingShow.reward.streamingResource > 0;
         _itemSlot.visible = _streamingShow.reward.itemId > 0;
         if(_content.iconGameCurrency.visible)
         {
            _tooltipGameCurrency.text = _streamingShow.reward.gameCurrencyString;
         }
         if(_content.iconStreamingResource.visible)
         {
            _tooltipStreamingResource.text = _streamingShow.reward.streamingResourceString;
         }
         if(_itemSlot.visible)
         {
            _itemSlot.item = User.current.character.getItemById(_streamingShow.reward.itemId);
         }
         var _loc3_:String = CStreamingSetting.fromId(_streamingShow.settingId).identifier;
         var _loc2_:String = CStreamingActor.fromId(_streamingShow.actorId).identifier;
         _tooltipStreamingShow.text = LocText.current.text("streaming/setting/" + _loc3_ + "/title");
         _tooltipStreamingShow.text = _tooltipStreamingShow.text + ("\n" + LocText.current.text("streaming/setting/" + _loc3_ + "/description"));
         _tooltipStreamingShow.text = _tooltipStreamingShow.text + ("\n\n" + LocText.current.text("streaming/actor/" + _loc2_ + "/name"));
         _tooltipStreamingShow.text = _tooltipStreamingShow.text + ("\n" + LocText.current.text("streaming/actor/" + _loc2_ + "/description"));
         _tooltipStreamingShow.text = _tooltipStreamingShow.text + ("\n\n" + LocText.current.text("streaming/pose/" + _streamingShow.animationId + "/title"));
         _content.imageBg.setUriSprite(_streamingShow.settingImageUrl,230,141,true,-1);
         _content.imageActor.setUriSprite(_streamingShow.actorOfferImageUrl,155,147,true,4);
      }
      
      private function onStartStreamingShowClicked(param1:InteractionEvent) : void
      {
      }
      
      public function dispose() : void
      {
         _tooltipDuration.dispose();
         _tooltipStreamingShow.dispose();
         _tooltipGameCurrency.dispose();
         _tooltipStreamingResource.dispose();
         _btnStart.dispose();
         _itemSlot.dispose();
         _tooltipDuration = null;
         _tooltipStreamingShow = null;
         _tooltipGameCurrency = null;
         _tooltipStreamingResource = null;
         _btnStart = null;
         _itemSlot = null;
      }
   }
}
