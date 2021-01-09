package spine.animation
{
   import spine.Event;
   import spine.PathConstraint;
   import spine.Skeleton;
   
   public class PathConstraintMixTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 3;
      
      static const PREV_TIME:int = -3;
      
      static const PREV_ROTATE:int = -2;
      
      static const PREV_TRANSLATE:int = -1;
      
      static const ROTATE:int = 1;
      
      static const TRANSLATE:int = 2;
       
      
      public var pathConstraintIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function PathConstraintMixTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 3,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.pathConstraintMix.ordinal << 24) + pathConstraintIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         param1 = param1 * 3;
         frames[param1] = param2;
         frames[param1 + 1] = param3;
         frames[param1 + 2] = param4;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc11_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc13_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc12_:PathConstraint = param1.pathConstraints[pathConstraintIndex];
         if(param3 < frames[0])
         {
            if(param6)
            {
               _loc12_.rotateMix = _loc12_.data.rotateMix;
               _loc12_.translateMix = _loc12_.data.translateMix;
            }
            return;
         }
         if(param3 >= frames[frames.length - 3])
         {
            _loc8_ = frames[frames.length + -2];
            _loc11_ = frames[frames.length + -1];
         }
         else
         {
            _loc13_ = Animation.binarySearch(frames,param3,3);
            _loc8_ = frames[_loc13_ + -2];
            _loc11_ = frames[_loc13_ + -1];
            _loc9_ = frames[_loc13_];
            _loc10_ = getCurvePercent(_loc13_ / 3 - 1,1 - (param3 - _loc9_) / (frames[_loc13_ + -3] - _loc9_));
            _loc8_ = _loc8_ + (frames[_loc13_ + 1] - _loc8_) * _loc10_;
            _loc11_ = _loc11_ + (frames[_loc13_ + 2] - _loc11_) * _loc10_;
         }
         if(param6)
         {
            _loc12_.rotateMix = _loc12_.data.rotateMix + (_loc8_ - _loc12_.data.rotateMix) * param5;
            _loc12_.translateMix = _loc12_.data.translateMix + (_loc11_ - _loc12_.data.translateMix) * param5;
         }
         else
         {
            _loc12_.rotateMix = _loc12_.rotateMix + (_loc8_ - _loc12_.rotateMix) * param5;
            _loc12_.translateMix = _loc12_.translateMix + (_loc11_ - _loc12_.translateMix) * param5;
         }
      }
   }
}
