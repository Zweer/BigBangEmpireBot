package spine.animation
{
   import spine.Event;
   import spine.PathConstraint;
   import spine.Skeleton;
   
   public class PathConstraintSpacingTimeline extends PathConstraintPositionTimeline
   {
       
      
      public function PathConstraintSpacingTimeline(param1:int)
      {
         super(param1);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.pathConstraintSpacing.ordinal << 24) + pathConstraintIndex;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc8_:Number = NaN;
         var _loc12_:int = 0;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc10_:PathConstraint = param1.pathConstraints[pathConstraintIndex];
         if(param3 < frames[0])
         {
            if(param6)
            {
               _loc10_.spacing = _loc10_.data.spacing;
            }
            return;
         }
         if(param3 >= frames[frames.length - 2])
         {
            _loc8_ = frames[frames.length + -1];
         }
         else
         {
            _loc12_ = Animation.binarySearch(frames,param3,2);
            _loc8_ = frames[_loc12_ + -1];
            _loc9_ = frames[_loc12_];
            _loc11_ = getCurvePercent(_loc12_ / 2 - 1,1 - (param3 - _loc9_) / (frames[_loc12_ + -2] - _loc9_));
            _loc8_ = _loc8_ + (frames[_loc12_ + 1] - _loc8_) * _loc11_;
         }
         if(param6)
         {
            _loc10_.spacing = _loc10_.data.spacing + (_loc8_ - _loc10_.data.spacing) * param5;
         }
         else
         {
            _loc10_.spacing = _loc10_.spacing + (_loc8_ - _loc10_.spacing) * param5;
         }
      }
   }
}
