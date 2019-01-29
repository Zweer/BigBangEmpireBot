package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingItem;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiStoryDungeonItemButtonTooltipGeneric;
   
   public class UiDatingItemRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiStoryDungeonItemButtonTooltipGeneric = null;
      
      private static var _progressBar:UiProgressBarBig;
      
      private static var _currentDatingItem:DatingItem;
       
      
      private var _datingItem:DatingItem;
      
      private var _datingStep:DatingStep;
      
      public function UiDatingItemRewardTooltip(param1:IInteractiveDisplayObject, param2:DatingItem = null)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiStoryDungeonItemButtonTooltipGeneric();
            _tooltipContent.captionProgress.autoFontSize = true;
            _tooltipContent.captionReward.autoFontSize = true;
            _progressBar = new UiProgressBarBig(_tooltipContent.progressBar);
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         this.datingItem = param2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _datingItem = null;
      }
      
      override public function onAssigned() : void
      {
         var _loc1_:int = 0;
         _currentDatingItem = _datingItem;
         if(_datingItem == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         if(!DatingUtil.isAvailable)
         {
            _tooltipContent.visible = false;
            return;
         }
         var _loc2_:Dating = User.current.character.dating;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:DatingStep = null;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.datingSteps.length)
         {
            if(_loc2_.datingSteps[_loc1_].rewardReference == _datingItem.identifier && _loc2_.datingSteps[_loc1_].isStarted)
            {
               _loc3_ = _loc2_.datingSteps[_loc1_];
               break;
            }
            _loc1_++;
         }
         if(_loc3_ == null)
         {
            return;
         }
         _datingStep = _loc3_;
         _tooltipContent.visible = true;
         _tooltipContent.captionProgress.text = LocText.current.text("dialog/change_stage/dating_progress_tooltip");
         _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/dating_reward_tooltip");
         _tooltipContent.txtName.text = DatingUtil.getName(_loc3_.datingIndex);
         _tooltipContent.txtName.autoFontSize = true;
         _progressBar.value = _loc3_.progress;
         _tooltipContent.txtProgress.text = _loc3_.pointsCollected + "/" + _loc3_.pointsNeeded;
         _tooltipContent.txtReward.text = LocText.current.text("general/item_reward_text");
         _tooltipContent.txtReward.autoFontSize = true;
      }
      
      public function set datingItem(param1:DatingItem) : void
      {
         _datingItem = param1;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(_datingStep)
         {
            _tooltipContent.iconItem.icon.setUriSprite(DatingUtil.getRewardItemIconImageUrl(_datingStep.datingIndex,_datingStep.stepIndex,_datingStep.repeat),30,30,false,1,null,true);
         }
      }
   }
}
