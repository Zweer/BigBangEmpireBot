package spine
{
   public class TransformConstraint implements Constraint
   {
       
      
      var _data:TransformConstraintData;
      
      var _bones:Vector.<Bone>;
      
      public var target:Bone;
      
      public var rotateMix:Number;
      
      public var translateMix:Number;
      
      public var scaleMix:Number;
      
      public var shearMix:Number;
      
      var _temp:Vector.<Number>;
      
      public function TransformConstraint(param1:TransformConstraintData, param2:Skeleton)
      {
         _temp = new Vector.<Number>(2);
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
         rotateMix = param1.rotateMix;
         translateMix = param1.translateMix;
         scaleMix = param1.scaleMix;
         shearMix = param1.shearMix;
         _bones = new Vector.<Bone>();
         var _loc5_:int = 0;
         var _loc4_:* = param1.bones;
         for each(var _loc3_ in param1.bones)
         {
            _bones.push(param2.findBone(_loc3_.name));
         }
         target = param2.findBone(param1.target._name);
      }
      
      public function apply() : void
      {
         update();
      }
      
      public function update() : void
      {
         var _loc15_:int = 0;
         var _loc19_:int = 0;
         var _loc16_:* = null;
         var _loc6_:Boolean = false;
         var _loc9_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc1_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:Number = this.rotateMix;
         var _loc8_:Number = this.translateMix;
         var _loc14_:Number = this.scaleMix;
         var _loc20_:Number = this.shearMix;
         var _loc21_:Bone = this.target;
         var _loc17_:Number = _loc21_.a;
         var _loc18_:Number = _loc21_.b;
         var _loc22_:Number = _loc21_.c;
         var _loc23_:Number = _loc21_.d;
         var _loc4_:Number = _loc17_ * _loc23_ - _loc18_ * _loc22_ > 0?MathUtils.degRad:Number(-MathUtils.degRad);
         var _loc11_:Number = data.offsetRotation * _loc4_;
         var _loc3_:Number = data.offsetShearY * _loc4_;
         var _loc26_:Vector.<Bone> = this._bones;
         _loc15_ = 0;
         _loc19_ = _loc26_.length;
         while(_loc15_ < _loc19_)
         {
            _loc16_ = _loc26_[_loc15_];
            _loc6_ = false;
            if(_loc2_ != 0)
            {
               _loc9_ = _loc16_.a;
               var _loc10_:Number = _loc16_.b;
               var _loc12_:Number = _loc16_.c;
               var _loc13_:Number = _loc16_.d;
               _loc24_ = Math.atan2(_loc22_,_loc17_) - Math.atan2(_loc12_,_loc9_) + _loc11_;
               if(_loc24_ > 3.14159265358979)
               {
                  _loc24_ = _loc24_ - 3.14159265358979 * 2;
               }
               else if(_loc24_ < -3.14159265358979)
               {
                  _loc24_ = _loc24_ + 3.14159265358979 * 2;
               }
               _loc24_ = _loc24_ * _loc2_;
               _loc1_ = Math.cos(_loc24_);
               var _loc7_:Number = Math.sin(_loc24_);
               _loc16_._a = _loc1_ * _loc9_ - _loc7_ * _loc12_;
               _loc16_._b = _loc1_ * _loc10_ - _loc7_ * _loc13_;
               _loc16_._c = _loc7_ * _loc9_ + _loc1_ * _loc12_;
               _loc16_._d = _loc7_ * _loc10_ + _loc1_ * _loc13_;
               _loc6_ = true;
            }
            if(_loc8_ != 0)
            {
               _temp[0] = data.offsetX;
               _temp[1] = data.offsetY;
               _loc21_.localToWorld(_temp);
               _loc16_._worldX = _loc16_._worldX + (_temp[0] - _loc16_.worldX) * _loc8_;
               _loc16_._worldY = _loc16_._worldY + (_temp[1] - _loc16_.worldY) * _loc8_;
               _loc6_ = true;
            }
            if(_loc14_ > 0)
            {
               _loc25_ = Math.sqrt(_loc16_.a * _loc16_.a + _loc16_.c * _loc16_.c);
               _loc27_ = Math.sqrt(_loc17_ * _loc17_ + _loc22_ * _loc22_);
               if(_loc25_ > 0.00001)
               {
                  _loc25_ = (_loc25_ + (_loc27_ - _loc25_ + data.offsetScaleX) * _loc14_) / _loc25_;
               }
               _loc16_._a = _loc16_._a * _loc25_;
               _loc16_._c = _loc16_._c * _loc25_;
               _loc25_ = Math.sqrt(_loc16_.b * _loc16_.b + _loc16_.d * _loc16_.d);
               _loc27_ = Math.sqrt(_loc18_ * _loc18_ + _loc23_ * _loc23_);
               if(_loc25_ > 0.00001)
               {
                  _loc25_ = (_loc25_ + (_loc27_ - _loc25_ + data.offsetScaleY) * _loc14_) / _loc25_;
               }
               _loc16_._b = _loc16_._b * _loc25_;
               _loc16_._d = _loc16_._d * _loc25_;
               _loc6_ = true;
            }
            if(_loc20_ > 0)
            {
               _loc10_ = _loc16_.b;
               _loc13_ = _loc16_.d;
               _loc16_.d;
               _loc5_ = Math.atan2(_loc13_,_loc10_);
               _loc24_ = Math.atan2(_loc23_,_loc18_) - Math.atan2(_loc22_,_loc17_) - (_loc5_ - Math.atan2(_loc16_.c,_loc16_.a));
               if(_loc24_ > 3.14159265358979)
               {
                  _loc24_ = _loc24_ - 3.14159265358979 * 2;
               }
               else if(_loc24_ < -3.14159265358979)
               {
                  _loc24_ = _loc24_ + 3.14159265358979 * 2;
               }
               _loc24_ = _loc5_ + (_loc24_ + _loc3_) * _loc20_;
               _loc25_ = Math.sqrt(_loc10_ * _loc10_ + _loc13_ * _loc13_);
               _loc16_._b = Math.cos(_loc24_) * _loc25_;
               _loc16_._d = Math.sin(_loc24_) * _loc25_;
               _loc6_ = true;
            }
            if(_loc6_)
            {
               _loc16_.appliedValid = false;
            }
            _loc15_++;
         }
      }
      
      public function getOrder() : Number
      {
         return _data.order;
      }
      
      public function get data() : TransformConstraintData
      {
         return _data;
      }
      
      public function get bones() : Vector.<Bone>
      {
         return _bones;
      }
      
      public function toString() : String
      {
         return _data._name;
      }
   }
}
