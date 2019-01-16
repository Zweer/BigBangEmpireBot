package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.application.data.optical_changes.OpticalChangeValue;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeSlotButtonGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesInfoGeneric;
   
   public class UiOpticalChangeInfo extends InteractiveDisplayObject
   {
      
      private static const MAX_SLOTS:int = 6;
      
      private static const SCROLL_VALUE:int = 3;
       
      
      private var _content:SymbolOpticalChangesInfoGeneric = null;
      
      private var _dialog:DialogOpticalChanges = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _offset:int = 0;
      
      private var _itemSlots:Vector.<UiOpticalChangeIconSlotButton> = null;
      
      private var _opticalChangeCategorie:OpticalChangeCategorie;
      
      private var _progressBar:UiProgressBarBig;
      
      private var _progressBarTotal:UiProgressBarBig;
      
      private var _btnCollectReward:UiTextButton;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _opticalChangeValue:OpticalChangeValue = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _previewAvatar:UiAvatarPreview = null;
      
      public function UiOpticalChangeInfo(param1:SymbolOpticalChangesInfoGeneric, param2:DialogOpticalChanges)
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _content = param1;
         super(_content);
         _dialog = param2;
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnCollectReward = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/optical_change/collect_reward_button"),"",onClickCollectReward);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _itemReward = new UiItemSlot(_content.itemReward,0);
         _progressBar = new UiProgressBarBig(_content.progressBar);
         _progressBarTotal = new UiProgressBarBig(_content.progressBarTotal);
         _previewAvatar = new UiAvatarPreview(_content.previewAvatar);
         _itemSlots = new Vector.<UiOpticalChangeIconSlotButton>();
         _loc3_ = 1;
         while(_loc3_ <= 6)
         {
            _loc4_ = _content.getChildByName("slot" + _loc3_) as SymbolOpticalChangeSlotButtonGeneric;
            _loc5_ = new UiOpticalChangeIconSlotButton(_loc4_,_dialog,_previewAvatar);
            _itemSlots.push(_loc5_);
            _loc3_++;
         }
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
         onMouseWheel.add(handleMouseWheel);
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnCollectReward.dispose();
         _btnCollectReward = null;
         _tooltip.dispose();
         _tooltip = null;
         _previewAvatar.dispose();
         _previewAvatar = null;
         _loc1_ = 0;
         while(_loc1_ < _itemSlots.length)
         {
            _itemSlots[_loc1_].dispose();
            _loc1_++;
         }
         _itemSlots.length = 0;
         _itemSlots = null;
         _dialog = null;
         _content = null;
         super.dispose();
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(3,true);
         }
         else
         {
            scrollDown(3,true);
         }
         param1.rawEvent.stopImmediatePropagation();
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(3,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(3,false);
      }
      
      private function onClickCollectReward(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("collectOpticalChangeReward",{
            "type":_opticalChangeCategorie.type,
            "value":_opticalChangeValue.value,
            "discard_item":false
         },handleRequests);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_offset == _opticalChangeCategorie.opticalChanges.length - 6)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _opticalChangeCategorie.opticalChanges.length - 6)
         {
            _offset = _opticalChangeCategorie.opticalChanges.length - 6;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refresh(param1:OpticalChangeCategorie, param2:Boolean = false) : void
      {
         if(!_content || !param1)
         {
            return;
         }
         if(_opticalChangeCategorie == param1 && _opticalChangeValue == param1.currentTargetValue() && !param2)
         {
            return;
         }
         _opticalChangeCategorie = param1;
         _opticalChangeValue = _opticalChangeCategorie.currentTargetValue();
         _content.txtName.text = LocText.current.text("dialog/optical_changes/optical_change_title",_opticalChangeCategorie.title,_opticalChangeCategorie.opticalChanges.length);
         _content.txtName.text = StringUtil.replace(_content.txtName.text," (","\n(");
         _content.txtProgressTotal.autoFontSize = true;
         _content.txtProgressTotal.text = LocText.current.text("dialog/optical_changes/optical_change_progress",LocText.current.formatHugeNumber(_opticalChangeCategorie.currentValue),LocText.current.formatHugeNumber(_opticalChangeCategorie.opticalChanges.length));
         _progressBarTotal.value = _opticalChangeCategorie.currentValue / _opticalChangeCategorie.opticalChanges.length * 100;
         _content.txtProgress.autoFontSize = true;
         _content.txtProgress.text = _opticalChangeValue.progressText;
         _progressBar.value = _opticalChangeValue.progress;
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         var _loc3_:* = _opticalChangeCategorie.opticalChanges.length >= _opticalChangeValue.value;
         var _loc4_:* = !_opticalChangeValue.isCollected();
         _content.progressBarTotal.visible = !_loc4_ && _loc3_;
         _content.txtProgressTotal.visible = !_loc4_ && _loc3_;
         _content.progressBackground.visible = _loc4_ && _loc3_;
         _content.progressBar.visible = _loc4_ && _loc3_;
         _content.txtProgress.visible = _loc4_ && _loc3_;
         _content.tooltipLayer.visible = _loc4_ && _loc3_;
         _content.txtProgressCaption.visible = _loc4_ && _loc3_;
         _content.txtRewardsCaption.visible = _loc4_ && _loc3_;
         _content.txtReward.visible = _loc4_ && _loc3_;
         _content.rewardBackground.visible = _loc4_ && _loc3_;
         _content.iconItem.visible = false;
         _content.iconQuestEnergy.visible = false;
         _content.iconStatPoints.visible = false;
         _content.itemReward.visible = false;
         _btnCollectReward.visible = false;
         if(_loc4_ && _loc3_)
         {
            _content.txtReward.text = _opticalChangeValue.rewardText;
            _content.iconItem.visible = _opticalChangeValue.isItemReward;
            _content.iconQuestEnergy.visible = _opticalChangeValue.isQuestEnergyReward;
            _content.iconStatPoints.visible = _opticalChangeValue.isStatPointReward;
            _tooltip.text = _opticalChangeValue.rewardDescription;
            _btnCollectReward.visible = _opticalChangeValue.isCollectable();
            if(_opticalChangeValue.isCollectable() && _opticalChangeValue.isItemReward)
            {
               Environment.application.sendActionRequest("getOpticalChangeItemReward",{
                  "type":_opticalChangeCategorie.type,
                  "value":_opticalChangeValue.value
               },handleRequests);
            }
         }
         _btnScrollUp.visible = _opticalChangeCategorie.opticalChanges.length > 6;
         _btnScrollDown.visible = _opticalChangeCategorie.opticalChanges.length > 6;
         _offset = 0;
         refreshList();
      }
      
      private function refreshList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!_content)
         {
            return;
         }
         if(!_opticalChangeCategorie)
         {
            return;
         }
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _opticalChangeCategorie.opticalChanges.length - 6;
         _loc1_ = 0;
         while(_loc1_ < _itemSlots.length)
         {
            _loc2_ = _itemSlots[_loc1_];
            _loc2_.visible = _opticalChangeCategorie.opticalChanges.length > _loc1_ + _offset;
            if(_loc2_.visible)
            {
               _loc2_.refresh(_opticalChangeCategorie,_opticalChangeCategorie.opticalChanges[_loc1_ + _offset]);
            }
            _loc1_++;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getOpticalChangeItemReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refreshItemReward(param1.appResponse.item.id);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "collectOpticalChangeReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("goal_collected.mp3");
                  showRewardEffect(!param1.request.getBoolean("discard_item"));
                  _dialog.refresh();
                  refresh(_opticalChangeCategorie,true);
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
               }
               else if(param1.error != "errCollectOpticalChangesAlreadyExists")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function refreshItemReward(param1:int) : void
      {
         _content.iconItem.visible = false;
         _content.tooltipLayer.visible = false;
         _itemReward.item = User.current.character.getItemById(param1);
         _content.itemReward.visible = true;
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         try
         {
            if(param1 && _opticalChangeValue.isItemReward && _itemReward)
            {
               EffectsLayer.instance.show(3,EffectOptions.fromData({
                  "emitter":_content.itemReward,
                  "imageUrl":_itemReward.item.iconImageUrl
               }),Environment.display.displayContext.stage);
            }
            if(_content.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,EffectOptions.fromData({
                  "emitter":_content.iconStatPoints,
                  "amount":_opticalChangeValue.rewardAmount
               }),Environment.display.displayContext.stage);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         _dialog.close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("collectOpticalChangeReward",{
            "type":_opticalChangeCategorie.type,
            "value":_opticalChangeValue.value,
            "discard_item":true
         },handleRequests);
      }
   }
}
