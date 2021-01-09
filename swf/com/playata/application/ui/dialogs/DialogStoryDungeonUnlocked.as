package com.playata.application.ui.dialogs
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonBoss;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonReward;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogStoryDungeonUnlockedGeneric;
   
   public class DialogStoryDungeonUnlocked extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _storyDungeonIndex:int = 0;
      
      private var _reward:UiStoryDungeonReward;
      
      private var _boss:UiStoryDungeonBoss;
      
      private var _changeStage:Boolean = false;
      
      private var _repeat:Boolean = false;
      
      public function DialogStoryDungeonUnlocked(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         var _loc4_:SymbolDialogStoryDungeonUnlockedGeneric = new SymbolDialogStoryDungeonUnlockedGeneric();
         super(_loc4_);
         _isOpen = true;
         _changeStage = param2;
         _repeat = param3;
         _storyDungeonIndex = param1;
         _loc4_.txtDialogTitle.text = StoryDungeon.getName(_storyDungeonIndex);
         _loc4_.txtInfo.text = StoryDungeon.getUnlockText(_storyDungeonIndex);
         _reward = new UiStoryDungeonReward(_loc4_.reward,_storyDungeonIndex,_repeat);
         _boss = new UiStoryDungeonBoss(_loc4_.boss,_storyDungeonIndex,_repeat);
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("event_dungeon_unlocked.mp3");
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _reward.dispose();
         _reward = null;
         _boss.dispose();
         _boss = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_repeat)
         {
            Environment.application.sendActionRequest("startNewStoryDungeon",{},handleRequests);
         }
         else
         {
            close();
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "startNewStoryDungeon":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_changeStage && User.current.character.currentStoryDungeon)
                  {
                     if(ViewManager.instance.activePanel != "citymap" && (User.current.character.currentQuestStage != User.current.character.currentStoryDungeon.stage || User.current.character.onMap))
                     {
                        Environment.application.sendActionRequest("setCharacterStage",{
                           "stage":User.current.character.currentStoryDungeon.stage,
                           "on_map":false
                        },handleRequests);
                     }
                  }
               }
               else if(param1.error == "errStartNewStoryDungeonActiveStoryDungeonBattleFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_story_dungeon_active_battle_found/title"),LocText.current.text("dialog/start_new_story_dungeon_active_battle_found/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errCreateStoryDungeonCurrentDungeonNotFinished")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               close();
               break;
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quests");
                  PanelCitymap.lastAction = 1;
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
