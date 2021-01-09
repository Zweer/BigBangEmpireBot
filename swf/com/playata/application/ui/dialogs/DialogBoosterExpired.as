package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.booster.UiBoosterExpiredButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBoosterExpiredGeneric;
   
   public class DialogBoosterExpired extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _confirmationBoosterId:String;
      
      private var _booster1:UiBoosterExpiredButton;
      
      private var _booster2:UiBoosterExpiredButton;
      
      private var _booster3:UiBoosterExpiredButton;
      
      private var _booster4:UiBoosterExpiredButton;
      
      private var _booster5:UiBoosterExpiredButton;
      
      public function DialogBoosterExpired(param1:Vector.<String>)
      {
         var _loc3_:SymbolDialogBoosterExpiredGeneric = new SymbolDialogBoosterExpiredGeneric();
         super(_loc3_);
         _queued = false;
         var _loc2_:Character = User.current.character;
         _loc3_.booster2.visible = param1.length > 1;
         _loc3_.booster3.visible = param1.length > 2;
         _loc3_.booster4.visible = param1.length > 3;
         _loc3_.booster5.visible = param1.length > 4;
         switch(int(param1.length) - 1)
         {
            case 0:
               _loc3_.dialogBackground.height = 243;
               _booster1 = new UiBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               break;
            case 1:
               _loc3_.dialogBackground.height = 310;
               _booster1 = new UiBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               _booster2 = new UiBoosterExpiredButton(_loc3_.booster2,param1[1],_loc2_,onBoosterClicked);
               break;
            case 2:
               _loc3_.dialogBackground.height = 373;
               _booster1 = new UiBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               _booster2 = new UiBoosterExpiredButton(_loc3_.booster2,param1[1],_loc2_,onBoosterClicked);
               _booster3 = new UiBoosterExpiredButton(_loc3_.booster3,param1[2],_loc2_,onBoosterClicked);
               break;
            case 3:
               _loc3_.dialogBackground.height = 442;
               _booster1 = new UiBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               _booster2 = new UiBoosterExpiredButton(_loc3_.booster2,param1[1],_loc2_,onBoosterClicked);
               _booster3 = new UiBoosterExpiredButton(_loc3_.booster3,param1[2],_loc2_,onBoosterClicked);
               _booster4 = new UiBoosterExpiredButton(_loc3_.booster4,param1[3],_loc2_,onBoosterClicked);
               break;
            case 4:
               _loc3_.dialogBackground.height = 510;
               _booster1 = new UiBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               _booster2 = new UiBoosterExpiredButton(_loc3_.booster2,param1[1],_loc2_,onBoosterClicked);
               _booster3 = new UiBoosterExpiredButton(_loc3_.booster3,param1[2],_loc2_,onBoosterClicked);
               _booster4 = new UiBoosterExpiredButton(_loc3_.booster4,param1[3],_loc2_,onBoosterClicked);
               _booster5 = new UiBoosterExpiredButton(_loc3_.booster5,param1[4],_loc2_,onBoosterClicked);
         }
         centerDialog(_loc3_);
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         if(param1.length == 1)
         {
            if(_booster1.isQuestBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/quest_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/quest_booster_expired/text");
            }
            else if(_booster1.isStatBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/stats_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/stats_booster_expired/text");
            }
            else if(_booster1.isWorkBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/work_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/work_booster_expired/text");
            }
            else if(_booster1.isSenseBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/sense_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/sense_booster_expired/text");
            }
            else if(_booster1.isMultitaskingBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/multitasking_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/multitasking_booster_expired/text");
            }
         }
         else
         {
            _loc3_.txtDialogTitle.text = LocText.current.text("dialog/multiple_boosters_expired/title");
            _loc3_.txtInfo.text = LocText.current.text("dialog/multiple_boosters_expired/text");
         }
         refresh(false);
      }
      
      private function centerDialog(param1:SymbolDialogBoosterExpiredGeneric) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.dialogBackground.height / 2) * -1;
         var _loc2_:int = param1.dialogBackground.y - _loc4_;
         if(_loc2_ != 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.numChildren)
            {
               _vo.getChildAt(_loc3_).y = _vo.getChildAt(_loc3_).y - _loc2_;
               _loc3_++;
            }
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _booster1.dispose();
         _booster1 = null;
         if(_booster2)
         {
            _booster2.dispose();
            _booster2 = null;
         }
         if(_booster3)
         {
            _booster3.dispose();
            _booster3 = null;
         }
         if(_booster4)
         {
            _booster4.dispose();
            _booster4 = null;
         }
         if(_booster5)
         {
            _booster5.dispose();
            _booster5 = null;
         }
         super.dispose();
      }
      
      private function refresh(param1:Boolean = true) : void
      {
         var _loc3_:Boolean = false;
         if(!_booster1)
         {
            return;
         }
         var _loc2_:Character = User.current.character;
         _booster1.refresh(_loc2_);
         if(_booster2)
         {
            _booster2.refresh(_loc2_);
         }
         if(_booster3)
         {
            _booster3.refresh(_loc2_);
         }
         if(_booster4)
         {
            _booster4.refresh(_loc2_);
         }
         if(_booster5)
         {
            _booster5.refresh(_loc2_);
         }
         if(param1)
         {
            _loc3_ = _booster1.extended;
            if(_loc3_ && _booster2)
            {
               _loc3_ = _booster2.extended;
            }
            if(_loc3_ && _booster3)
            {
               _loc3_ = _booster3.extended;
            }
            if(_loc3_ && _booster4)
            {
               _loc3_ = _booster4.extended;
            }
            if(_loc3_ && _booster5)
            {
               _loc3_ = _booster5.extended;
            }
            if(_loc3_)
            {
               close();
            }
         }
      }
      
      private function onBoosterClicked(param1:UiBoosterExpiredButton) : void
      {
         _confirmationBoosterId = param1.boosterId;
         buyBooster(_confirmationBoosterId);
      }
      
      private function buyBooster(param1:String) : void
      {
         if(param1 == "booster_sense")
         {
            Environment.application.sendActionRequest("buySenseBooster",{},handleRequests);
         }
         else if(param1 == "booster_multitasking")
         {
            Environment.application.sendActionRequest("buyMultitaskingBooster",{},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("buyBooster",{"id":param1},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "buyBooster":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("booster_activate.mp3");
                  refresh();
               }
               else
               {
                  if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.booster_large_costs_premium_currency);
                  }
                  else if(param1.error == "errRemoveGameCurrencyNotEnough")
                  {
                     _loc2_ = CBooster.fromId(_confirmationBoosterId).amount;
                     ViewManager.instance.showNotEnoughGameCurrencyDialog(GameUtil.boosterCost(User.current.character.level,_loc2_ == 10));
                  }
                  else if(param1.error != "errConsumeBoosterNotYetAllowed")
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
                  ViewManager.instance.refresh();
               }
               break;
            case "buySenseBooster":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("booster_activate.mp3");
                  refresh();
               }
               else
               {
                  if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.booster_sense_costs_premium_currency_amount);
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
                  ViewManager.instance.refresh();
               }
               break;
            case "buyMultitaskingBooster":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("booster_activate.mp3");
                  refresh();
               }
               else
               {
                  if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.multitasking_rent_premium_amount);
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
                  ViewManager.instance.refresh();
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
         close();
      }
   }
}
