package com.playata.application.ui.elements.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatternValue;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternInfoGeneric;
   
   public class UiItemPatternInfo extends InteractiveDisplayObject
   {
      
      private static const MAX_PATTERNS:int = 12;
      
      private static const SCROLL_VALUE:int = 4;
       
      
      private var _content:SymbolItemPatternInfoGeneric = null;
      
      private var _dialog:DialogSewingMachine = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _offset:int = 0;
      
      private var _itemSlots:Vector.<UiItemSlot> = null;
      
      private var _itemPattern:ItemPattern;
      
      private var _progressBar:UiProgressBarBig;
      
      private var _progressBarTotal:UiProgressBarBig;
      
      private var _btnCollectReward:UiTextButton;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _itemPatternValue:ItemPatternValue = null;
      
      private var _btnSourceInfo:UiButton = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _tooltipTitleText:UiTextTooltip = null;
      
      public function UiItemPatternInfo(param1:SymbolItemPatternInfoGeneric, param2:DialogSewingMachine)
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _content = param1;
         super(_content);
         _dialog = param2;
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnSourceInfo = new UiButton(_content.btnSourceInfo,"",onClickSourceInfo);
         _btnCollectReward = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/sewing_machine/collect_reward_button"),"",onClickCollectReward);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _itemReward = new UiItemSlot(_content.itemReward,0);
         _progressBar = new UiProgressBarBig(_content.progressBar);
         _progressBarTotal = new UiProgressBarBig(_content.progressBarTotal);
         _itemSlots = new Vector.<UiItemSlot>();
         _loc3_ = 1;
         while(_loc3_ <= 12)
         {
            _loc4_ = _content.getChildByName("slot" + _loc3_) as SymbolItemSlotGeneric;
            _loc5_ = new UiItemSlot(_loc4_,0);
            _loc5_.locked = true;
            _itemSlots.push(_loc5_);
            _loc3_++;
         }
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
         _tooltipTitleText = new UiTextTooltip(_content.rewardTitle,"");
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
         _btnSourceInfo.dispose();
         _btnSourceInfo = null;
         _tooltipTitleText.dispose();
         _tooltipTitleText = null;
         _tooltip.dispose();
         _tooltip = null;
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
      
      private function onClickSourceInfo(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(_itemPattern.title,_itemPattern.sourceInfo,LocText.current.text("general/button_ok"),null,false,true));
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(4,true);
         }
         else
         {
            scrollDown(4,true);
         }
         param1.rawEvent.stopImmediatePropagation();
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(4,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(4,false);
      }
      
      private function onClickCollectReward(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("collectItemPatternReward",{
            "identifier":_itemPattern.identifier,
            "value":_itemPatternValue.value,
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
         var _loc3_:Character = User.current.character;
         if(_offset == _itemPattern.getItemIdentifiers(_loc3_.gender).length - 12)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _itemPattern.getItemIdentifiers(_loc3_.gender).length - 12)
         {
            _offset = _itemPattern.getItemIdentifiers(_loc3_.gender).length - 12;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refresh(param1:ItemPattern, param2:Boolean = false) : void
      {
         if(!_content || !param1)
         {
            return;
         }
         if(_itemPattern == param1 && _itemPatternValue == param1.currentTargetValue() && !param2)
         {
            return;
         }
         _itemPattern = param1;
         _itemPatternValue = _itemPattern.currentTargetValue();
         var _loc3_:Character = User.current.character;
         _content.txtName.text = LocText.current.text("dialog/sewing_machine/item_pattern_title",_itemPattern.title,_itemPattern.getItemIdentifiers(_loc3_.gender).length);
         _content.txtName.text = StringUtil.replace(_content.txtName.text," (","\n(");
         _btnSourceInfo.htmlTooltip = _itemPattern.sourceInfo;
         _content.txtProgressTotal.text = LocText.current.text("dialog/sewing_machine/item_pattern_progress",LocText.current.formatHugeNumber(_itemPattern.currentValue),LocText.current.formatHugeNumber(_itemPattern.getItemIdentifiers(_loc3_.gender).length));
         _progressBarTotal.value = _itemPattern.currentValue / _itemPattern.getItemIdentifiers(_loc3_.gender).length * 100;
         _content.txtProgress.text = _itemPatternValue.progressText;
         _progressBar.value = _itemPatternValue.progress;
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         var _loc4_:* = !_itemPatternValue.isCollected();
         _content.progressBarTotal.visible = !_loc4_;
         _content.txtProgressTotal.visible = !_loc4_;
         _content.progressBar.visible = _loc4_;
         _content.txtProgress.visible = _loc4_;
         _content.tooltipLayer.visible = _loc4_;
         _content.txtProgressCaption.visible = _loc4_;
         _content.txtRewardsCaption.visible = _loc4_;
         _content.txtReward.visible = _loc4_;
         _content.iconItem.visible = false;
         _content.iconQuestEnergy.visible = false;
         _content.iconStatPoints.visible = false;
         _content.itemReward.visible = false;
         _content.rewardTitle.visible = false;
         _btnCollectReward.visible = false;
         _content.tooltipLayer.visible = false;
         _content.txtReward.x = 221;
         _content.iconItem.x = 181;
         _content.iconQuestEnergy.x = 186;
         _content.iconStatPoints.x = 196;
         _content.itemReward.x = 181;
         _content.tooltipLayer.x = 179;
         if(_loc4_)
         {
            _content.tooltipLayer.visible = true;
            _content.txtReward.text = _itemPatternValue.rewardText;
            _content.iconItem.visible = _itemPatternValue.isItemReward;
            _content.iconQuestEnergy.visible = _itemPatternValue.isQuestEnergyReward;
            _content.iconStatPoints.visible = _itemPatternValue.isStatPointReward;
            _content.rewardTitle.visible = _itemPatternValue.hasTitleReward && AppConfig.titlesEnabled;
            if(_content.rewardTitle.visible)
            {
               _tooltipTitleText.text = LocText.current.text("dialog/sewing_machine/info_progress_title",Titles.instance.getNameWithTitle(User.current.character.name,_itemPatternValue.rewardTitle));
               _content.txtReward.x = _content.txtReward.x + 35;
               _content.iconItem.x = _content.iconItem.x + 35;
               _content.iconQuestEnergy.x = _content.iconQuestEnergy.x + 35;
               _content.iconStatPoints.x = _content.iconStatPoints.x + 35;
               _content.itemReward.x = _content.itemReward.x + 35;
               _content.tooltipLayer.x = _content.tooltipLayer.x + 35;
            }
            _tooltip.text = _itemPatternValue.rewardDescription;
            _btnCollectReward.visible = _itemPatternValue.isCollectable();
            if(_itemPatternValue.isCollectable() && _itemPatternValue.isItemReward)
            {
               Environment.application.sendActionRequest("getItemPatternItemReward",{
                  "identifier":_itemPattern.identifier,
                  "value":_itemPatternValue.value
               },handleRequests);
            }
         }
         _btnScrollUp.visible = _itemPattern.getItemIdentifiers(_loc3_.gender).length > 12;
         _btnScrollDown.visible = _itemPattern.getItemIdentifiers(_loc3_.gender).length > 12;
         _offset = 0;
         refreshList();
         if(_itemPattern.isNew)
         {
            Environment.application.sendActionRequest("itemPatternSelected",{"identifier":_itemPattern.identifier},handleRequests);
         }
      }
      
      private function refreshList() : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         if(!_content)
         {
            return;
         }
         if(!_itemPattern)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _itemPattern.getItemIdentifiers(_loc1_.gender).length - 12;
         var _loc2_:Object = Constants.current.constant("item_templates");
         _loc3_ = 0;
         while(_loc3_ < _itemSlots.length)
         {
            _loc5_ = _itemSlots[_loc3_];
            _loc5_.container.visible = _itemPattern.getItemIdentifiers(_loc1_.gender).length > _loc3_ + _offset;
            if(_loc5_.container.visible)
            {
               _loc4_ = _itemPattern.getItemIdentifiers(_loc1_.gender)[_loc3_ + _offset];
               _loc5_.itemPattern = _itemPattern.getItemIdentifiers(_loc1_.gender)[_loc3_ + _offset] as String;
               _loc5_.container.iconCheckmark.visible = _itemPattern.isItemCollected(_loc4_);
               _loc5_.container.iconLock.visible = !_loc5_.container.iconCheckmark.visible && _loc2_[_loc4_]["required_level"] > _loc1_.level;
            }
            _loc3_++;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getItemPatternItemReward":
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
            case "itemPatternSelected":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _dialog.refreshCounter();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "collectItemPatternReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("goal_collected.mp3");
                  showRewardEffect(!param1.request.getBoolean("discard_item"));
                  _dialog.refreshCounter();
                  refresh(_itemPattern,true);
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
               }
               else if(param1.error != "errCollectItemPatternAlreadyExists")
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
            if(param1 && _itemPatternValue.isItemReward && _itemReward)
            {
               EffectsLayer.instance.show(3,{
                  "emitter":_content.itemReward,
                  "imageUrl":_itemReward.item.iconImageUrl
               });
            }
            if(_content.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,{
                  "emitter":_content.iconStatPoints,
                  "amount":_itemPatternValue.rewardAmount
               });
            }
            if(_content.rewardTitle.visible)
            {
               EffectsLayer.instance.show(10,{"emitter":_content.rewardTitle});
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
         Environment.application.sendActionRequest("collectItemPatternReward",{
            "identifier":_itemPattern.identifier,
            "value":_itemPatternValue.value,
            "discard_item":true
         },handleRequests);
      }
   }
}
