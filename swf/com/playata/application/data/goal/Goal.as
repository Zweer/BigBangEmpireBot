package com.playata.application.data.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.ui.elements.goal.UiGoalFilter;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.data.DataObject;
   
   public class Goal extends DataObject
   {
       
      
      private var _identifier:String = null;
      
      private var _values:Vector.<GoalValue>;
      
      private var _position:int = 0;
      
      public function Goal(param1:String, param2:Object = null)
      {
         _values = new Vector.<GoalValue>();
         _identifier = param1;
         super(param2);
         var _loc7_:int = 0;
         var _loc6_:* = param2.values;
         for(var _loc5_ in param2.values)
         {
            _values.push(new GoalValue(parseInt(_loc5_.toString()),this,param2.values[_loc5_]));
         }
         _values.sort(sortByValue);
         var _loc3_:int = 1;
         var _loc9_:int = 0;
         var _loc8_:* = _values;
         for each(var _loc4_ in _values)
         {
            _loc3_++;
            _loc4_.index = _loc3_;
         }
      }
      
      private function sortByValue(param1:GoalValue, param2:GoalValue) : int
      {
         if(param1.value < param2.value)
         {
            return -1;
         }
         if(param1.value > param2.value)
         {
            return 1;
         }
         return 0;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get goalType() : int
      {
         return getInt("goal_type");
      }
      
      public function get mechanicType() : int
      {
         return getInt("mechanic_type");
      }
      
      public function get lookupColumn() : String
      {
         return getString("lookup_column");
      }
      
      public function get category() : int
      {
         return getInt("category");
      }
      
      public function get requiredGoal() : Goal
      {
         var _loc1_:String = getString("required_goal");
         if(!_loc1_)
         {
            return null;
         }
         return Goals.instance.goal(_loc1_);
      }
      
      public function get requiredLevel() : int
      {
         return getInt("required_level");
      }
      
      public function get isNumberStep() : Boolean
      {
         return goalType == 1;
      }
      
      public function get isOneTime() : Boolean
      {
         return goalType == 2;
      }
      
      public function get values() : Vector.<GoalValue>
      {
         return _values;
      }
      
      public function allValuesCollected(param1:Character) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = values;
         for each(var _loc2_ in values)
         {
            if(!_loc2_.isCollected(param1))
            {
               return false;
            }
         }
         return true;
      }
      
      public function lastCollectedValue(param1:Character) : GoalValue
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = values;
         for each(var _loc2_ in values)
         {
            if(_loc2_.isCollected(param1))
            {
               _loc3_ = _loc2_;
            }
         }
         if(_loc3_)
         {
            return _loc3_;
         }
         return null;
      }
      
      public function currentValue(param1:Character, param2:Boolean = false) : int
      {
         var _loc3_:int = mechanicType;
         if(_loc3_ == 2 || _loc3_ == 3)
         {
            return param1.goalValue(this,param2);
         }
         return param1.goalValue(this,false);
      }
      
      public function currentTargetValue(param1:Character, param2:Boolean = false) : GoalValue
      {
         var _loc5_:int = 0;
         var _loc4_:* = values;
         for each(var _loc3_ in values)
         {
            if(!_loc3_.isCollected(param1))
            {
               if(!(param2 && !UiGoalFilter.isAllowed(_loc3_,param1)))
               {
                  return _loc3_;
               }
            }
         }
         return values[values.length - 1];
      }
      
      public function currentGoalValue(param1:Character) : GoalValue
      {
         var _loc4_:int = 0;
         var _loc3_:* = values;
         for each(var _loc2_ in values)
         {
            if(!_loc2_.isCollectable(param1))
            {
               return _loc2_;
            }
         }
         return values[values.length - 1];
      }
      
      public function isFinished(param1:Character) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = values;
         for each(var _loc2_ in values)
         {
            if(!_loc2_.isCollected(param1))
            {
               return false;
            }
         }
         return true;
      }
      
      public function isAvailable(param1:Character) : Boolean
      {
         if(requiredLevel > 0)
         {
            if(requiredLevel > param1.level)
            {
               return false;
            }
         }
         if(requiredGoal != null)
         {
            if(!requiredGoal.isFinished(param1))
            {
               return false;
            }
         }
         return true;
      }
      
      public function get iconImageUrl() : String
      {
         return Assets.assetURL("goals/" + identifier,"png");
      }
      
      public function get isHidden() : Boolean
      {
         return getBoolean("hidden");
      }
      
      public function get displayAsTime() : Boolean
      {
         return getBoolean("display_as_time");
      }
      
      public function set position(param1:int) : void
      {
         _position = param1;
      }
      
      public function get position() : int
      {
         return _position;
      }
   }
}
