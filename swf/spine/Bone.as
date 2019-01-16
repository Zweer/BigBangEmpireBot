package spine
{
   public class Bone implements Updatable
   {
      
      public static var yDown:Boolean;
       
      
      var _data:BoneData;
      
      var _skeleton:Skeleton;
      
      var _parent:Bone;
      
      var _children:Vector.<Bone>;
      
      public var x:Number;
      
      public var y:Number;
      
      public var rotation:Number;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      public var shearX:Number;
      
      public var shearY:Number;
      
      public var ax:Number;
      
      public var ay:Number;
      
      public var arotation:Number;
      
      public var ascaleX:Number;
      
      public var ascaleY:Number;
      
      public var ashearX:Number;
      
      public var ashearY:Number;
      
      public var appliedValid:Boolean;
      
      var _a:Number;
      
      var _b:Number;
      
      var _c:Number;
      
      var _d:Number;
      
      var _worldX:Number;
      
      var _worldY:Number;
      
      var _sorted:Boolean;
      
      public function Bone(param1:BoneData, param2:Skeleton, param3:Bone)
      {
         _children = new Vector.<Bone>();
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
         _skeleton = param2;
         _parent = param3;
         setToSetupPose();
      }
      
      public function update() : void
      {
         updateWorldTransformWith(x,y,rotation,scaleX,scaleY,shearX,shearY);
      }
      
      public function updateWorldTransform() : void
      {
         updateWorldTransformWith(x,y,rotation,scaleX,scaleY,shearX,shearY);
      }
      
      public function updateWorldTransformWith(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc12_:* = null;
         var _loc28_:* = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc18_:Number = NaN;
         ax = param1;
         ay = param2;
         arotation = param3;
         ascaleX = param4;
         ascaleY = param5;
         ashearX = param6;
         ashearY = param7;
         appliedValid = true;
         var _loc13_:* = 0;
         var _loc25_:* = 0;
         var _loc26_:* = 0;
         var _loc27_:* = 0;
         var _loc29_:* = 0;
         var _loc14_:* = 0;
         var _loc9_:* = 0;
         var _loc22_:* = 0;
         var _loc8_:Bone = _parent;
         if(!_loc8_)
         {
            _loc13_ = Number(param3 + 90 + param7);
            _loc25_ = Number(MathUtils.cosDeg(param3 + param6) * param4);
            _loc26_ = Number(MathUtils.cosDeg(_loc13_) * param5);
            _loc27_ = Number(MathUtils.sinDeg(param3 + param6) * param4);
            _loc29_ = Number(MathUtils.sinDeg(_loc13_) * param5);
            _loc12_ = _skeleton;
            if(_loc12_.flipX)
            {
               param1 = -param1;
               _loc25_ = Number(-_loc25_);
               _loc26_ = Number(-_loc26_);
            }
            if(_loc12_.flipY != yDown)
            {
               param2 = -param2;
               _loc27_ = Number(-_loc27_);
               _loc29_ = Number(-_loc29_);
            }
            _a = _loc25_;
            _b = _loc26_;
            _c = _loc27_;
            _d = _loc29_;
            _worldX = param1 + _loc12_.x;
            _worldY = param2 + _loc12_.y;
            return;
         }
         var _loc19_:* = Number(_loc8_._a);
         var _loc20_:Number = _loc8_._b;
         var _loc23_:* = Number(_loc8_._c);
         var _loc24_:Number = _loc8_._d;
         _worldX = _loc19_ * param1 + _loc20_ * param2 + _loc8_._worldX;
         _worldY = _loc23_ * param1 + _loc24_ * param2 + _loc8_._worldY;
         var _loc30_:* = _data.transformMode;
         switch(_loc30_)
         {
            case TransformMode.normal:
               _loc13_ = Number(param3 + 90 + param7);
               _loc25_ = Number(MathUtils.cosDeg(param3 + param6) * param4);
               _loc26_ = Number(MathUtils.cosDeg(_loc13_) * param5);
               _loc27_ = Number(MathUtils.sinDeg(param3 + param6) * param4);
               _loc29_ = Number(MathUtils.sinDeg(_loc13_) * param5);
               _a = _loc19_ * _loc25_ + _loc20_ * _loc27_;
               _b = _loc19_ * _loc26_ + _loc20_ * _loc29_;
               _c = _loc23_ * _loc25_ + _loc24_ * _loc27_;
               _d = _loc23_ * _loc26_ + _loc24_ * _loc29_;
               return;
            case TransformMode.onlyTranslation:
               _loc13_ = Number(param3 + 90 + param7);
               _a = MathUtils.cosDeg(param3 + param6) * param4;
               _b = MathUtils.cosDeg(_loc13_) * param5;
               _c = MathUtils.sinDeg(param3 + param6) * param4;
               _d = MathUtils.sinDeg(_loc13_) * param5;
            case TransformMode.noRotationOrReflection:
               _loc22_ = Number(_loc19_ * _loc19_ + _loc23_ * _loc23_);
               _loc28_ = 0;
               if(_loc22_ > 0.0001)
               {
                  _loc22_ = Number(Math.abs(_loc19_ * _loc24_ - _loc20_ * _loc23_) / _loc22_);
                  _loc20_ = _loc23_ * _loc22_;
                  _loc24_ = _loc19_ * _loc22_;
                  _loc28_ = Number(Math.atan2(_loc23_,_loc19_) * MathUtils.radDeg);
               }
               else
               {
                  _loc19_ = 0;
                  _loc23_ = 0;
                  _loc28_ = Number(90 - Math.atan2(_loc24_,_loc20_) * MathUtils.radDeg);
               }
               _loc10_ = param3 + param6 - _loc28_;
               _loc11_ = param3 + param7 - _loc28_ + 90;
               _loc25_ = Number(MathUtils.cosDeg(_loc10_) * param4);
               _loc26_ = Number(MathUtils.cosDeg(_loc11_) * param5);
               _loc27_ = Number(MathUtils.sinDeg(_loc10_) * param4);
               _loc29_ = Number(MathUtils.sinDeg(_loc11_) * param5);
               _a = _loc19_ * _loc25_ - _loc20_ * _loc27_;
               _b = _loc19_ * _loc26_ - _loc20_ * _loc29_;
               _c = _loc23_ * _loc25_ + _loc24_ * _loc27_;
               _d = _loc23_ * _loc26_ + _loc24_ * _loc29_;
            default:
               if(_skeleton.flipX)
               {
                  _a = -_a;
                  _b = -_b;
               }
               if(_skeleton.flipY != yDown)
               {
                  _c = -_c;
                  _d = -_d;
               }
               return;
            case TransformMode.noScale:
            case TransformMode.noScaleOrReflection:
               _loc9_ = Number(MathUtils.cosDeg(param3));
               _loc14_ = Number(MathUtils.sinDeg(param3));
               _loc15_ = _loc19_ * _loc9_ + _loc20_ * _loc14_;
               _loc17_ = _loc23_ * _loc9_ + _loc24_ * _loc14_;
               _loc22_ = Number(Math.sqrt(_loc15_ * _loc15_ + _loc17_ * _loc17_));
               if(_loc22_ > 0.00001)
               {
                  _loc22_ = Number(1 / _loc22_);
               }
               _loc15_ = _loc15_ * _loc22_;
               _loc17_ = _loc17_ * _loc22_;
               _loc22_ = Number(Math.sqrt(_loc15_ * _loc15_ + _loc17_ * _loc17_));
               _loc21_ = 3.14159265358979 / 2 + Math.atan2(_loc17_,_loc15_);
               _loc16_ = Math.cos(_loc21_) * _loc22_;
               _loc18_ = Math.sin(_loc21_) * _loc22_;
               _loc25_ = Number(MathUtils.cosDeg(param6) * param4);
               _loc26_ = Number(MathUtils.cosDeg(90 + param7) * param5);
               _loc27_ = Number(MathUtils.sinDeg(param6) * param4);
               _loc29_ = Number(MathUtils.sinDeg(90 + param7) * param5);
               _a = _loc15_ * _loc25_ + _loc16_ * _loc27_;
               _b = _loc15_ * _loc26_ + _loc16_ * _loc29_;
               _c = _loc17_ * _loc25_ + _loc18_ * _loc27_;
               _d = _loc17_ * _loc26_ + _loc18_ * _loc29_;
               if(_data.transformMode != TransformMode.noScaleOrReflection?_loc19_ * _loc24_ - _loc20_ * _loc23_ < 0:_loc12_.flipX != _loc12_.flipY)
               {
                  _b = -_b;
                  _d = -_d;
               }
               return;
         }
      }
      
      public function setToSetupPose() : void
      {
         x = _data.x;
         y = _data.y;
         rotation = _data.rotation;
         scaleX = _data.scaleX;
         scaleY = _data.scaleY;
         shearX = _data.shearX;
         shearY = _data.shearY;
      }
      
      public function get data() : BoneData
      {
         return _data;
      }
      
      public function get skeleton() : Skeleton
      {
         return _skeleton;
      }
      
      public function get parent() : Bone
      {
         return _parent;
      }
      
      public function get children() : Vector.<Bone>
      {
         return _children;
      }
      
      public function get a() : Number
      {
         return _a;
      }
      
      public function get b() : Number
      {
         return _b;
      }
      
      public function get c() : Number
      {
         return _c;
      }
      
      public function get d() : Number
      {
         return _d;
      }
      
      public function get worldX() : Number
      {
         return _worldX;
      }
      
      public function get worldY() : Number
      {
         return _worldY;
      }
      
      public function get worldRotationX() : Number
      {
         return Math.atan2(_c,_a) * MathUtils.radDeg;
      }
      
      public function get worldRotationY() : Number
      {
         return Math.atan2(_d,_b) * MathUtils.radDeg;
      }
      
      public function get worldScaleX() : Number
      {
         return Math.sqrt(_a * _a + _c * _c);
      }
      
      public function get worldScaleY() : Number
      {
         return Math.sqrt(_b * _b + _d * _d);
      }
      
      public function worldToLocalRotationX() : Number
      {
         var _loc1_:Bone = _parent;
         if(_loc1_ == null)
         {
            return arotation;
         }
         var _loc3_:Number = _loc1_.a;
         var _loc4_:Number = _loc1_.b;
         var _loc5_:Number = _loc1_.c;
         var _loc7_:Number = _loc1_.d;
         var _loc2_:Number = this.a;
         var _loc6_:Number = this.c;
         return Math.atan2(_loc3_ * _loc6_ - _loc5_ * _loc2_,_loc7_ * _loc2_ - _loc4_ * _loc6_) * MathUtils.radDeg;
      }
      
      public function worldToLocalRotationY() : Number
      {
         var _loc1_:Bone = _parent;
         if(_loc1_ == null)
         {
            return arotation;
         }
         var _loc2_:Number = _loc1_.a;
         var _loc3_:Number = _loc1_.b;
         var _loc5_:Number = _loc1_.c;
         var _loc6_:Number = _loc1_.d;
         var _loc4_:Number = this.b;
         var _loc7_:Number = this.d;
         return Math.atan2(_loc2_ * _loc7_ - _loc5_ * _loc4_,_loc6_ * _loc4_ - _loc3_ * _loc7_) * MathUtils.radDeg;
      }
      
      public function rotateWorld(param1:Number) : void
      {
         var _loc2_:Number = this.a;
         var _loc3_:Number = this.b;
         var _loc4_:Number = this.c;
         var _loc5_:Number = this.d;
         var _loc6_:Number = MathUtils.cosDeg(param1);
         var _loc7_:Number = MathUtils.sinDeg(param1);
         this._a = _loc6_ * _loc2_ - _loc7_ * _loc4_;
         this._b = _loc6_ * _loc3_ - _loc7_ * _loc5_;
         this._c = _loc7_ * _loc2_ + _loc6_ * _loc4_;
         this._d = _loc7_ * _loc3_ + _loc6_ * _loc5_;
         this.appliedValid = false;
      }
      
      function updateAppliedTransform() : void
      {
         var _loc9_:Number = NaN;
         appliedValid = true;
         var _loc1_:Bone = this.parent;
         if(_loc1_ == null)
         {
            ax = worldX;
            ay = worldY;
            arotation = Math.atan2(c,a) * MathUtils.radDeg;
            ascaleX = Math.sqrt(a * a + c * c);
            ascaleY = Math.sqrt(b * b + d * d);
            ashearX = 0;
            ashearY = Math.atan2(a * b + c * d,a * d - b * c) * MathUtils.radDeg;
            return;
         }
         var _loc5_:Number = _loc1_.a;
         var _loc7_:Number = _loc1_.b;
         var _loc10_:Number = _loc1_.c;
         var _loc11_:Number = _loc1_.d;
         var _loc2_:Number = 1 / (_loc5_ * _loc11_ - _loc7_ * _loc10_);
         var _loc12_:Number = worldX - _loc1_.worldX;
         var _loc13_:Number = worldY - _loc1_.worldY;
         ax = _loc12_ * _loc11_ * _loc2_ - _loc13_ * _loc7_ * _loc2_;
         ay = _loc13_ * _loc5_ * _loc2_ - _loc12_ * _loc10_ * _loc2_;
         var _loc14_:Number = _loc2_ * _loc11_;
         var _loc17_:Number = _loc2_ * _loc5_;
         var _loc15_:Number = _loc2_ * _loc7_;
         var _loc16_:Number = _loc2_ * _loc10_;
         var _loc3_:Number = _loc14_ * a - _loc15_ * c;
         var _loc4_:Number = _loc14_ * b - _loc15_ * d;
         var _loc6_:Number = _loc17_ * c - _loc16_ * a;
         var _loc8_:Number = _loc17_ * d - _loc16_ * b;
         ashearX = 0;
         ascaleX = Math.sqrt(_loc3_ * _loc3_ + _loc6_ * _loc6_);
         if(scaleX > 0.0001)
         {
            _loc9_ = _loc3_ * _loc8_ - _loc4_ * _loc6_;
            ascaleY = _loc9_ / ascaleX;
            ashearY = Math.atan2(_loc3_ * _loc4_ + _loc6_ * _loc8_,_loc9_) * MathUtils.radDeg;
            arotation = Math.atan2(_loc6_,_loc3_) * MathUtils.radDeg;
         }
         else
         {
            ascaleX = 0;
            ascaleY = Math.sqrt(_loc4_ * _loc4_ + _loc8_ * _loc8_);
            ashearY = 0;
            arotation = 90 - Math.atan2(_loc8_,_loc4_) * MathUtils.radDeg;
         }
      }
      
      public function worldToLocal(param1:Vector.<Number>) : void
      {
         var _loc2_:Number = _a;
         var _loc3_:Number = _b;
         var _loc4_:Number = _c;
         var _loc6_:Number = _d;
         var _loc5_:Number = 1 / (_loc2_ * _loc6_ - _loc3_ * _loc4_);
         var _loc7_:Number = param1[0] - _worldX;
         var _loc8_:Number = param1[1] - _worldY;
         param1[0] = _loc7_ * _loc6_ * _loc5_ - _loc8_ * _loc3_ * _loc5_;
         param1[1] = _loc8_ * _loc2_ * _loc5_ - _loc7_ * _loc4_ * _loc5_;
      }
      
      public function localToWorld(param1:Vector.<Number>) : void
      {
         var _loc3_:Number = param1[0];
         var _loc2_:Number = param1[1];
         param1[0] = _loc3_ * _a + _loc2_ * _b + _worldX;
         param1[1] = _loc3_ * _c + _loc2_ * _d + _worldY;
      }
      
      public function toString() : String
      {
         return _data._name;
      }
   }
}
