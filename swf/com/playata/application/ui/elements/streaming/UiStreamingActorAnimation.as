package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.constants.CStreamingActorAnimation;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogUnlockStreamingActorAnimation;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.filter.TintFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingActorAnimationGeneric;
   
   public class UiStreamingActorAnimation
   {
       
      
      private var _content:SymbolStreamingActorAnimationGeneric = null;
      
      private var _btnUnlock:UiButton = null;
      
      private var _tooltip:UiStreamingAnimationTooltip = null;
      
      private var _actorId:int = 0;
      
      private var _animationId:int = 0;
      
      private var _animation:CStreamingActorAnimation = null;
      
      public function UiStreamingActorAnimation(param1:SymbolStreamingActorAnimationGeneric)
      {
         super();
         _content = param1;
         _btnUnlock = new UiButton(_content.btnUnlock,LocText.current.text("dialog/streaming_actors/btn_unlock_pose"),onClickUnlock);
         _btnUnlock.visible = false;
      }
      
      public function dispose() : void
      {
         _btnUnlock.dispose();
         _btnUnlock = null;
         _tooltip.dispose();
         _tooltip = null;
         _content = null;
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         if(!_content)
         {
            return;
         }
         _actorId = param1;
         _animationId = param2;
         var _loc4_:Streaming = User.current.character.streaming;
         var _loc5_:Boolean = _loc4_.getUnlockedActors().exists(_actorId) && (_loc4_.getUnlockedActors().getData(_actorId) as StreamingActor).unlockedAnimations.exists(param2);
         var _loc3_:CStreamingActor = CStreamingActor.fromId(param1);
         _animation = _loc3_.getAnimation(_animationId);
         if(_tooltip)
         {
            _tooltip.dispose();
         }
         _tooltip = new UiStreamingAnimationTooltip(_content);
         _tooltip.refresh(_actorId,_animationId);
         _content.iconCheckmark.visible = _loc5_;
         _content.txtTitle.text = LocText.current.text("streaming/pose/" + _animationId + "/title");
         if(!_loc5_ && _animation.unlockType == 4)
         {
            _btnUnlock.visible = true;
            _btnUnlock.tooltip = LocText.current.text("dialog/streaming_actors/btn_unlock_pose_tooltip",LocText.current.text("streaming/pose/" + param2 + "/title"));
            _content.iconExclamationMark.visible = _animation.unlockValue <= _loc4_.streamingResource;
            _content.iconLock.visible = false;
         }
         else
         {
            _btnUnlock.visible = false;
            _content.iconLock.visible = !_loc5_;
            _content.iconExclamationMark.visible = _loc5_ && (_loc4_.getUnlockedActors().getData(_actorId) as StreamingActor).unlockedAnimations.getData(param2) == true;
         }
         if(!_loc5_)
         {
            _content.iconPose.addFilter(new TintFilter(11018373));
         }
         else
         {
            _content.iconPose.removeAllFilters();
         }
         _content.iconPose.setUriSprite(StreamingShow.getActorImageUrl(_actorId,_animationId),81,99,true,1);
      }
      
      private function onClickUnlock(param1:InteractionEvent) : void
      {
         if(_animation)
         {
            Environment.panelManager.showDialog(new DialogUnlockStreamingActorAnimation(_animation,onUnlock,onPremiumUnlock));
         }
      }
      
      private function onUnlock() : void
      {
         Environment.application.sendActionRequest("unlockStreamingActorAnimation",{
            "actor_id":_actorId,
            "animation_id":_animationId,
            "premium":false
         },handleRequests);
      }
      
      private function onPremiumUnlock() : void
      {
         Environment.application.sendActionRequest("unlockStreamingActorAnimation",{
            "actor_id":_actorId,
            "animation_id":_animationId,
            "premium":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = param1.action;
         if("unlockStreamingActorAnimation" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            refresh(_actorId,_animationId);
         }
         else if(param1.error == "errRemoveStreamingResourceNotEnough")
         {
            _loc2_ = User.current.character.streaming.streamingResource;
            _loc3_ = _animation.unlockValue;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unlock_streaming_room/err_not_enough_resource_title"),LocText.current.text("dialog/unlock_streaming_room/err_not_enough_resource_text",_loc3_ - _loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_animation.premiumUnlockValue);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
