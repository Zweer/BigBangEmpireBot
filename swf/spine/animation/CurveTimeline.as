package spine.animation
{
   import spine.Event;
   import spine.MathUtils;
   import spine.Skeleton;
   
   public class CurveTimeline implements Timeline
   {
      
      private static const LINEAR:Number = 0;
      
      private static const STEPPED:Number = 1;
      
      private static const BEZIER:Number = 2;
      
      private static const BEZIER_SIZE:int = 19;
       
      
      private var curves:Vector.<Number>;
      
      public function CurveTimeline(param1:int)
      {
         super();
         curves = new Vector.<Number>((param1 - 1) * 19,true);
      }
      
      public function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void
      {
      }
      
      public function getPropertyId() : int
      {
         return 0;
      }
      
      public function get frameCount() : int
      {
         return curves.length / 19 + 1;
      }
      
      public function setLinear(param1:int) : void
      {
         curves[int(param1 * 19)] = 0;
      }
      
      public function setStepped(param1:int) : void
      {
         curves[int(param1 * 19)] = 1;
      }
      
      public function setCurve(param1:int, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc9_:int = 0;
         var _loc13_:Number = (-param2 * 2 + param4) * 0.03;
         var _loc11_:Number = (-param3 * 2 + param5) * 0.03;
         var _loc6_:Number = ((param2 - param4) * 3 + 1) * 0.006;
         var _loc7_:Number = ((param3 - param5) * 3 + 1) * 0.006;
         var _loc17_:Number = _loc13_ * 2 + _loc6_;
         var _loc18_:Number = _loc11_ * 2 + _loc7_;
         var _loc14_:Number = param2 * 0.3 + _loc13_ + _loc6_ * 0.16666667;
         var _loc12_:Number = param3 * 0.3 + _loc11_ + _loc7_ * 0.16666667;
         var _loc8_:int = param1 * 19;
         var _loc10_:Vector.<Number> = this.curves;
         _loc8_++;
         _loc10_[int(_loc8_)] = 2;
         var _loc15_:* = _loc14_;
         var _loc16_:* = _loc12_;
         _loc9_ = _loc8_ + 19 - 1;
         while(_loc8_ < _loc9_)
         {
            _loc10_[_loc8_] = _loc15_;
            _loc10_[int(_loc8_ + 1)] = _loc16_;
            _loc14_ = _loc14_ + _loc17_;
            _loc12_ = _loc12_ + _loc18_;
            _loc17_ = _loc17_ + _loc6_;
            _loc18_ = _loc18_ + _loc7_;
            _loc15_ = Number(_loc15_ + _loc14_);
            _loc16_ = Number(_loc16_ + _loc12_);
            _loc8_ = _loc8_ + 2;
         }
      }
      
      public function getCurvePercent(param1:int, param2:Number) : Number
      {
         var _loc5_:* = 0;
         var _loc11_:int = 0;
         var _loc7_:* = NaN;
         var _loc9_:* = NaN;
         param2 = MathUtils.clamp(param2,0,1);
         var _loc3_:Vector.<Number> = this.curves;
         var _loc6_:int = param1 * 19;
         var _loc10_:Number = _loc3_[_loc6_];
         if(_loc10_ == 0)
         {
            return param2;
         }
         if(_loc10_ == 1)
         {
            return 0;
         }
         _loc6_++;
         var _loc4_:* = 0;
         _loc5_ = _loc6_;
         _loc11_ = _loc6_ + 19 - 1;
         while(_loc6_ < _loc11_)
         {
            _loc4_ = Number(_loc3_[_loc6_]);
            if(_loc4_ >= param2)
            {
               if(_loc6_ == _loc5_)
               {
                  _loc9_ = 0;
                  _loc7_ = 0;
               }
               else
               {
                  _loc9_ = Number(_loc3_[int(_loc6_ - 2)]);
                  _loc7_ = Number(_loc3_[int(_loc6_ - 1)]);
               }
               return _loc7_ + (_loc3_[int(_loc6_ + 1)] - _loc7_) * (param2 - _loc9_) / (_loc4_ - _loc9_);
            }
            _loc6_ = _loc6_ + 2;
         }
         var _loc8_:Number = _loc3_[int(_loc6_ - 1)];
         return _loc8_ + (1 - _loc8_) * (param2 - _loc4_) / (1 - _loc4_);
      }
   }
}
