package com.playata.application.ui.dialogs
{
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.fan_foto.UiFanFotoOffer;
   import com.playata.application.ui.elements.fan_foto.UiFanFotoProgressBar;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFanFotoUnlockFotoGeneric;
   
   public class DialogFanFotoUnlockFoto extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnEditTag:UiTextButton;
      
      private var _offer1:UiFanFotoOffer;
      
      private var _offer2:UiFanFotoOffer;
      
      private var _offer3:UiFanFotoOffer;
      
      private var _fanFotoProgressBar:UiFanFotoProgressBar;
      
      private var _type:int;
      
      public function DialogFanFotoUnlockFoto(param1:Boolean = true)
      {
         var _loc4_:int = 0;
         var _loc3_:SymbolDialogFanFotoUnlockFotoGeneric = new SymbolDialogFanFotoUnlockFotoGeneric();
         super(_loc3_);
         _queued = false;
         _offer1 = new UiFanFotoOffer(_loc3_.offerRandom,1,onClickUnlock);
         _offer2 = new UiFanFotoOffer(_loc3_.offerRandom25,2,onClickUnlock);
         _offer3 = new UiFanFotoOffer(_loc3_.offerNotRandom,3,onClickUnlock);
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnEditTag = new UiTextButton(_loc3_.btnEditTags,LocText.current.text("dialog/fan_foto_unlock/button_edit_tags"),"",onClickEditTags);
         var _loc2_:FanFoto = User.current.character.fanFoto;
         var _loc5_:Array = _loc2_.tags;
         _loc3_.txtTagCaption.text = LocText.current.text("dialog/fan_foto_unlock/caption_tags");
         _loc3_.txtTags.text = _loc5_.length + "/" + _loc2_.maxSelectableTags;
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_loc5_.length >= _loc4_)
            {
               _loc3_["txtTag" + _loc4_].text = LocText.current.text("fan_foto/tag/" + _loc5_[_loc4_ - 1] + "/name");
            }
            else
            {
               _loc3_["iconTag" + _loc4_].visible = false;
               _loc3_["txtTag" + _loc4_].visible = false;
            }
            _loc4_++;
         }
         _fanFotoProgressBar = new UiFanFotoProgressBar(_loc3_.fanFotoResourceBar,false);
         refresh();
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnEditTag.dispose();
         _btnEditTag = null;
         _fanFotoProgressBar.dispose();
         _fanFotoProgressBar = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         if(!User.current.character.hasTutorialFlag("fan_foto_tag2"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/fan_foto_edit_tags_arrow_text"),"left_side","down",641 + LayoutUtil.deviceAdjustedWidthCorrection / 2,421,1.5,0,false,"",true);
         }
         else if(!User.current.character.hasTutorialFlag("fan_foto_finished"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/fan_foto_unlock_arrow_text"),"right_back","up",373 + LayoutUtil.deviceAdjustedWidthCorrection / 2,289,1.5,0,true,"",true);
         }
      }
      
      private function refresh() : void
      {
         _offer1.refresh();
         _offer2.refresh();
         _offer3.refresh();
         _fanFotoProgressBar.refresh(User.current.character.fanFoto);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         close();
      }
      
      private function onClickEditTags(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         ViewManager.instance.tutorialArrow.hide();
         var tutorialFlagAlreadySet:Boolean = User.current.character.hasTutorialFlag("fan_foto_tag1");
         User.current.character.setTutorialFlag("fan_foto_tag1");
         close();
         if(tutorialFlagAlreadySet)
         {
            Environment.panelManager.showDialog(new DialogDatingPictures(false));
         }
         else
         {
            Runtime.delayFunction(function():void
            {
               Environment.panelManager.showDialog(new DialogDatingPictures(false));
            },1);
         }
      }
      
      private function onClickUnlock(param1:int) : void
      {
         _type = param1;
         unlockFanFoto();
      }
      
      private function unlockFanFoto() : void
      {
         ViewManager.instance.tutorialArrow.hide();
         Environment.application.sendActionRequest("buyRandomFanFoto",{"type":_type},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:* = param1.action;
         if("buyRandomFanFoto" !== _loc5_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _loc4_ = param1.appResponse.new_fan_foto_id;
            if(_loc4_ >= 0)
            {
               _loc3_ = User.current.character.fanFoto.unlockedFotosObject[_loc4_]["identifier"];
               Environment.panelManager.showDialog(new DialogFanFotoPicture(_loc4_,_loc3_,null,null));
            }
            refresh();
         }
         else if(param1.error == "errUnlockFanFotoNoTagsSet")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/fan_foto_unlock/error_no_tags/title"),LocText.current.text("dialog/fan_foto_unlock/error_no_tags/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errUnlockFanFotoNoFotoToUnlock")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/fan_foto_unlock/error_no_foto_with_tag/title"),LocText.current.text("dialog/fan_foto_unlock/error_no_foto_with_tag/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRemoveFanFotoResourceNotEnough")
         {
            _loc2_ = User.current.character.fanFoto.getResourceCost(_type) - User.current.character.fanFoto.currentResources;
            Environment.panelManager.showDialog(new DialogFanFotoBuyResource(_loc2_,unlockFanFoto));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
