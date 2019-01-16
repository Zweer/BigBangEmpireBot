package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   import spine.Slot;
   
   public class ColorTimeline extends CurveTimeline
   {
      
      public static const ENTRIES:int = 5;
      
      static const PREV_TIME:int = -5;
      
      static const PREV_R:int = -4;
      
      static const PREV_G:int = -3;
      
      static const PREV_B:int = -2;
      
      static const PREV_A:int = -1;
      
      static const R:int = 1;
      
      static const G:int = 2;
      
      static const B:int = 3;
      
      static const A:int = 4;
       
      
      public var slotIndex:int;
      
      public var frames:Vector.<Number>;
      
      public function ColorTimeline(param1:int)
      {
         super(param1);
         frames = new Vector.<Number>(param1 * 5,true);
      }
      
      override public function getPropertyId() : int
      {
         return (TimelineType.color.ordinal << 24) + slotIndex;
      }
      
      public function setFrame(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         param1 = param1 * 5;
         frames[param1] = param2;
         frames[int(param1 + 1)] = param3;
         frames[int(param1 + 2)] = param4;
         frames[int(param1 + 3)] = param5;
         frames[int(param1 + 4)] = param6;
      }
      
      override public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
         var _loc11_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc13_:int = 0;
         var _loc17_:int = 0;
         var _loc12_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc10_:Vector.<Number> = this.frames;
         var _loc14_:Slot = param1.slots[slotIndex];
         if(param3 < _loc10_[0])
         {
            if(param6)
            {
               _loc14_.r = _loc14_.data.r;
               _loc14_.g = _loc14_.data.g;
               _loc14_.b = _loc14_.data.b;
               _loc14_.a = _loc14_.data.a;
            }
            return;
         }
         if(param3 >= _loc10_[_loc10_.length - 5])
         {
            _loc13_ = _loc10_.length;
            _loc16_ = _loc10_[_loc13_ + -4];
            _loc11_ = _loc10_[_loc13_ + -3];
            _loc9_ = _loc10_[_loc13_ + -2];
            _loc8_ = _loc10_[_loc13_ + -1];
         }
         else
         {
            _loc17_ = Animation.binarySearch(_loc10_,param3,5);
            _loc16_ = _loc10_[_loc17_ + -4];
            _loc11_ = _loc10_[_loc17_ + -3];
            _loc9_ = _loc10_[_loc17_ + -2];
            _loc8_ = _loc10_[_loc17_ + -1];
            _loc12_ = _loc10_[_loc17_];
            _loc15_ = getCurvePercent(_loc17_ / 5 - 1,1 - (param3 - _loc12_) / (_loc10_[_loc17_ + -5] - _loc12_));
            _loc16_ = _loc16_ + (_loc10_[_loc17_ + 1] - _loc16_) * _loc15_;
            _loc11_ = _loc11_ + (_loc10_[_loc17_ + 2] - _loc11_) * _loc15_;
            _loc9_ = _loc9_ + (_loc10_[_loc17_ + 3] - _loc9_) * _loc15_;
            _loc8_ = _loc8_ + (_loc10_[_loc17_ + 4] - _loc8_) * _loc15_;
         }
         if(param5 == 1)
         {
            _loc14_.r = _loc16_;
            _loc14_.g = _loc11_;
            _loc14_.b = _loc9_;
            _loc14_.a = _loc8_;
         }
         else
         {
            if(param6)
            {
               _loc14_.r = _loc14_.data.r;
               _loc14_.g = _loc14_.data.g;
               _loc14_.b = _loc14_.data.b;
               _loc14_.a = _loc14_.data.a;
            }
            _loc14_.r = _loc14_.r + (_loc16_ - _loc14_.r) * param5;
            _loc14_.g = _loc14_.g + (_loc11_ - _loc14_.g) * param5;
            _loc14_.b = _loc14_.b + (_loc9_ - _loc14_.b) * param5;
            _loc14_.a = _loc14_.a + (_loc8_ - _loc14_.a) * param5;
         }
      }
   }
}
