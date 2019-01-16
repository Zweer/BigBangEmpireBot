package com.playata.application.ui.dialogs
{
   import com.playata.application.data.optical_changes.OpticalChange;
   import com.playata.application.data.optical_changes.OpticalChangeAnimation;
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.application.data.optical_changes.OpticalChangeUtil;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogActivateOpticalChangeGeneric;
   
   public class DialogActivateOpticalChange extends UiDialog
   {
       
      
      private var _content:SymbolDialogActivateOpticalChangeGeneric;
      
      private var _dialog:DialogOpticalChanges;
      
      private var _opticalChange:OpticalChange;
      
      private var _btnClose:UiButton = null;
      
      private var _btnNext:UiButton;
      
      private var _btnPrevious:UiButton;
      
      private var _btnActivate:UiTextButton;
      
      private var _opticalChangeCategorie:OpticalChangeCategorie;
      
      private var _previewTarget:int = 0;
      
      private var _backgroundImage:IDisplayObject;
      
      private var _animationLayer:Sprite;
      
      private var _opticalChangeAnimation:OpticalChangeAnimation;
      
      private var _btnSourceInfo:UiButton;
      
      public function DialogActivateOpticalChange(param1:OpticalChange, param2:DialogOpticalChanges)
      {
         _content = new SymbolDialogActivateOpticalChangeGeneric();
         super(_content);
         _queued = false;
         _dialog = param2;
         _btnClose = new UiButton(_content.btnClose,"",onClickClose);
         _btnSourceInfo = new UiButton(_content.btnSourceInfo,"",onClickSourceInfo);
         _btnPrevious = new UiButton(_content.btnPrevious,"",onClickPrevious);
         _btnNext = new UiButton(_content.btnNext,"",onClickNext);
         _btnActivate = new UiTextButton(_content.btnActivate,LocText.current.text("dialog/activate_optical_change/btn_activate"),"",onClickActivate);
         _animationLayer = new Sprite();
         _opticalChangeAnimation = new OpticalChangeAnimation(_animationLayer);
         _content.preview.mask = _content.m;
         refreshOpticalChange(param1);
      }
      
      private function refreshOpticalChange(param1:OpticalChange) : void
      {
         _opticalChange = param1;
         _opticalChangeCategorie = OpticalChanges.instance.getOpticalChangeCategorieOfType(_opticalChange.type);
         var _loc2_:* = _opticalChangeCategorie != null;
         _btnNext.enabled = _loc2_;
         _btnPrevious.enabled = _loc2_;
         _previewTarget = 0;
         refresh();
      }
      
      private function refresh() : void
      {
         _btnActivate.enabled = false;
         if(_opticalChange.isUnlocked)
         {
            _content.txtDialogTitle.text = _opticalChange.name;
         }
         else
         {
            _content.txtDialogTitle.text = _opticalChange.name;
         }
         updatePreview();
         updateButton();
      }
      
      private function updatePreview() : void
      {
         var _loc2_:int = 1;
         if(_previewTarget == _loc2_ || _loc2_ == 0)
         {
            return;
         }
         _previewTarget = _loc2_;
         var _loc1_:Vector.<int> = OpticalChanges.instance.allActiveOptions;
         _loc1_ = OpticalChangeUtil.replaceOpticalChange(_loc1_,_opticalChange.id);
         OpticalChangeUtil.setBackground(_loc1_,null,0,onBackgroundLoaded);
         _opticalChangeAnimation.update(_loc1_);
      }
      
      private function onBackgroundLoaded(param1:IDisplayObject) : void
      {
         _content.preview.removeAllChildren(false);
         if(_backgroundImage)
         {
            _backgroundImage.dispose();
            _backgroundImage = null;
         }
         _backgroundImage = param1;
         showBackground();
      }
      
      private function showBackground() : void
      {
         if(_backgroundImage == null)
         {
            return;
         }
         try
         {
            _content.preview.addChild(_backgroundImage);
            _content.preview.addChild(_animationLayer);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function updateButton() : void
      {
         _btnActivate.enabled = !OpticalChanges.instance.isOpticalChangeActive(_opticalChange.id) && _opticalChange.isUnlocked;
         if(_btnActivate.enabled)
         {
            _btnActivate.tooltip = "";
         }
         else if(_opticalChange.isUnlocked)
         {
            _btnActivate.tooltip = LocText.current.text("dialog/activate_optical_change/already_active");
         }
         else
         {
            _btnActivate.tooltip = LocText.current.text("dialog/activate_optical_change/not_unlocked");
         }
         _btnSourceInfo.visible = _opticalChange.event != "" && _opticalChange.event != null;
         if(_btnSourceInfo.visible)
         {
            _btnSourceInfo.tooltip = _opticalChange.sourceInfo;
         }
      }
      
      override public function dispose() : void
      {
         _opticalChange = null;
         _dialog = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnSourceInfo.dispose();
         _btnSourceInfo = null;
         _btnPrevious.dispose();
         _btnPrevious = null;
         _btnNext.dispose();
         _btnNext = null;
         _btnActivate.dispose();
         _btnActivate = null;
         _opticalChangeAnimation.dispose();
         _opticalChangeAnimation = null;
         _animationLayer.dispose();
         _animationLayer = null;
         if(_backgroundImage)
         {
            _backgroundImage.dispose();
            _backgroundImage = null;
         }
         super.dispose();
      }
      
      private function onClickActivate(param1:InteractionEvent) : void
      {
         if(!_btnActivate.enabled)
         {
            return;
         }
         Environment.application.sendActionRequest("activateOpticalChange",{"opticalChangeId":_opticalChange.id},handleRequests);
      }
      
      private function onClickNext(param1:InteractionEvent) : void
      {
         var _loc2_:int = _opticalChangeCategorie.opticalChanges.indexOf(_opticalChange) + 1;
         if(_loc2_ >= _opticalChangeCategorie.opticalChanges.length)
         {
            _loc2_ = 0;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         refreshOpticalChange(_opticalChangeCategorie.opticalChanges[_loc2_]);
      }
      
      private function onClickPrevious(param1:InteractionEvent) : void
      {
         var _loc2_:int = _opticalChangeCategorie.opticalChanges.indexOf(_opticalChange) - 1;
         if(_loc2_ < 0)
         {
            _loc2_ = _opticalChangeCategorie.opticalChanges.length - 1;
         }
         refreshOpticalChange(_opticalChangeCategorie.opticalChanges[_loc2_]);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSourceInfo(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(_opticalChange.name,_opticalChange.sourceInfo,LocText.current.text("general/button_ok"),null,false,true));
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("activateOpticalChange" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_dialog)
            {
               _dialog.refresh();
               refresh();
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
