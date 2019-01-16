package com.playata.framework.core.util
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.localization.LocText;
   
   public class TimeUtil
   {
      
      private static var _serverTimestampOffset:int = 0;
      
      private static var _latencies:Vector.<Number> = new Vector.<Number>(0);
      
      private static var _timestampCorrection:int = 0;
       
      
      public function TimeUtil()
      {
         super();
         throw new Exception("This class only provides static functions and must not be initialized directly.");
      }
      
      public static function getSecondString(param1:int) : String
      {
         if(LocText.current == null)
         {
            return null;
         }
         return LocText.current.text("general/time_second",param1);
      }
      
      public static function getMinuteString(param1:int) : String
      {
         if(LocText.current == null)
         {
            return null;
         }
         return LocText.current.text("general/time_minute",param1);
      }
      
      public static function getHourString(param1:int) : String
      {
         if(LocText.current == null)
         {
            return null;
         }
         return LocText.current.text("general/time_hour",param1);
      }
      
      public static function getDayString(param1:int) : String
      {
         if(LocText.current == null)
         {
            return null;
         }
         return LocText.current.text("general/time_day",param1);
      }
      
      public static function secondsToString(param1:Number, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : String
      {
         if(LocText.current == null)
         {
            return null;
         }
         var _loc5_:Array = new Array(5);
         _loc5_[0] = Math.floor(param1 / 86400);
         _loc5_[1] = Math.floor(param1 / 3600 % 24);
         _loc5_[2] = Math.floor(param1 / 60 % 60);
         _loc5_[3] = Math.floor(param1 % 60);
         if(_loc5_[0] > 0)
         {
            if(param2 || _loc5_[1] == 0 && _loc5_[2] == 0)
            {
               return LocText.current.text("general/time_d",getDayString(_loc5_[0]));
            }
            return LocText.current.text("general/time_dhm",getDayString(_loc5_[0]),_loc5_[1],_loc5_[2]);
         }
         if(_loc5_[1] > 0)
         {
            if(param3 || _loc5_[2] == 0)
            {
               return LocText.current.text("general/time_h",_loc5_[1]);
            }
            return LocText.current.text("general/time_hm",_loc5_[1],_loc5_[2]);
         }
         if(_loc5_[2] > 0)
         {
            if(param4 || _loc5_[3] == 0)
            {
               return LocText.current.text("general/time_m",_loc5_[2]);
            }
            return LocText.current.text("general/time_ms",_loc5_[2],_loc5_[3]);
         }
         if(_loc5_[3] > 0)
         {
            return LocText.current.text("general/time_s",_loc5_[3]);
         }
         return "";
      }
      
      public static function secondsToStringFormat(param1:Number, param2:String) : String
      {
         var _loc3_:Array = new Array(5);
         _loc3_[0] = Math.floor(param1 / 86400);
         _loc3_[1] = Math.floor(param1 / 3600 % 24);
         _loc3_[2] = Math.floor(param1 / 60 % 60);
         _loc3_[3] = Math.floor(param1 % 60);
         var _loc4_:* = param2;
         if(param2.indexOf("d") != -1)
         {
            if(_loc3_[0] < 10)
            {
               _loc4_ = StringUtil.replace(_loc4_,"d","0" + _loc3_[0].toString());
            }
            else
            {
               _loc4_ = StringUtil.replace(_loc4_,"d",_loc3_[0].toString());
            }
         }
         if(param2.indexOf("H") != -1)
         {
            if(_loc3_[1] < 10)
            {
               _loc4_ = StringUtil.replace(_loc4_,"H","0" + _loc3_[1].toString());
            }
            else
            {
               _loc4_ = StringUtil.replace(_loc4_,"H",_loc3_[1].toString());
            }
         }
         if(param2.indexOf("m") != -1)
         {
            if(_loc3_[2] < 10)
            {
               _loc4_ = StringUtil.replace(_loc4_,"m","0" + _loc3_[2].toString());
            }
            else
            {
               _loc4_ = StringUtil.replace(_loc4_,"m",_loc3_[2].toString());
            }
         }
         if(param2.indexOf("s") != -1)
         {
            if(_loc3_[3] < 10)
            {
               _loc4_ = StringUtil.replace(_loc4_,"s","0" + _loc3_[3].toString());
            }
            else
            {
               _loc4_ = StringUtil.replace(_loc4_,"s",_loc3_[3].toString());
            }
         }
         return _loc4_;
      }
      
      public static function resetNow() : void
      {
         _latencies.length = 0;
         _timestampCorrection = 0;
         _serverTimestampOffset = 0;
      }
      
      public static function set serverTimestampOffset(param1:int) : void
      {
         _serverTimestampOffset = param1;
      }
      
      public static function get serverTimestampOffset() : int
      {
         return _serverTimestampOffset;
      }
      
      public static function get timestampCorrection() : int
      {
         return _timestampCorrection;
      }
      
      public static function get localDateTime() : DateTime
      {
         return new DateTime(_timestampCorrection);
      }
      
      public static function get serverDateTime() : DateTime
      {
         return new DateTime(DateTime.utcLocalTimestampOffset + TimeUtil.serverTimestampOffset + _timestampCorrection);
      }
      
      public static function get utcDateTime() : DateTime
      {
         return new DateTime(DateTime.utcLocalTimestampOffset + _timestampCorrection);
      }
      
      public static function get now() : int
      {
         return localDateTime.timestamp;
      }
      
      public static function correctTime(param1:int, param2:Number) : void
      {
         _latencies.push(param2);
         if(_latencies.length > 20)
         {
            _latencies.shift();
         }
         _latencies.sort(latenciesSort);
         var _loc6_:Number = _latencies[_latencies.length >> 1];
         var _loc5_:* = 0;
         var _loc13_:int = 0;
         var _loc12_:* = _latencies;
         for each(var _loc7_ in _latencies)
         {
            _loc5_ = Number(_loc5_ + Math.pow(_loc7_ - _loc6_,2));
         }
         _loc5_ = Number(_loc5_ / _latencies.length);
         var _loc10_:Number = Math.sqrt(_loc5_);
         var _loc3_:int = 0;
         var _loc8_:* = 0;
         var _loc15_:int = 0;
         var _loc14_:* = _latencies;
         for each(_loc7_ in _latencies)
         {
            if(_loc7_ - _loc6_ <= _loc10_)
            {
               _loc3_++;
               _loc8_ = Number(_loc8_ + _loc7_);
            }
         }
         var _loc4_:Number = _loc8_ / _loc3_ / 1000;
         var _loc9_:Number = DateTime.now.timestamp;
         var _loc11_:Number = param1;
         _timestampCorrection = _loc11_ - _loc9_;
      }
      
      private static function latenciesSort(param1:Number, param2:Number) : int
      {
         return param1 < param2?-1:1;
      }
   }
}
