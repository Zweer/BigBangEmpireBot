package com.playata.application.ui.elements.battle
{
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.filter.GlowFilter;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGeneric;
   
   public class UiBattleSkill extends InteractiveDisplayObject
   {
      
      public static var COMMON:GlowFilter = new GlowFilter(16777215,1,10,1,3);
      
      public static var RARE:GlowFilter = new GlowFilter(52479,1,10,1,3);
      
      public static var EPIC:GlowFilter = new GlowFilter(10040319,1,10,1,3);
      
      public static const PREVIEW:int = 1;
      
      public static const BIG:int = 2;
      
      public static const TOOLTIP:int = 3;
       
      
      private var _content:SymbolBattleSkillGeneric;
      
      private var _skill:BattleSkill;
      
      private var _tooltip:UiBattleSkillDetailTooltip;
      
      private var _mode:int;
      
      private var _rareGlowEffect:GlowFilterEffect;
      
      private var _epicGlowEffect:GlowFilterEffect;
      
      public var owner:String;
      
      public function UiBattleSkill(param1:SymbolBattleSkillGeneric, param2:int, param3:BattleSkill = null)
      {
         _content = param1;
         super(_content);
         _mode = param2;
         _skill = param3;
         _content.txtDescription.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         _content.txtTitle.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         if(_mode != 3)
         {
            _rareGlowEffect = UiItemGraphic.getItemGlowEffect(2,_content.icon);
            _epicGlowEffect = UiItemGraphic.getItemGlowEffect(3,_content.icon);
         }
         refresh();
      }
      
      override public function get height() : Number
      {
         return !!_content.visible?Math.max(40,_content.txtDescription.y + _content.txtDescription.height):0;
      }
      
      override public function dispose() : void
      {
         _tooltip = null;
         if(_rareGlowEffect)
         {
            _rareGlowEffect.stop();
            _rareGlowEffect.dispose();
            _rareGlowEffect = null;
         }
         if(_epicGlowEffect)
         {
            _epicGlowEffect.stop();
            _epicGlowEffect.dispose();
            _epicGlowEffect = null;
         }
         super.dispose();
      }
      
      public function get skill() : BattleSkill
      {
         return _skill;
      }
      
      public function set skill(param1:BattleSkill) : void
      {
         if(param1 == _skill)
         {
            return;
         }
         _skill = param1;
         refresh();
      }
      
      private function refresh() : void
      {
         if(!_skill)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         var _loc1_:String = "";
         if(_mode != 3)
         {
            _rareGlowEffect.stop();
            _epicGlowEffect.stop();
         }
         _content.icon.removeAllFilters();
         switch(int(skill.quality))
         {
            case 0:
               break;
            case 1:
               _content.icon.addFilter(COMMON);
               _loc1_ = "common";
               break;
            case 2:
               if(_mode != 3)
               {
                  _rareGlowEffect.play();
               }
               else
               {
                  _content.icon.addFilter(RARE);
               }
               _loc1_ = "rare";
               break;
            case 3:
               if(_mode != 3)
               {
                  _epicGlowEffect.play();
               }
               else
               {
                  _content.icon.addFilter(EPIC);
               }
               _loc1_ = "epic";
         }
         _content.icon.img.removeAllChildren();
         switch(int(_mode) - 1)
         {
            case 0:
               _content.icon.img.addChild(UriSprite.load(_skill.iconUrlBig,60,60,true,3));
               _content.bg.gotoAndStop("preview");
               break;
            case 1:
               _content.icon.img.addChild(UriSprite.load(_skill.iconUrlBig,120,120,true,3));
               _content.bg.gotoAndStop("big_" + _loc1_);
               break;
            case 2:
               _content.icon.img.addChild(UriSprite.load(_skill.iconUrlSmall,40,40,true,9));
               _content.bg.gotoAndStop("tooltip");
         }
         if(_mode != 3)
         {
            _tooltip = new UiBattleSkillDetailTooltip(new InteractiveDisplayObject(_content),skill.name,skill.description,skill.quality);
            _content.txtTitle.visible = false;
            _content.txtDescription.visible = false;
         }
         else
         {
            _content.txtTitle.text = skill.name;
            _content.txtDescription.text = owner != null?skill.getEnemySkillDescription(owner):skill.description;
            _content.txtDescription.y = _content.txtTitle.y + _content.txtTitle.textHeight + 2;
         }
      }
   }
}
