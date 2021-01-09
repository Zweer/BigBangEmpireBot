package com.playata.application.ui.panels
{
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogStreamingActors;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.streaming.UiStreamingResourcePanel;
   import com.playata.application.ui.elements.streaming.UiStreamingRoom;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelStreamingGeneric;
   
   public class PanelStreaming extends DefaultPanel
   {
       
      
      private var _rooms:Vector.<UiStreamingRoom> = null;
      
      private var _unlockStreamingSend:Boolean = false;
      
      private var _btnActors:UiButton = null;
      
      private var _resourcePanel:UiStreamingResourcePanel = null;
      
      private var _scaleInOutEffect:ScaleInOutEffect = null;
      
      public function PanelStreaming(param1:SymbolPanelStreamingGeneric)
      {
         var _loc2_:int = 0;
         super(param1);
         _rooms = new Vector.<UiStreamingRoom>();
         _loc2_ = 1;
         while(_loc2_ <= Streaming.ROOMS_COUNT)
         {
            _rooms.push(new UiStreamingRoom(param1["room" + _loc2_],_loc2_));
            _loc2_++;
         }
         _btnActors = new UiButton(param1.btnActors,LocText.current.text("screen/streaming/button_actors_tooltip"),onClickActors);
         _resourcePanel = new UiStreamingResourcePanel(param1.resourcePanel);
         _anchorContainer.add(param1.btnActors,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room1,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room2,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room3,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room4,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room5,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.room6,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.fg,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.bg,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.resourcePanel,AnchorPoint.TOP_RIGHT);
         _scaleInOutEffect = new ScaleInOutEffect(param1.btnActors.iconExclamationMark,1,0.45);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         super.dispose();
         _loc1_ = 0;
         while(_loc1_ < _rooms.length)
         {
            _rooms[_loc1_].dispose();
            _loc1_++;
         }
         _rooms = null;
         _btnActors.dispose();
         _btnActors = null;
         _resourcePanel.dispose();
         _resourcePanel = null;
         _scaleInOutEffect.dispose();
         _scaleInOutEffect = null;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         ViewManager.instance.setBackground(4);
         ViewManager.instance.fadeInPanel(_vo);
      }
      
      override public function refresh() : void
      {
         var _loc2_:int = 0;
         super.refresh();
         var _loc1_:Streaming = User.current.character.streaming;
         if(!_loc1_)
         {
            if(!_unlockStreamingSend)
            {
               _unlockStreamingSend = true;
               Environment.application.sendActionRequest("unlockStreaming",{},handleRequests);
            }
            showTutorialDialog();
            return;
         }
         _resourcePanel.refresh();
         _loc2_ = 0;
         while(_loc2_ < _rooms.length)
         {
            _rooms[_loc2_].refresh(_loc1_);
            _loc2_++;
         }
         var _loc3_:SymbolPanelStreamingGeneric = _vo as SymbolPanelStreamingGeneric;
         _loc3_.btnActors.iconExclamationMark.visible = _loc1_.hasNewPose() || _loc1_.hasNewSetting() || _loc1_.hasPoseToUnlock();
         if(_loc3_.btnActors.iconExclamationMark.visible)
         {
            _scaleInOutEffect.stop();
            _scaleInOutEffect.play();
         }
         else
         {
            _scaleInOutEffect.stop();
         }
      }
      
      override public function hide() : void
      {
         if(_scaleInOutEffect)
         {
            _scaleInOutEffect.stop();
         }
         super.hide();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/streaming/title"),LocText.current.text("dialog/tutorial/streaming/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("streaming_unlocked");
      }
      
      private function onClickActors(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogStreamingActors());
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("unlockStreaming" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            _unlockStreamingSend = false;
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
