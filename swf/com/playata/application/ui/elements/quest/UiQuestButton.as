package com.playata.application.ui.elements.quest
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.effects.SwishEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonQuestGeneric;
   
   public class UiQuestButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonQuestGeneric;
      
      private var _swishFight:SwishEffect = null;
      
      private var _swishTime:SwishEffect = null;
      
      private var _swishStat:SwishEffect = null;
      
      private var _swishUserStory:SwishEffect = null;
      
      private var _scaleInOutTime:ScaleInOutEffect = null;
      
      private var _scaleInOutFight:ScaleInOutEffect = null;
      
      private var _scaleInOutStat:ScaleInOutEffect = null;
      
      private var _scaleInOutUserStory:ScaleInOutEffect = null;
      
      public function UiQuestButton(param1:SymbolButtonQuestGeneric, param2:String, param3:Function)
      {
         _realContent = param1;
         super(param1,param2,param3);
         var _loc6_:IImage = null;
         var _loc7_:IImage = null;
         var _loc4_:IImage = null;
         var _loc5_:IImage = null;
         _swishFight = new SwishEffect(_realContent.fightQuest.graphic.swish.swish,90,0.6,3,true,_loc6_);
         _swishTime = new SwishEffect(_realContent.timeQuest.graphic.swish.swish,90,0.6,3,true,_loc7_);
         _swishStat = new SwishEffect(_realContent.statQuest.graphic.swish.swish,90,0.6,3,true,_loc4_);
         _swishUserStory = new SwishEffect(_realContent.userStoryQuest.graphic.swish.swish,90,0.6,3,true,_loc5_);
         _realContent.timeQuest.graphic.animation.hours.rotation = 0;
         _realContent.timeQuest.graphic.animation.minutes.rotation = 0;
         _scaleInOutTime = new ScaleInOutEffect(_realContent.timeQuest,1,0.8);
         _scaleInOutFight = new ScaleInOutEffect(_realContent.fightQuest,1,0.8);
         _scaleInOutStat = new ScaleInOutEffect(_realContent.statQuest,1,0.8);
         _scaleInOutUserStory = new ScaleInOutEffect(_realContent.userStoryQuest,1,0.8);
      }
      
      override public function dispose() : void
      {
         _swishFight.dispose();
         _swishTime.dispose();
         _swishStat.dispose();
         _swishUserStory.dispose();
         _scaleInOutTime.dispose();
         _scaleInOutFight.dispose();
         _scaleInOutStat.dispose();
         _scaleInOutUserStory.dispose();
         super.dispose();
      }
      
      public function animate(param1:Boolean) : void
      {
         if(param1)
         {
            _scaleInOutFight.play();
            _scaleInOutTime.play();
            _scaleInOutStat.play();
            _scaleInOutUserStory.play();
         }
         else
         {
            _scaleInOutFight.stop();
            _scaleInOutTime.stop();
            _scaleInOutStat.stop();
            _scaleInOutUserStory.stop();
            _swishFight.stop();
            _swishTime.stop();
            _swishStat.stop();
            _swishUserStory.stop();
         }
      }
      
      public function set quest(param1:Quest) : void
      {
         tag = param1;
      }
      
      public function get quest() : Quest
      {
         if(tag is Quest)
         {
            return tag as Quest;
         }
         return null;
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(_enabled)
         {
            _content.scaleX = _originalScaleX;
            _content.scaleY = _originalScaleY;
         }
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(_enabled)
         {
            _content.scaleX = _originalScaleX * 1.1;
            _content.scaleY = _originalScaleY * 1.1;
         }
      }
      
      public function refresh(param1:Quest) : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         tag = param1;
         try
         {
            _realContent.fightQuest.visible = param1.isFightQuest;
            _realContent.timeQuest.visible = param1.isTimeQuest;
            _realContent.statQuest.visible = param1.isStatQuest;
            _realContent.userStoryQuest.visible = param1.isUserStoryQuest;
            _realContent.fightQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            _realContent.timeQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            _realContent.statQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            _realContent.userStoryQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            if(param1.isFightQuest && _realContent.fightQuest.graphic.swish.visible)
            {
               _swishFight.play();
            }
            else
            {
               _swishFight.stop();
            }
            if(param1.isTimeQuest && _realContent.timeQuest.graphic.swish.visible)
            {
               _swishTime.play();
            }
            else
            {
               _swishTime.stop();
            }
            if(param1.isUserStoryQuest && _realContent.userStoryQuest.graphic.swish.visible)
            {
               _swishUserStory.play();
            }
            else
            {
               _swishUserStory.stop();
            }
            if(param1.isStatQuest && _realContent.statQuest.graphic.swish.visible)
            {
               _swishStat.play();
            }
            else
            {
               _swishStat.stop();
            }
            if(param1.isStatQuest)
            {
               _loc5_ = _realContent.statQuest.graphic.animation;
               _loc7_ = 1;
               while(_loc7_ < 5)
               {
                  _loc9_ = _loc5_.getChildByName("stat" + _loc7_);
                  _loc9_.visible = _loc7_ == param1.statQuestStat;
                  _loc7_++;
               }
            }
            if(param1.isUserStoryQuest)
            {
               _loc8_ = UserStories.getUserStory(parseInt(param1.identifier));
               if(_loc8_)
               {
                  _realContent.userStoryQuest.graphic.iconTag.gotoAndStop(_loc8_.tag);
               }
            }
            _loc4_ = _realContent.fightQuest.graphic.effect;
            _loc2_ = _realContent.timeQuest.graphic.effect;
            _loc6_ = _realContent.statQuest.graphic.effect;
            _loc3_ = _realContent.userStoryQuest.graphic.effect;
            _loc4_.visible = param1.effect != null;
            _loc2_.visible = param1.effect != null;
            _loc6_.visible = param1.effect != null;
            _loc3_.visible = param1.effect != null;
            if(param1.effect)
            {
               if(param1.isFightQuest)
               {
                  _loc4_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
               }
               else if(param1.isUserStoryQuest)
               {
                  _loc3_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
               }
               else if(param1.isStatQuest)
               {
                  _loc6_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
               }
               else
               {
                  _loc2_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
               }
            }
            if(param1.isFightQuest)
            {
               tooltip = LocText.current.text("screen/quest/button_fight_quest_tooltip");
            }
            else if(param1.isStatQuest)
            {
               tooltip = LocText.current.text("screen/quest/button_stat_quest_tooltip");
            }
            else if(param1.isTimeQuest)
            {
               tooltip = LocText.current.text("screen/quest/button_time_quest_tooltip");
            }
            else if(param1.isUserStoryQuest)
            {
               tooltip = LocText.current.text("screen/quest/button_user_story_quest_tooltip");
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
