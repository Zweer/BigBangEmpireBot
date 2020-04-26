package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogStageUnlocked;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import visuals.ui.elements.citymap.SymbolCitymapProgressPointsGeneric;
   
   public class UiCitymapProgressPoints
   {
      
      private static const POINT_DELAY:Number = 0.3;
       
      
      private var _content:SymbolCitymapProgressPointsGeneric;
      
      private var _pointShownCallback:Function;
      
      public function UiCitymapProgressPoints(param1:SymbolCitymapProgressPointsGeneric, param2:Function)
      {
         super();
         _content = param1;
         _pointShownCallback = param2;
         _content.stop();
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         if(PanelCitymap.unlockedStage > 0 && PanelCitymap.unlockedStage <= CConstant.quest_max_stage)
         {
            _content.gotoAndStop("location" + (_loc1_.maxQuestStage - 1));
            if(!DialogStageUnlocked.isShowing)
            {
               Runtime.delayFunction(showNextDot,0.3);
            }
         }
         else if(PanelCitymap.unlockedStage != 0)
         {
            _pointShownCallback(PanelCitymap.unlockedStage);
         }
         else
         {
            _content.gotoAndStop("location" + _loc1_.maxQuestStage);
         }
      }
      
      private function showNextDot() : void
      {
         _content.gotoAndStop(_content.currentFrame + 1);
         Environment.audio.playFX("dungeon_point_progress.mp3");
         Logger.info(_content.nativeInstance.currentFrameLabel + _content.currentLabel);
         if(_content.nativeInstance.currentFrameLabel == null)
         {
            Runtime.delayFunction(showNextDot,0.3);
         }
         else
         {
            PanelCitymap.unlockedStage = 0;
            Runtime.delayFunction(_pointShownCallback,0.3,[User.current.character.maxQuestStage]);
         }
      }
      
      public function stopAnimation() : void
      {
         Runtime.killDelayedFunction(showNextDot);
         Runtime.killDelayedFunction(_pointShownCallback);
      }
   }
}
