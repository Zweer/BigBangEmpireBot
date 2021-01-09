package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingShowTooltipGeneric;
   
   public class UiStreamingShowTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolStreamingShowTooltipGeneric;
      
      private static var _itemSlot:UiItemSlot = null;
      
      private static var _currentStreamingShow:StreamingShow = null;
       
      
      private var _streamingShow:StreamingShow = null;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiStreamingShowTooltip(param1:IDisplayObject)
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
            _tooltipContent = new SymbolStreamingShowTooltipGeneric();
            _tooltipContent.txtRewardsCaption.text = LocText.current.text("dialog/streaming/animation_rewards_caption");
            _tooltipContent.txtRewardsCaption.autoFontSize = true;
            _tooltipContent.txtTitle.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
            _itemSlot = new UiItemSlot(_tooltipContent.itemSlot,0);
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
         if(_currentStreamingShow == _streamingShow)
         {
            return;
         }
         _currentStreamingShow = _streamingShow;
         if(_currentStreamingShow == null || _currentStreamingShow.status != 2 || _currentStreamingShow.remainingSeconds <= 0)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.txtTitle.text = LocText.current.text("streaming/pose/" + _currentStreamingShow.animationId + "/title");
         _tooltipContent.iconGameCurrency.visible = _currentStreamingShow.reward.gameCurrency > 0;
         _itemSlot.visible = _currentStreamingShow.reward.itemId > 0;
         _tooltipContent.iconStreamingResource.visible = _currentStreamingShow.reward.streamingResource > 0;
         if(_tooltipContent.iconGameCurrency.visible)
         {
            _tooltipContent.txtReward.text = _currentStreamingShow.reward.gameCurrencyString;
         }
         else if(_tooltipContent.iconStreamingResource.visible)
         {
            _tooltipContent.txtReward.text = _currentStreamingShow.reward.streamingResourceString;
         }
         else if(_itemSlot.visible)
         {
            _itemSlot.item = User.current.character.getItemById(_currentStreamingShow.reward.itemId);
            _tooltipContent.txtReward.text = _itemSlot.item.name;
         }
         placeCloseButton(_tooltipContent.background);
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(_streamingShow == null || _streamingShow.status != 2 || _streamingShow.remainingSeconds <= 0)
         {
            return;
         }
         super.handleInteractionOver(param1);
      }
      
      public function refresh(param1:StreamingShow) : void
      {
         _streamingShow = param1;
      }
   }
}
