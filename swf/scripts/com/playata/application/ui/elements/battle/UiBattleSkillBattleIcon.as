package com.playata.application.ui.elements.battle
{
   import com.greensock.easing.Sine;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.ui.elements.generic.UiHeadlineTextTooltip;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.filter.DropShadowFilter;
   import com.playata.framework.display.filter.GlowFilter;
   import com.playata.framework.display.filter.IDisplayObjectFilter;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillBattleIconGeneric;
   
   public class UiBattleSkillBattleIcon
   {
      
      public static const SIZE:int = 20;
      
      public static var SHADOW:DropShadowFilter = new DropShadowFilter(2,30,0,1,4,1);
      
      public static var COMMON:GlowFilter = new GlowFilter(16777215,1,2,1,6);
      
      public static var RARE:GlowFilter = new GlowFilter(52479,1,2,1,6);
      
      public static var EPIC:GlowFilter = new GlowFilter(10040319,1,2,1,6);
       
      
      private var _content:SymbolBattleSkillBattleIconGeneric;
      
      private var _skill:BattleSkill;
      
      private var _tooltip:UiHeadlineTextTooltip;
      
      public function UiBattleSkillBattleIcon(param1:SymbolBattleSkillBattleIconGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiHeadlineTextTooltip(_content);
      }
      
      public function setSkill(param1:BattleSkill, param2:Boolean = true, param3:String = "") : void
      {
         clear();
         _skill = param1;
         if(!_skill)
         {
            return;
         }
         _content.visible = true;
         loadImage();
         var _loc4_:String = !!param2?param1.description:param1.getEnemySkillDescription(param3);
         if(param1.numItems > 1)
         {
            _content.numItems.text = param1.numItems.toString();
            _loc4_ = _loc4_ + ("\n\n" + LocText.current.text("battle_skill/multi_item_info",param1.numItems));
         }
         _tooltip.title = param1.name;
         _tooltip.text = _loc4_;
         initFilters();
      }
      
      private function initFilters() : void
      {
         var _loc2_:Vector.<IDisplayObjectFilter> = new Vector.<IDisplayObjectFilter>(0);
         switch(int(_skill.quality) - 1)
         {
            case 0:
               _loc2_.push(COMMON);
               break;
            case 1:
               _loc2_.push(RARE);
               break;
            case 2:
               _loc2_.push(EPIC);
         }
         _loc2_.push(SHADOW);
         _content.removeAllFilters();
         var _loc4_:int = 0;
         var _loc3_:* = _loc2_;
         for each(var _loc1_ in _loc2_)
         {
            _content.addFilter(_loc1_);
         }
      }
      
      public function activate(param1:Boolean, param2:Boolean) : void
      {
         _content.parent.addChild(_content);
         _content.tweenTo(0.5,{
            "scaleX":1.5,
            "scaleY":1.5,
            "ease":Sine.easeOut
         });
         _content.parent.addChild(_content);
         if(param1)
         {
            _content.tweenTo(0.5,{
               "delay":1,
               "scaleX":1,
               "scaleY":1,
               "ease":Sine.easeOut
            });
            if(param2)
            {
               _content.tweenTo(0.5,{
                  "delay":1,
                  "colorMatrixFilter":{
                     "brightness":0.2,
                     "saturation":0
                  }
               });
            }
         }
         else
         {
            Runtime.delayFunction(startActivationWobble,0.5);
         }
      }
      
      public function deactivate(param1:Boolean) : void
      {
         _content.killTweens();
         _content.tweenTo(0.5,{
            "scaleX":1,
            "scaleY":1,
            "ease":Sine.easeOut
         });
         if(param1)
         {
            _content.tweenTo(0.5,{"colorMatrixFilter":{
               "brightness":0.2,
               "saturation":0
            }});
         }
      }
      
      private function startActivationWobble() : void
      {
         _content.tweenTo(1,{
            "scaleX":0.5,
            "scaleY":0.5,
            "ease":Sine.easeInOut,
            "repeat":-1,
            "yoyo":true
         });
      }
      
      private function clear() : void
      {
         _skill = null;
         _content.img.removeAllChildren();
         _content.numItems.text = "";
         _content.killTweens();
         _content.removeAllFilters();
         _content.addFilter(SHADOW);
         _content.visible = false;
      }
      
      private function loadImage() : void
      {
         _content.img.addChild(UriSprite.load(_skill.iconUrlSmall,20,20,true,18));
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
      }
      
      public function reset() : void
      {
         if(!_skill)
         {
            return;
         }
         initFilters();
         _content.killTweens();
      }
   }
}
