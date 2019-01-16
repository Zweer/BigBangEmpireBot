package com.playata.application.ui.elements.event
{
   import com.playata.application.data.event.EventItem;
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiGoalItemButtonTooltipGeneric;
   
   public class UiEventItemRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiGoalItemButtonTooltipGeneric = null;
      
      private static var _progressBar:UiProgressBarBig;
      
      private static var _currentEventItem:EventItem;
       
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      private var _eventItem:EventItem;
      
      public function UiEventItemRewardTooltip(param1:IDisplayObject, param2:EventItem = null)
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
            _tooltipContent = new SymbolUiGoalItemButtonTooltipGeneric();
            _tooltipContent.captionProgress.text = LocText.current.text("dialog/change_stage/event_progress_tooltip");
            _tooltipContent.captionProgress.autoFontSize = true;
            _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/event_reward_tooltip");
            _tooltipContent.captionReward.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
            _tooltipContent.txtName.autoFontSize = true;
            _progressBar = new UiProgressBarBig(_tooltipContent.progressBar);
         }
         _tooltipContent.visible = false;
         super(_interactiveDisplayObject,_tooltipContent);
         this.eventItem = param2;
      }
      
      override public function dispose() : void
      {
         _eventItem = null;
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         var _loc2_:int = 0;
         _currentEventItem = _eventItem;
         if(_eventItem == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         var _loc3_:EventQuest = User.current.character.eventQuest;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc1_:EventQuestObjective = null;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.objectives.length)
         {
            if(_loc3_.objectives[_loc2_].reference == _eventItem.identifier)
            {
               _loc1_ = _loc3_.objectives[_loc2_];
               break;
            }
            _loc2_++;
         }
         if(_loc1_ == null)
         {
            return;
         }
         _tooltipContent.visible = true;
         _progressBar.value = _loc1_.progressValue;
         _tooltipContent.txtName.text = _loc1_.name;
         _tooltipContent.txtProgress.text = _loc1_.currentValue + "/" + _loc1_.value;
         _tooltipContent.txtReward.text = _loc1_.rewardText;
         _tooltipContent.iconCoins.visible = _loc1_.isGameCurrencyReward;
         _tooltipContent.iconPremiumCurrency.visible = _loc1_.isPremiumCurrencyReward;
         _tooltipContent.iconXp.visible = _loc1_.isXpReward;
         _tooltipContent.iconStatPoints.visible = _loc1_.isStatPointReward;
         _tooltipContent.iconItem.visible = _loc1_.isItemReward;
         _tooltipContent.iconQuestEnergy.visible = false;
         _tooltipContent.iconBooster.visible = false;
         _tooltipContent.title.visible = false;
         placeCloseButton(_tooltipContent.background);
      }
      
      public function set eventItem(param1:EventItem) : void
      {
         _eventItem = param1;
      }
   }
}
