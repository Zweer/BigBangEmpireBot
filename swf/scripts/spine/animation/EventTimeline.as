package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   
   public class EventTimeline implements Timeline
   {
       
      
      public var frames:Vector.<Number>;
      
      public var events:Vector.<Event>;
      
      public function EventTimeline(param1:int)
      {
         super();
         frames = new Vector.<Number>(param1,true);
         events = new Vector.<Event>(param1,true);
      }
      
      public function get frameCount() : int
      {
         return frames.length;
      }
      
      public function getPropertyId() : int
      {
         return TimelineType.event.ordinal << 24;
      }
      
      public function setFrame(param1:int, param2:Event) : void
      {
         frames[param1] = param2.time;
         events[param1] = param2;
      }
      
      public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc9_:int = 0;
         var _loc8_:Number = NaN;
         if(!param4)
         {
            return;
         }
         if(param2 > param3)
         {
            apply(param1,param2,2147483647,param4,param5,param6,param7);
            param2 = -1;
         }
         else if(param2 >= frames[int(frameCount - 1)])
         {
            return;
         }
         if(param3 < frames[0])
         {
            return;
         }
         if(param2 < frames[0])
         {
            _loc9_ = 0;
         }
         else
         {
            _loc9_ = Animation.binarySearch1(frames,param2);
            _loc8_ = frames[_loc9_];
            while(_loc9_ > 0)
            {
               if(frames[int(_loc9_ - 1)] == _loc8_)
               {
                  _loc9_--;
                  continue;
               }
               break;
            }
         }
         while(_loc9_ < frameCount && param3 >= frames[_loc9_])
         {
            param4[param4.length] = events[_loc9_];
            _loc9_++;
         }
      }
   }
}
