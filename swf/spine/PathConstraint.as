package spine
{
   import spine.attachments.PathAttachment;
   
   public class PathConstraint implements Constraint
   {
      
      private static const NONE:int = -1;
      
      private static const BEFORE:int = -2;
      
      private static const AFTER:int = -3;
       
      
      var _data:PathConstraintData;
      
      var _bones:Vector.<Bone>;
      
      public var target:Slot;
      
      public var position:Number;
      
      public var spacing:Number;
      
      public var rotateMix:Number;
      
      public var translateMix:Number;
      
      const _spaces:Vector.<Number> = new Vector.<Number>();
      
      const _positions:Vector.<Number> = new Vector.<Number>();
      
      const _world:Vector.<Number> = new Vector.<Number>();
      
      const _curves:Vector.<Number> = new Vector.<Number>();
      
      const _lengths:Vector.<Number> = new Vector.<Number>();
      
      const _segments:Vector.<Number> = new Vector.<Number>(10);
      
      public function PathConstraint(param1:PathConstraintData, param2:Skeleton)
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
         _bones = new Vector.<Bone>();
         var _loc5_:int = 0;
         var _loc4_:* = param1.bones;
         for each(var _loc3_ in param1.bones)
         {
            _bones.push(param2.findBone(_loc3_.name));
         }
         target = param2.findSlot(param1.target.name);
         position = param1.position;
         spacing = param1.spacing;
         rotateMix = param1.rotateMix;
         translateMix = param1.translateMix;
      }
      
      public function apply() : void
      {
         update();
      }
      
      public function update() : void
      {
         var _loc29_:int = 0;
         var _loc26_:int = 0;
         var _loc30_:int = 0;
         var _loc27_:* = null;
         var _loc25_:Number = NaN;
         var _loc32_:* = null;
         var _loc31_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc11_:PathAttachment = target.attachment as PathAttachment;
         if(_loc11_ == null)
         {
            return;
         }
         var _loc4_:Number = this.rotateMix;
         var _loc19_:Number = this.translateMix;
         var _loc9_:* = _loc19_ > 0;
         var _loc1_:* = _loc4_ > 0;
         if(!_loc9_ && !_loc1_)
         {
            return;
         }
         var _loc2_:PathConstraintData = this._data;
         var _loc13_:SpacingMode = _loc2_.spacingMode;
         var _loc5_:* = _loc13_ == SpacingMode.length;
         var _loc14_:RotateMode = _loc2_.rotateMode;
         var _loc17_:* = _loc14_ == RotateMode.tangent;
         var _loc6_:* = _loc14_ == RotateMode.chainScale;
         _loc29_ = this._bones.length;
         var _loc36_:int = !!_loc17_?_loc29_:_loc29_ + 1;
         var _loc37_:Vector.<Bone> = this._bones;
         this._spaces.length = _loc36_;
         var _loc38_:Vector.<Number> = this._spaces;
         var _loc35_:Vector.<Number> = null;
         var _loc10_:Number = this.spacing;
         if(_loc6_ || _loc5_)
         {
            if(_loc6_)
            {
               this._lengths.length = _loc29_;
               _loc35_ = this._lengths;
            }
            _loc26_ = 0;
            _loc30_ = _loc36_ - 1;
            while(_loc26_ < _loc30_)
            {
               _loc27_ = _loc37_[_loc26_];
               _loc25_ = _loc27_.data.length;
               var _loc39_:Number = _loc25_ * _loc27_.a;
               var _loc40_:Number = _loc25_ * _loc27_.c;
               _loc25_ = Math.sqrt(_loc39_ * _loc39_ + _loc40_ * _loc40_);
               if(_loc6_)
               {
                  _loc35_[_loc26_] = _loc25_;
               }
               _loc26_++;
               _loc38_[_loc26_] = !!_loc5_?Math.max(0,_loc25_ + _loc10_):Number(_loc10_);
            }
         }
         else
         {
            _loc26_ = 1;
            while(_loc26_ < _loc36_)
            {
               _loc38_[_loc26_] = _loc10_;
               _loc26_++;
            }
         }
         var _loc28_:Vector.<Number> = computeWorldPositions(_loc11_,_loc36_,_loc17_,_loc2_.positionMode == PositionMode.percent,_loc13_ == SpacingMode.percent);
         var _loc8_:* = Number(_loc28_[0]);
         var _loc7_:* = Number(_loc28_[1]);
         var _loc22_:Number = _loc2_.offsetRotation;
         var _loc18_:* = false;
         if(_loc22_ == 0)
         {
            _loc18_ = _loc14_ == RotateMode.chain;
         }
         else
         {
            _loc18_ = false;
            _loc32_ = target.bone;
            _loc22_ = _loc22_ * (_loc32_.a * _loc32_.d - _loc32_.b * _loc32_.c > 0?MathUtils.degRad:Number(-MathUtils.degRad));
         }
         _loc26_ = 0;
         _loc31_ = 3;
         3;
         while(_loc26_ < _loc29_)
         {
            _loc27_ = _loc37_[_loc26_];
            _loc27_._worldX = _loc27_._worldX + (_loc8_ - _loc27_.worldX) * _loc19_;
            _loc27_._worldY = _loc27_._worldY + (_loc7_ - _loc27_.worldY) * _loc19_;
            _loc39_ = _loc28_[_loc31_];
            _loc40_ = _loc28_[_loc31_ + 1];
            _loc12_ = _loc39_ - _loc8_;
            var _loc15_:Number = _loc40_ - _loc7_;
            if(_loc6_)
            {
               _loc25_ = _loc35_[_loc26_];
               if(_loc25_ != 0)
               {
                  _loc34_ = (Math.sqrt(_loc12_ * _loc12_ + _loc15_ * _loc15_) / _loc25_ - 1) * _loc4_ + 1;
                  _loc27_._a = _loc27_._a * _loc34_;
                  _loc27_._c = _loc27_._c * _loc34_;
               }
            }
            _loc8_ = _loc39_;
            _loc7_ = _loc40_;
            if(_loc1_)
            {
               _loc20_ = _loc27_.a;
               var _loc21_:Number = _loc27_.b;
               var _loc23_:Number = _loc27_.c;
               var _loc24_:Number = _loc27_.d;
               if(_loc17_)
               {
                  _loc33_ = _loc28_[_loc31_ - 1];
               }
               else if(_loc38_[_loc26_ + 1] == 0)
               {
                  _loc33_ = _loc28_[_loc31_ + 2];
               }
               else
               {
                  _loc33_ = Math.atan2(_loc15_,_loc12_);
               }
               _loc33_ = _loc33_ - Math.atan2(_loc23_,_loc20_);
               if(_loc18_)
               {
                  _loc3_ = Math.cos(_loc33_);
                  _loc16_ = Math.sin(_loc33_);
                  _loc25_ = _loc27_.data.length;
                  _loc8_ = Number(_loc8_ + (_loc25_ * (_loc3_ * _loc20_ - _loc16_ * _loc23_) - _loc12_) * _loc4_);
                  _loc7_ = Number(_loc7_ + (_loc25_ * (_loc16_ * _loc20_ + _loc3_ * _loc23_) - _loc15_) * _loc4_);
               }
               else
               {
                  _loc33_ = _loc33_ + _loc22_;
               }
               if(_loc33_ > 3.14159265358979)
               {
                  _loc33_ = _loc33_ - 3.14159265358979 * 2;
               }
               else if(_loc33_ < -3.14159265358979)
               {
                  _loc33_ = _loc33_ + 3.14159265358979 * 2;
               }
               _loc33_ = _loc33_ * _loc4_;
               _loc3_ = Math.cos(_loc33_);
               _loc16_ = Math.sin(_loc33_);
               _loc27_._a = _loc3_ * _loc20_ - _loc16_ * _loc23_;
               _loc27_._b = _loc3_ * _loc21_ - _loc16_ * _loc24_;
               _loc27_._c = _loc16_ * _loc20_ + _loc3_ * _loc23_;
               _loc27_._d = _loc16_ * _loc21_ + _loc3_ * _loc24_;
            }
            _loc27_.appliedValid = false;
            _loc26_++;
            _loc31_ = _loc31_ + 3;
            _loc31_ + 3;
         }
      }
      
      protected function computeWorldPositions(param1:PathAttachment, param2:int, param3:Boolean, param4:Boolean, param5:Boolean) : Vector.<Number>
      {
         var _loc14_:* = undefined;
         var _loc10_:int = 0;
         var _loc29_:* = undefined;
         var _loc36_:* = NaN;
         var _loc22_:int = 0;
         var _loc6_:int = 0;
         var _loc24_:int = 0;
         var _loc11_:Number = NaN;
         var _loc26_:* = NaN;
         var _loc21_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:int = 0;
         var _loc15_:int = 0;
         var _loc20_:int = 0;
         var _loc23_:Slot = this.target;
         var _loc41_:Number = this.position;
         var _loc35_:Vector.<Number> = this._spaces;
         this._positions.length = param2 * 3 + 2;
         var _loc12_:Vector.<Number> = this._positions;
         var _loc37_:Boolean = param1.closed;
         _loc10_ = param1.worldVerticesLength;
         var _loc25_:int = _loc10_ / 6;
         var _loc27_:* = -1;
         if(!param1.constantSpeed)
         {
            _loc29_ = param1.lengths;
            _loc25_ = _loc25_ - (!!_loc37_?1:2);
            _loc36_ = Number(_loc29_[_loc25_]);
            if(param4)
            {
               _loc41_ = _loc41_ * _loc36_;
            }
            if(param5)
            {
               _loc22_ = 0;
               while(_loc22_ < param2)
               {
                  var _loc46_:* = _loc22_;
                  var _loc47_:* = _loc35_[_loc46_] * _loc36_;
                  _loc35_[_loc46_] = _loc47_;
                  _loc22_++;
               }
            }
            this._world.length = 8;
            _loc14_ = this._world;
            _loc22_ = 0;
            _loc24_ = 0;
            0;
            _loc6_ = 0;
            0;
            while(_loc22_ < param2)
            {
               _loc11_ = _loc35_[_loc22_];
               _loc41_ = _loc41_ + _loc11_;
               _loc26_ = _loc41_;
               if(_loc37_)
               {
                  _loc26_ = Number(_loc26_ % _loc36_);
                  if(_loc26_ < 0)
                  {
                     _loc26_ = Number(_loc26_ + _loc36_);
                  }
                  _loc6_ = 0;
               }
               else
               {
                  if(_loc26_ < 0)
                  {
                     if(_loc27_ != -2)
                     {
                        _loc27_ = -2;
                        param1.computeWorldVertices2(_loc23_,2,4,_loc14_,0);
                     }
                     addBeforePosition(_loc26_,_loc14_,0,_loc12_,_loc24_);
                  }
                  else if(_loc26_ > _loc36_)
                  {
                     if(_loc27_ != -3)
                     {
                        _loc27_ = -3;
                        param1.computeWorldVertices2(_loc23_,_loc10_ - 6,4,_loc14_,0);
                     }
                     addAfterPosition(_loc26_ - _loc36_,_loc14_,0,_loc12_,_loc24_);
                  }
                  addr359:
                  _loc22_++;
                  _loc24_ = _loc24_ + 3;
                  _loc24_ + 3;
                  continue;
               }
               while(true, true)
               {
                  _loc21_ = _loc29_[_loc6_];
                  if(_loc26_ <= _loc21_)
                  {
                     break;
                  }
                  _loc6_++;
               }
               if(_loc6_ == 0)
               {
                  _loc26_ = Number(_loc26_ / _loc21_);
               }
               else
               {
                  _loc8_ = _loc29_[_loc6_ - 1];
                  _loc26_ = Number((_loc26_ - _loc8_) / (_loc21_ - _loc8_));
               }
               if(_loc6_ != _loc27_)
               {
                  _loc27_ = _loc6_;
                  if(_loc37_ && _loc6_ == _loc25_)
                  {
                     param1.computeWorldVertices2(_loc23_,_loc10_ - 4,4,_loc14_,0);
                     param1.computeWorldVertices2(_loc23_,0,4,_loc14_,4);
                  }
                  else
                  {
                     param1.computeWorldVertices2(_loc23_,_loc6_ * 6 + 2,8,_loc14_,0);
                  }
               }
               addCurvePosition(_loc26_,_loc14_[0],_loc14_[1],_loc14_[2],_loc14_[3],_loc14_[4],_loc14_[5],_loc14_[6],_loc14_[7],_loc12_,_loc24_,param3 || _loc22_ > 0 && _loc11_ == 0);
               §§goto(addr359);
            }
            return _loc12_;
         }
         if(_loc37_)
         {
            _loc10_ = _loc10_ + 2;
            this._world.length = _loc10_;
            _loc14_ = this._world;
            param1.computeWorldVertices2(_loc23_,2,_loc10_ - 4,_loc14_,0);
            param1.computeWorldVertices2(_loc23_,0,2,_loc14_,_loc10_ - 4);
            _loc14_[_loc10_ - 2] = _loc14_[0];
            _loc14_[_loc10_ - 1] = _loc14_[1];
         }
         else
         {
            _loc25_--;
            _loc10_ = _loc10_ - 4;
            this._world.length = _loc10_;
            _loc14_ = this._world;
            param1.computeWorldVertices2(_loc23_,2,_loc10_,_loc14_,0);
         }
         this._curves.length = _loc25_;
         var _loc28_:Vector.<Number> = this._curves;
         _loc36_ = 0;
         var _loc38_:* = Number(_loc14_[0]);
         var _loc16_:* = Number(_loc14_[1]);
         var _loc19_:* = 0;
         var _loc39_:* = 0;
         var _loc18_:* = 0;
         var _loc44_:* = 0;
         var _loc40_:* = 0;
         var _loc17_:* = 0;
         _loc22_ = 0;
         _loc34_ = 2;
         2;
         while(_loc22_ < _loc25_)
         {
            _loc19_ = Number(_loc14_[_loc34_]);
            _loc39_ = Number(_loc14_[_loc34_ + 1]);
            _loc18_ = Number(_loc14_[_loc34_ + 2]);
            _loc44_ = Number(_loc14_[_loc34_ + 3]);
            _loc40_ = Number(_loc14_[_loc34_ + 4]);
            _loc17_ = Number(_loc14_[_loc34_ + 5]);
            _loc33_ = (_loc38_ - _loc19_ * 2 + _loc18_) * 0.1875;
            _loc30_ = (_loc16_ - _loc39_ * 2 + _loc44_) * 0.1875;
            _loc7_ = ((_loc19_ - _loc18_) * 3 - _loc38_ + _loc40_) * 0.09375;
            _loc9_ = ((_loc39_ - _loc44_) * 3 - _loc16_ + _loc17_) * 0.09375;
            _loc43_ = _loc33_ * 2 + _loc7_;
            _loc45_ = _loc30_ * 2 + _loc9_;
            _loc32_ = (_loc19_ - _loc38_) * 0.75 + _loc33_ + _loc7_ * 0.16666667;
            _loc31_ = (_loc39_ - _loc16_) * 0.75 + _loc30_ + _loc9_ * 0.16666667;
            _loc36_ = Number(_loc36_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
            _loc32_ = _loc32_ + _loc43_;
            _loc31_ = _loc31_ + _loc45_;
            _loc43_ = _loc43_ + _loc7_;
            _loc45_ = _loc45_ + _loc9_;
            _loc36_ = Number(_loc36_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
            _loc32_ = _loc32_ + _loc43_;
            _loc31_ = _loc31_ + _loc45_;
            _loc36_ = Number(_loc36_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
            _loc32_ = _loc32_ + (_loc43_ + _loc7_);
            _loc31_ = _loc31_ + (_loc45_ + _loc9_);
            _loc36_ = Number(_loc36_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
            _loc28_[_loc22_] = _loc36_;
            _loc38_ = _loc40_;
            _loc16_ = _loc17_;
            _loc22_++;
            _loc34_ = _loc34_ + 6;
            _loc34_ + 6;
         }
         if(param4)
         {
            _loc41_ = _loc41_ * _loc36_;
         }
         if(param5)
         {
            _loc22_ = 0;
            while(_loc22_ < param2)
            {
               _loc47_ = _loc22_;
               _loc46_ = _loc35_[_loc47_] * _loc36_;
               _loc35_[_loc47_] = _loc46_;
               _loc22_++;
            }
         }
         var _loc13_:Vector.<Number> = this._segments;
         var _loc42_:* = 0;
         _loc22_ = 0;
         _loc24_ = 0;
         0;
         _loc6_ = 0;
         0;
         _loc15_ = 0;
         0;
         while(_loc22_ < param2)
         {
            _loc11_ = _loc35_[_loc22_];
            _loc41_ = _loc41_ + _loc11_;
            _loc26_ = _loc41_;
            if(_loc37_)
            {
               _loc26_ = Number(_loc26_ % _loc36_);
               if(_loc26_ < 0)
               {
                  _loc26_ = Number(_loc26_ + _loc36_);
               }
               _loc6_ = 0;
            }
            else
            {
               if(_loc26_ < 0)
               {
                  addBeforePosition(_loc26_,_loc14_,0,_loc12_,_loc24_);
               }
               else if(_loc26_ > _loc36_)
               {
                  addAfterPosition(_loc26_ - _loc36_,_loc14_,_loc10_ - 4,_loc12_,_loc24_);
               }
               addr1221:
               _loc22_++;
               _loc24_ = _loc24_ + 3;
               _loc24_ + 3;
               continue;
            }
            while(true, true)
            {
               _loc21_ = _loc28_[_loc6_];
               if(_loc26_ <= _loc21_)
               {
                  break;
               }
               _loc6_++;
            }
            if(_loc6_ == 0)
            {
               _loc26_ = Number(_loc26_ / _loc21_);
            }
            else
            {
               _loc8_ = _loc28_[_loc6_ - 1];
               _loc26_ = Number((_loc26_ - _loc8_) / (_loc21_ - _loc8_));
            }
            if(_loc6_ != _loc27_)
            {
               _loc27_ = _loc6_;
               _loc20_ = _loc6_ * 6;
               _loc38_ = Number(_loc14_[_loc20_]);
               _loc16_ = Number(_loc14_[_loc20_ + 1]);
               _loc19_ = Number(_loc14_[_loc20_ + 2]);
               _loc39_ = Number(_loc14_[_loc20_ + 3]);
               _loc18_ = Number(_loc14_[_loc20_ + 4]);
               _loc44_ = Number(_loc14_[_loc20_ + 5]);
               _loc40_ = Number(_loc14_[_loc20_ + 6]);
               _loc17_ = Number(_loc14_[_loc20_ + 7]);
               _loc33_ = (_loc38_ - _loc19_ * 2 + _loc18_) * 0.03;
               _loc30_ = (_loc16_ - _loc39_ * 2 + _loc44_) * 0.03;
               _loc7_ = ((_loc19_ - _loc18_) * 3 - _loc38_ + _loc40_) * 0.006;
               _loc9_ = ((_loc39_ - _loc44_) * 3 - _loc16_ + _loc17_) * 0.006;
               _loc43_ = _loc33_ * 2 + _loc7_;
               _loc45_ = _loc30_ * 2 + _loc9_;
               _loc32_ = (_loc19_ - _loc38_) * 0.3 + _loc33_ + _loc7_ * 0.16666667;
               _loc31_ = (_loc39_ - _loc16_) * 0.3 + _loc30_ + _loc9_ * 0.16666667;
               _loc42_ = Number(Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
               _loc13_[0] = _loc42_;
               _loc20_ = 1;
               while(_loc20_ < 8)
               {
                  _loc32_ = _loc32_ + _loc43_;
                  _loc31_ = _loc31_ + _loc45_;
                  _loc43_ = _loc43_ + _loc7_;
                  _loc45_ = _loc45_ + _loc9_;
                  _loc42_ = Number(_loc42_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
                  _loc13_[_loc20_] = _loc42_;
                  _loc20_++;
               }
               _loc32_ = _loc32_ + _loc43_;
               _loc31_ = _loc31_ + _loc45_;
               _loc42_ = Number(_loc42_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
               _loc13_[8] = _loc42_;
               _loc32_ = _loc32_ + (_loc43_ + _loc7_);
               _loc31_ = _loc31_ + (_loc45_ + _loc9_);
               _loc42_ = Number(_loc42_ + Math.sqrt(_loc32_ * _loc32_ + _loc31_ * _loc31_));
               _loc13_[9] = _loc42_;
               _loc15_ = 0;
            }
            _loc26_ = Number(_loc26_ * _loc42_);
            while(true, true)
            {
               _loc21_ = _loc13_[_loc15_];
               if(_loc26_ <= _loc21_)
               {
                  break;
               }
               _loc15_++;
            }
            if(_loc15_ == 0)
            {
               _loc26_ = Number(_loc26_ / _loc21_);
            }
            else
            {
               _loc8_ = _loc13_[_loc15_ - 1];
               _loc26_ = Number(_loc15_ + (_loc26_ - _loc8_) / (_loc21_ - _loc8_));
            }
            addCurvePosition(_loc26_ * 0.1,_loc38_,_loc16_,_loc19_,_loc39_,_loc18_,_loc44_,_loc40_,_loc17_,_loc12_,_loc24_,param3 || _loc22_ > 0 && _loc11_ == 0);
            §§goto(addr1221);
         }
         return _loc12_;
      }
      
      private function addBeforePosition(param1:Number, param2:Vector.<Number>, param3:int, param4:Vector.<Number>, param5:int) : void
      {
         var _loc10_:Number = NaN;
         _loc10_ = param2[param3];
         var _loc9_:Number = param2[param3 + 1];
         var _loc7_:Number = param2[param3 + 2] - _loc10_;
         var _loc8_:Number = param2[param3 + 3] - _loc9_;
         var _loc6_:Number = Math.atan2(_loc8_,_loc7_);
         param4[param5] = _loc10_ + param1 * Math.cos(_loc6_);
         param4[param5 + 1] = _loc9_ + param1 * Math.sin(_loc6_);
         param4[param5 + 2] = _loc6_;
      }
      
      private function addAfterPosition(param1:Number, param2:Vector.<Number>, param3:int, param4:Vector.<Number>, param5:int) : void
      {
         var _loc10_:Number = NaN;
         _loc10_ = param2[param3 + 2];
         var _loc9_:Number = param2[param3 + 3];
         var _loc7_:Number = _loc10_ - param2[param3];
         var _loc8_:Number = _loc9_ - param2[param3 + 1];
         var _loc6_:Number = Math.atan2(_loc8_,_loc7_);
         param4[param5] = _loc10_ + param1 * Math.cos(_loc6_);
         param4[param5 + 1] = _loc9_ + param1 * Math.sin(_loc6_);
         param4[param5 + 2] = _loc6_;
      }
      
      private function addCurvePosition(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Vector.<Number>, param11:int, param12:Boolean) : void
      {
         var _loc13_:Number = NaN;
         var _loc23_:Number = NaN;
         if(param1 == 0 || isNaN(param1))
         {
            param1 = 0.0001;
         }
         _loc13_ = param1 * param1;
         var _loc18_:Number = _loc13_ * param1;
         var _loc19_:Number = 1 - param1;
         var _loc14_:Number = _loc19_ * _loc19_;
         var _loc17_:Number = _loc14_ * _loc19_;
         _loc23_ = _loc19_ * param1;
         var _loc20_:Number = _loc23_ * 3;
         var _loc16_:Number = _loc19_ * _loc20_;
         var _loc15_:Number = _loc20_ * param1;
         var _loc21_:Number = param2 * _loc17_ + param4 * _loc16_ + param6 * _loc15_ + param8 * _loc18_;
         var _loc22_:Number = param3 * _loc17_ + param5 * _loc16_ + param7 * _loc15_ + param9 * _loc18_;
         param10[param11] = _loc21_;
         param10[param11 + 1] = _loc22_;
         if(param12)
         {
            param10[param11 + 2] = Math.atan2(_loc22_ - (param3 * _loc14_ + param5 * _loc23_ * 2 + param7 * _loc13_),_loc21_ - (param2 * _loc14_ + param4 * _loc23_ * 2 + param6 * _loc13_));
         }
      }
      
      public function get bones() : Vector.<Bone>
      {
         return _bones;
      }
      
      public function get data() : PathConstraintData
      {
         return _data;
      }
      
      public function getOrder() : Number
      {
         return _data.order;
      }
      
      public function toString() : String
      {
         return _data.name;
      }
   }
}
