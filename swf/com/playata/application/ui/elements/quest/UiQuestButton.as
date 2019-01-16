package com.playata.application.ui.elements.quest
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.quest.Quest;
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
      
      private var _scaleInOutTime:ScaleInOutEffect = null;
      
      private var _scaleInOutFight:ScaleInOutEffect = null;
      
      private var _scaleInOutStat:ScaleInOutEffect = null;
      
      public function UiQuestButton(param1:SymbolButtonQuestGeneric, param2:String, param3:Function)
      {
         _realContent = param1;
         super(param1,param2,param3);
         var _loc5_:IImage = null;
         var _loc6_:IImage = null;
         var _loc4_:IImage = null;
         _swishFight = new SwishEffect(_realContent.fightQuest.graphic.swish.swish,90,0.6,3,true,_loc5_);
         _swishTime = new SwishEffect(_realContent.timeQuest.graphic.swish.swish,90,0.6,3,true,_loc6_);
         _swishStat = new SwishEffect(_realContent.statQuest.graphic.swish.swish,90,0.6,3,true,_loc4_);
         _realContent.timeQuest.graphic.animation.hours.rotation = 0;
         _realContent.timeQuest.graphic.animation.minutes.rotation = 0;
         _scaleInOutTime = new ScaleInOutEffect(_realContent.timeQuest,1,0.8);
         _scaleInOutFight = new ScaleInOutEffect(_realContent.fightQuest,1,0.8);
         _scaleInOutStat = new ScaleInOutEffect(_realContent.statQuest,1,0.8);
      }
      
      override public function dispose() : void
      {
         _swishFight.dispose();
         _swishTime.dispose();
         _swishStat.dispose();
         _scaleInOutTime.dispose();
         _scaleInOutFight.dispose();
         _scaleInOutStat.dispose();
         super.dispose();
      }
      
      public function animate(param1:Boolean) : void
      {
         if(param1)
         {
            _scaleInOutFight.play();
            _scaleInOutTime.play();
            _scaleInOutStat.play();
         }
         else
         {
            _scaleInOutFight.stop();
            _scaleInOutTime.stop();
            _scaleInOutStat.stop();
            _swishFight.stop();
            _swishTime.stop();
            _swishStat.stop();
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
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         tag = param1;
         try
         {
            _realContent.fightQuest.visible = param1.isFightQuest;
            _realContent.timeQuest.visible = param1.isTimeQuest;
            _realContent.statQuest.visible = param1.isStatQuest;
            _realContent.fightQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            _realContent.timeQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
            _realContent.statQuest.graphic.swish.visible = param1.reward.itemId != 0 || param1.reward.dungeonKey;
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
               _loc4_ = _realContent.statQuest.graphic.animation;
               _loc6_ = 1;
               while(_loc6_ < 5)
               {
                  _loc7_ = _loc4_.getChildByName("stat" + _loc6_);
                  _loc7_.visible = _loc6_ == param1.statQuestStat;
                  _loc6_++;
               }
            }
            _loc3_ = _realContent.fightQuest.graphic.effect;
            _loc2_ = _realContent.timeQuest.graphic.effect;
            _loc5_ = _realContent.statQuest.graphic.effect;
            _loc3_.visible = param1.effect != null;
            _loc2_.visible = param1.effect != null;
            _loc5_.visible = param1.effect != null;
            if(param1.effect)
            {
               if(param1.isFightQuest)
               {
                  _loc3_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
               }
               else if(param1.isStatQuest)
               {
                  _loc5_.setUriSprite(param1.effectImageUrl,110,110,true,CConstant.quest_max_stage,null,true);
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
            else
            {
               tooltip = LocText.current.text("screen/quest/button_time_quest_tooltip");
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
