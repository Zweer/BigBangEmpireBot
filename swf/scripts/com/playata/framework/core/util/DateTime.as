package com.playata.framework.core.util
{
   public class DateTime
   {
       
      
      private var _localTimestampOffset:int = 0;
      
      private var _date:Date = null;
      
      public function DateTime(param1:int = 0)
      {
         super();
         _localTimestampOffset = param1;
         _date = new Date();
         if(_localTimestampOffset != 0)
         {
            _date.setTime(_date.getTime() + _localTimestampOffset * 1000);
         }
      }
      
      public static function get utcLocalTimestampOffset() : int
      {
         var _loc1_:Date = new Date();
         return _loc1_.getTimezoneOffset() * 60;
      }
      
      public static function get now() : DateTime
      {
         return new DateTime();
      }
      
      public static function fromStringServer(param1:String) : DateTime
      {
         return fromString(param1,(DateTime.utcLocalTimestampOffset + TimeUtil.serverTimestampOffset) * -1);
      }
      
      public static function fromString(param1:String, param2:int = 0) : DateTime
      {
         var _loc4_:Array = param1.match(/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/);
         var _loc3_:Date = new Date();
         _loc3_.setFullYear(int(_loc4_[1]),int(_loc4_[2]) - 1,int(_loc4_[3]));
         _loc3_.setHours(int(_loc4_[4]),int(_loc4_[5]),int(_loc4_[6]),0);
         var _loc5_:int = Math.round(_loc3_.getTime() / 1000);
         return fromTimestamp(_loc5_,param2);
      }
      
      public static function fromTimestamp(param1:int, param2:int = 0) : DateTime
      {
         var _loc3_:DateTime = new DateTime(param2);
         _loc3_.timestamp = param1;
         return _loc3_;
      }
      
      public function get localTimestampOffset() : int
      {
         return _localTimestampOffset;
      }
      
      public function get timestamp() : int
      {
         return Math.round(timestampMilliseconds / 1000);
      }
      
      public function get timestampMilliseconds() : Number
      {
         return Math.round(_date.getTime());
      }
      
      public function set timestamp(param1:int) : void
      {
         _date.setTime(param1 * 1000 + _localTimestampOffset * 1000);
      }
      
      public function get millisecond() : int
      {
         return _date.getMilliseconds();
      }
      
      public function set millisecond(param1:int) : void
      {
         _date.setMilliseconds(param1);
      }
      
      public function get second() : int
      {
         return _date.getSeconds();
      }
      
      public function set second(param1:int) : void
      {
         _date.setSeconds(param1);
      }
      
      public function get minute() : int
      {
         return _date.getMinutes();
      }
      
      public function set minute(param1:int) : void
      {
         _date.setMinutes(param1);
      }
      
      public function get hour() : int
      {
         return _date.getHours();
      }
      
      public function set hour(param1:int) : void
      {
         _date.setHours(param1);
      }
      
      public function get date() : int
      {
         return _date.getDate();
      }
      
      public function set date(param1:int) : void
      {
         _date.setDate(param1);
      }
      
      public function get month() : int
      {
         return _date.getMonth() + 1;
      }
      
      public function set month(param1:int) : void
      {
         _date.setMonth(param1 - 1);
      }
      
      public function get year() : int
      {
         return _date.getFullYear();
      }
      
      public function set year(param1:int) : void
      {
         _date.setFullYear(param1);
      }
      
      public function isToday(param1:int) : Boolean
      {
         var _loc2_:DateTime = DateTime.fromTimestamp(param1,localTimestampOffset - TimeUtil.timestampCorrection);
         var _loc4_:String = _loc2_.year + "_" + _loc2_.month + "_" + _loc2_.date;
         var _loc3_:String = year + "_" + month + "_" + date;
         return _loc4_ == _loc3_;
      }
      
      public function isYesterday(param1:int) : Boolean
      {
         var _loc2_:DateTime = DateTime.fromTimestamp(param1,localTimestampOffset - TimeUtil.timestampCorrection);
         var _loc4_:String = _loc2_.year + "_" + _loc2_.month + "_" + _loc2_.date;
         var _loc3_:DateTime = DateTime.fromTimestamp(this.timestamp - 86400,localTimestampOffset - TimeUtil.timestampCorrection);
         var _loc5_:String = _loc3_.year + "_" + _loc3_.month + "_" + _loc3_.date;
         return _loc4_ == _loc5_;
      }
      
      public function isTomorrow(param1:int) : Boolean
      {
         var _loc2_:DateTime = DateTime.fromTimestamp(param1,localTimestampOffset - TimeUtil.timestampCorrection);
         var _loc4_:String = _loc2_.year + "_" + _loc2_.month + "_" + _loc2_.date;
         var _loc3_:DateTime = DateTime.fromTimestamp(this.timestamp + 86400,localTimestampOffset - TimeUtil.timestampCorrection);
         var _loc5_:String = _loc3_.year + "_" + _loc3_.month + "_" + _loc3_.date;
         return _loc4_ == _loc5_;
      }
      
      public function get secondsUntilTomorrow() : int
      {
         var _loc1_:int = (23 - hour) * 60 * 60;
         var _loc2_:int = (59 - minute) * 60;
         var _loc3_:int = 60 - second;
         return _loc1_ + _loc2_ + _loc3_;
      }
      
      public function format(param1:String, param2:String = null) : String
      {
         var _loc6_:String = "";
         var _loc7_:String = "";
         var _loc11_:String = "";
         var _loc4_:String = "";
         var _loc10_:String = "";
         var _loc5_:String = "";
         _loc6_ = String(this.year);
         _loc7_ = String(this.month);
         if(String(this.month).length == 1)
         {
            _loc7_ = "0" + _loc7_;
         }
         _loc11_ = String(this.date);
         if(String(this.date).length == 1)
         {
            _loc11_ = "0" + _loc11_;
         }
         _loc4_ = String(this.hour);
         if(String(this.hour).length == 1)
         {
            _loc4_ = "0" + _loc4_;
         }
         _loc10_ = String(this.minute);
         if(String(this.minute).length == 1)
         {
            _loc10_ = "0" + _loc10_;
         }
         _loc5_ = String(this.second);
         if(String(this.second).length == 1)
         {
            _loc5_ = "0" + _loc5_;
         }
         var _loc8_:* = param1.indexOf("H") != -1;
         var _loc9_:String = "";
         if(_loc8_)
         {
            if(param2 == "en_US")
            {
               _loc9_ = this.hour < 12?" a.m.":" p.m.";
            }
            else
            {
               _loc9_ = this.hour < 12?"am":"pm";
            }
            if(this.hour > 12)
            {
               _loc4_ = String(this.hour - 12);
               if(_loc4_.length == 1)
               {
                  _loc4_ = "0" + _loc4_;
               }
            }
            else if(_loc4_ == "00")
            {
               _loc4_ = "12";
            }
         }
         var _loc3_:* = param1;
         _loc3_ = StringUtil.replace(_loc3_,"[h]","[G]");
         _loc3_ = StringUtil.replace(_loc3_,"mnn",_loc10_ == "00"?"":_loc10_);
         _loc3_ = StringUtil.replace(_loc3_,"Y",_loc6_);
         _loc3_ = StringUtil.replace(_loc3_,"M",_loc7_);
         _loc3_ = StringUtil.replace(_loc3_,"D",_loc11_);
         _loc3_ = StringUtil.replace(_loc3_,"h",_loc4_);
         _loc3_ = StringUtil.replace(_loc3_,"H",_loc4_);
         _loc3_ = StringUtil.replace(_loc3_,"m",_loc10_);
         _loc3_ = StringUtil.replace(_loc3_,"s",_loc5_);
         _loc3_ = StringUtil.replace(_loc3_,"[G]","h");
         return StringUtil.trim(_loc3_) + _loc9_;
      }
   }
}
