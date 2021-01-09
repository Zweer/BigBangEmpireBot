package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.herobook.HerobookItem;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiGoalItemButtonTooltipGeneric;
   
   public class UiHerobookItemRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiGoalItemButtonTooltipGeneric = null;
      
      private static var _progressBar:UiProgressBarBig;
      
      private static var _currentHerobookItem:HerobookItem;
       
      
      private var _herobookItem:HerobookItem;
      
      public function UiHerobookItemRewardTooltip(param1:IInteractiveDisplayObject, param2:HerobookItem = null)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiGoalItemButtonTooltipGeneric();
            _tooltipContent.captionProgress.autoFontSize = true;
            _tooltipContent.captionReward.autoFontSize = true;
            _progressBar = new UiProgressBarBig(_tooltipContent.progressBar);
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         this.herobookItem = param2;
      }
      
      override public function dispose() : void
      {
         _herobookItem = null;
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         var _loc3_:int = 0;
         _currentHerobookItem = _herobookItem;
         if(_herobookItem == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         var _loc1_:Herobook = User.current.character.herobook;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:HerobookObjective = null;
         _loc3_ = 0;
         while(_loc3_ < _loc1_.objectives.length)
         {
            if(_loc1_.objectives[_loc3_].reference == _herobookItem.identifier)
            {
               _loc2_ = _loc1_.objectives[_loc3_];
               break;
            }
            _loc3_++;
         }
         if(_loc2_ == null)
         {
            return;
         }
         _tooltipContent.captionProgress.text = LocText.current.text("dialog/change_stage/herobook_progress_tooltip");
         _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/herobook_reward_tooltip");
         _tooltipContent.txtName.text = _loc2_.name;
         _tooltipContent.txtName.autoFontSize = true;
         _progressBar.value = _loc2_.progress * 100;
         _tooltipContent.txtProgress.text = _loc2_.progressText;
         _tooltipContent.txtReward.text = _loc2_.rewardText;
         _tooltipContent.txtReward.autoFontSize = true;
         _tooltipContent.iconCoins.visible = _loc2_.isCoinReward;
         _tooltipContent.iconPremiumCurrency.visible = _loc2_.isPremiumCurrencyReward;
         _tooltipContent.iconXp.visible = _loc2_.isXpReward;
         _tooltipContent.iconStatPoints.visible = _loc2_.isStatPointReward;
         _tooltipContent.iconItem.visible = _loc2_.isItemReward;
         _tooltipContent.iconQuestEnergy.visible = _loc2_.isQuestEnergyReward;
         _tooltipContent.iconFans.visible = _loc2_.isFansReward;
         _tooltipContent.iconStreamingResource.visible = _loc2_.isStreamingResourceReward;
         _tooltipContent.iconBooster.visible = false;
         _tooltipContent.title.visible = false;
         _tooltipContent.visible = true;
         placeCloseButton(_tooltipContent.background);
      }
      
      public function set herobookItem(param1:HerobookItem) : void
      {
         _herobookItem = param1;
      }
   }
}
