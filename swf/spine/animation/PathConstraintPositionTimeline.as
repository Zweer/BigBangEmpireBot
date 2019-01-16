package spine.animation
{
   import spine.Event;
   import spine.PathConstraint;
   import spine.Skeleton;
   
   public class PathConstraintPositionTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 2;
      
      static const PREV_TIME:int = -2;
      
      static const PREV_VALUE:int = -1;
      
      static const VALUE:int = 1;
       
      
      public var pathConstraintIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function PathConstraintPositionTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 2,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.pathConstraintPosition.ordinal << 24) + pathConstraintIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number) : void
      {
         param1 = param1 * 2;
         frames[param1] = param2;
         frames[param1 + 1] = param3;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc10_:Number = NaN;
         var _loc12_:int = 0;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc9_:PathConstraint = param1.pathConstraints[pathConstraintIndex];
         if(param3 < frames[0])
         {
            if(param6)
            {
               _loc9_.position = _loc9_.data.position;
            }
            return;
         }
         if(param3 >= frames[frames.length - 2])
         {
            _loc10_ = frames[frames.length + -1];
         }
         else
         {
            _loc12_ = Animation.binarySearch(frames,param3,2);
            _loc10_ = frames[_loc12_ + -1];
            _loc8_ = frames[_loc12_];
            _loc11_ = getCurvePercent(_loc12_ / 2 - 1,1 - (param3 - _loc8_) / (frames[_loc12_ + -2] - _loc8_));
            _loc10_ = _loc10_ + (frames[_loc12_ + 1] - _loc10_) * _loc11_;
         }
         if(param6)
         {
            _loc9_.position = _loc9_.data.position + (_loc10_ - _loc9_.data.position) * param5;
         }
         else
         {
            _loc9_.position = _loc9_.position + (_loc10_ - _loc9_.position) * param5;
         }
      }
   }
}
