package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiStoryDungeonItemButtonTooltipGeneric;
   
   public class UiStoryDungeonItemRewardTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiStoryDungeonItemButtonTooltipGeneric = null;
      
      private static var _progressBar:UiProgressBarBig;
      
      private static var _currentStoryDungeonIndex:int;
       
      
      private var _storyDungeonIndex:int;
      
      private var _storyDungeon:StoryDungeon;
      
      public function UiStoryDungeonItemRewardTooltip(param1:IInteractiveDisplayObject, param2:int = -1)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiStoryDungeonItemButtonTooltipGeneric();
            _tooltipContent.captionProgress.text = LocText.current.text("dialog/change_stage/story_dungeon_progress_tooltip");
            _tooltipContent.captionProgress.autoFontSize = true;
            _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/story_dungeon_reward_tooltip");
            _tooltipContent.captionReward.autoFontSize = true;
            _progressBar = new UiProgressBarBig(_tooltipContent.progressBar);
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         if(param2 >= 0)
         {
            this.storyDungeon = param2;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _storyDungeon = null;
      }
      
      override public function onAssigned() : void
      {
         _currentStoryDungeonIndex = _storyDungeonIndex;
         if(!_storyDungeonIndex)
         {
            _tooltipContent.visible = false;
            return;
         }
         _storyDungeon = null;
         if(User.current.character.currentStoryDungeon && User.current.character.currentStoryDungeonIndex == _storyDungeonIndex)
         {
            _storyDungeon = User.current.character.currentStoryDungeon;
         }
         else if(User.current.character.repeatStoryDungeon && User.current.character.repeatStoryDungeon.storyDungeonIndex == _storyDungeonIndex)
         {
            _storyDungeon = User.current.character.repeatStoryDungeon;
         }
         if(_storyDungeon == null)
         {
            return;
         }
         _tooltipContent.visible = true;
         _tooltipContent.txtName.text = StoryDungeon.getName(_storyDungeonIndex);
         _tooltipContent.txtName.autoFontSize = true;
         _progressBar.value = _storyDungeon.progress;
         _tooltipContent.txtProgress.text = _storyDungeon.pointsCollected + "/" + _storyDungeon.pointsNeeded;
         _tooltipContent.txtReward.text = LocText.current.text("general/item_reward_text");
         _tooltipContent.txtReward.autoFontSize = true;
      }
      
      public function set storyDungeon(param1:int) : void
      {
         _storyDungeonIndex = param1;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(_storyDungeon)
         {
            _tooltipContent.iconItem.icon.setUriSprite(StoryDungeon.getRewardItemIconImageUrl(_storyDungeon.storyDungeonIndex),30,30,false,1,null,true);
         }
      }
   }
}
