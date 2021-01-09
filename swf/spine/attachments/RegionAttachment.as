package spine.attachments
{
   import spine.Bone;
   
   public dynamic class RegionAttachment extends Attachment
   {
       
      
      public const X1:int = 0;
      
      public const Y1:int = 1;
      
      public const X2:int = 2;
      
      public const Y2:int = 3;
      
      public const X3:int = 4;
      
      public const Y3:int = 5;
      
      public const X4:int = 6;
      
      public const Y4:int = 7;
      
      public var x:Number;
      
      public var y:Number;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var rotation:Number;
      
      public var width:Number;
      
      public var height:Number;
      
      public var r:Number = 1;
      
      public var g:Number = 1;
      
      public var b:Number = 1;
      
      public var a:Number = 1;
      
      public var path:String;
      
      public var rendererObject:Object;
      
      public var regionOffsetX:Number;
      
      public var regionOffsetY:Number;
      
      public var regionWidth:Number;
      
      public var regionHeight:Number;
      
      public var regionOriginalWidth:Number;
      
      public var regionOriginalHeight:Number;
      
      public var offset:Vector.<Number>;
      
      public var uvs:Vector.<Number>;
      
      public function RegionAttachment(param1:String)
      {
         offset = new Vector.<Number>();
         uvs = new Vector.<Number>();
         super(param1);
         offset.length = 8;
         uvs.length = 8;
      }
      
      public function setUVs(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean) : void
      {
         if(param5)
         {
            uvs[2] = param1;
            uvs[3] = param4;
            uvs[4] = param1;
            uvs[5] = param2;
            uvs[6] = param3;
            uvs[7] = param2;
            uvs[0] = param3;
            uvs[1] = param4;
         }
         else
         {
            uvs[0] = param1;
            uvs[1] = param4;
            uvs[2] = param1;
            uvs[3] = param2;
            uvs[4] = param3;
            uvs[5] = param2;
            uvs[6] = param3;
            uvs[7] = param4;
         }
      }
      
      public function updateOffset() : void
      {
         var _loc5_:Number = width / regionOriginalWidth * scaleX;
         var _loc4_:Number = height / regionOriginalHeight * scaleY;
         var _loc17_:Number = -width / 2 * scaleX + regionOffsetX * _loc5_;
         var _loc15_:Number = -height / 2 * scaleY + regionOffsetY * _loc4_;
         var _loc9_:Number = _loc17_ + regionWidth * _loc5_;
         var _loc10_:Number = _loc15_ + regionHeight * _loc4_;
         var _loc8_:Number = rotation * 3.14159265358979 / 180;
         var _loc6_:Number = Math.cos(_loc8_);
         var _loc16_:Number = Math.sin(_loc8_);
         var _loc11_:Number = _loc17_ * _loc6_ + x;
         var _loc1_:Number = _loc17_ * _loc16_;
         var _loc13_:Number = _loc15_ * _loc6_ + y;
         var _loc2_:Number = _loc15_ * _loc16_;
         var _loc12_:Number = _loc9_ * _loc6_ + x;
         var _loc7_:Number = _loc9_ * _loc16_;
         var _loc3_:Number = _loc10_ * _loc6_ + y;
         var _loc14_:Number = _loc10_ * _loc16_;
         offset[0] = _loc11_ - _loc2_;
         offset[1] = _loc13_ + _loc1_;
         offset[2] = _loc11_ - _loc14_;
         offset[3] = _loc3_ + _loc1_;
         offset[4] = _loc12_ - _loc14_;
         offset[5] = _loc3_ + _loc7_;
         offset[6] = _loc12_ - _loc2_;
         offset[7] = _loc13_ + _loc7_;
      }
      
      public function computeWorldVertices(param1:Number, param2:Number, param3:Bone, param4:Vector.<Number>) : void
      {
         param1 = param1 + param3.worldX;
         param2 = param2 + param3.worldY;
         var _loc5_:Number = param3.a;
         var _loc8_:Number = param3.b;
         var _loc7_:Number = param3.c;
         var _loc6_:Number = param3.d;
         var _loc10_:Number = offset[0];
         var _loc9_:Number = offset[1];
         var _loc12_:Number = offset[2];
         var _loc11_:Number = offset[3];
         var _loc14_:Number = offset[4];
         var _loc13_:Number = offset[5];
         var _loc16_:Number = offset[6];
         var _loc15_:Number = offset[7];
         param4[0] = _loc10_ * _loc5_ + _loc9_ * _loc8_ + param1;
         param4[1] = _loc10_ * _loc7_ + _loc9_ * _loc6_ + param2;
         param4[2] = _loc12_ * _loc5_ + _loc11_ * _loc8_ + param1;
         param4[3] = _loc12_ * _loc7_ + _loc11_ * _loc6_ + param2;
         param4[4] = _loc14_ * _loc5_ + _loc13_ * _loc8_ + param1;
         param4[5] = _loc14_ * _loc7_ + _loc13_ * _loc6_ + param2;
         param4[6] = _loc16_ * _loc5_ + _loc15_ * _loc8_ + param1;
         param4[7] = _loc16_ * _loc7_ + _loc15_ * _loc6_ + param2;
      }
   }
}
