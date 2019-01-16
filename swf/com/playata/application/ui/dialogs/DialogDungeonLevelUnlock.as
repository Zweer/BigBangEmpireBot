package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonLevelUnlockGeneric;
   
   public class DialogDungeonLevelUnlock extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _level:DungeonLevel;
      
      private var _btnUnlock:UiPremiumButton;
      
      private var _btnLeaveDungeon:UiTextButton;
      
      private var _levelUnlockedCallback:Function;
      
      private var _tooltipFans:UiTextTooltip;
      
      private var _tooltipLock:UiTextTooltip;
      
      private var _tooltipRewards:UiTextTooltip;
      
      public function DialogDungeonLevelUnlock(param1:DungeonLevel, param2:Function)
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:* = null;
         _isOpen = true;
         _levelUnlockedCallback = param2;
         var _loc7_:SymbolDialogDungeonLevelUnlockGeneric = new SymbolDialogDungeonLevelUnlockGeneric();
         super(_loc7_);
         _level = param1;
         _tooltipFans = new UiTextTooltip(_loc7_.txtFans,"");
         _tooltipLock = new UiTextTooltip(_loc7_.lock,"");
         var _loc8_:String = LocText.current.formatHugeNumber(param1.fansNeeded);
         var _loc3_:String = LocText.current.formatHugeNumber(User.current.character.fansTotal);
         _loc7_.txtRequirementsCaption.text = LocText.current.text("dialog/dungeon_level_unlock/caption_requirements");
         _loc7_.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_level_unlock/caption_rewards");
         _loc7_.txtFans.text = _loc8_;
         _tooltipRewards = new UiTextTooltip(_loc7_.txtRewardsCaption,LocText.current.text("dialog/dungeon_level_unlock/caption_rewards_tooltips"));
         if(_level.isUnlocked)
         {
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_level_unlock/title_unlocked",param1.level);
            _loc7_.txtInfo.text = _level.textUnlocked;
            _loc7_.lock.visible = false;
            _tooltipFans.text = LocText.current.text("dialog/dungeon_level_unlock/tooltip_fans_unlocked",_loc8_,_loc3_);
            _loc7_.iconCheckmark.x = _loc7_.txtFans.x + _loc7_.txtFans.textWidth + 8;
            _loc7_.btnLeaveDungeon.visible = false;
            _loc7_.btnStartLevel.x = -45;
         }
         else
         {
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_level_unlock/title_locked",param1.level);
            _loc7_.txtInfo.text = _level.textLocked;
            _loc7_.lock.x = -_loc7_.txtDialogTitle.textWidth * 0.5 - 45 - _loc7_.lock.width;
            var _loc10_:* = LocText.current.text("dialog/dungeon_level_unlock/tooltip_fans_locked",_loc8_,_loc3_);
            _tooltipFans.text = _loc10_;
            _tooltipLock.text = _loc10_;
            _loc7_.iconCheckmark.visible = false;
         }
         _loc7_.txtInfo.autoFontSize = true;
         _loc7_.itemReward.visible = param1.rewardItemId != 0;
         if(param1.rewardItemId != 0)
         {
            _loc4_ = new UiItemSlot(_loc7_.itemReward,0);
            _loc4_.item = User.current.character.getItemById(param1.rewardItemId);
         }
         _btnLeaveDungeon = new UiTextButton(_loc7_.btnLeaveDungeon,LocText.current.text("dialog/dungeon_level_unlock/button_leave_dungeon"),"",onLeaveDungeonClicked);
         _btnUnlock = new UiPremiumButton(_loc7_.btnStartLevel,CConstant.dungeon_level_unlock_premium_currency_cost,LocText.current.text("dialog/dungeon_level_unlock/button_unlock_free"),LocText.current.text("dialog/dungeon_level_unlock/button_unlock_premium"),LocText.current.text("dialog/dungeon_quest_briefing/button_attack_no_cooldown_tooltip"),"",onClickUnlock);
         _btnUnlock.premium = !_level.isUnlocked;
         _btnLeaveDungeon.visible = _btnUnlock.premium;
         _loc7_.npc.removeAllChildren();
         if(param1.unlockNpcIdentifier != null)
         {
            _loc5_ = 720;
            _loc9_ = 840;
            _loc6_ = UriSprite.load(param1.unlockNpcImageUrlHD,_loc5_,_loc9_,true,1,null,true);
            _loc7_.npc.addChild(_loc6_);
            _loc7_.npc.alpha = 0;
            _loc7_.npc.x = _loc7_.npc.x + 55;
            _loc7_.npc.y = _loc7_.npc.y - 50;
            _loc7_.npc.applySettings(new TypedObject({"touchable":false}));
         }
         _loc7_.photo.photo.setUriSprite(param1.imageUrl,60,60,true,1,null,true);
         _loc10_ = false;
         _loc7_.photo.locked.visible = _loc10_;
         _loc7_.photo.completed.visible = _loc10_;
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         var _loc1_:SymbolDialogDungeonLevelUnlockGeneric = _vo as SymbolDialogDungeonLevelUnlockGeneric;
         _loc1_.npc.tweenTo(0.6,{
            "alpha":1,
            "delay":0.5
         });
      }
      
      override public function dispose() : void
      {
         _levelUnlockedCallback = null;
         if(_btnLeaveDungeon.parent)
         {
            _btnLeaveDungeon.dispose();
         }
         _btnLeaveDungeon = null;
         _btnUnlock.dispose();
         _btnUnlock = null;
         _tooltipFans.dispose();
         _tooltipLock.dispose();
         _tooltipRewards.dispose();
         super.dispose();
      }
      
      private function onClickUnlock(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("unlockDungeonLevel",{},handleRequests);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
         var _loc2_:SymbolDialogDungeonLevelUnlockGeneric = _vo as SymbolDialogDungeonLevelUnlockGeneric;
         _loc2_.npc.tweenTo(0.1,{"alpha":0});
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "unlockDungeonLevel":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  PanelDungeon.visualizeProgress = true;
                  _levelUnlockedCallback();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.dungeon_level_unlock_premium_currency_cost);
               }
               else if(param1.error == "errFinishDungeonTimeUpInvalidStatus")
               {
                  close();
                  ViewManager.instance.showPanel("citymap");
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterLocation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  PanelCitymap.lastAction = 1;
                  ViewManager.instance.showPanel("citymap");
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quests");
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function onLeaveDungeonClicked(param1:InteractionEvent) : void
      {
         if(User.current.character.activeQuest)
         {
            Environment.application.sendActionRequest("setCharacterStage",{
               "stage":User.current.character.activeQuest.stage,
               "on_map":false
            },handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("setCharacterLocation",{"location":1},handleRequests);
         }
      }
      
      override public function onEscape() : void
      {
         if(!_level.isUnlocked)
         {
            close();
         }
      }
   }
}
