package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import visuals.ui.elements.citymap.SymbolCitymapIconStoryDungeonGeneric;
   
   public class UiCitymapStoryDungeonIcon
   {
       
      
      private var _content:SymbolCitymapIconStoryDungeonGeneric;
      
      private var _stage:int;
      
      private var _storyDungeon:StoryDungeon;
      
      private var _isCustomStage:Boolean;
      
      public function UiCitymapStoryDungeonIcon(param1:SymbolCitymapIconStoryDungeonGeneric, param2:int, param3:Boolean = false)
      {
         super();
         _content = param1;
         _stage = param2;
         _isCustomStage = param3;
      }
      
      public function refresh() : Boolean
      {
         var _loc1_:* = false;
         if(_isCustomStage)
         {
            _loc1_ = Boolean(GameUtil.isCustomStageUnlocked(User.current.character,_stage));
         }
         else
         {
            _loc1_ = User.current.character.maxQuestStage >= _stage;
         }
         _storyDungeon = User.current.character.getActiveStoryDungeonByStage(_stage);
         if(_loc1_ && _storyDungeon != null)
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
