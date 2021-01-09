package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiStoryDungeonItemButton implements ICitymapQuestButton
   {
       
      
      private var _callback:Function = null;
      
      private var _quest:Quest = null;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _tooltip:UiStoryDungeonItemRewardTooltip;
      
      private var _container:SymbolMovieItemGeneric;
      
      public function UiStoryDungeonItemButton(param1:SymbolMovieItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super();
         _container = param1;
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
         _quest = param2;
         _callback = param3;
      }
      
      public function dispose() : void
      {
         destroy();
         _buttonWrapper.dispose();
         _buttonWrapper = null;
      }
      
      public function destroy() : void
      {
         _buttonWrapper.destroy();
         _quest = null;
         if(_tooltip != null)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         _container = null;
      }
      
      public function set storyDungeon(param1:int) : void
      {
         _container.itemPos.setUriSprite(StoryDungeon.getUnlockPointImageUrl(param1),60,60,true,15,null,true);
         if(_tooltip == null)
         {
            _tooltip = new UiStoryDungeonItemRewardTooltip(new InteractiveDisplayObject(_container));
         }
         _tooltip.storyDungeon = param1;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _container;
      }
   }
}
