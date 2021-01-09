package spine.animation
{
   import spine.Bone;
   import spine.Event;
   import spine.Skeleton;
   
   public class RotateTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 2;
      
      public static const PREV_TIME:int = -2;
      
      public static const PREV_ROTATION:int = -1;
      
      public static const ROTATION:int = 1;
       
      
      public var boneIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function RotateTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 2,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.rotate.ordinal << 24) + boneIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number) : void
      {
         param1 = param1 << 1;
         frames[param1] = param2;
         frames[int(param1 + 1)] = param3;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc12_:Number = NaN;
         var _loc8_:Vector.<Number> = this.frames;
         var _loc10_:Bone = param1.bones[boneIndex];
         if(param3 < _loc8_[0])
         {
            if(param6)
            {
               _loc10_.rotation = _loc10_.data.rotation;
            }
            return;
         }
         if(param3 >= _loc8_[_loc8_.length - 2])
         {
            if(param6)
            {
               _loc10_.rotation = _loc10_.data.rotation + _loc8_[_loc8_.length + -1] * param5;
            }
            else
            {
               _loc12_ = _loc10_.data.rotation + _loc8_[_loc8_.length + -1] - _loc10_.rotation;
               _loc12_ = _loc12_ - (16384 - (int(16384.5 - _loc12_ / 360))) * 360;
               _loc10_.rotation = _loc10_.rotation + _loc12_ * param5;
            }
            return;
         }
         var _loc14_:int = Animation.binarySearch(_loc8_,param3,2);
         var _loc13_:Number = _loc8_[_loc14_ + -1];
         var _loc9_:Number = _loc8_[_loc14_];
         var _loc11_:Number = getCurvePercent((_loc14_ >> 1) - 1,1 - (param3 - _loc9_) / (_loc8_[_loc14_ + -2] - _loc9_));
         _loc12_ = _loc8_[_loc14_ + 1] - _loc13_;
         _loc12_ = _loc12_ - (16384 - (int(16384.5 - _loc12_ / 360))) * 360;
         _loc12_ = _loc13_ + _loc12_ * _loc11_;
         if(param6)
         {
            _loc12_ = _loc12_ - (16384 - (int(16384.5 - _loc12_ / 360))) * 360;
            _loc10_.rotation = _loc10_.data.rotation + _loc12_ * param5;
         }
         else
         {
            _loc12_ = _loc10_.data.rotation + _loc12_ - _loc10_.rotation;
            _loc12_ = _loc12_ - (16384 - (int(16384.5 - _loc12_ / 360))) * 360;
            _loc10_.rotation = _loc10_.rotation + _loc12_ * param5;
         }
      }
   }
}
