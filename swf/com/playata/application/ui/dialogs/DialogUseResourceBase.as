package com.playata.application.ui.dialogs
{
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.resource.UiResourceButton;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.application.ui.panels.PanelQuestProgress;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   
   public class DialogUseResourceBase extends UiDialog
   {
       
      
      protected var _featureType:int = 0;
      
      protected var _featureFlag:String;
      
      protected var _btnClose:UiButton = null;
      
      protected var _btnSendRequest:UiTextButton = null;
      
      protected var _btnUseResource:UiResourceButton = null;
      
      protected var _resourceUsable:Boolean = true;
      
      public function DialogUseResourceBase(param1:Sprite, param2:int, param3:Boolean, param4:String)
      {
         var _loc6_:* = null;
         _featureType = param2;
         _resourceUsable = param3;
         _featureFlag = param4;
         var _loc5_:ResourceFeature = new ResourceFeature(_featureType);
         super(param1);
         _queued = false;
         getLabel("txtDialogTitle").text = _loc5_.useDialogTitleText;
         getLabel("txtInfo").text = _loc5_.useDialogInfoText;
         getLabel("txtResourceUsageCaption").text = _loc5_.useDialogUsageCaptionText;
         getLabel("txtResourcesLeft").text = LocText.current.text("dialog/use_resource/left_count",_loc5_.resourceUsageLeftCount);
         _btnClose = new UiButton(param1.getChildByName("btnClose"),"",onClickClose);
         _btnSendRequest = new UiTextButton(param1.getChildByName("btnSendRequest"),LocText.current.text("dialog/use_resource/button_send_request"),"",onClickSendRequest);
         _btnUseResource = new UiResourceButton(param1["btnUseResource"],_loc5_.resourceIconIndex,_loc5_.useAmount,_loc5_.useDialogButtonText,"",onClickUseResource);
         param1["iconResource"].gotoAndStop(_loc5_.resourceIconIndex);
         if(_loc5_.unusedResourceCount <= 0)
         {
            _btnUseResource.buttonEnabled = false;
            _btnUseResource.tooltip = _loc5_.useDialogButtonNoResourcesLeftTooltipText;
         }
         else if(_loc5_.resourceUsageLeftCount <= 0)
         {
            _btnUseResource.buttonEnabled = false;
            _btnUseResource.tooltip = _loc5_.useDialogButtonLimitReachedTooltipText;
         }
         else if(!(int(_featureType) - 1))
         {
            if(ViewManager.instance.activePanelInstance is PanelQuestProgress)
            {
               _loc6_ = ViewManager.instance.activePanelInstance as PanelQuestProgress;
               if(!_loc6_.durationEvent)
               {
                  _btnUseResource.buttonEnabled = false;
               }
            }
            else if(ViewManager.instance.activePanelInstance is PanelDungeon && Environment.panelManager.dialogManager.hasVisibleDialog(DialogDungeonQuestBriefing))
            {
               if(!User.current.character.hasDungeonQuestCooldown)
               {
                  _btnUseResource.buttonEnabled = false;
               }
            }
            else
            {
               _btnUseResource.buttonEnabled = false;
            }
         }
         if(!_resourceUsable)
         {
            _btnUseResource.visible = false;
            _btnSendRequest.content.x = _btnSendRequest.content.x + 110;
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSendRequest.dispose();
         _btnSendRequest = null;
         _btnUseResource.dispose();
         _btnUseResource = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSendRequest(param1:InteractionEvent) : void
      {
         close();
         Environment.panelManager.showDialog(new DialogResourceRequest(_featureType));
      }
      
      private function onClickUseResource(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("useResource",{
            "feature_type":_featureType,
            "feature_flag":_featureFlag
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = param1.action;
         if("useResource" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!(int(_featureType) - 1))
            {
               if(ViewManager.instance.activePanelInstance is PanelQuestProgress)
               {
                  _loc3_ = ViewManager.instance.activePanelInstance as PanelQuestProgress;
                  if(_loc3_.durationEvent && (_loc3_.durationEvent.isFightQuest || _loc3_.durationEvent.isTimeQuest || _loc3_.durationEvent.isStatQuest))
                  {
                     MessageRouter.dispatch(new Message("ViewMessage.notifyVideoAdvertismentFinished",{
                        "type":1,
                        "reference_id":param1.appResponse.quest.id
                     },this));
                  }
                  else if(_loc3_.durationEvent && _loc3_.durationEvent.isConventionShow)
                  {
                     MessageRouter.dispatch(new Message("ViewMessage.notifyVideoAdvertismentFinished",{
                        "type":1,
                        "reference_id":param1.appResponse.convention_show.id
                     },this));
                  }
               }
            }
            _loc2_ = new ResourceFeature(_featureType);
            _loc2_.showUsageConfirmation(param1.appResponse);
            close();
         }
         else if(param1.error != "errUseResourceLimitReached")
         {
            if(param1.error != "errUseResourceNoneLeft")
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      protected function getLabel(param1:String) : ILabel
      {
         return _vo.getChildByName(param1) as ILabel;
      }
   }
}
