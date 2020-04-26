package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric;
   
   public class UiRepeatStoryDungeonKeyRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric = null;
      
      private static var _currentStoryDungeonIndex:int;
       
      
      private var _storyDungeonIndex:int = 0;
      
      public function UiRepeatStoryDungeonKeyRewardTooltip(param1:IInteractiveDisplayObject, param2:int = -1)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiRepeatStoryDungeonKeyButtonTooltipGeneric();
            _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/story_dungeon_reward_tooltip");
            _tooltipContent.captionReward.autoFontSize = true;
            _tooltipContent.captionName.autoFontSize = true;
            _tooltipContent.txtDescription.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         this.storyDungeon = param2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentStoryDungeonIndex == _storyDungeonIndex)
         {
            return;
         }
         _currentStoryDungeonIndex = _storyDungeonIndex;
         if(!_storyDungeonIndex)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.captionName.text = StoryDungeon.getRepeatKeyName(_storyDungeonIndex);
         _tooltipContent.txtDescription.text = StoryDungeon.getRepeatKeyDescription(_storyDungeonIndex);
         _tooltipContent.txtReward.text = LocText.current.text("general/item_reward_text");
      }
      
      public function set storyDungeon(param1:int) : void
      {
         _storyDungeonIndex = param1;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(_currentStoryDungeonIndex > 0)
         {
            _tooltipContent.iconItem.icon.setUriSprite(StoryDungeon.getRewardItemIconImageUrl(_currentStoryDungeonIndex),30,30,false,1,null,true);
         }
      }
   }
}
