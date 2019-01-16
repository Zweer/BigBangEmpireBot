package spine.animation
{
   import spine.Bone;
   import spine.Event;
   import spine.Skeleton;
   
   public class ShearTimeline extends TranslateTimeline
   {
       
      
      public function ShearTimeline(param1:int)
      {
         super(param1);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.shear.ordinal << 24) + boneIndex;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc13_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc14_:int = 0;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc8_:Vector.<Number> = this.frames;
         var _loc10_:Bone = param1.bones[boneIndex];
         if(param3 < _loc8_[0])
         {
            if(param6)
            {
               _loc10_.shearX = _loc10_.data.shearX;
               _loc10_.shearY = _loc10_.data.shearY;
            }
            return;
         }
         if(param3 >= _loc8_[_loc8_.length - 3])
         {
            _loc12_ = _loc8_[_loc8_.length + -2];
            _loc13_ = _loc8_[_loc8_.length + -1];
         }
         else
         {
            _loc14_ = Animation.binarySearch(_loc8_,param3,3);
            _loc12_ = _loc8_[_loc14_ + -2];
            _loc13_ = _loc8_[_loc14_ + -1];
            _loc9_ = _loc8_[_loc14_];
            _loc11_ = getCurvePercent(_loc14_ / 3 - 1,1 - (param3 - _loc9_) / (_loc8_[_loc14_ + -3] - _loc9_));
            _loc12_ = _loc12_ + (_loc8_[_loc14_ + 1] - _loc12_) * _loc11_;
            _loc13_ = _loc13_ + (_loc8_[_loc14_ + 2] - _loc13_) * _loc11_;
         }
         if(param6)
         {
            _loc10_.shearX = _loc10_.data.shearX + _loc12_ * param5;
            _loc10_.shearY = _loc10_.data.shearY + _loc13_ * param5;
         }
         else
         {
            _loc10_.shearX = _loc10_.shearX + (_loc10_.data.shearX + _loc12_ - _loc10_.shearX) * param5;
            _loc10_.shearY = _loc10_.shearY + (_loc10_.data.shearY + _loc13_ - _loc10_.shearY) * param5;
         }
      }
   }
}
