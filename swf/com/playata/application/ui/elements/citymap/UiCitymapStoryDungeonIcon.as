package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import visuals.ui.elements.citymap.SymbolCitymapIconStoryDungeonGeneric;
   
   public class UiCitymapStoryDungeonIcon
   {
       
      
      private var _content:SymbolCitymapIconStoryDungeonGeneric;
      
      private var _stage:int;
      
      private var _storyDungeon:StoryDungeon;
      
      public function UiCitymapStoryDungeonIcon(param1:SymbolCitymapIconStoryDungeonGeneric, param2:int)
      {
         super();
         _content = param1;
         _stage = param2;
      }
      
      public function refresh() : Boolean
      {
         _storyDungeon = User.current.character.getActiveStoryDungeonByStage(_stage);
         if(User.current.character.maxQuestStage >= _stage && _storyDungeon != null)
         {
            _content.visible = true;
            _content.graphic.npcIcon.setUriSprite(_storyDungeon.questButtonImageUrl,80,78,true);
            return true;
         }
         _content.visible = false;
         return false;
      }
      
      public function dispose() : void
      {
         _content = null;
         _storyDungeon = null;
      }
   }
}
