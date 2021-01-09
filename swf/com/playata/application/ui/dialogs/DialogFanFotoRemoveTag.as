package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFanFotoRemoveTagGeneric;
   
   public class DialogFanFotoRemoveTag extends UiDialog
   {
       
      
      private var _btnRemove:UiPremiumButton = null;
      
      private var _btnRemoveAll:UiPremiumButton = null;
      
      private var _btnClose:UiButton;
      
      private var _tag:int;
      
      private var _refreshCallback:Function;
      
      public function DialogFanFotoRemoveTag(param1:int, param2:Function)
      {
         var _loc4_:SymbolDialogFanFotoRemoveTagGeneric = new SymbolDialogFanFotoRemoveTagGeneric();
         super(_loc4_);
         _queued = false;
         _tag = param1;
         _refreshCallback = param2;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/fan_foto_remove_tag/title");
         _loc4_.textMessage.text = LocText.current.text("dialog/fan_foto_remove_tag/info",LocText.current.text("fan_foto/tag/" + _tag + "/name"));
         var _loc3_:FanFoto = User.current.character.fanFoto;
         _btnRemove = new UiPremiumButton(_loc4_.btnRemove,CConstant.fan_foto_remove_tag_cost,LocText.current.text("dialog/fan_foto_remove_tag/btn_remove"),LocText.current.text("dialog/fan_foto_remove_tag/btn_remove"),"","",onClickRemove);
         _btnRemove.premium = true;
         _btnRemoveAll = new UiPremiumButton(_loc4_.btnRemoveAll,CConstant.fan_foto_remove_all_tags_cost,"",LocText.current.text("dialog/fan_foto_remove_tag/btn_remove_all"),"","",onClickRemoveAll);
         _btnRemoveAll.premium = true;
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         if(_loc3_.tags.length == 1)
         {
            _btnRemoveAll.visible = false;
            _btnRemove.x = -_loc4_.btnRemove.x;
            _loc4_.textMessage.text = LocText.current.text("dialog/fan_foto_remove_tag/info_single",LocText.current.text("fan_foto/tag/" + _tag + "/name"));
         }
         if(!_loc3_.fotosAvailableForTags && !TimeUtil.serverDateTime.isToday(_loc3_.tsLastTagRemoved))
         {
            _btnRemove.premium = false;
            _btnRemove.premiumAmount = 0;
         }
      }
      
      override public function dispose() : void
      {
         _btnRemove.dispose();
         _btnRemove = null;
         _btnRemoveAll.dispose();
         _btnRemoveAll = null;
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRemove(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("removeFanFotoTag",{"tag":_tag},handleRequests);
      }
      
      private function onClickRemoveAll(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("removeAllFanFotoTags",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "removeFanFotoTag":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close(_refreshCallback);
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnRemove.premiumAmount);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "removeAllFanFotoTags":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close(_refreshCallback);
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnRemoveAll.premiumAmount);
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
   }
}
