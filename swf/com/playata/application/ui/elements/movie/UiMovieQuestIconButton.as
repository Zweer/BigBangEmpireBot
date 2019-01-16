package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.effects.SwishEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolButtonMovieQuestGeneric;
   
   public class UiMovieQuestIconButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonMovieQuestGeneric;
      
      private var _swishFight:SwishEffect = null;
      
      private var _swishInstant:SwishEffect = null;
      
      private var _swishStat:SwishEffect = null;
      
      private var _scaleInOutInstant:ScaleInOutEffect = null;
      
      private var _scaleInOutFight:ScaleInOutEffect = null;
      
      private var _scaleInOutStat:ScaleInOutEffect = null;
      
      public function UiMovieQuestIconButton(param1:SymbolButtonMovieQuestGeneric, param2:String, param3:Function)
      {
         super(param1,param2,param3);
         _realContent = param1;
         var _loc5_:IImage = null;
         var _loc6_:IImage = null;
         var _loc4_:IImage = null;
         _swishFight = new SwishEffect(_realContent.fightQuest.graphic.swish.swish,90,0.6,3,true,_loc5_);
         _swishInstant = new SwishEffect(_realContent.instantQuest.graphic.swish.swish,90,0.6,3,true,_loc6_);
         _swishStat = new SwishEffect(_realContent.statQuest.graphic.swish.swish,90,0.6,3,true,_loc4_);
         _scaleInOutInstant = new ScaleInOutEffect(_realContent.instantQuest,1,0.8);
         _scaleInOutFight = new ScaleInOutEffect(_realContent.fightQuest,1,0.8);
         _scaleInOutStat = new ScaleInOutEffect(_realContent.statQuest,1,0.8);
      }
      
      override public function dispose() : void
      {
         _swishFight.dispose();
         _swishInstant.dispose();
         _swishStat.dispose();
         _scaleInOutInstant.dispose();
         _scaleInOutFight.dispose();
         _scaleInOutStat.dispose();
         super.dispose();
      }
      
      public function animate(param1:Boolean) : void
      {
         if(param1)
         {
            _scaleInOutFight.play();
            _scaleInOutInstant.play();
            _scaleInOutStat.play();
         }
         else
         {
            _scaleInOutFight.stop();
            _scaleInOutInstant.stop();
            _scaleInOutStat.stop();
            _swishFight.stop();
            _swishInstant.stop();
            _swishStat.stop();
         }
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(buttonEnabled)
         {
            _content.scaleX = _originalScaleX;
            _content.scaleY = _originalScaleY;
         }
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(buttonEnabled)
         {
            _content.scaleX = _originalScaleX * 1.1;
            _content.scaleY = _originalScaleY * 1.1;
         }
      }
      
      public function refresh(param1:MovieQuest) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         _realContent.fightQuest.visible = param1.isFightQuest;
         _realContent.instantQuest.visible = param1.isInstantQuest;
         _realContent.statQuest.visible = param1.isStatQuest;
         if(param1.isStatQuest)
         {
            _loc2_ = _realContent.statQuest.graphic.animation;
            _loc3_ = 1;
            while(_loc3_ < 5)
            {
               _loc4_ = _loc2_.getChildByName("stat" + _loc3_);
               _loc4_.visible = _loc3_ == param1.statQuestStat;
               _loc3_++;
            }
         }
         _realContent.fightQuest.graphic.effect.visible = false;
         _realContent.instantQuest.graphic.effect.visible = false;
         _realContent.statQuest.graphic.effect.visible = false;
         _realContent.fightQuest.graphic.swish.visible = false;
         _realContent.instantQuest.graphic.swish.visible = false;
         _realContent.statQuest.graphic.swish.visible = false;
         if(param1.isFightQuest && _realContent.fightQuest.graphic.swish.visible)
         {
            _swishFight.play();
         }
         else
         {
            _swishFight.stop();
         }
         if(param1.isInstantQuest && _realContent.instantQuest.graphic.swish.visible)
         {
            _swishInstant.play();
         }
         else
         {
            _swishInstant.stop();
         }
         if(param1.isStatQuest && _realContent.statQuest.graphic.swish.visible)
         {
            _swishStat.play();
         }
         else
         {
            _swishStat.stop();
         }
         if(param1.isFightQuest)
         {
            tooltip = LocText.current.text("screen/movie_quest/button_fight_quest_tooltip");
         }
         else if(param1.isStatQuest)
         {
            tooltip = LocText.current.text("screen/movie_quest/button_stat_quest_tooltip");
         }
         else
         {
            tooltip = LocText.current.text("screen/movie_quest/button_instant_quest_tooltip");
         }
         tag = param1;
      }
   }
}
