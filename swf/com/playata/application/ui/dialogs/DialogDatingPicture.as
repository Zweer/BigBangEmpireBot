package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.filter.BlurFilter;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDatingPictureGeneric;
   
   public class DialogDatingPicture extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnLeft:UiButton;
      
      private var _btnRight:UiButton;
      
      private var _btnHideMessage:UiButton;
      
      private var _btnShowMessage:UiButton;
      
      private var _btnUpgrade:UiPremiumButton;
      
      private var _datingIndex:int;
      
      private var _stepIndex:int;
      
      private var _getPreviousPicture:Function;
      
      private var _getNextPicture:Function;
      
      private var _upgradeCallback:Function;
      
      private var _showNextStep:Function;
      
      public function DialogDatingPicture(param1:int, param2:int, param3:Function = null, param4:Function = null, param5:Function = null, param6:Function = null)
      {
         var _loc9_:SymbolDialogDatingPictureGeneric = new SymbolDialogDatingPictureGeneric();
         super(_loc9_,false);
         _getPreviousPicture = param3;
         _getNextPicture = param4;
         _upgradeCallback = param5;
         _showNextStep = param6;
         _btnClose = new UiButton(_loc9_.btnClose,"",onClickClose);
         _btnLeft = new UiButton(_loc9_.btnLeft,"",onClickLeft);
         _btnRight = new UiButton(_loc9_.btnRight,"",onClickRight);
         _btnHideMessage = new UiButton(_loc9_.btnHideMessage,"",onClickHideMessage);
         _btnShowMessage = new UiButton(_loc9_.btnShowMessage,"",onClickShowMessage);
         _btnUpgrade = new UiPremiumButton(_loc9_.btnUpgrade,CConstant.dating_upgrade_storage_premium_currency,"",LocText.current.text("dating/upgrade_storage"),"","",onClickUpgrade);
         _btnUpgrade.premium = true;
         var _loc8_:Number = LayoutUtil.deviceAdjustedWidthCorrection / 2;
         var _loc7_:Number = LayoutUtil.deviceAdjustedHeightCorrection / 2;
         _loc9_.background.width = _loc9_.background.width + LayoutUtil.deviceAdjustedWidthCorrection;
         _loc9_.background.height = _loc9_.background.height + LayoutUtil.deviceAdjustedHeightCorrection;
         _loc9_.background.x = _loc9_.background.x - _loc8_;
         _loc9_.background.y = _loc9_.background.y - _loc7_;
         _loc9_.btnClose.x = _loc9_.btnClose.x + _loc8_;
         _loc9_.btnClose.y = _loc9_.btnClose.y - _loc7_;
         _loc9_.btnLeft.x = _loc9_.btnLeft.x - _loc8_;
         _loc9_.btnRight.x = _loc9_.btnRight.x + _loc8_;
         _loc9_.btnShowMessage.x = _loc9_.btnShowMessage.x + _loc8_;
         _loc9_.btnShowMessage.y = _loc9_.btnShowMessage.y + _loc7_;
         if(LayoutUtil.isWidthAdjustedFormat)
         {
            _loc9_.girl.scale = Environment.layout.appHeight / Environment.layout.appDefaultHeight;
         }
         else
         {
            _loc9_.girl.scale = Environment.layout.appWidth / Environment.layout.appDefaultWidth;
         }
         _loc9_.girl.x = _loc9_.girl.x - (_loc9_.girl.scale * 450 - 450);
         _loc9_.girl.y = _loc9_.girl.y - (_loc9_.girl.scale * 315 - 315);
         refresh(param1,param2);
      }
      
      public function refresh(param1:int = -2, param2:int = -1, param3:Boolean = true) : void
      {
         if((param1 <= -1 || param2 <= 0) && (_datingIndex <= -1 || _stepIndex <= 0))
         {
            return;
         }
         if(param1 > -1 && param2 > 0)
         {
            _datingIndex = param1;
            _stepIndex = param2;
         }
         var _loc4_:SymbolDialogDatingPictureGeneric = _vo as SymbolDialogDatingPictureGeneric;
         _loc4_.girl.setUriSprite(DatingUtil.getGirlRewardImageUrl(_datingIndex,_stepIndex),900,630,false,1,null,true);
         _btnClose.visible = true;
         if(!User.current.character.dating.isPictureAllowed(_datingIndex,_stepIndex))
         {
            _loc4_.txtUpgrade.visible = true;
            _loc4_.upgradeBackground.visible = true;
            _btnUpgrade.visible = true;
            _loc4_.message.visible = false;
            _btnHideMessage.visible = false;
            _btnShowMessage.visible = false;
            if(param3)
            {
               _loc4_.girl.addFilter(new BlurFilter(50,50));
            }
            _loc4_.txtUpgrade.text = LocText.current.text("dating/upgrade_storage_info",CConstant.dating_upgrade_storage_premium_currency,CConstant.dating_storage_upgrade);
            _loc4_.txtUpgrade.autoFontSize = true;
         }
         else
         {
            _loc4_.txtUpgrade.visible = false;
            _loc4_.upgradeBackground.visible = false;
            _btnUpgrade.visible = false;
            _loc4_.message.visible = true;
            _btnHideMessage.visible = _loc4_.message.alpha == 1;
            _btnShowMessage.visible = _loc4_.message.alpha == 0;
            if(param3)
            {
               _loc4_.girl.removeAllFilters();
            }
            _loc4_.message.caption.text = DatingUtil.getImageText(_datingIndex,_stepIndex);
         }
         _btnLeft.visible = _getPreviousPicture != null && _getNextPicture != null;
         _btnRight.visible = _getPreviousPicture != null && _getNextPicture != null;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
         if(_showNextStep != null)
         {
            _showNextStep();
         }
      }
      
      private function onClickLeft(param1:InteractionEvent) : void
      {
         if(_getPreviousPicture != null)
         {
            _getPreviousPicture(this);
         }
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
         if(_getNextPicture != null)
         {
            _getNextPicture(this);
         }
      }
      
      private function onClickHideMessage(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogDatingPictureGeneric = _vo as SymbolDialogDatingPictureGeneric;
         _btnHideMessage.visible = false;
         _btnShowMessage.visible = false;
         _loc2_.message.tweenTo(1,{"alpha":0});
         _btnShowMessage.tweenTo(1.5,{"visible":true});
      }
      
      private function onClickShowMessage(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogDatingPictureGeneric = _vo as SymbolDialogDatingPictureGeneric;
         _btnHideMessage.visible = false;
         _btnShowMessage.visible = false;
         _loc2_.message.tweenTo(1,{"alpha":1});
         _btnHideMessage.tweenTo(1.5,{"visible":true});
      }
      
      private function onClickUpgrade(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("upgradeDatingStorage",{
            "dating_index":_datingIndex,
            "step_index":_stepIndex
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("upgradeDatingStorage" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _loc2_ = _vo as SymbolDialogDatingPictureGeneric;
            if(User.current.character.dating.isPictureAllowed(_datingIndex,_stepIndex))
            {
               _loc2_.girl.tweenTo(3,{"blurFilter":{
                  "blurY":1,
                  "blurX":1,
                  "remove":true
               }});
               _loc2_.txtUpgrade.visible = false;
               _loc2_.upgradeBackground.visible = false;
               _btnUpgrade.visible = false;
               _loc2_.message.visible = false;
               _loc2_.message.alpha = 0;
               _btnHideMessage.visible = false;
               _btnShowMessage.visible = false;
               _btnLeft.visible = false;
               _btnRight.visible = false;
               _btnClose.visible = false;
               Runtime.delayFunction(refresh,3);
               Runtime.delayFunction(onClickShowMessage,3,[null]);
            }
            if(_upgradeCallback != null)
            {
               _upgradeCallback();
            }
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(CConstant.dating_upgrade_storage_premium_currency);
         }
         else if(param1.error != "errStartDatingStepAlreadyStarted")
         {
            if(param1.error == "errCharacterNoDatingLookup")
            {
               close();
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnLeft.dispose();
         _btnLeft = null;
         _btnRight.dispose();
         _btnRight = null;
         _btnHideMessage.dispose();
         _btnHideMessage = null;
         _btnShowMessage.dispose();
         _btnShowMessage = null;
         _btnUpgrade.dispose();
         _btnUpgrade = null;
         super.dispose();
      }
      
      public function get stepIndex() : int
      {
         return _stepIndex;
      }
      
      public function get datingIndex() : int
      {
         return _datingIndex;
      }
   }
}
