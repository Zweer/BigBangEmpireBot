package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   import spine.TransformConstraint;
   import spine.TransformConstraintData;
   
   public class TransformConstraintTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 5;
      
      static const PREV_TIME:int = -5;
      
      static const PREV_ROTATE:int = -4;
      
      static const PREV_TRANSLATE:int = -3;
      
      static const PREV_SCALE:int = -2;
      
      static const PREV_SHEAR:int = -1;
      
      static const ROTATE:int = 1;
      
      static const TRANSLATE:int = 2;
      
      static const SCALE:int = 3;
      
      static const SHEAR:int = 4;
       
      
      public var transformConstraintIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function TransformConstraintTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 5,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.transformConstraint.ordinal << 24) + transformConstraintIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         param1 = param1 * 5;
         frames[param1] = param2;
         frames[param1 + 1] = param3;
         frames[param1 + 2] = param4;
         frames[param1 + 3] = param5;
         frames[param1 + 4] = param6;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc16_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc14_:int = 0;
         var _loc18_:int = 0;
         var _loc12_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc9_:Vector.<Number> = this.frames;
         var _loc17_:TransformConstraint = param1.transformConstraints[transformConstraintIndex];
         if(param3 < _loc9_[0])
         {
            if(param6)
            {
               _loc10_ = _loc17_.data;
               _loc17_.rotateMix = _loc17_.data.rotateMix;
               _loc17_.translateMix = _loc17_.data.translateMix;
               _loc17_.scaleMix = _loc17_.data.scaleMix;
               _loc17_.shearMix = _loc17_.data.shearMix;
            }
            return;
         }
         if(param3 >= _loc9_[_loc9_.length - 5])
         {
            _loc14_ = _loc9_.length;
            _loc8_ = _loc9_[_loc14_ + -4];
            _loc16_ = _loc9_[_loc14_ + -3];
            _loc13_ = _loc9_[_loc14_ + -2];
            _loc11_ = _loc9_[_loc14_ + -1];
         }
         else
         {
            _loc18_ = Animation.binarySearch(_loc9_,param3,5);
            _loc8_ = _loc9_[_loc18_ + -4];
            _loc16_ = _loc9_[_loc18_ + -3];
            _loc13_ = _loc9_[_loc18_ + -2];
            _loc11_ = _loc9_[_loc18_ + -1];
            _loc12_ = _loc9_[_loc18_];
            _loc15_ = getCurvePercent(_loc18_ / 5 - 1,1 - (param3 - _loc12_) / (_loc9_[_loc18_ + -5] - _loc12_));
            _loc8_ = _loc8_ + (_loc9_[_loc18_ + 1] - _loc8_) * _loc15_;
            _loc16_ = _loc16_ + (_loc9_[_loc18_ + 2] - _loc16_) * _loc15_;
            _loc13_ = _loc13_ + (_loc9_[_loc18_ + 3] - _loc13_) * _loc15_;
            _loc11_ = _loc11_ + (_loc9_[_loc18_ + 4] - _loc11_) * _loc15_;
         }
         if(param6)
         {
            _loc10_ = _loc17_.data;
            _loc17_.rotateMix = _loc10_.rotateMix + (_loc8_ - _loc10_.rotateMix) * param5;
            _loc17_.translateMix = _loc10_.translateMix + (_loc16_ - _loc10_.translateMix) * param5;
            _loc17_.scaleMix = _loc10_.scaleMix + (_loc13_ - _loc10_.scaleMix) * param5;
            _loc17_.shearMix = _loc10_.shearMix + (_loc11_ - _loc10_.shearMix) * param5;
         }
         else
         {
            _loc17_.rotateMix = _loc17_.rotateMix + (_loc8_ - _loc17_.rotateMix) * param5;
            _loc17_.translateMix = _loc17_.translateMix + (_loc16_ - _loc17_.translateMix) * param5;
            _loc17_.scaleMix = _loc17_.scaleMix + (_loc13_ - _loc17_.scaleMix) * param5;
            _loc17_.shearMix = _loc17_.shearMix + (_loc11_ - _loc17_.shearMix) * param5;
         }
      }
   }
}
