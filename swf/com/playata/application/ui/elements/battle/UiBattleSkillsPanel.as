package com.playata.application.ui.elements.battle
{
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.NumberUtil;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillsGeneric;
   
   public class UiBattleSkillsPanel
   {
       
      
      private var _content:SymbolBattleSkillsGeneric = null;
      
      private var _skills:Vector.<UiBattleSkillBattleIcon>;
      
      private var _offsetX:Number = 0;
      
      private var _skillLookup:IntMap;
      
      private var _hasSkills:Boolean;
      
      public function UiBattleSkillsPanel(param1:SymbolBattleSkillsGeneric)
      {
         super();
         _content = param1;
         _skills = new Vector.<UiBattleSkillBattleIcon>(0);
         _skills.push(new UiBattleSkillBattleIcon(_content.skill1));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill2));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill3));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill4));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill5));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill6));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill7));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill8));
         _skills.push(new UiBattleSkillBattleIcon(_content.skill9));
      }
      
      public function dispose() : void
      {
         resetSkillUsage();
         var _loc3_:int = 0;
         var _loc2_:* = _skills;
         for each(var _loc1_ in _skills)
         {
            _loc1_.dispose();
         }
         _skills = null;
      }
      
      public function refresh(param1:Object, param2:Boolean, param3:String = "") : void
      {
         var _loc5_:int = 0;
         resetSkillUsage();
         _skillLookup = new IntMap();
         var _loc4_:Vector.<BattleSkill> = BattleSkills.instance.getSkillsFromBattleEffectData(param1,true);
         _loc5_ = 0;
         while(_loc5_ < 9)
         {
            if(_loc5_ < _loc4_.length)
            {
               _skillLookup.setData(_loc4_[_loc5_].id,_skills[_loc5_]);
               _skills[_loc5_].setSkill(_loc4_[_loc5_],param2,param3);
               _content.getChildByName("skill" + (_loc5_ + 1)).rotation = NumberUtil.randomNumber(-10,10);
            }
            else
            {
               _skills[_loc5_].setSkill(null);
            }
            _loc5_++;
         }
         _offsetX = _loc4_.length > 0?_content.getChildByName("skill" + _loc4_.length).x:0;
      }
      
      public function resetSkillUsage() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _skills;
         for each(var _loc1_ in _skills)
         {
            _loc1_.reset();
         }
      }
      
      public function showSkillUsage(param1:int, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:UiBattleSkillBattleIcon = _skillLookup.getData(param1);
         if(_loc4_)
         {
            _loc4_.activate(param2,param3);
         }
      }
      
      public function deactivateSkillUsage(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:UiBattleSkillBattleIcon = _skillLookup.getData(param1);
         if(_loc3_)
         {
            _loc3_.deactivate(param2);
         }
      }
      
      public function get offsetX() : Number
      {
         return _offsetX;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible && _content.skill1.img.numChildren > 0;
      }
   }
}
