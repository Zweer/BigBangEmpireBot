package com.playata.application.data.battle
{
   import com.playata.application.data.constants.CBattleSkill;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.localization.LocText;
   
   public class BattleSkill
   {
      
      private static var CACHE:StringMap = new StringMap();
       
      
      private var _skillId:int = 0;
      
      private var _value1;
      
      private var _value2;
      
      private var _value3;
      
      private var _quality:int;
      
      private var _numItems:int;
      
      public function BattleSkill(param1:int, param2:*, param3:*, param4:*, param5:int = 0, param6:int = 1)
      {
         super();
         _skillId = param1;
         _quality = param5;
         _value1 = param2;
         _value2 = param3;
         _value3 = param4;
         _numItems = param6;
      }
      
      public static function fromJSON(param1:String) : BattleSkill
      {
         if(CACHE.exists(param1))
         {
            return CACHE.getData(param1);
         }
         return fromData(JsonUtil.decode(param1));
      }
      
      public static function fromData(param1:Object) : BattleSkill
      {
         var _loc2_:int = param1["skill_id"];
         var _loc7_:int = param1["quality"];
         var _loc4_:* = param1["value1"];
         var _loc3_:* = param1["value2"];
         var _loc5_:* = param1["value3"];
         var _loc6_:String = JsonUtil.encode(param1);
         CACHE.setData(_loc6_,new BattleSkill(_loc2_,_loc4_,_loc3_,_loc5_,_loc7_));
         return CACHE.getData(_loc6_);
      }
      
      public function get id() : int
      {
         return _skillId;
      }
      
      public function get identifier() : String
      {
         return CBattleSkill.fromId(_skillId).identifier;
      }
      
      public function get name() : String
      {
         return LocText.current.text("battle_skill/" + identifier + "/name");
      }
      
      public function get description() : String
      {
         if(value1 !== null && value2 !== null && value3 !== null)
         {
            return LocText.current.text("battle_skill/" + identifier + "/description",value1,value2,value3);
         }
         if(value1 !== null && value2 !== null)
         {
            return LocText.current.text("battle_skill/" + identifier + "/description",value1,value2);
         }
         if(!§§pop())
         {
            return LocText.current.text("battle_skill/" + identifier + "/description",value1);
         }
         return LocText.current.text("battle_skill/" + identifier + "/description");
      }
      
      public function getEnemySkillDescription(param1:String) : String
      {
         if(value1 !== null && value2 !== null && value3 !== null)
         {
            return LocText.current.text("battle_skill/" + identifier + "/description_other",param1,value1,value2,value3);
         }
         if(value1 !== null && value2 !== null)
         {
            return LocText.current.text("battle_skill/" + identifier + "/description_other",param1,value1,value2);
         }
         if(!§§pop())
         {
            return LocText.current.text("battle_skill/" + identifier + "/description_other",param1,value1);
         }
         return LocText.current.text("battle_skill/" + identifier + "/description_other",param1);
      }
      
      public function get shortDescription() : String
      {
         if(!§§pop())
         {
            return LocText.current.text("battle_skill/" + identifier + "/short_description",value1);
         }
         return LocText.current.text("battle_skill/" + identifier + "/short_description");
      }
      
      private function getDisplayValue(param1:String, param2:Number) : Number
      {
         if(identifier != "dot" || param1 != "value2")
         {
            return NumberUtil.roundDecimal((param2 as Number) * 100,2);
         }
         return param2;
      }
      
      public function get value1() : *
      {
         if(_value1 == null || _value1 == undefined)
         {
            return null;
         }
         if(_value1 is Number)
         {
            return getDisplayValue("value1",_value1);
         }
         return getDisplayValue("value1",_value1["min"]) + "-" + getDisplayValue("value1",_value1["max"]);
      }
      
      public function get value2() : *
      {
         if(_value2 == null || _value2 == undefined)
         {
            return null;
         }
         if(_value2 is Number)
         {
            return getDisplayValue("value2",_value2);
         }
         return getDisplayValue("value2",_value2["min"]) + "-" + getDisplayValue("value2",_value2["max"]);
      }
      
      public function get value3() : *
      {
         if(_value3 == null || _value3 == undefined)
         {
            return null;
         }
         if(_value3 is Number)
         {
            return getDisplayValue("value3",_value3);
         }
         return getDisplayValue("value3",_value3["min"]) + "-" + getDisplayValue("value3",_value3["max"]);
      }
      
      public function get type() : int
      {
         return CBattleSkill.fromId(_skillId).type;
      }
      
      public function get charges() : int
      {
         return CBattleSkill.fromId(_skillId).charges;
      }
      
      public function get iconUrlSmall() : String
      {
         return ServerInfo.assetURL("battle_skills/" + identifier + "_small","png");
      }
      
      public function get iconUrlBig() : String
      {
         return ServerInfo.assetURL("battle_skills/" + identifier + "_big","png");
      }
      
      public function get isBonusSkill() : Boolean
      {
         return identifier == "increase_strength" || identifier == "increase_stamina" || identifier == "increase_crit" || identifier == "increase_dodge";
      }
      
      public function get isPassiveSkill() : Boolean
      {
         return isBonusSkill || identifier == "increase_missile_damage" || identifier == "reduce_enemy_dodge" || identifier == "reduce_enemy_crit" || identifier == "reduce_trophy_penalty";
      }
      
      public function isEqual(param1:BattleSkill) : Boolean
      {
         if(_skillId != param1._skillId)
         {
            return false;
         }
         if(_value1 is Number && param1._value1 is Number && _value1 != param1._value1)
         {
            return false;
         }
         if(_value2 is Number && param1._value2 is Number && _value2 != param1._value2)
         {
            return false;
         }
         if(_value3 is Number && param1._value3 is Number && _value3 != param1._value3)
         {
            return false;
         }
         return true;
      }
      
      public function get quality() : int
      {
         return _quality;
      }
      
      public function get numItems() : int
      {
         return _numItems;
      }
   }
}
