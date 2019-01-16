package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.battle.UiBattleSkillGenerationResult;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCustomizeItemResultGeneric;
   
   public class DialogCustomizeItemResult extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _btnCustomize:UiPremiumButton;
      
      private var _itemId:int;
      
      private var _skill1:UiBattleSkillGenerationResult;
      
      private var _skill2:UiBattleSkillGenerationResult;
      
      private var _skill3:UiBattleSkillGenerationResult;
      
      private var _itemSlot:UiItemSlot;
      
      private var _item:Item;
      
      public function DialogCustomizeItemResult(param1:Boolean)
      {
         _isOpen = true;
         var _loc3_:SymbolDialogCustomizeItemResultGeneric = new SymbolDialogCustomizeItemResultGeneric();
         super(_loc3_);
         _queued = param1;
         _skill1 = new UiBattleSkillGenerationResult(_loc3_.skill1,onSelectSkill,0);
         _skill2 = new UiBattleSkillGenerationResult(_loc3_.skill2,onSelectSkill,1);
         _skill3 = new UiBattleSkillGenerationResult(_loc3_.skill3,onSelectSkill,2);
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/customize_item_result/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/customize_item_result/info");
         _loc3_.reroll.txtInfoAgain.text = LocText.current.text("dialog/customize_item_result/info_again");
         _btnCustomize = new UiPremiumButton(_loc3_.reroll.btnCustomizeAgain,CConstant.customize_item_premium_currency_amount,LocText.current.text("dialog/customize_item_result/button_customize"),LocText.current.text("dialog/customize_item_result/button_customize"),"","",onClickCustomize);
         _btnCustomize.buttonEnabled = false;
         _loc3_.reroll.addChild(_btnCustomize);
         _loc3_.effectLayerContainer.removeAllChildren();
         _loc3_.skill1.visible = false;
         _loc3_.skill2.visible = false;
         _loc3_.skill3.visible = false;
         var _loc2_:Object = User.current.character.pendingItemCustomization;
         if(!_item)
         {
            _itemId = _loc2_["item"];
            _item = User.current.character.getItemById(_itemId);
            _itemSlot = new UiItemSlot(_loc3_.itemSlot,20);
            _itemSlot.item = _item;
            _itemSlot.locked = true;
         }
         _btnCustomize.premium = User.current.character.customizeItemUsed;
         _btnCustomize.textTooltip.requestTextFunction = getCustomizeItemTooltip;
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         Runtime.delayFunction(refresh,1,[false]);
         Runtime.delayFunction(revealSkills,1.6);
      }
      
      private function refresh(param1:Boolean = true) : void
      {
         var _loc6_:* = null;
         var _loc4_:SymbolDialogCustomizeItemResultGeneric = _vo as SymbolDialogCustomizeItemResultGeneric;
         var _loc3_:Object = User.current.character.pendingItemCustomization;
         _loc4_.skill1.visible = true;
         _loc4_.skill2.visible = true;
         _loc4_.skill3.visible = true;
         var _loc2_:BattleSkill = _item.battleSkillData;
         var _loc5_:Vector.<BattleSkill> = new Vector.<BattleSkill>(0);
         var _loc9_:int = 0;
         var _loc8_:* = _loc3_["skills"];
         for each(var _loc7_ in _loc3_["skills"])
         {
            _loc6_ = BattleSkill.fromData(_loc7_);
            if(!_loc2_ || !_loc2_.isEqual(_loc6_))
            {
               _loc5_.push(_loc6_);
            }
         }
         if(_loc2_)
         {
            _loc5_.unshift(_loc2_);
         }
         _skill1.setSkill(_loc5_[0],_loc2_ == null);
         _skill2.setSkill(_loc5_[1]);
         _skill3.setSkill(_loc5_[2]);
         Runtime.killDelayedFunction(_skill1.reveal);
         Runtime.killDelayedFunction(_skill2.reveal);
         Runtime.killDelayedFunction(_skill3.reveal);
         Runtime.killDelayedFunction(Environment.audio.playFX);
         _btnCustomize.premium = User.current.character.customizeItemUsed;
         _btnCustomize.textTooltip.requestTextFunction = getCustomizeItemTooltip;
         if(param1)
         {
            revealSkills();
         }
      }
      
      private function revealSkills() : void
      {
         var _loc1_:* = 1;
         var _loc2_:Array = [];
         if(_skill1.isNew)
         {
            Runtime.delayFunction(_skill1.reveal,_loc1_);
            _loc1_ = Number(_loc1_ + (0.8 + 0.1));
            _loc2_.push(_skill1.skill.quality);
         }
         Runtime.delayFunction(_skill2.reveal,_loc1_);
         _loc1_ = Number(_loc1_ + (0.8 + 0.1));
         Runtime.delayFunction(_skill3.reveal,_loc1_);
         _loc2_.push(_skill2.skill.quality);
         _loc2_.push(_skill3.skill.quality);
         var _loc3_:int = !!_skill1.isNew?Math.max(_skill1.skill.quality,_skill2.skill.quality,_skill3.skill.quality):Number(Math.max(_skill2.skill.quality,_skill3.skill.quality));
         if(_loc3_ > 1)
         {
            Runtime.delayFunction(Environment.audio.playFX,1 + (_loc2_.indexOf(_loc3_) + 1) * 0.8 + 0.1,[_loc3_ == 2?"event_guild_artifact_won.mp3":"event_tutorial_complete.mp3"]);
         }
         Runtime.delayFunction(enableRerollButton,_loc1_ + 1);
      }
      
      private function enableRerollButton() : void
      {
         _btnCustomize.buttonEnabled = true;
      }
      
      override public function dispose() : void
      {
         Runtime.killDelayedFunction(_skill1.reveal);
         Runtime.killDelayedFunction(_skill2.reveal);
         Runtime.killDelayedFunction(_skill3.reveal);
         Runtime.killDelayedFunction(enableRerollButton);
         _btnCustomize.dispose();
         _btnCustomize = null;
         _skill1.dispose();
         _skill2.dispose();
         _skill3.dispose();
         _itemSlot.dispose();
         _itemSlot = null;
         _item = null;
         super.dispose();
      }
      
      private function getCustomizeItemTooltip() : String
      {
         if(User.current.character.customizeItemUsed)
         {
            return LocText.current.text("dialog/customize_item/button_customize_wait_tooltip",GameUtil.getPremiumCurrencyString(CConstant.customize_item_premium_currency_amount),TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
         }
         return LocText.current.text("dialog/customize_item/button_customize_default_tooltip");
      }
      
      private function onClickCustomize(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("generateNewItemBattleSkill",{
            "item_id":_item.id,
            "use_premium":_btnCustomize.premium
         },handleRequests);
         _btnCustomize.buttonEnabled = false;
      }
      
      private function onSelectSkill(param1:int) : void
      {
         Environment.application.sendActionRequest("changeItemSkill",{
            "item_id":_itemId,
            "skill_index":param1
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "changeItemSkill":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "generateNewItemBattleSkill":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.customize_item_premium_currency_amount);
               }
               else if(param1.error == "errCustomizeItemItemNotYetAllowed")
               {
                  _btnCustomize.premium = true;
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/customize_item/not_yet_allowed/title"),LocText.current.text("dialog/customize_item/not_yet_allowed/text"),LocText.current.text("general/button_ok")));
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
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
   }
}
