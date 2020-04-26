package spine.animation
{
   import spine.Bone;
   import spine.Event;
   import spine.MathUtils;
   import spine.Skeleton;
   
   public class ScaleTimeline extends TranslateTimeline
   {
       
      
      public function ScaleTimeline(param1:int)
      {
         super(param1);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.scale.ordinal << 24) + boneIndex;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc15_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc16_:int = 0;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Vector.<Number> = this.frames;
         var _loc10_:Bone = param1.bones[boneIndex];
         if(param3 < _loc8_[0])
         {
            if(param6)
            {
               _loc10_.scaleX = _loc10_.data.scaleX;
               _loc10_.scaleY = _loc10_.data.scaleY;
            }
            return;
         }
         if(param3 >= _loc8_[_loc8_.length - 3])
         {
            _loc14_ = _loc8_[_loc8_.length + -2] * _loc10_.data.scaleX;
            _loc15_ = _loc8_[_loc8_.length + -1] * _loc10_.data.scaleY;
         }
         else
         {
            _loc16_ = Animation.binarySearch(_loc8_,param3,3);
            _loc14_ = _loc8_[_loc16_ + -2];
            _loc15_ = _loc8_[_loc16_ + -1];
            _loc9_ = _loc8_[_loc16_];
            _loc11_ = getCurvePercent(_loc16_ / 3 - 1,1 - (param3 - _loc9_) / (_loc8_[_loc16_ + -3] - _loc9_));
            _loc14_ = (_loc14_ + (_loc8_[_loc16_ + 1] - _loc14_) * _loc11_) * _loc10_.data.scaleX;
            _loc15_ = (_loc15_ + (_loc8_[_loc16_ + 2] - _loc15_) * _loc11_) * _loc10_.data.scaleY;
         }
         if(param5 == 1)
         {
            _loc10_.scaleX = _loc14_;
            _loc10_.scaleY = _loc15_;
         }
         else
         {
            if(param6)
            {
               _loc12_ = _loc10_.data.scaleX;
               _loc13_ = _loc10_.data.scaleY;
            }
            else
            {
               _loc12_ = _loc10_.scaleX;
               _loc13_ = _loc10_.scaleY;
            }
            if(param7)
            {
               _loc14_ = Math.abs(_loc14_) * MathUtils.signum(_loc12_);
               _loc15_ = Math.abs(_loc15_) * MathUtils.signum(_loc13_);
            }
            else
            {
               _loc12_ = Math.abs(_loc12_) * MathUtils.signum(_loc14_);
               _loc13_ = Math.abs(_loc13_) * MathUtils.signum(_loc15_);
            }
            _loc10_.scaleX = _loc12_ + (_loc14_ - _loc12_) * param5;
            _loc10_.scaleY = _loc13_ + (_loc15_ - _loc13_) * param5;
         }
      }
   }
}
