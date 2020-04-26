package com.playata.application.data.battle
{
   import com.playata.framework.core.collection.IntMap;
   
   public class BattleSkills
   {
      
      private static var _instance:BattleSkills;
       
      
      private var _skillsBySlot:IntMap;
      
      public function BattleSkills(param1:Object)
      {
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = undefined;
         var _loc4_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = null;
         super();
         if(_instance != null)
         {
            throw new Error("Battle skills can only have a single instance!");
         }
         _instance = this;
         _skillsBySlot = new IntMap();
         var _loc14_:int = 0;
         var _loc13_:* = param1;
         for(var _loc2_ in param1)
         {
            _loc10_ = param1[_loc2_];
            _loc3_ = _loc10_["slots"];
            var _loc12_:int = 0;
            var _loc11_:* = _loc3_;
            for(var _loc9_ in _loc3_)
            {
               _loc6_ = _loc10_["rolled_value"] == "value1"?_loc3_[_loc9_]:_loc10_["value1"];
               _loc4_ = _loc10_["rolled_value"] == "value2"?_loc3_[_loc9_]:_loc10_["value2"];
               _loc7_ = _loc10_["rolled_value"] == "value3"?_loc3_[_loc9_]:_loc10_["value3"];
               _loc8_ = new BattleSkill(_loc2_,_loc6_,_loc4_,_loc7_);
               if(!_skillsBySlot.exists(_loc9_))
               {
                  _skillsBySlot.setData(_loc9_,new Vector.<BattleSkill>(0));
               }
               _skillsBySlot.getData(_loc9_).push(_loc8_);
            }
         }
         var _loc16_:int = 0;
         var _loc15_:* = _skillsBySlot;
         for each(var _loc5_ in _skillsBySlot)
         {
            _loc5_.sort(skillSort);
         }
      }
      
      public static function get instance() : BattleSkills
      {
         return _instance;
      }
      
      public function getSkillsForSlot(param1:int) : Vector.<BattleSkill>
      {
         return _skillsBySlot.getData(param1);
      }
      
      private function skillSort(param1:BattleSkill, param2:BattleSkill) : int
      {
         return param1.id - param2.id;
      }
      
      public function getSkillsFromBattleEffectData(param1:Object, param2:Boolean = true) : Vector.<BattleSkill>
      {
         var _loc10_:* = null;
         var _loc4_:int = 0;
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc8_:* = undefined;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc9_:* = null;
         var _loc3_:Vector.<BattleSkill> = new Vector.<BattleSkill>(0);
         var _loc14_:int = 0;
         var _loc13_:* = param1;
         for(var _loc6_ in param1)
         {
            _loc10_ = param1[_loc6_];
            _loc4_ = BattleEffect.getBattleSkillId(_loc6_);
            _loc7_ = !!_loc10_.hasOwnProperty("chance")?_loc10_["chance"]:_loc10_["value"];
            _loc5_ = !!_loc10_.hasOwnProperty("chance")?!!_loc10_.hasOwnProperty("value")?_loc10_["value"]:null:null;
            _loc8_ = !!_loc10_.hasOwnProperty("value2")?_loc10_["value2"]:null;
            _loc11_ = _loc10_["quality"];
            _loc12_ = !!_loc10_.hasOwnProperty("items")?_loc10_["items"]:1;
            _loc9_ = new BattleSkill(_loc4_,_loc7_,_loc5_,_loc8_,_loc11_,_loc12_);
            if(!param2 || !_loc9_.isBonusSkill && _loc9_.identifier != "increase_stats")
            {
               _loc3_.push(_loc9_);
            }
         }
         return _loc3_;
      }
   }
}
