package com.playata.framework.core.enum
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.error.Exception;
   import flash.utils.describeType;
   
   public class Enum
   {
      
      private static var _pendingDb:Object = {};
      
      private static var _enumDb:Object = {};
       
      
      private var _name:String = null;
      
      private var _index:int = -1;
      
      public function Enum()
      {
         super();
         var _loc1_:String = Runtime.getClassName(this);
         if(_enumDb[_loc1_] != null)
         {
            throw new Exception("Enum constants can only be constructed as static consts in their own enum class (bad type=’" + _loc1_ + "’)");
         }
         var _loc2_:Array = _pendingDb[_loc1_];
         if(_loc2_ == null)
         {
            _loc2_ = [];
            _pendingDb[_loc1_] = [];
         }
         _index = _loc2_.length;
         _loc2_.push(this);
      }
      
      public static function GetConstants(param1:Class) : Array
      {
         var _loc2_:EnumConstants = _enumDb[Runtime.getClassName(param1)];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.ByIndex.slice();
      }
      
      public static function ParseConstant(param1:Class, param2:String, param3:Boolean = false) : Enum
      {
         var _loc5_:EnumConstants = _enumDb[Runtime.getClassName(param1)];
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc4_:Enum = _loc5_.ByName[param2.toLowerCase()];
         if(param3 && _loc4_ != null && param2 != _loc4_.Name)
         {
            return null;
         }
         return _loc4_;
      }
      
      protected static function initEnum(param1:Class) : void
      {
         var _loc3_:* = null;
         var _loc7_:* = undefined;
         var _loc4_:String = Runtime.getClassName(param1);
         if(_enumDb[_loc4_] != null)
         {
            throw new Exception("Can’t initialize enum twice (type=’" + _loc4_ + "’)");
         }
         var _loc5_:Array = _pendingDb[_loc4_];
         if(_loc5_ == null)
         {
            throw new Exception("Can’t have an enum without any constants (type=’" + _loc4_ + "’)");
         }
         var _loc6_:XML = describeType(param1);
         var _loc9_:int = 0;
         var _loc8_:* = _loc6_.constant;
         for each(var _loc2_ in _loc6_.constant)
         {
            _loc3_ = param1[_loc2_.@name];
            _loc7_ = Object(_loc3_).constructor;
            if(_loc7_ != param1)
            {
               throw new Exception("Constant type ‘" + _loc7_ + "’ " + "does not match its enum class ‘" + param1 + "’");
            }
            _loc3_._name = _loc2_.@name;
         }
         _pendingDb[_loc4_] = null;
         _enumDb[_loc4_] = new EnumConstants(_loc5_);
      }
      
      public function get Name() : String
      {
         return _name;
      }
      
      public function get Index() : int
      {
         return _index;
      }
      
      public function toString() : String
      {
         return Name;
      }
   }
}

import com.playata.framework.core.enum.Enum;

class EnumConstants
{
    
   
   public var ByIndex:Array;
   
   public var ByName:Object;
   
   function EnumConstants(param1:Array)
   {
      var _loc3_:int = 0;
      var _loc2_:* = null;
      ByName = {};
      super();
      ByIndex = param1;
      _loc3_ = 0;
      while(_loc3_ < ByIndex.length)
      {
         _loc2_ = ByIndex[_loc3_];
         ByName[_loc2_.Name.toLowerCase()] = _loc2_;
         _loc3_++;
      }
   }
}
