package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFanFotoSetTagGeneric;
   
   public class DialogFanFotoSetTag extends UiDialog
   {
       
      
      private var _btnSet:UiPremiumButton = null;
      
      private var _btnClose:UiButton;
      
      private var _tag:int;
      
      private var _refreshCallback:Function;
      
      public function DialogFanFotoSetTag(param1:int, param2:Function)
      {
         var _loc4_:SymbolDialogFanFotoSetTagGeneric = new SymbolDialogFanFotoSetTagGeneric();
         super(_loc4_);
         _queued = false;
         _tag = param1;
         _refreshCallback = param2;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/fan_foto_buy_tag/title");
         _loc4_.textMessage.text = LocText.current.text("dialog/fan_foto_buy_tag/info",LocText.current.text("fan_foto/tag/" + _tag + "/name"));
         var _loc3_:int = CConstant.fan_foto_tag_3_cost;
         if(User.current.character.fanFoto.tags.length == 3)
         {
            _loc3_ = CConstant.fan_foto_tag_4_cost;
         }
         _btnSet = new UiPremiumButton(_loc4_.btnSet,_loc3_,"",LocText.current.text("dialog/fan_foto_buy_tag/btn_set"),"","",onClickSet);
         _btnSet.premium = true;
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnSet.dispose();
         _btnSet = null;
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSet(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("buyFanFotoTag",{"tag":_tag},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buyFanFotoTag" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close(_refreshCallback);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_btnSet.premiumAmount);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
