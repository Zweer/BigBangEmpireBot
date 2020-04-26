package spine.animation
{
   import spine.Event;
   import spine.IkConstraint;
   import spine.Skeleton;
   
   public class IkConstraintTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 3;
      
      static const PREV_TIME:int = -3;
      
      static const PREV_MIX:int = -2;
      
      static const PREV_BEND_DIRECTION:int = -1;
      
      static const MIX:int = 1;
      
      static const BEND_DIRECTION:int = 2;
       
      
      public var ikConstraintIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function IkConstraintTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 3,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.ikConstraint.ordinal << 24) + ikConstraintIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number, param4:int) : void
      {
         param1 = param1 * 3;
         frames[param1] = param2;
         frames[int(param1 + 1)] = param3;
         frames[int(param1 + 2)] = param4;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc9_:IkConstraint = param1.ikConstraints[ikConstraintIndex];
         if(param3 < frames[0])
         {
            if(param6)
            {
               _loc9_.mix = _loc9_.data.mix;
               _loc9_.bendDirection = _loc9_.data.bendDirection;
            }
            return;
         }
         if(param3 >= frames[int(frames.length - 3)])
         {
            if(param6)
            {
               _loc9_.mix = _loc9_.data.mix + (frames[frames.length + -2] - _loc9_.data.mix) * param5;
               _loc9_.bendDirection = !!param7?_loc9_.data.bendDirection:int(frames[frames.length + -1]);
            }
            else
            {
               _loc9_.mix = _loc9_.mix + (frames[frames.length + -2] - _loc9_.mix) * param5;
               if(!param7)
               {
                  _loc9_.bendDirection = int(frames[frames.length + -1]);
               }
            }
            return;
         }
         var _loc12_:int = Animation.binarySearch(frames,param3,3);
         var _loc10_:Number = frames[int(_loc12_ + -2)];
         var _loc8_:Number = frames[_loc12_];
         var _loc11_:Number = getCurvePercent(_loc12_ / 3 - 1,1 - (param3 - _loc8_) / (frames[_loc12_ + -3] - _loc8_));
         if(param6)
         {
            _loc9_.mix = _loc9_.data.mix + (_loc10_ + (frames[_loc12_ + 1] - _loc10_) * _loc11_ - _loc9_.data.mix) * param5;
            _loc9_.bendDirection = !!param7?_loc9_.data.bendDirection:int(frames[_loc12_ + -1]);
         }
         else
         {
            _loc9_.mix = _loc9_.mix + (_loc10_ + (frames[_loc12_ + 1] - _loc10_) * _loc11_ - _loc9_.mix) * param5;
            if(!param7)
            {
               _loc9_.bendDirection = int(frames[_loc12_ + -1]);
            }
         }
      }
   }
}
