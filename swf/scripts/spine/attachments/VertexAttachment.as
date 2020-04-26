package spine.attachments
{
   import spine.Bone;
   import spine.Skeleton;
   import spine.Slot;
   
   public dynamic class VertexAttachment extends Attachment
   {
       
      
      public var bones:Vector.<int>;
      
      public var vertices:Vector.<Number>;
      
      public var worldVerticesLength:int;
      
      public function VertexAttachment(param1:String)
      {
         super(param1);
      }
      
      public function computeWorldVertices(param1:Slot, param2:Vector.<Number>) : void
      {
         computeWorldVertices2(param1,0,worldVerticesLength,param2,0);
      }
      
      public function computeWorldVertices2(param1:Slot, param2:int, param3:int, param4:Vector.<Number>, param5:int) : void
      {
         var _loc20_:* = undefined;
         var _loc28_:* = 0;
         var _loc25_:int = 0;
         var _loc22_:int = 0;
         var _loc10_:int = 0;
         var _loc16_:int = 0;
         var _loc21_:int = 0;
         var _loc27_:* = 0;
         var _loc8_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc17_:* = NaN;
         var _loc14_:* = NaN;
         var _loc24_:* = null;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc23_:Number = NaN;
         param3 = param3 + param5;
         var _loc11_:Skeleton = param1.skeleton;
         var _loc12_:Vector.<Number> = param1.attachmentVertices;
         var _loc9_:* = this.vertices;
         var _loc26_:Vector.<int> = this.bones;
         if(_loc26_ == null)
         {
            if(_loc12_.length > 0)
            {
               _loc9_ = _loc12_;
            }
            _loc24_ = param1.bone;
            _loc29_ = _loc24_.worldX;
            _loc30_ = _loc24_.worldY;
            _loc15_ = _loc24_.a;
            var _loc6_:Number = _loc24_.b;
            var _loc18_:Number = _loc24_.c;
            var _loc19_:Number = _loc24_.d;
            _loc27_ = param2;
            _loc28_ = param5;
            _loc28_;
            while(_loc28_ < param3)
            {
               _loc7_ = _loc9_[_loc27_];
               _loc8_ = _loc9_[_loc27_ + 1];
               _loc9_[_loc27_ + 1];
               param4[_loc28_] = _loc7_ * _loc15_ + _loc8_ * _loc6_ + _loc29_;
               param4[_loc28_ + 1] = _loc7_ * _loc18_ + _loc8_ * _loc19_ + _loc30_;
               _loc27_ = int(_loc27_ + 2);
               _loc28_ = int(_loc28_ + 2);
               _loc28_ + 2;
            }
            return;
         }
         _loc27_ = 0;
         _loc10_ = 0;
         0;
         _loc22_ = 0;
         while(_loc22_ < param2)
         {
            _loc25_ = _loc26_[_loc27_];
            _loc27_ = int(_loc27_ + (_loc25_ + 1));
            _loc10_ = _loc10_ + _loc25_;
            _loc22_ = _loc22_ + 2;
         }
         var _loc13_:Vector.<Bone> = _loc11_.bones;
         if(_loc12_.length == 0)
         {
            _loc28_ = param5;
            _loc16_ = _loc10_ * 3;
            _loc10_ * 3;
            while(_loc28_ < param3)
            {
               _loc14_ = 0;
               _loc17_ = Number(0);
               0;
               _loc27_++;
               _loc25_ = _loc26_[_loc27_];
               _loc25_ = _loc25_ + _loc27_;
               while(_loc27_ < _loc25_)
               {
                  _loc24_ = _loc13_[_loc26_[_loc27_]];
                  _loc7_ = _loc9_[_loc16_];
                  _loc8_ = _loc9_[_loc16_ + 1];
                  _loc23_ = _loc9_[_loc16_ + 2];
                  _loc14_ = Number(_loc14_ + (_loc7_ * _loc24_.a + _loc8_ * _loc24_.b + _loc24_.worldX) * _loc23_);
                  _loc17_ = Number(_loc17_ + (_loc7_ * _loc24_.c + _loc8_ * _loc24_.d + _loc24_.worldY) * _loc23_);
                  _loc27_++;
                  _loc16_ = _loc16_ + 3;
                  _loc16_ + 3;
               }
               param4[_loc28_] = _loc14_;
               param4[_loc28_ + 1] = _loc17_;
               _loc28_ = int(_loc28_ + 2);
            }
         }
         else
         {
            _loc20_ = _loc12_;
            _loc28_ = param5;
            _loc16_ = _loc10_ * 3;
            _loc10_ * 3;
            _loc21_ = _loc10_ << 1;
            _loc10_ << 1;
            while(_loc28_ < param3)
            {
               _loc14_ = 0;
               _loc17_ = 0;
               _loc27_++;
               _loc25_ = _loc26_[_loc27_];
               _loc25_ = _loc25_ + _loc27_;
               while(_loc27_ < _loc25_)
               {
                  _loc24_ = _loc13_[_loc26_[_loc27_]];
                  _loc7_ = _loc9_[_loc16_] + _loc20_[_loc21_];
                  _loc8_ = _loc9_[_loc16_ + 1] + _loc20_[_loc21_ + 1];
                  _loc23_ = _loc9_[_loc16_ + 2];
                  _loc14_ = Number(_loc14_ + (_loc7_ * _loc24_.a + _loc8_ * _loc24_.b + _loc24_.worldX) * _loc23_);
                  _loc17_ = Number(_loc17_ + (_loc7_ * _loc24_.c + _loc8_ * _loc24_.d + _loc24_.worldY) * _loc23_);
                  _loc27_++;
                  _loc16_ = _loc16_ + 3;
                  _loc16_ + 3;
                  _loc21_ = _loc21_ + 2;
                  _loc21_ + 2;
               }
               param4[_loc28_] = _loc14_;
               param4[_loc28_ + 1] = _loc17_;
               _loc28_ = int(_loc28_ + 2);
            }
         }
      }
      
      public function applyDeform(param1:VertexAttachment) : Boolean
      {
         return this == param1;
      }
   }
}
