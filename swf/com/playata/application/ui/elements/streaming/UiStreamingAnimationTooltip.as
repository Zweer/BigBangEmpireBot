package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.constants.CStreamingActorAnimation;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingAnimationTooltipGeneric;
   
   public class UiStreamingAnimationTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolStreamingAnimationTooltipGeneric;
      
      private static var _currentActorId:int = 0;
      
      private static var _currentAnimationId:int = 0;
       
      
      private var _actorId:int = 0;
      
      private var _animationId:int = 0;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiStreamingAnimationTooltip(param1:IDisplayObject)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolStreamingAnimationTooltipGeneric();
            _tooltipContent.txtRewardsCaption.text = LocText.current.text("dialog/streaming/animation_rewards_caption");
            _tooltipContent.txtMultiplierCaption.autoFontSize = true;
            _tooltipContent.txtRewardsCaption.autoFontSize = true;
            _tooltipContent.txtTitle.autoFontSize = true;
            _tooltipContent.txtRewardMultiplier.autoFontSize = true;
            _tooltipContent.txtUnlock.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(_interactiveDisplayObject,_tooltipContent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentActorId == _actorId && _currentAnimationId == _animationId)
         {
            return;
         }
         _currentActorId = _actorId;
         _currentAnimationId = _animationId;
         if(_currentActorId == 0 || _currentAnimationId == 0)
         {
            _tooltipContent.visible = false;
            return;
         }
         var _loc1_:CStreamingActorAnimation = CStreamingActor.fromId(_actorId).getAnimation(_animationId);
         _tooltipContent.visible = true;
         _tooltipContent.txtTitle.text = LocText.current.text("streaming/pose/" + _animationId + "/title");
         _tooltipContent.iconGameCurrency.visible = _loc1_.rewardType == 1;
         _tooltipContent.iconItem.visible = _loc1_.rewardType == 2;
         _tooltipContent.iconStreamingResource.visible = _loc1_.rewardType == 3;
         if(_tooltipContent.iconItem.visible)
         {
            _tooltipContent.txtRewardMultiplier.text = "+" + _loc1_.itemBonusLevel;
            _tooltipContent.txtMultiplierCaption.text = LocText.current.text("dialog/streaming/animation_rewards_item_bonus_level");
         }
         else
         {
            _tooltipContent.txtRewardMultiplier.text = "+" + Math.round(_loc1_.rewardMultiplier * 100) + "%";
            _tooltipContent.txtMultiplierCaption.text = LocText.current.text("dialog/streaming/animation_rewards_multiplier");
         }
         var _loc2_:* = !User.current.character.streaming.getUnlockedActors().exists(_actorId) || !(User.current.character.streaming.getUnlockedActors().getData(_actorId) as StreamingActor).unlockedAnimations.exists(_animationId);
         _tooltipContent.txtUnlock.visible = _loc2_;
         _tooltipContent.backgroundUnlock.visible = _loc2_;
         if(_tooltipContent.txtUnlock.visible)
         {
            switch(int(_loc1_.unlockType) - 1)
            {
               case 0:
                  _tooltipContent.txtUnlock.text = LocText.current.text("dialog/streaming_actors/pose_unlock/room_unlock",_loc1_.unlockValue);
                  break;
               case 1:
                  _tooltipContent.txtUnlock.text = LocText.current.text("dialog/streaming_actors/pose_unlock/room_fans",LocText.current.formatHugeNumber(_loc1_.unlockValue));
                  break;
               case 2:
                  _tooltipContent.txtUnlock.text = LocText.current.text("dialog/streaming_actors/pose_unlock/room_dating",LocText.current.text("dating/" + CDating.fromId(_loc1_.unlockValue).identifier + "/name"));
                  break;
               case 3:
                  _tooltipContent.txtUnlock.text = LocText.current.text("dialog/streaming_actors/pose_unlock/room_likes",GameUtil.getStreamingResourceString(_loc1_.unlockValue));
            }
         }
         _tooltipContent.txtRewardsCaption.y = Math.round(_tooltipContent.txtTitle.y + _tooltipContent.txtTitle.textHeight + 10);
         _tooltipContent.txtMultiplierCaption.y = _tooltipContent.txtRewardsCaption.y;
         _tooltipContent.txtRewardMultiplier.y = _tooltipContent.txtRewardsCaption.y + 28;
         _tooltipContent.iconGameCurrency.y = _tooltipContent.txtRewardMultiplier.y - 3;
         _tooltipContent.iconStreamingResource.y = _tooltipContent.txtRewardMultiplier.y + 10;
         _tooltipContent.iconItem.y = _tooltipContent.txtRewardMultiplier.y - 4;
         _tooltipContent.backgroundUnlock.y = _tooltipContent.txtRewardMultiplier.y + 40;
         _tooltipContent.txtUnlock.y = _tooltipContent.backgroundUnlock.y + 15;
         if(_tooltipContent.backgroundUnlock.visible)
         {
            _tooltipContent.background.height = _tooltipContent.backgroundUnlock.y + _tooltipContent.backgroundUnlock.height + 30;
         }
         else
         {
            _tooltipContent.background.height = _tooltipContent.txtRewardMultiplier.y + _tooltipContent.txtRewardMultiplier.height + 30;
         }
         placeCloseButton(_tooltipContent.background);
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         _actorId = param1;
         _animationId = param2;
      }
   }
}
