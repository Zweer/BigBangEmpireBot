package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.ui.elements.battle.UiBattleSkillBattleIcon;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.filter.IDisplayObjectFilter;
   import visuals.ui.elements.battle_skills.SymbolTooltipCharacterBattleSkillGeneric;
   
   public class UiCharacterTooltipBattleSkill
   {
       
      
      private var _content:SymbolTooltipCharacterBattleSkillGeneric;
      
      public function UiCharacterTooltipBattleSkill(param1:SymbolTooltipCharacterBattleSkillGeneric)
      {
         super();
         _content = param1;
      }
      
      public function setSkill(param1:BattleSkill) : void
      {
         if(!param1)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.img.removeAllChildren();
         _content.img.addChild(UriSprite.load(param1.iconUrlSmall,20,20,true,18));
         var _loc3_:Vector.<IDisplayObjectFilter> = new Vector.<IDisplayObjectFilter>(0);
         switch(int(param1.quality) - 1)
         {
            case 0:
               _loc3_.push(UiBattleSkillBattleIcon.COMMON);
               break;
            case 1:
               _loc3_.push(UiBattleSkillBattleIcon.RARE);
               break;
            case 2:
               _loc3_.push(UiBattleSkillBattleIcon.EPIC);
         }
         _loc3_.push(UiBattleSkillBattleIcon.SHADOW);
         _content.img.removeAllFilters();
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _content.img.addFilter(_loc2_);
         }
         _content.text.text = param1.shortDescription;
         _content.text.autoFontSize = true;
      }
   }
}
