package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonUnlockBossGeneric;
   
   public class UiStoryDungeonBoss
   {
       
      
      private var _content:SymbolStoryDungeonUnlockBossGeneric;
      
      public function UiStoryDungeonBoss(param1:SymbolStoryDungeonUnlockBossGeneric, param2:int = 0, param3:Boolean = false)
      {
         super();
         _content = param1;
         refresh(param2,param3);
      }
      
      public function refresh(param1:int, param2:Boolean) : void
      {
         if(param1 > 0)
         {
            _content.iconBoss.setUriSprite(StoryDungeon.getBossThumbnailImageUrl(param1),126,126,false,1,null,true);
            if(param2)
            {
               _content.txtInfo.text = LocText.current.text("dialog/story_dungeon_unlocked/boss_level",User.current.character.level);
            }
            else
            {
               _content.txtInfo.text = LocText.current.text("dialog/story_dungeon_unlocked/boss_level",StoryDungeon.getBossLevel(param1));
            }
         }
      }
      
      public function dispose() : void
      {
         _content = null;
      }
   }
}
