package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric;
   
   public class UiRepeatDatingKeyRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric = null;
      
      private static var _currentDatingIndex:int;
       
      
      private var _datingIndex:int = 0;
      
      public function UiRepeatDatingKeyRewardTooltip(param1:IInteractiveDisplayObject, param2:int = -1)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric();
            _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/dating_reward_tooltip");
            _tooltipContent.captionReward.autoFontSize = true;
            _tooltipContent.captionName.autoFontSize = true;
            _tooltipContent.txtDescription.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         this.dating = param2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentDatingIndex == _datingIndex)
         {
            return;
         }
         _currentDatingIndex = _datingIndex;
         if(!_datingIndex)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.captionName.text = DatingUtil.getRepeatKeyName(_datingIndex);
         _tooltipContent.txtDescription.text = DatingUtil.getRepeatKeyDescription(_datingIndex);
         _tooltipContent.txtReward.text = LocText.current.text("general/item_reward_text");
      }
      
      public function set dating(param1:int) : void
      {
         _datingIndex = param1;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(_currentDatingIndex > 0)
         {
            _tooltipContent.iconItem.icon.setUriSprite(DatingUtil.getRewardItemIconImageUrl(_currentDatingIndex,1,true),30,30,false,1,null,true);
         }
      }
   }
}
