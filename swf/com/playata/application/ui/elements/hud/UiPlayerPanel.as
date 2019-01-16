package com.playata.application.ui.elements.hud
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quint;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.generic.SymbolPlayerPanelGeneric;
   
   public class UiPlayerPanel
   {
      
      public static var dailyLoginBonus:int = 0;
      
      private static const BASE_X:Number = -154;
      
      private static const TOTAL_WIDTH:Number = 137;
       
      
      private var _content:SymbolPlayerPanelGeneric;
      
      private var _tooltipXp:UiTextTooltip;
      
      private var _tooltipLevel:UiTextTooltip;
      
      private var _timeline:TimelineMax;
      
      private var _currentUser:User;
      
      private var _lastXP:Number;
      
      private var _currentWidth:Number;
      
      private var _mask:IDisplayObject;
      
      private var _text:ILabel;
      
      public function UiPlayerPanel(param1:SymbolPlayerPanelGeneric)
      {
         vo = param1;
         super();
         _content = vo;
         _mask = vo.xpBarMask;
         vo.nativeInstance.blendMode = "layer";
         _tooltipXp = new UiTextTooltip(vo.tooltipLayer,"");
         _tooltipLevel = new UiTextTooltip(vo.levelStar.level.txtLevel,"");
         _currentWidth = 0;
         _text = vo.addXPText;
         _text.y = -12;
         _text.alpha = 0;
         _text.visible = false;
         _timeline = new TimelineMax({"paused":true});
         _timeline.addCallback(function():void
         {
            _text.visible = false;
         },0);
         _timeline.insert(new TweenMax(_content,0.1,{
            "rotation":-5,
            "scaleX":0.8,
            "scaleY":0.8,
            "ease":Quint.easeOut
         }),0.7);
         _timeline.append(new TweenMax(_content,0.01,{
            "rotation":-2,
            "scaleX":0.95,
            "scaleY":0.95,
            "ease":Linear.easeNone
         }));
         _timeline.append(new TweenMax(_content,0.1,{
            "rotation":-5,
            "scaleX":0.8,
            "scaleY":0.8,
            "ease":Quint.easeOut
         }));
         _timeline.append(new TweenMax(_content,0.01,{
            "rotation":-2,
            "scaleX":0.95,
            "scaleY":0.95,
            "ease":Linear.easeNone
         }));
         _timeline.append(new TweenMax(_content,0.1,{
            "rotation":-5,
            "scaleX":0.8,
            "scaleY":0.8,
            "ease":Quint.easeOut
         }));
         _timeline.append(new TweenMax(_content,0.4,{
            "rotation":0,
            "scaleX":1,
            "scaleY":1,
            "ease":Back.easeOut
         }));
         _timeline.addCallback(function():void
         {
            _text.visible = true;
            _text.alpha = 1;
         },_timeline.duration());
         _timeline.append(new TweenMax(_text,2,{
            "y":-37,
            "ease":Linear.easeNone
         }));
         _timeline.append(new TweenMax(_text,0.5,{
            "autoAlpha":0,
            "ease":Linear.easeNone
         }),-0.5);
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         _content.levelStar.level.txtLevel.text = _loc1_.level.toString();
         if(_loc1_.maxQuestStage == CConstant.quest_max_stage)
         {
            _tooltipLevel.text = LocText.current.text("general/level_general_tooltip",_loc1_.level);
         }
         else
         {
            _tooltipLevel.text = LocText.current.text("general/level_stage_tooltip",GameUtil.getLevelString(GameUtil.getQuestStageUnlockLevel(_loc1_.maxQuestStage + 1) - _loc1_.level),_loc1_.maxQuestStage + 1);
         }
         if(_loc1_.level >= CConstant.max_level)
         {
            _tooltipXp.text = "";
         }
         else
         {
            _tooltipXp.text = LocText.current.text("general/xp_tooltip",_loc1_.xpInThisLevel,_loc1_.xpCurrentLevel,_loc1_.xpToLevelUp);
         }
         var _loc3_:Number = _loc1_.levelProgress * 137;
         if(_currentUser == null)
         {
            _currentUser = User.current;
            _currentWidth = _loc3_;
            _mask.x = -154 + _currentWidth;
            _lastXP = _loc1_.getInt("xp");
            return;
         }
         var _loc2_:int = _loc1_.getInt("xp") - _lastXP;
         _lastXP = _loc1_.getInt("xp");
         if(_loc2_ > 0)
         {
            _text.text = "+" + LocText.current.formatHugeNumber(_loc2_);
            _text.x = -154 + _loc3_ + _content.xpBarMask.width - 40;
         }
         else
         {
            _text.text = "";
         }
         if(_loc3_ > _currentWidth)
         {
            _mask.tweenTo(0.5,{
               "delay":0.75,
               "x":-154 + _loc3_,
               "ease":Linear.easeNone
            });
            if(EffectsLayer.instance.enabled)
            {
               _timeline.gotoAndPlay(0,false);
            }
         }
         else if(_loc2_ > 0)
         {
            _mask.tweenTo(0.25,{
               "delay":0.75,
               "x":-154 + 137,
               "ease":Linear.easeNone,
               "onComplete":continueUpdateOnNextLevel,
               "onCompleteParams":[_loc3_]
            });
            if(EffectsLayer.instance.enabled)
            {
               _timeline.gotoAndPlay(0,false);
            }
         }
         _currentWidth = _loc3_;
      }
      
      private function continueUpdateOnNextLevel(param1:Number) : void
      {
         _mask.x = -154;
         _mask.tweenTo(0.25,{
            "x":-154 + param1,
            "ease":Linear.easeNone
         });
      }
      
      public function dispose() : void
      {
         _tooltipLevel.dispose();
         _tooltipXp.dispose();
         _tooltipLevel = null;
         _tooltipXp = null;
         _content = null;
      }
      
      public function reset() : void
      {
         _currentUser = null;
      }
   }
}
