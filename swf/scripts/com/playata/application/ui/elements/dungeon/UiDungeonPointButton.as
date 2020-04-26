package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonQuestGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonProgressButtonLevelGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonProgressButtonQuestGeneric;
   
   public class UiDungeonPointButton extends UiButton
   {
       
      
      private var _contentQuest:SymbolDungeonProgressButtonQuestGeneric;
      
      private var _contentLevel:SymbolDungeonProgressButtonLevelGeneric;
      
      public function UiDungeonPointButton(param1:SymbolButtonDungeonQuestGeneric, param2:Function)
      {
         _contentQuest = param1.graphic.contentQuest;
         _contentLevel = param1.graphic.contentLevel;
         super(param1,"",param2);
      }
      
      public function refresh(param1:Dungeon) : void
      {
         if(param1.currentLevel.isFinished)
         {
            _contentQuest.visible = false;
            _contentLevel.visible = true;
            if(param1.nextLevel != null && param1.nextLevel.isUnlocked)
            {
               _contentLevel.lock.visible = false;
            }
            else
            {
               _contentLevel.lock.visible = true;
            }
         }
         else
         {
            _contentQuest.visible = true;
            _contentLevel.visible = false;
            _contentQuest.txtProgress.text = (param1.numQuestsCompleted + 1).toString();
            if(param1.currentDungeonQuest.isFightQuest)
            {
               if(param1.currentDungeonQuest.isBoss)
               {
                  _contentQuest.stat1.visible = false;
                  _contentQuest.stat2.visible = false;
                  _contentQuest.stat3.visible = false;
                  _contentQuest.stat4.visible = false;
                  _contentQuest.npc.visible = true;
                  _contentQuest.fight.visible = false;
                  _contentQuest.npc.setUriSprite(param1.currentDungeonQuest.npcQuestStarImageUrl,100,88,true,1,null,true);
               }
               else
               {
                  _contentQuest.stat1.visible = false;
                  _contentQuest.stat2.visible = false;
                  _contentQuest.stat3.visible = false;
                  _contentQuest.stat4.visible = false;
                  _contentQuest.npc.visible = false;
                  _contentQuest.fight.visible = true;
               }
            }
            else
            {
               _contentQuest.stat1.visible = param1.currentDungeonQuest.statQuestStat == 1;
               _contentQuest.stat2.visible = param1.currentDungeonQuest.statQuestStat == 2;
               _contentQuest.stat3.visible = param1.currentDungeonQuest.statQuestStat == 3;
               _contentQuest.stat4.visible = param1.currentDungeonQuest.statQuestStat == 4;
               _contentQuest.npc.visible = false;
               _contentQuest.fight.visible = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         _contentQuest = null;
         _contentLevel = null;
         super.dispose();
      }
   }
}
