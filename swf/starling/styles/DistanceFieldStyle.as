package starling.styles
{
   import flash.geom.Matrix;
   import starling.core.Starling;
   import starling.display.Mesh;
   import starling.rendering.MeshEffect;
   import starling.rendering.RenderState;
   import starling.rendering.VertexData;
   import starling.rendering.VertexDataFormat;
   import starling.utils.Color;
   import starling.utils.MathUtil;
   
   public class DistanceFieldStyle extends MeshStyle
   {
      
      public static const VERTEX_FORMAT:VertexDataFormat = MeshStyle.VERTEX_FORMAT.extend("basic:bytes4, extended:bytes4, outerColor:bytes4");
      
      public static const MODE_BASIC:String = "basic";
      
      public static const MODE_OUTLINE:String = "outline";
      
      public static const MODE_GLOW:String = "glow";
      
      public static const MODE_SHADOW:String = "shadow";
       
      
      private var _mode:String;
      
      private var _multiChannel:Boolean;
      
      private var _threshold:Number;
      
      private var _alpha:Number;
      
      private var _softness:Number;
      
      private var _outerThreshold:Number;
      
      private var _outerAlphaEnd:Number;
      
      private var _shadowOffsetX:Number;
      
      private var _shadowOffsetY:Number;
      
      private var _outerColor:uint;
      
      private var _outerAlphaStart:Number;
      
      public function DistanceFieldStyle(param1:Number = 0.125, param2:Number = 0.5)
      {
         super();
         _mode = "basic";
         _threshold = param2;
         _softness = param1;
         _alpha = 1;
         _outerAlphaEnd = 0;
         _outerThreshold = 0;
         _shadowOffsetY = 0;
         _shadowOffsetX = 0;
         _outerColor = 0;
         _outerAlphaStart = 0;
      }
      
      override public function copyFrom(param1:MeshStyle) : void
      {
         var _loc2_:DistanceFieldStyle = param1 as DistanceFieldStyle;
         if(_loc2_)
         {
            _mode = _loc2_._mode;
            _multiChannel = _loc2_._multiChannel;
            _threshold = _loc2_._threshold;
            _softness = _loc2_._softness;
            _alpha = _loc2_._alpha;
            _outerThreshold = _loc2_._outerThreshold;
            _outerAlphaEnd = _loc2_._outerAlphaEnd;
            _shadowOffsetX = _loc2_._shadowOffsetX;
            _shadowOffsetY = _loc2_._shadowOffsetY;
            _outerColor = _loc2_._outerColor;
            _outerAlphaStart = _loc2_._outerAlphaStart;
         }
         super.copyFrom(param1);
      }
      
      override public function createEffect() : MeshEffect
      {
         return new DistanceFieldEffect();
      }
      
      override public function get vertexFormat() : VertexDataFormat
      {
         return VERTEX_FORMAT;
      }
      
      override protected function onTargetAssigned(param1:Mesh) : void
      {
         updateVertices();
      }
      
      private function updateVertices() : void
      {
         var _loc7_:int = 0;
         if(vertexData == null)
         {
            return;
         }
         var _loc1_:int = vertexData.numVertices;
         var _loc4_:int = 8;
         var _loc3_:int = 8;
         var _loc5_:Number = (_shadowOffsetX + _loc3_) / (2 * _loc3_);
         var _loc6_:Number = (_shadowOffsetY + _loc3_) / (2 * _loc3_);
         var _loc8_:uint = uint(_threshold * 255) | uint(_alpha * 255) << 8 | uint(_softness / 2 * 255) << 16 | uint(1 / _loc4_ * 255) << 24;
         var _loc9_:uint = uint(_outerThreshold * 255) | uint(_outerAlphaEnd * 255) << 8 | uint(_loc5_ * 255) << 16 | uint(_loc6_ * 255) << 24;
         var _loc2_:uint = Color.getRed(_outerColor) | Color.getGreen(_outerColor) << 8 | Color.getBlue(_outerColor) << 16 | uint(_outerAlphaStart * 255) << 24;
         _loc7_ = 0;
         while(_loc7_ < _loc1_)
         {
            vertexData.setUnsignedInt(_loc7_,"basic",_loc8_);
            vertexData.setUnsignedInt(_loc7_,"extended",_loc9_);
            vertexData.setUnsignedInt(_loc7_,"outerColor",_loc2_);
            _loc7_++;
         }
         setVertexDataChanged();
      }
      
      override public function batchVertexData(param1:MeshStyle, param2:int = 0, param3:Matrix = null, param4:int = 0, param5:int = -1) : void
      {
         var _loc8_:Number = NaN;
         var _loc12_:* = null;
         var _loc6_:* = NaN;
         var _loc13_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc14_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc7_:* = 0;
         super.batchVertexData(param1,param2,param3,param4,param5);
         if(param3)
         {
            _loc8_ = Math.sqrt(param3.a * param3.a + param3.c * param3.c);
            if(!MathUtil.isEquivalent(_loc8_,1,0.01))
            {
               _loc12_ = (param1 as DistanceFieldStyle).vertexData;
               _loc6_ = 8;
               _loc13_ = _loc6_ / 255;
               if(param5 < 0)
               {
                  param5 = vertexData.numVertices - param4;
               }
               _loc9_ = 0;
               while(_loc9_ < param5)
               {
                  _loc10_ = uint(vertexData.getUnsignedInt(param4 + _loc9_,"basic"));
                  _loc14_ = (_loc10_ >> 24 & 255) / 255 * _loc6_;
                  _loc11_ = MathUtil.clamp(_loc14_ * _loc8_,_loc13_,_loc6_);
                  _loc7_ = uint(_loc10_ & 16777215 | uint(_loc11_ / _loc6_ * 255) << 24);
                  _loc12_.setUnsignedInt(param2 + _loc9_,"basic",_loc7_);
                  _loc9_++;
               }
            }
         }
      }
      
      override public function updateEffect(param1:MeshEffect, param2:RenderState) : void
      {
         var _loc4_:* = null;
         var _loc3_:Number = NaN;
         var _loc5_:DistanceFieldEffect = param1 as DistanceFieldEffect;
         _loc5_.mode = _mode;
         _loc5_.multiChannel = _multiChannel;
         if(param2.is3D)
         {
            _loc5_.scale = 1;
         }
         else
         {
            _loc4_ = param2.modelviewMatrix;
            _loc3_ = Math.sqrt(_loc4_.a * _loc4_.a + _loc4_.c * _loc4_.c);
            _loc5_.scale = _loc3_ * Starling.contentScaleFactor;
         }
         super.updateEffect(param1,param2);
      }
      
      override public function canBatchWith(param1:MeshStyle) : Boolean
      {
         var _loc2_:DistanceFieldStyle = param1 as DistanceFieldStyle;
         if(_loc2_ && super.canBatchWith(param1))
         {
            return _loc2_._mode == _mode && _loc2_._multiChannel == _multiChannel;
         }
         return false;
      }
      
      public function setupBasic() : void
      {
         _mode = "basic";
         setRequiresRedraw();
      }
      
      public function setupOutline(param1:Number = 0.25, param2:uint = 0, param3:Number = 1.0) : void
      {
         _mode = "outline";
         _outerThreshold = MathUtil.clamp(_threshold - param1,0,_threshold);
         _outerColor = param2;
         _outerAlphaEnd = MathUtil.clamp(param3,0,1);
         _outerAlphaStart = MathUtil.clamp(param3,0,1);
         _shadowOffsetY = 0;
         _shadowOffsetX = 0;
         updateVertices();
      }
      
      public function setupGlow(param1:Number = 0.2, param2:uint = 16776960, param3:Number = 0.5) : void
      {
         _mode = "glow";
         _outerThreshold = MathUtil.clamp(_threshold - param1,0,_threshold);
         _outerColor = param2;
         _outerAlphaStart = MathUtil.clamp(param3,0,1);
         _outerAlphaEnd = 0;
         _shadowOffsetY = 0;
         _shadowOffsetX = 0;
         updateVertices();
      }
      
      public function setupDropShadow(param1:Number = 0.2, param2:Number = 2, param3:Number = 2, param4:uint = 0, param5:Number = 0.5) : void
      {
         var _loc6_:* = NaN;
         _loc6_ = 8;
         _mode = "shadow";
         _outerThreshold = MathUtil.clamp(_threshold - param1,0,_threshold);
         _outerColor = param4;
         _outerAlphaStart = MathUtil.clamp(param5,0,1);
         _outerAlphaEnd = 0;
         _shadowOffsetX = MathUtil.clamp(param2,-8,8);
         _shadowOffsetY = MathUtil.clamp(param3,-8,8);
         updateVertices();
      }
      
      public function get mode() : String
      {
         return _mode;
      }
      
      public function set mode(param1:String) : void
      {
         _mode = param1;
         setRequiresRedraw();
      }
      
      public function get multiChannel() : Boolean
      {
         return _multiChannel;
      }
      
      public function set multiChannel(param1:Boolean) : void
      {
         _multiChannel = param1;
         setRequiresRedraw();
      }
      
      public function get threshold() : Number
      {
         return _threshold;
      }
      
      public function set threshold(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_threshold != param1)
         {
            _threshold = param1;
            updateVertices();
         }
      }
      
      public function get softness() : Number
      {
         return _softness;
      }
      
      public function set softness(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_softness != param1)
         {
            _softness = param1;
            updateVertices();
         }
      }
      
      public function get alpha() : Number
      {
         return _alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_alpha != param1)
         {
            _alpha = param1;
            updateVertices();
         }
      }
      
      public function get outerThreshold() : Number
      {
         return _outerThreshold;
      }
      
      public function set outerThreshold(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_outerThreshold != param1)
         {
            _outerThreshold = param1;
            updateVertices();
         }
      }
      
      public function get outerAlphaStart() : Number
      {
         return _outerAlphaStart;
      }
      
      public function set outerAlphaStart(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_outerAlphaStart != param1)
         {
            _outerAlphaStart = param1;
            updateVertices();
         }
      }
      
      public function get outerAlphaEnd() : Number
      {
         return _outerAlphaEnd;
      }
      
      public function set outerAlphaEnd(param1:Number) : void
      {
         param1 = MathUtil.clamp(param1,0,1);
         if(_outerAlphaEnd != param1)
         {
            _outerAlphaEnd = param1;
            updateVertices();
         }
      }
      
      public function get outerColor() : uint
      {
         return _outerColor;
      }
      
      public function set outerColor(param1:uint) : void
      {
         if(_outerColor != param1)
         {
            _outerColor = param1;
            updateVertices();
         }
      }
      
      public function get shadowOffsetX() : Number
      {
         return _shadowOffsetX;
      }
      
      public function set shadowOffsetX(param1:Number) : void
      {
         var _loc2_:* = NaN;
         _loc2_ = 8;
         param1 = MathUtil.clamp(param1,-8,8);
         if(_shadowOffsetX != param1)
         {
            _shadowOffsetX = param1;
            updateVertices();
         }
      }
      
      public function get shadowOffsetY() : Number
      {
         return _shadowOffsetY;
      }
      
      public function set shadowOffsetY(param1:Number) : void
      {
         var _loc2_:* = NaN;
         _loc2_ = 8;
         param1 = MathUtil.clamp(param1,-8,8);
         if(_shadowOffsetY != param1)
         {
            _shadowOffsetY = param1;
            updateVertices();
         }
      }
   }
}

import flash.display3D.Context3D;
import starling.rendering.MeshEffect;
import starling.rendering.Program;
import starling.rendering.VertexDataFormat;
import starling.styles.DistanceFieldStyle;
import starling.utils.StringUtil;

class DistanceFieldEffect extends MeshEffect
{
   
   public static const VERTEX_FORMAT:VertexDataFormat = DistanceFieldStyle.VERTEX_FORMAT;
   
   public static const MAX_OUTER_OFFSET:int = 8;
   
   public static const MAX_SCALE:int = 8;
   
   private static const sVector:Vector.<Number> = new Vector.<Number>(4,true);
    
   
   private var _mode:String;
   
   private var _scale:Number;
   
   private var _multiChannel:Boolean;
   
   function DistanceFieldEffect()
   {
      super();
      _scale = 1;
      _mode = "basic";
   }
   
   private static function step(param1:String, param2:String, param3:String, param4:String = "ft6") : String
   {
      return [StringUtil.format("sub {0}, {1}, {2}",param4,param3,param2),StringUtil.format("rcp {0}, {0}",param4),StringUtil.format("sub {0}, {0}, {1}",param1,param2),StringUtil.format("mul {0}, {0}, {1}",param1,param4),StringUtil.format("sat {0}, {0}",param1)].join("\n");
   }
   
   private static function median(param1:String) : String
   {
      return [StringUtil.format("max {0}.xyz, {0}.xxy, {0}.yzz",param1),StringUtil.format("min {0}.x, {0}.x, {0}.y",param1),StringUtil.format("min {0}, {0}.xxxx, {0}.zzzz",param1)].join("\n");
   }
   
   override protected function createProgram() : Program
   {
      var _loc1_:* = false;
      var _loc4_:* = false;
      var _loc2_:* = undefined;
      var _loc3_:* = undefined;
      if(texture)
      {
         _loc1_ = _mode == "basic";
         _loc4_ = _mode == "shadow";
         _loc2_ = new <String>["m44 op, va0, vc0","mov v0, va1","mul vt4, va3.yyyy, vc4","mul v1, va2, vt4","mov v3, va3","mov v4, va4","mov v5, va5","mul vt4.w, vc4.w, va2.w","mul v4.y, va4.y, vt4.w","mul v5.w, va5.w, vt4.w","mul vt0.x, va3.w, vc5.z","mul vt0.x, vt0.x, vc5.w","div vt0.x, va3.z, vt0.x","mov vt1, vc4","sub vt1.x, va3.x, vt0.x","add vt1.y, va3.x, vt0.x"];
         if(!_loc1_)
         {
            _loc2_.push("sub vt1.z, va4.x, vt0.x","add vt1.w, va4.x, vt0.x");
         }
         _loc2_.push("sat v6, vt1");
         if(_loc4_)
         {
            _loc2_.push("mul vt0.xy, va4.zw, vc6.zz","sub vt0.xy, vt0.xy, vc6.yy","mul vt0.xy, vt0.xy, vc5.xy","sub v7, va1, vt0.xyxy","sub vt0.z, va3.x, va4.x","add v7.z, va3.x, vt0.z");
         }
         _loc3_ = new <String>[tex("ft0","v0",0,texture),!!_multiChannel?median("ft0"):"mov ft0, ft0.xxxx","mov ft1, ft0",step("ft1.w","v6.x","v6.y"),"mov ft3, ft1","mul ft1, v1, ft1.wwww"];
         if(_loc4_)
         {
            _loc3_.push(tex("ft0","v7",0,texture),!!_multiChannel?median("ft0"):"mov ft0, ft0.xxxx","mov ft5.x, v7.z");
         }
         else if(!_loc1_)
         {
            _loc3_.push("mov ft5.x, v6.x");
         }
         if(!_loc1_)
         {
            _loc3_.push("mov ft2, ft0",step("ft2.w","v6.z","v6.w"),"sub ft2.w, ft2.w, ft3.w","sat ft2.w, ft2.w","mov ft4, ft0",step("ft4.w","v6.z","ft5.x"),"sub ft6.w, v5.w, v4.y","mul ft4.w, ft4.w, ft6.w","add ft4.w, ft4.w, v4.y","mul ft2.w, ft2.w, ft4.w","mul ft2.xyz, v5.xyz, ft2.www");
         }
         if(_loc1_)
         {
            _loc3_.push("mov oc, ft1");
         }
         else
         {
            _loc3_.push("add oc, ft1, ft2");
         }
         return Program.fromSource(_loc2_.join("\n"),_loc3_.join("\n"));
      }
      return super.createProgram();
   }
   
   override protected function beforeDraw(param1:Context3D) : void
   {
      var _loc3_:Number = NaN;
      var _loc2_:Number = NaN;
      super.beforeDraw(param1);
      if(texture)
      {
         vertexFormat.setVertexBufferAt(3,vertexBuffer,"basic");
         vertexFormat.setVertexBufferAt(4,vertexBuffer,"extended");
         vertexFormat.setVertexBufferAt(5,vertexBuffer,"outerColor");
         _loc3_ = 1 / (texture.root.nativeWidth / texture.scale);
         _loc2_ = 1 / (texture.root.nativeHeight / texture.scale);
         sVector[0] = 8 * _loc3_;
         sVector[1] = 8 * _loc2_;
         sVector[2] = 8;
         sVector[3] = _scale;
         param1.setProgramConstantsFromVector("vertex",5,sVector);
         sVector[0] = 0;
         sVector[1] = 1;
         sVector[2] = 2;
         param1.setProgramConstantsFromVector("vertex",6,sVector);
      }
   }
   
   override protected function afterDraw(param1:Context3D) : void
   {
      if(texture)
      {
         param1.setVertexBufferAt(3,null);
         param1.setVertexBufferAt(4,null);
         param1.setVertexBufferAt(5,null);
      }
      super.afterDraw(param1);
   }
   
   override public function get vertexFormat() : VertexDataFormat
   {
      return VERTEX_FORMAT;
   }
   
   override protected function get programVariantName() : uint
   {
      var _loc1_:* = 0;
      var _loc2_:* = _mode;
      switch(_loc2_)
      {
         case "shadow":
            _loc1_ = uint(3);
            break;
         case "glow":
            _loc1_ = uint(2);
            break;
         case "outline":
            _loc1_ = uint(1);
            break;
         default:
            _loc1_ = uint(0);
      }
      if(_multiChannel)
      {
         _loc1_ = uint(_loc1_ | 4);
      }
      return super.programVariantName | _loc1_ << 8;
   }
   
   public function get scale() : Number
   {
      return _scale;
   }
   
   public function set scale(param1:Number) : void
   {
      _scale = param1;
   }
   
   public function get mode() : String
   {
      return _mode;
   }
   
   public function set mode(param1:String) : void
   {
      _mode = param1;
   }
   
   public function get multiChannel() : Boolean
   {
      return _multiChannel;
   }
   
   public function set multiChannel(param1:Boolean) : void
   {
      _multiChannel = param1;
   }
}
