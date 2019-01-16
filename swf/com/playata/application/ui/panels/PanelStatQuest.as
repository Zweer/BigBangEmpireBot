package com.playata.application.ui.panels
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CDatingStep;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.quest.IStatQuest;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.dating.UiDatingGirl;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.stats.UiStatQuestResultGauge;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelStatQuestGeneric;
   
   public class PanelStatQuest extends DefaultPanel
   {
      
      public static var movieMode:Boolean;
      
      public static var datingStep:DatingStep;
      
      private static var _lastViewedMode:int;
       
      
      private var _avatar:UiAvatar;
      
      private var _gauge:UiStatQuestResultGauge;
      
      private var _quest:IStatQuest;
      
      private var _btnSkip:UiTextButton = null;
      
      private var _girl:UiDatingGirl;
      
      public function PanelStatQuest(param1:SymbolPanelStatQuestGeneric)
      {
         super(param1);
         _avatar = new UiAvatar(param1.avatar,true,true,true);
         _gauge = new UiStatQuestResultGauge(param1.gauge,onAnimationComplete,onHideSkipButton);
         _girl = new UiDatingGirl(param1.npc);
         _btnSkip = new UiTextButton(param1.btnSkip,LocText.current.text("screen/stat_quest_visualization/button_skip"),"",onClickSkip);
      }
      
      public static function get lastViewedMode() : int
      {
         return _lastViewedMode;
      }
      
      private function onClickSkip(param1:InteractionEvent) : void
      {
         onHideSkipButton();
         _gauge.skip();
         onAnimationComplete();
      }
      
      override public function show(param1:* = null) : void
      {
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         super.show(param1);
         if(datingStep)
         {
            _lastViewedMode = 7;
            refreshWithDatingStep();
            return;
         }
         var _loc3_:Character = User.current.character;
         if(movieMode)
         {
            _quest = _loc3_.movie.activeMovieQuest;
            _lastViewedMode = 4;
         }
         else if(_loc3_.activeDungeonQuest)
         {
            _quest = _loc3_.activeDungeonQuest;
            _lastViewedMode = 3;
         }
         else if(_loc3_.activeQuest)
         {
            _quest = _loc3_.activeQuest;
            _lastViewedMode = 1;
         }
         _btnSkip.visible = true;
         _avatar.startAnimation();
         var _loc2_:int = 0;
         switch(int(_quest.statQuestStat) - 1)
         {
            case 0:
               _loc2_ = 7;
               break;
            case 1:
               _loc2_ = 8;
               break;
            case 2:
               _loc2_ = 9;
               break;
            case 3:
               _loc2_ = 10;
         }
         ViewManager.instance.setBackground(_loc2_);
         ViewManager.instance.fadeInPanel(_vo);
         ViewManager.instance.baseUserPanel.fadeOutMainNavigationButtons();
         var _loc4_:int = 0;
         switch(int(_quest.statQuestStat) - 1)
         {
            case 0:
               _loc4_ = 2;
               break;
            case 1:
               _loc4_ = 3;
               break;
            case 2:
               _loc4_ = 4;
               break;
            case 3:
               _loc4_ = 5;
         }
         _avatar.update(_loc3_.getCurrentSettings(_loc4_),true);
         var _loc6_:Sprite = (_vo as SymbolPanelStatQuestGeneric).npc;
         _loc6_.visible = false;
         if(_quest.npcIdentifier)
         {
            _loc5_ = 720;
            _loc8_ = 840;
            _loc6_.visible = true;
            _loc6_.setUriSprite(_quest.npcImageUrlHD,_loc5_,_loc8_,true,1,null,true);
         }
         var _loc7_:SymbolPanelStatQuestGeneric = _vo as SymbolPanelStatQuestGeneric;
         _loc7_.stats.gotoAndStop(_quest.statQuestStat);
         switch(int(_quest.statQuestStat) - 1)
         {
            case 0:
               _loc7_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_stamina");
               break;
            case 1:
               _loc7_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_strength");
               break;
            case 2:
               _loc7_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_critical_rating");
               break;
            case 3:
               _loc7_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_dodge_rating");
         }
         _gauge.prepare(_quest.winChance,_quest.isWon);
         _gauge.show();
      }
      
      private function refreshWithDatingStep() : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc9_:int = 0;
         var _loc4_:Character = User.current.character;
         _btnSkip.visible = true;
         _avatar.startAnimation();
         var _loc1_:CDatingStep = DatingUtil.getDatingStepTemplate(datingStep.datingIndex,datingStep.stepIndex);
         var _loc3_:int = 0;
         switch(int(_loc1_.statType) - 1)
         {
            case 0:
               _loc3_ = 7;
               break;
            case 1:
               _loc3_ = 8;
               break;
            case 2:
               _loc3_ = 9;
               break;
            case 3:
               _loc3_ = 10;
         }
         ViewManager.instance.setBackground(_loc3_);
         ViewManager.instance.fadeInPanel(_vo);
         ViewManager.instance.baseUserPanel.fadeOutMainNavigationButtons();
         var _loc7_:int = 0;
         switch(int(_loc1_.statType) - 1)
         {
            case 0:
               _loc7_ = 2;
               break;
            case 1:
               _loc7_ = 3;
               break;
            case 2:
               _loc7_ = 4;
               break;
            case 3:
               _loc7_ = 5;
         }
         _avatar.update(_loc4_.getCurrentSettings(_loc7_),true);
         _girl.refresh(datingStep.datingIndex,datingStep.stepIndex);
         var _loc8_:SymbolPanelStatQuestGeneric = _vo as SymbolPanelStatQuestGeneric;
         _loc8_.stats.gotoAndStop(_loc1_.statType);
         switch(int(_loc1_.statType) - 1)
         {
            case 0:
               _loc8_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_stamina");
               break;
            case 1:
               _loc8_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_strength");
               break;
            case 2:
               _loc8_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_critical_rating");
               break;
            case 3:
               _loc8_.txtHint.text = LocText.current.text("screen/stat_quest_visualization/hint_dodge_rating");
         }
         var _loc6_:* = 0;
         if(datingStep.repeat)
         {
            _loc6_ = Number(GameUtil.calculateStatQuestWinChance(User.current.character,_loc1_.statType,3));
         }
         else
         {
            _loc5_ = _loc4_.outfits.getOutfitWithSetting(_loc7_);
            if(_loc5_)
            {
               _loc2_ = _loc4_.outfits.getCharacterStatsWithOutfit(_loc4_,_loc4_.outfits.getOutfitWithSetting(_loc7_));
               _loc9_ = 0;
               switch(int(_loc1_.statType) - 1)
               {
                  case 0:
                     _loc9_ = _loc2_.getInt("stat_total_stamina");
                     break;
                  case 1:
                     _loc9_ = _loc2_.getInt("stat_total_strength");
                     break;
                  case 2:
                     _loc9_ = _loc2_.getInt("stat_total_critical_rating");
                     break;
                  case 3:
                     _loc9_ = _loc2_.getInt("stat_total_dodge_rating");
               }
               _loc6_ = Number(_loc9_ / _loc1_.statValue * 1000);
            }
            else
            {
               _loc6_ = Number(_loc4_.getStatValue(_loc1_.statType) / _loc1_.statValue * 1000);
            }
         }
         _gauge.prepare(_loc6_,datingStep.isFinished);
         _gauge.show();
      }
      
      override public function hide() : void
      {
         if(_avatar)
         {
            _avatar.stopAnimation();
         }
         super.hide();
      }
      
      private function onHideSkipButton() : void
      {
         _btnSkip.visible = false;
      }
      
      private function onAnimationComplete() : void
      {
         _quest = null;
         MessageRouter.dispatch(new Message("ViewMessage.notifyStatQuestFinished",null,this));
      }
   }
}
