package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   
   public class Animation
   {
       
      
      var _name:String;
      
      public var _timelines:Vector.<Timeline>;
      
      public var duration:Number;
      
      public function Animation(param1:String, param2:Vector.<Timeline>, param3:Number)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("name cannot be null.");
         }
         if(param2 == null)
         {
            throw new ArgumentError("timelines cannot be null.");
         }
         _name = param1;
         _timelines = param2;
         this.duration = param3;
      }
      
      public static function binarySearch(param1:Vector.<Number>, param2:Number, param3:int) : int
      {
         var _loc6_:int = 0;
         var _loc4_:* = int(param1.length / param3 - 2);
         if(_loc4_ == 0)
         {
            return param3;
         }
         var _loc5_:int = _loc4_ >>> 1;
         while(true)
         {
            if(param1[int((_loc5_ + 1) * param3)] <= param2)
            {
               _loc6_ = _loc5_ + 1;
            }
            else
            {
               _loc4_ = _loc5_;
            }
            if(_loc6_ == _loc4_)
            {
               break;
            }
            _loc5_ = _loc6_ + _loc4_ >>> 1;
         }
         return (_loc6_ + 1) * param3;
      }
      
      public static function binarySearch1(param1:Vector.<Number>, param2:Number) : int
      {
         var _loc5_:int = 0;
         var _loc3_:* = int(param1.length - 2);
         if(_loc3_ == 0)
         {
            return 1;
         }
         var _loc4_:int = _loc3_ >>> 1;
         while(true)
         {
            if(param1[int(_loc4_ + 1)] <= param2)
            {
               _loc5_ = _loc4_ + 1;
            }
            else
            {
               _loc3_ = _loc4_;
            }
            if(_loc5_ == _loc3_)
            {
               break;
            }
            _loc4_ = _loc5_ + _loc3_ >>> 1;
         }
         return _loc5_ + 1;
      }
      
      public static function linearSearch(param1:Vector.<Number>, param2:Number, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         _loc5_ = 0;
         _loc4_ = param1.length - param3;
         while(_loc5_ <= _loc4_)
         {
            if(param1[_loc5_] > param2)
            {
               return _loc5_;
            }
            _loc5_ = _loc5_ + param3;
         }
         return -1;
      }
      
      public function get timelines() : Vector.<Timeline>
      {
         return _timelines;
      }
      
      public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Boolean, param5:Vector.<Event>, param6:Number, param7:Boolean, param8:Boolean) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("skeleton cannot be null.");
         }
         if(param4 && duration != 0)
         {
            param3 = param3 % duration;
            if(param2 > 0)
            {
               param2 = param2 % duration;
            }
         }
         _loc9_ = 0;
         _loc10_ = timelines.length;
         while(_loc9_ < _loc10_)
         {
            timelines[_loc9_].apply(param1,param2,param3,param5,param6,param7,param8);
            _loc9_++;
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function toString() : String
      {
         return _name;
      }
   }
}
