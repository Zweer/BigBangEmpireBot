package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CStreamingRoomUnlock;
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogStreamingOffers;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingRoomGeneric;
   
   public class UiStreamingRoom
   {
       
      
      private var _content:SymbolStreamingRoomGeneric = null;
      
      private var _roomId:int = 0;
      
      private var _currentShow:StreamingShow = null;
      
      private var _btnUnlockPremiumCurrency:UiPremiumButton = null;
      
      private var _btnUnlockGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnStartStreamingShow:UiButton = null;
      
      private var _itemSlot:UiItemSlot = null;
      
      private var _btnCollectReward:UiTextButton = null;
      
      private var _timer:ITimer = null;
      
      private var _streamingActor:UiStreamingActor = null;
      
      private var _tooltip:UiStreamingShowTooltip = null;
      
      public function UiStreamingRoom(param1:SymbolStreamingRoomGeneric, param2:int)
      {
         super();
         _content = param1;
         _roomId = param2;
         _content.gotoAndStop(param2);
         _btnUnlockPremiumCurrency = new UiPremiumButton(_content.btnUnlockPremiumCurrency,CStreamingRoomUnlock.fromId(_roomId).premiumCurrency,"",LocText.current.text("screen/streaming/btn_unlock_room_premium_currency"),"","",onClickUnlockPremiumCurrency);
         _btnUnlockPremiumCurrency.premium = true;
         _btnUnlockGameCurrency = new UiGameCurrencyButton(_content.btnUnlockGameCurrency,CStreamingRoomUnlock.fromId(_roomId).streamingResource,LocText.current.text("screen/streaming/btn_unlock_room_game_currency"),"",onClickUnlockGameCurrency);
         _btnStartStreamingShow = new UiButton(_content.btnStartStreamingShow,LocText.current.text("screen/streaming/btn_start_streaming_show_tooltip"),onClickStartStreamingShow);
         _btnCollectReward = new UiTextButton(_content.reward.btnCollectReward,LocText.current.text("screen/streaming/btn_collect_reward"),"",onClickCollectReward);
         _itemSlot = new UiItemSlot(_content.reward.iconItemReward,0);
         _content.txtRecording.text = LocText.current.text("screen/streaming/txt_streaming_show_active");
         _timer = Environment.createTimer("UiStreamingRoom_" + _roomId + "::timer",1000,onTimerEvent);
         _streamingActor = new UiStreamingActor(_content.actor);
         _tooltip = new UiStreamingShowTooltip(_content);
         removeAssets();
      }
      
      public function dispose() : void
      {
         _content = null;
         _btnUnlockPremiumCurrency.dispose();
         _btnUnlockPremiumCurrency = null;
         _btnUnlockGameCurrency.dispose();
         _btnUnlockGameCurrency = null;
         _btnStartStreamingShow.dispose();
         _btnStartStreamingShow = null;
         _btnCollectReward.dispose();
         _btnCollectReward = null;
         _itemSlot.dispose();
         _itemSlot = null;
         _streamingActor.dispose();
         _streamingActor = null;
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function hide() : void
      {
         removeAssets();
         _currentShow = null;
      }
      
      public function refresh(param1:Streaming) : void
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         _content.roomLocked.visible = false;
         _content.roomImageLocked.visible = false;
         _content.txtRecording.visible = false;
         _content.txtRecordingTimeLeft.visible = false;
         _btnUnlockPremiumCurrency.visible = false;
         _btnUnlockGameCurrency.visible = false;
         _btnStartStreamingShow.visible = false;
         _content.reward.visible = false;
         _tooltip.refresh(null);
         if(!param1.isRoomUnlocked(_roomId))
         {
            _btnUnlockPremiumCurrency.visible = true;
            _btnUnlockGameCurrency.visible = true;
            _loc2_ = _roomId - 1;
            while(_loc2_ > 0)
            {
               if(!param1.isRoomUnlocked(_loc2_))
               {
                  _btnUnlockGameCurrency.visible = false;
                  _btnUnlockPremiumCurrency.visible = false;
                  break;
               }
               _loc2_--;
            }
            if(_btnUnlockGameCurrency.visible)
            {
               _btnUnlockGameCurrency.y = _content.roomLocked.height / 2 - _btnUnlockGameCurrency.height / 2 - 5;
               _btnUnlockPremiumCurrency.y = _content.roomLocked.height / 2 + _btnUnlockPremiumCurrency.height / 2 + 5;
               _content.roomLocked.visible = true;
            }
            else
            {
               _content.roomImageLocked.visible = true;
               _content.roomImageLocked.room3.visible = _roomId == 3;
               _content.roomImageLocked.room4.visible = _roomId == 4;
               _content.roomImageLocked.room5.visible = _roomId == 5;
               _content.roomImageLocked.room6.visible = _roomId == 6;
            }
            return;
         }
         if(!param1.hasRoomActiveShow(_roomId))
         {
            _btnStartStreamingShow.visible = true;
            return;
         }
         refreshWidthStreamingShow(param1.getShowOfRoom(_roomId));
      }
      
      public function refreshWidthStreamingShow(param1:StreamingShow) : void
      {
         _tooltip.refresh(param1);
         _content.txtRecording.visible = true;
         _content.txtRecordingTimeLeft.visible = true;
         if(param1 == _currentShow && (_currentShow == null || _currentShow.remainingSeconds > 0))
         {
            return;
         }
         removeAssets();
         _currentShow = param1;
         if(_currentShow.remainingSeconds > 0)
         {
            randomAssets();
            onTimerEvent();
            _timer.start();
         }
         else
         {
            _content.txtRecording.visible = false;
            _content.txtRecordingTimeLeft.visible = false;
            _content.roomLocked.visible = true;
            _content.reward.visible = true;
            _content.reward.txtRewards.visible = false;
            _content.reward.iconGameCurrencyReward.visible = false;
            _content.reward.iconStreamingReward.visible = false;
            _itemSlot.visible = _currentShow.reward.itemId > 0;
            if(_itemSlot.visible)
            {
               _itemSlot.item = User.current.character.getItemById(_currentShow.reward.itemId);
            }
            else if(_currentShow.reward.gameCurrency > 0)
            {
               _content.reward.txtRewards.visible = true;
               _content.reward.iconGameCurrencyReward.visible = true;
               _content.reward.txtRewards.text = _currentShow.reward.gameCurrencyString;
            }
            else if(_currentShow.reward.streamingResource > 0)
            {
               _content.reward.txtRewards.visible = true;
               _content.reward.iconStreamingReward.visible = true;
               _content.reward.txtRewards.text = _currentShow.reward.streamingResourceString;
            }
         }
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(!_currentShow)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(_currentShow.remainingSeconds <= 0)
         {
            refreshWidthStreamingShow(_currentShow);
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         _content.txtRecordingTimeLeft.text = TimeUtil.secondsToStringFormat(_currentShow.remainingSeconds,"H:m:s");
      }
      
      public function removeAssets() : void
      {
         _content.settingBackground.removeAllChildren();
         _content.actor.removeAllChildren();
         _content.settingAssetButton.removeAllChildren();
         _content.settingAssetTop.removeAllChildren();
         _streamingActor.stop();
      }
      
      public function randomAssets() : void
      {
         var _loc1_:String = CStreamingSetting.fromId(_currentShow.settingId).identifier;
         _content.settingBackground.setUriSprite(_currentShow.settingImageUrl,230,141,true,-1);
         _content.settingAssetButton.setUriSprite(ServerInfo.assetURL("streaming_settings/" + _loc1_ + "_asset_bottom","png"),72,119,true,6);
         _content.settingAssetTop.setUriSprite(ServerInfo.assetURL("streaming_settings/" + _loc1_ + "_asset_top","png"),92,60,true,6);
         _streamingActor.refresh(_currentShow);
      }
      
      private function onClickUnlockPremiumCurrency(param1:InteractionEvent) : void
      {
         if(_btnUnlockPremiumCurrency.visible && _btnUnlockPremiumCurrency.enabled)
         {
            Environment.application.sendActionRequest("unlockStreamingRoom",{
               "room_id":_roomId,
               "use_premium":true
            },handleRequests);
         }
      }
      
      private function onClickUnlockGameCurrency(param1:InteractionEvent) : void
      {
         if(_btnUnlockGameCurrency.visible && _btnUnlockGameCurrency.enabled)
         {
            Environment.application.sendActionRequest("unlockStreamingRoom",{
               "room_id":_roomId,
               "use_premium":false
            },handleRequests);
         }
      }
      
      private function onClickStartStreamingShow(param1:InteractionEvent) : void
      {
         if(_btnStartStreamingShow.visible && _btnStartStreamingShow.enabled)
         {
            Environment.panelManager.showDialog(new DialogStreamingOffers(_roomId));
         }
      }
      
      private function onClickCollectReward(param1:InteractionEvent) : void
      {
         if(_btnCollectReward.visible && _btnCollectReward.enabled)
         {
            Environment.application.sendActionRequest("collectStreamingShow",{
               "room_id":_roomId,
               "discard_item":false
            },handleRequests);
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("collectStreamingShow",{
            "room_id":_roomId,
            "discard_item":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "unlockStreamingRoom":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  if(_btnUnlockPremiumCurrency)
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(_btnUnlockPremiumCurrency.premiumAmount);
                  }
               }
               else if(param1.error == "errRemoveStreamingResourceNotEnough")
               {
                  _loc2_ = User.current.character.streaming.streamingResource;
                  _loc3_ = _btnUnlockGameCurrency.gameCurrencyAmount;
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unlock_streaming_room/err_not_enough_resource_title"),LocText.current.text("dialog/unlock_streaming_room/err_not_enough_resource_text",_loc3_ - _loc2_),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "collectStreamingShow":
               if(param1.error == "")
               {
                  showRewardEffect(!param1.request.getBoolean("discard_item"));
                  Environment.audio.playFX("streaming_claim_reward.mp3");
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemSlot.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
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
      
      private function showRewardEffect(param1:Boolean) : void
      {
         if(!_currentShow)
         {
            return;
         }
         if(param1 && _currentShow.reward.itemId > 0)
         {
            EffectsLayer.instance.show(3,EffectOptions.fromData({
               "emitter":_content.reward.iconItemReward,
               "imageUrl":_itemSlot.item.iconImageUrl
            }));
         }
         if(_currentShow.reward.gameCurrency > 0)
         {
            EffectsLayer.instance.show(0,EffectOptions.fromData({"emitter":_content.reward.iconGameCurrencyReward}));
         }
         if(_currentShow.reward.streamingResource > 0)
         {
            EffectsLayer.instance.show(15,EffectOptions.fromData({
               "emitter":_content.reward.iconStreamingReward,
               "amount":_currentShow.reward.streamingResource
            }));
         }
      }
   }
}
