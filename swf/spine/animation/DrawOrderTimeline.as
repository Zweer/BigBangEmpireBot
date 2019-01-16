package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   import spine.Slot;
   
   public class DrawOrderTimeline implements Timeline
   {
       
      
      public var frames:Vector.<Number>;
      
      public var drawOrders:Vector.<Vector.<int>>;
      
      public function DrawOrderTimeline(param1:int)
      {
         super();
         frames = new Vector.<Number>(param1,true);
         drawOrders = new Vector.<Vector.<int>>(param1,true);
      }
      
      public function get frameCount() : int
      {
         return frames.length;
      }
      
      public function getPropertyId() : int
      {
         return TimelineType.drawOrder.ordinal << 24;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Vector.<int>) : void
      {
         frames[param1] = param2;
         drawOrders[param1] = param3;
      }
      
      public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc8_:int = 0;
         var _loc14_:int = 0;
         var _loc13_:* = null;
         var _loc10_:int = 0;
         if(param7 && param6)
         {
            _loc8_ = 0;
            _loc14_ = param1.slots.length;
            while(_loc8_ < _loc14_)
            {
               param1.drawOrder[_loc8_] = param1.slots[_loc8_];
               _loc8_++;
            }
            return;
         }
         var _loc16_:Vector.<Slot> = param1.drawOrder;
         var _loc15_:Vector.<Slot> = param1.slots;
         var _loc12_:int = 0;
         if(param3 < frames[0])
         {
            if(param6)
            {
               var _loc18_:int = 0;
               var _loc17_:* = _loc15_;
               for each(_loc13_ in _loc15_)
               {
                  _loc12_++;
                  _loc16_[_loc12_] = _loc13_;
               }
            }
            return;
         }
         if(param3 >= frames[int(frames.length - 1)])
         {
            _loc10_ = frames.length - 1;
         }
         else
         {
            _loc10_ = Animation.binarySearch1(frames,param3) - 1;
         }
         var _loc9_:Vector.<int> = drawOrders[_loc10_];
         _loc12_ = 0;
         if(!_loc9_)
         {
            var _loc20_:int = 0;
            var _loc19_:* = _loc15_;
            for each(_loc13_ in _loc15_)
            {
               _loc12_++;
               _loc16_[_loc12_] = _loc13_;
            }
         }
         else
         {
            var _loc22_:int = 0;
            var _loc21_:* = _loc9_;
            for each(var _loc11_ in _loc9_)
            {
               _loc12_++;
               _loc16_[_loc12_] = _loc15_[_loc11_];
            }
         }
      }
   }
}
