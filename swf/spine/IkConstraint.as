package spine
{
   public class IkConstraint implements Constraint
   {
       
      
      var _data:IkConstraintData;
      
      public var bones:Vector.<Bone>;
      
      public var target:Bone;
      
      public var mix:Number;
      
      public var bendDirection:int;
      
      public function IkConstraint(param1:IkConstraintData, param2:Skeleton)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("data cannot be null.");
         }
         if(param2 == null)
         {
            throw new ArgumentError("skeleton cannot be null.");
         }
         _data = param1;
         mix = param1.mix;
         bendDirection = param1.bendDirection;
         bones = new Vector.<Bone>();
         var _loc5_:int = 0;
         var _loc4_:* = param1.bones;
         for each(var _loc3_ in param1.bones)
         {
            bones[bones.length] = param2.findBone(_loc3_.name);
         }
         target = param2.findBone(param1.target._name);
      }
      
      public static function apply1(param1:Bone, param2:Number, param3:Number, param4:Number) : void
      {
         if(!param1.appliedValid)
         {
            param1.updateAppliedTransform();
         }
         var _loc5_:Bone = param1.parent;
         var _loc11_:Number = 1 / (_loc5_.a * _loc5_.d - _loc5_.b * _loc5_.c);
         var _loc9_:Number = param2 - _loc5_.worldX;
         var _loc10_:Number = param3 - _loc5_.worldY;
         var _loc7_:Number = (_loc9_ * _loc5_.d - _loc10_ * _loc5_.b) * _loc11_ - param1.ax;
         var _loc8_:Number = (_loc10_ * _loc5_.a - _loc9_ * _loc5_.c) * _loc11_ - param1.ay;
         var _loc6_:Number = Math.atan2(_loc8_,_loc7_) * MathUtils.radDeg - param1.ashearX - param1.arotation;
         if(param1.ascaleX < 0)
         {
            _loc6_ = _loc6_ + 180;
         }
         if(_loc6_ > 180)
         {
            _loc6_ = _loc6_ - 360;
         }
         else if(_loc6_ < -180)
         {
            _loc6_ = _loc6_ + 360;
         }
         param1.updateWorldTransformWith(param1.ax,param1.ay,param1.arotation + _loc6_ * param4,param1.ascaleX,param1.ascaleY,param1.ashearX,param1.ashearY);
      }
      
      public static function apply2(param1:Bone, param2:Bone, param3:Number, param4:Number, param5:int, param6:Number) : void
      {
         var _loc30_:int = 0;
         var _loc20_:int = 0;
         var _loc29_:int = 0;
         var _loc52_:* = NaN;
         var _loc11_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc13_:* = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc56_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc42_:* = NaN;
         var _loc40_:* = NaN;
         var _loc33_:Number = NaN;
         if(param6 == 0)
         {
            param2.updateWorldTransform();
            return;
         }
         if(!param1.appliedValid)
         {
            param1.updateAppliedTransform();
         }
         if(!param2.appliedValid)
         {
            param2.updateAppliedTransform();
         }
         var _loc14_:Number = param1.ax;
         var _loc15_:Number = param1.ay;
         var _loc31_:Number = param1.ascaleX;
         var _loc32_:Number = param1.ascaleY;
         var _loc16_:Number = param2.ascaleX;
         if(_loc31_ < 0)
         {
            _loc31_ = -_loc31_;
            _loc29_ = 180;
            _loc20_ = -1;
         }
         else
         {
            _loc29_ = 0;
            _loc20_ = 1;
         }
         if(_loc32_ < 0)
         {
            _loc32_ = -_loc32_;
            _loc20_ = -_loc20_;
         }
         if(_loc16_ < 0)
         {
            _loc16_ = -_loc16_;
            _loc30_ = 180;
         }
         else
         {
            _loc30_ = 0;
         }
         var _loc49_:Number = param2.ax;
         var _loc34_:Number = param1.a;
         var _loc35_:Number = param1.b;
         var _loc37_:Number = param1.c;
         var _loc38_:Number = param1.d;
         var _loc50_:* = Math.abs(_loc31_ - _loc32_) <= 0.0001;
         if(!_loc50_)
         {
            _loc52_ = 0;
            _loc11_ = _loc34_ * _loc49_ + param1.worldX;
            _loc9_ = _loc37_ * _loc49_ + param1.worldY;
         }
         else
         {
            _loc52_ = Number(param2.ay);
            _loc11_ = _loc34_ * _loc49_ + _loc35_ * _loc52_ + param1.worldX;
            _loc9_ = _loc37_ * _loc49_ + _loc38_ * _loc52_ + param1.worldY;
         }
         var _loc7_:Bone = param1.parent;
         _loc34_ = _loc7_.a;
         _loc35_ = _loc7_.b;
         _loc37_ = _loc7_.c;
         _loc38_ = _loc7_.d;
         var _loc19_:Number = 1 / (_loc34_ * _loc38_ - _loc35_ * _loc37_);
         var _loc53_:Number = param3 - _loc7_.worldX;
         var _loc54_:Number = param4 - _loc7_.worldY;
         var _loc10_:Number = (_loc53_ * _loc38_ - _loc54_ * _loc35_) * _loc19_ - _loc14_;
         var _loc12_:Number = (_loc54_ * _loc34_ - _loc53_ * _loc37_) * _loc19_ - _loc15_;
         _loc53_ = _loc11_ - _loc7_.worldX;
         _loc54_ = _loc9_ - _loc7_.worldY;
         var _loc17_:Number = (_loc53_ * _loc38_ - _loc54_ * _loc35_) * _loc19_ - _loc14_;
         var _loc18_:Number = (_loc54_ * _loc34_ - _loc53_ * _loc37_) * _loc19_ - _loc15_;
         var _loc25_:Number = Math.sqrt(_loc17_ * _loc17_ + _loc18_ * _loc18_);
         var _loc26_:Number = param2.data.length * _loc16_;
         if(_loc50_)
         {
            _loc26_ = _loc26_ * _loc31_;
            _loc13_ = Number((_loc10_ * _loc10_ + _loc12_ * _loc12_ - _loc25_ * _loc25_ - _loc26_ * _loc26_) / (2 * _loc25_ * _loc26_));
            if(_loc13_ < -1)
            {
               _loc13_ = -1;
            }
            else if(_loc13_ > 1)
            {
               _loc13_ = 1;
            }
            _loc45_ = Math.acos(_loc13_) * param5;
            _loc34_ = _loc25_ + _loc26_ * _loc13_;
            _loc35_ = _loc26_ * Math.sin(_loc45_);
            _loc44_ = Math.atan2(_loc12_ * _loc34_ - _loc10_ * _loc35_,_loc10_ * _loc34_ + _loc12_ * _loc35_);
         }
         else
         {
            _loc34_ = _loc31_ * _loc26_;
            _loc35_ = _loc32_ * _loc26_;
            _loc21_ = _loc34_ * _loc34_;
            var _loc24_:Number = _loc35_ * _loc35_;
            var _loc8_:Number = _loc10_ * _loc10_ + _loc12_ * _loc12_;
            var _loc43_:Number = Math.atan2(_loc12_,_loc10_);
            _loc37_ = _loc24_ * _loc25_ * _loc25_ + _loc21_ * _loc8_ - _loc21_ * _loc24_;
            _loc22_ = -2 * _loc24_ * _loc25_;
            var _loc23_:Number = _loc24_ - _loc21_;
            _loc38_ = _loc22_ * _loc22_ - 4 * _loc23_ * _loc37_;
            if(_loc38_ >= 0)
            {
               _loc46_ = Math.sqrt(_loc38_);
               if(_loc22_ < 0)
               {
                  _loc46_ = -_loc46_;
               }
               _loc46_ = -(_loc22_ + _loc46_) / 2;
               _loc56_ = _loc46_ / _loc23_;
               var _loc57_:Number = _loc37_ / _loc46_;
               _loc47_ = Math.abs(_loc56_) < Math.abs(_loc57_)?_loc56_:Number(_loc57_);
               if(_loc47_ * _loc47_ <= _loc8_)
               {
                  _loc54_ = Math.sqrt(_loc8_ - _loc47_ * _loc47_) * param5;
                  _loc44_ = _loc43_ - Math.atan2(_loc54_,_loc47_);
                  _loc45_ = Math.atan2(_loc54_ / _loc32_,(_loc47_ - _loc25_) / _loc31_);
               }
            }
            _loc42_ = 0;
            var _loc55_:* = 1.79769313486232e308;
            var _loc51_:* = 0;
            var _loc48_:* = 0;
            _loc40_ = 0;
            var _loc36_:* = 0;
            var _loc28_:* = 0;
            var _loc27_:* = 0;
            _loc53_ = _loc25_ + _loc34_;
            _loc38_ = _loc53_ * _loc53_;
            if(_loc38_ > _loc36_)
            {
               _loc40_ = 0;
               _loc36_ = _loc38_;
               _loc28_ = _loc53_;
            }
            _loc53_ = _loc25_ - _loc34_;
            _loc38_ = _loc53_ * _loc53_;
            if(_loc38_ < _loc55_)
            {
               _loc42_ = 3.14159265358979;
               _loc55_ = _loc38_;
               _loc51_ = _loc53_;
            }
            _loc33_ = Math.acos(-_loc34_ * _loc25_ / (_loc21_ - _loc24_));
            _loc53_ = _loc34_ * Math.cos(_loc33_) + _loc25_;
            _loc54_ = _loc35_ * Math.sin(_loc33_);
            _loc38_ = _loc53_ * _loc53_ + _loc54_ * _loc54_;
            if(_loc38_ < _loc55_)
            {
               _loc42_ = _loc33_;
               _loc55_ = _loc38_;
               _loc51_ = _loc53_;
               _loc48_ = _loc54_;
            }
            if(_loc38_ > _loc36_)
            {
               _loc40_ = _loc33_;
               _loc36_ = _loc38_;
               _loc28_ = _loc53_;
               _loc27_ = _loc54_;
            }
            if(_loc8_ <= (_loc55_ + _loc36_) / 2)
            {
               _loc44_ = _loc43_ - Math.atan2(_loc48_ * param5,_loc51_);
               _loc45_ = _loc42_ * param5;
            }
            else
            {
               _loc44_ = _loc43_ - Math.atan2(_loc27_ * param5,_loc28_);
               _loc45_ = _loc40_ * param5;
            }
         }
         var _loc39_:Number = Math.atan2(_loc52_,_loc49_) * _loc20_;
         var _loc41_:Number = param1.arotation;
         _loc44_ = (_loc44_ - _loc39_) * MathUtils.radDeg + _loc29_ - _loc41_;
         if(_loc44_ > 180)
         {
            _loc44_ = _loc44_ - 360;
         }
         else if(_loc44_ < -180)
         {
            _loc44_ = _loc44_ + 360;
         }
         param1.updateWorldTransformWith(_loc14_,_loc15_,_loc41_ + _loc44_ * param6,param1.ascaleX,param1.ascaleY,0,0);
         _loc41_ = param2.arotation;
         _loc45_ = ((_loc45_ + _loc39_) * MathUtils.radDeg - param2.ashearX) * _loc20_ + _loc30_ - _loc41_;
         if(_loc45_ > 180)
         {
            _loc45_ = _loc45_ - 360;
         }
         else if(_loc45_ < -180)
         {
            _loc45_ = _loc45_ + 360;
         }
         param2.updateWorldTransformWith(_loc49_,_loc52_,_loc41_ + _loc45_ * param6,param2.ascaleX,param2.ascaleY,param2.ashearX,param2.ashearY);
      }
      
      public function apply() : void
      {
         update();
      }
      
      public function update() : void
      {
         switch(int(bones.length) - 1)
         {
            case 0:
               apply1(bones[0],target._worldX,target._worldY,mix);
               break;
            case 1:
               apply2(bones[0],bones[1],target._worldX,target._worldY,bendDirection,mix);
         }
      }
      
      public function getOrder() : Number
      {
         return _data.order;
      }
      
      public function get data() : IkConstraintData
      {
         return _data;
      }
      
      public function toString() : String
      {
         return _data._name;
      }
   }
}
