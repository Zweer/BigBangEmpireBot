package com.playata.application.data.movie
{
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   
   public class ColorMatrix
   {
      
      public static const COLOR_DEFICIENCY_TYPES:Array = ["Protanopia","Protanomaly","Deuteranopia","Deuteranomaly","Tritanopia","Tritanomaly","Achromatopsia","Achromatomaly"];
      
      private static const LUMA_R:Number = 0.212671;
      
      private static const LUMA_G:Number = 0.71516;
      
      private static const LUMA_B:Number = 0.072169;
      
      private static const LUMA_R2:Number = 0.3086;
      
      private static const LUMA_G2:Number = 0.6094;
      
      private static const LUMA_B2:Number = 0.082;
      
      private static const ONETHIRD:Number = 0.3333333333333333;
      
      private static const IDENTITY:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      private static const RAD:Number = 0.017453292519943295;
       
      
      public var matrix:Array;
      
      private var preHue:ColorMatrix;
      
      private var postHue:ColorMatrix;
      
      private var hueInitialized:Boolean;
      
      public function ColorMatrix(param1:Object = null)
      {
         super();
         if(param1 is ColorMatrix)
         {
            matrix = param1.matrix.concat();
         }
         else if(param1 is Array)
         {
            matrix = param1.concat();
         }
         else
         {
            reset();
         }
      }
      
      public function reset() : void
      {
         matrix = IDENTITY.concat();
      }
      
      public function clone() : ColorMatrix
      {
         return new ColorMatrix(matrix);
      }
      
      public function invert() : void
      {
         concat([-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0]);
      }
      
      public function adjustSaturation(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc3_ = 1 - param1;
         _loc2_ = _loc3_ * 0.212671;
         _loc4_ = _loc3_ * 0.71516;
         _loc5_ = _loc3_ * 0.072169;
         concat([_loc2_ + param1,_loc4_,_loc5_,0,0,_loc2_,_loc4_ + param1,_loc5_,0,0,_loc2_,_loc4_,_loc5_ + param1,0,0,0,0,0,1,0]);
      }
      
      public function adjustContrast(param1:Number, param2:Number = NaN, param3:Number = NaN) : void
      {
         if(isNaN(param2))
         {
            param2 = param1;
         }
         if(isNaN(param3))
         {
            param3 = param1;
         }
         param1 = param1 + 1;
         param2 = Number(param2 + 1);
         param3 = Number(param3 + 1);
         concat([param1,0,0,0,128 * (1 - param1),0,param2,0,0,128 * (1 - param2),0,0,param3,0,128 * (1 - param3),0,0,0,1,0]);
      }
      
      public function adjustBrightness(param1:Number, param2:Number = NaN, param3:Number = NaN) : void
      {
         if(isNaN(param2))
         {
            param2 = param1;
         }
         if(isNaN(param3))
         {
            param3 = param1;
         }
         concat([1,0,0,0,param1,0,1,0,0,param2,0,0,1,0,param3,0,0,0,1,0]);
      }
      
      public function toGreyscale(param1:Number, param2:Number, param3:Number) : void
      {
         concat([param1,param2,param3,0,0,param1,param2,param3,0,0,param1,param2,param3,0,0,0,0,0,1,0]);
      }
      
      public function adjustHue(param1:Number) : void
      {
         param1 = param1 * 0.0174532925199433;
         var _loc2_:Number = Math.cos(param1);
         var _loc3_:Number = Math.sin(param1);
         concat([0.212671 + _loc2_ * (1 - 0.212671) + _loc3_ * -0.212671,0.71516 + _loc2_ * -0.71516 + _loc3_ * -0.71516,0.072169 + _loc2_ * -0.072169 + _loc3_ * (1 - 0.072169),0,0,0.212671 + _loc2_ * -0.212671 + _loc3_ * 0.143,0.71516 + _loc2_ * (1 - 0.71516) + _loc3_ * 0.14,0.072169 + _loc2_ * -0.072169 + _loc3_ * -0.283,0,0,0.212671 + _loc2_ * -0.212671 + _loc3_ * -0.787329,0.71516 + _loc2_ * -0.71516 + _loc3_ * 0.71516,0.072169 + _loc2_ * (1 - 0.072169) + _loc3_ * 0.072169,0,0,0,0,0,1,0]);
      }
      
      public function rotateHue(param1:Number) : void
      {
         initHue();
         concat(preHue.matrix);
         rotateBlue(param1);
         concat(postHue.matrix);
      }
      
      public function luminance2Alpha() : void
      {
         concat([0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,0.212671,0.71516,0.072169,0,0]);
      }
      
      public function adjustAlphaContrast(param1:Number) : void
      {
         param1 = param1 + 1;
         concat([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,param1,128 * (1 - param1)]);
      }
      
      public function colorize(param1:int, param2:Number = 1) : void
      {
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         _loc3_ = (param1 >> 16 & 255) / 255;
         _loc5_ = (param1 >> 8 & 255) / 255;
         _loc4_ = (param1 & 255) / 255;
         _loc6_ = 1 - param2;
         concat([_loc6_ + param2 * _loc3_ * 0.212671,param2 * _loc3_ * 0.71516,param2 * _loc3_ * 0.072169,0,0,param2 * _loc5_ * 0.212671,_loc6_ + param2 * _loc5_ * 0.71516,param2 * _loc5_ * 0.072169,0,0,param2 * _loc4_ * 0.212671,param2 * _loc4_ * 0.71516,_loc6_ + param2 * _loc4_ * 0.072169,0,0,0,0,0,1,0]);
      }
      
      public function setChannels(param1:int = 1, param2:int = 2, param3:int = 4, param4:int = 8) : void
      {
         var _loc5_:Number = ((param1 & 1) == 1?1:0) + ((param1 & 2) == 2?1:0) + ((param1 & 4) == 4?1:0) + ((param1 & 8) == 8?1:0);
         if(_loc5_ > 0)
         {
            _loc5_ = 1 / _loc5_;
         }
         var _loc8_:Number = ((param2 & 1) == 1?1:0) + ((param2 & 2) == 2?1:0) + ((param2 & 4) == 4?1:0) + ((param2 & 8) == 8?1:0);
         if(_loc8_ > 0)
         {
            _loc8_ = 1 / _loc8_;
         }
         var _loc6_:Number = ((param3 & 1) == 1?1:0) + ((param3 & 2) == 2?1:0) + ((param3 & 4) == 4?1:0) + ((param3 & 8) == 8?1:0);
         if(_loc6_ > 0)
         {
            _loc6_ = 1 / _loc6_;
         }
         var _loc7_:Number = ((param4 & 1) == 1?1:0) + ((param4 & 2) == 2?1:0) + ((param4 & 4) == 4?1:0) + ((param4 & 8) == 8?1:0);
         if(_loc7_ > 0)
         {
            _loc7_ = 1 / _loc7_;
         }
         concat([(param1 & 1) == 1?_loc5_:0,(param1 & 2) == 2?_loc5_:0,(param1 & 4) == 4?_loc5_:0,(param1 & 8) == 8?_loc5_:0,0,(param2 & 1) == 1?_loc8_:0,(param2 & 2) == 2?_loc8_:0,(param2 & 4) == 4?_loc8_:0,(param2 & 8) == 8?_loc8_:0,0,(param3 & 1) == 1?_loc6_:0,(param3 & 2) == 2?_loc6_:0,(param3 & 4) == 4?_loc6_:0,(param3 & 8) == 8?_loc6_:0,0,(param4 & 1) == 1?_loc7_:0,(param4 & 2) == 2?_loc7_:0,(param4 & 4) == 4?_loc7_:0,(param4 & 8) == 8?_loc7_:0,0]);
      }
      
      public function blend(param1:ColorMatrix, param2:Number) : void
      {
         var _loc4_:Number = 1 - param2;
         var _loc3_:int = 0;
         while(_loc3_ < 20)
         {
            matrix[_loc3_] = _loc4_ * matrix[_loc3_] + param2 * param1.matrix[_loc3_];
            _loc3_++;
         }
      }
      
      public function extrapolate(param1:ColorMatrix, param2:Number) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 20)
         {
            var _loc4_:* = _loc3_;
            var _loc5_:* = matrix[_loc4_] + (param1.matrix[_loc3_] - matrix[_loc3_]) * param2;
            matrix[_loc4_] = _loc5_;
            _loc3_++;
         }
      }
      
      public function average(param1:Number = 0.3333333333333333, param2:Number = 0.3333333333333333, param3:Number = 0.3333333333333333) : void
      {
         concat([param1,param2,param3,0,0,param1,param2,param3,0,0,param1,param2,param3,0,0,0,0,0,1,0]);
      }
      
      public function threshold(param1:Number, param2:Number = 256) : void
      {
         concat([0.212671 * param2,0.71516 * param2,0.072169 * param2,0,-(param2 - 1) * param1,0.212671 * param2,0.71516 * param2,0.072169 * param2,0,-(param2 - 1) * param1,0.212671 * param2,0.71516 * param2,0.072169 * param2,0,-(param2 - 1) * param1,0,0,0,1,0]);
      }
      
      public function threshold_rgb(param1:Number, param2:Number = 256) : void
      {
         concat([param2,0,0,0,-(param2 - 1) * param1,0,param2,0,0,-(param2 - 1) * param1,0,0,param2,0,-(param2 - 1) * param1,0,0,0,1,0]);
      }
      
      public function desaturate() : void
      {
         concat([0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0.212671,0.71516,0.072169,0,0,0,0,0,1,0]);
      }
      
      public function randomize(param1:Number = 1) : void
      {
         var _loc13_:Number = 1 - param1;
         var _loc14_:Number = _loc13_ + param1 * (Math.random() - Math.random());
         var _loc7_:Number = param1 * (Math.random() - Math.random());
         var _loc10_:Number = param1 * (Math.random() - Math.random());
         var _loc4_:Number = param1 * 255 * (Math.random() - Math.random());
         var _loc2_:Number = param1 * (Math.random() - Math.random());
         var _loc8_:Number = _loc13_ + param1 * (Math.random() - Math.random());
         var _loc11_:Number = param1 * (Math.random() - Math.random());
         var _loc5_:Number = param1 * 255 * (Math.random() - Math.random());
         var _loc3_:Number = param1 * (Math.random() - Math.random());
         var _loc9_:Number = param1 * (Math.random() - Math.random());
         var _loc12_:Number = _loc13_ + param1 * (Math.random() - Math.random());
         var _loc6_:Number = param1 * 255 * (Math.random() - Math.random());
         concat([_loc14_,_loc7_,_loc10_,0,_loc4_,_loc2_,_loc8_,_loc11_,0,_loc5_,_loc3_,_loc9_,_loc12_,0,_loc6_,0,0,0,1,0]);
      }
      
      public function setMultiplicators(param1:Number = 1, param2:Number = 1, param3:Number = 1, param4:Number = 1) : void
      {
         var _loc5_:Array = new Array(param1,0,0,0,0,0,param2,0,0,0,0,0,param3,0,0,0,0,0,param4,0);
         concat(_loc5_);
      }
      
      public function clearChannels(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(param1)
         {
            var _loc5_:* = 0;
            matrix[4] = _loc5_;
            _loc5_ = _loc5_;
            matrix[3] = _loc5_;
            _loc5_ = _loc5_;
            matrix[2] = _loc5_;
            _loc5_ = _loc5_;
            matrix[1] = _loc5_;
            matrix[0] = _loc5_;
         }
         if(param2)
         {
            _loc5_ = 0;
            matrix[9] = _loc5_;
            _loc5_ = _loc5_;
            matrix[8] = _loc5_;
            _loc5_ = _loc5_;
            matrix[7] = _loc5_;
            _loc5_ = _loc5_;
            matrix[6] = _loc5_;
            matrix[5] = _loc5_;
         }
         if(param3)
         {
            _loc5_ = 0;
            matrix[14] = _loc5_;
            _loc5_ = _loc5_;
            matrix[13] = _loc5_;
            _loc5_ = _loc5_;
            matrix[12] = _loc5_;
            _loc5_ = _loc5_;
            matrix[11] = _loc5_;
            matrix[10] = _loc5_;
         }
         if(param4)
         {
            _loc5_ = 0;
            matrix[19] = _loc5_;
            _loc5_ = _loc5_;
            matrix[18] = _loc5_;
            _loc5_ = _loc5_;
            matrix[17] = _loc5_;
            _loc5_ = _loc5_;
            matrix[16] = _loc5_;
            matrix[15] = _loc5_;
         }
      }
      
      public function thresholdAlpha(param1:Number, param2:Number = 256) : void
      {
         concat([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,param2,-param2 * param1]);
      }
      
      public function averageRGB2Alpha() : void
      {
         concat([0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,0.333333333333333,0.333333333333333,0.333333333333333,0,0]);
      }
      
      public function invertAlpha() : void
      {
         concat([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,-1,255]);
      }
      
      public function rgb2Alpha(param1:Number, param2:Number, param3:Number) : void
      {
         concat([0,0,0,0,255,0,0,0,0,255,0,0,0,0,255,param1,param2,param3,0,0]);
      }
      
      public function setAlpha(param1:Number) : void
      {
         concat([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,param1,0]);
      }
      
      public function get filter() : ColorMatrixFilter
      {
         return new ColorMatrixFilter(matrix);
      }
      
      public function applyFilter(param1:BitmapData) : void
      {
         param1.applyFilter(param1,param1.rect,new Point(),filter);
      }
      
      public function concat(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            _loc3_ = 0;
            while(_loc3_ < 5)
            {
               _loc2_[int(_loc4_ + _loc3_)] = param1[_loc4_] * matrix[_loc3_] + param1[int(_loc4_ + 1)] * matrix[int(_loc3_ + 5)] + param1[int(_loc4_ + 2)] * matrix[int(_loc3_ + 10)] + param1[int(_loc4_ + 3)] * matrix[int(_loc3_ + 15)] + (_loc3_ == 4?param1[int(_loc4_ + 4)]:0);
               _loc3_++;
            }
            _loc4_ = _loc4_ + 5;
            _loc5_++;
         }
         matrix = _loc2_;
      }
      
      public function rotateRed(param1:Number) : void
      {
         rotateColor(param1,2,1);
      }
      
      public function rotateGreen(param1:Number) : void
      {
         rotateColor(param1,0,2);
      }
      
      public function rotateBlue(param1:Number) : void
      {
         rotateColor(param1,1,0);
      }
      
      public function normalize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = NaN;
         var _loc3_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               _loc2_ = Number(_loc2_ + matrix[_loc1_ * 5 + _loc3_] * matrix[_loc1_ * 5 + _loc3_]);
               _loc3_++;
            }
            _loc2_ = Number(1 / Math.sqrt(_loc2_));
            if(_loc2_ != 1)
            {
               _loc3_ = 0;
               while(_loc3_ < 4)
               {
                  var _loc4_:* = _loc1_ * 5 + _loc3_;
                  var _loc5_:* = matrix[_loc4_] * _loc2_;
                  matrix[_loc4_] = _loc5_;
                  _loc3_++;
               }
            }
            _loc1_++;
         }
      }
      
      public function fitRange() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:int = 0;
         var _loc5_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            _loc1_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < 4)
            {
               if(matrix[_loc4_ * 5 + _loc7_] < 0)
               {
                  _loc1_ = Number(_loc1_ + matrix[_loc4_ * 5 + _loc7_]);
               }
               else
               {
                  _loc6_ = Number(_loc6_ + matrix[_loc4_ * 5 + _loc7_]);
               }
               _loc7_++;
            }
            _loc5_ = _loc6_ * 255 - _loc1_ * 255;
            _loc3_ = 255 / _loc5_;
            if(_loc3_ != 1)
            {
               _loc7_ = 0;
               while(_loc7_ < 4)
               {
                  var _loc9_:* = _loc4_ * 5 + _loc7_;
                  var _loc10_:* = matrix[_loc9_] * _loc3_;
                  matrix[_loc9_] = _loc10_;
                  _loc7_++;
               }
            }
            _loc1_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < 4)
            {
               if(matrix[_loc4_ * 5 + _loc7_] < 0)
               {
                  _loc1_ = Number(_loc1_ + matrix[_loc4_ * 5 + _loc7_]);
               }
               else
               {
                  _loc6_ = Number(_loc6_ + matrix[_loc4_ * 5 + _loc7_]);
               }
               _loc7_++;
            }
            _loc2_ = _loc1_ * 255;
            _loc8_ = _loc6_ * 255;
            matrix[_loc4_ * 5 + 4] = -(_loc2_ + (_loc8_ - _loc2_) * 0.5 - 127.5);
            _loc4_++;
         }
      }
      
      private function rotateColor(param1:Number, param2:int, param3:int) : void
      {
         param1 = param1 * 0.0174532925199433;
         var _loc4_:Array = IDENTITY.concat();
         var _loc5_:* = Math.cos(param1);
         _loc4_[param3 + param3 * 5] = _loc5_;
         _loc4_[param2 + param2 * 5] = _loc5_;
         _loc4_[param3 + param2 * 5] = Math.sin(param1);
         _loc4_[param2 + param3 * 5] = -Math.sin(param1);
         concat(_loc4_);
      }
      
      public function shearRed(param1:Number, param2:Number) : void
      {
         shearColor(0,1,param1,2,param2);
      }
      
      public function shearGreen(param1:Number, param2:Number) : void
      {
         shearColor(1,0,param1,2,param2);
      }
      
      public function shearBlue(param1:Number, param2:Number) : void
      {
         shearColor(2,0,param1,1,param2);
      }
      
      private function shearColor(param1:int, param2:int, param3:Number, param4:int, param5:Number) : void
      {
         var _loc6_:Array = IDENTITY.concat();
         _loc6_[param2 + param1 * 5] = param3;
         _loc6_[param4 + param1 * 5] = param5;
         concat(_loc6_);
      }
      
      public function applyColorDeficiency(param1:String) : void
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "Protanopia":
               concat([0.567,0.433,0,0,0,0.558,0.442,0,0,0,0,0.242,0.758,0,0,0,0,0,1,0]);
               break;
            case "Protanomaly":
               concat([0.817,0.183,0,0,0,0.333,0.667,0,0,0,0,0.125,0.875,0,0,0,0,0,1,0]);
               break;
            case "Deuteranopia":
               concat([0.625,0.375,0,0,0,0.7,0.3,0,0,0,0,0.3,0.7,0,0,0,0,0,1,0]);
               break;
            case "Deuteranomaly":
               concat([0.8,0.2,0,0,0,0.258,0.742,0,0,0,0,0.142,0.858,0,0,0,0,0,1,0]);
               break;
            case "Tritanopia":
               concat([0.95,0.05,0,0,0,0,0.433,0.567,0,0,0,0.475,0.525,0,0,0,0,0,1,0]);
               break;
            case "Tritanomaly":
               concat([0.967,0.033,0,0,0,0,0.733,0.267,0,0,0,0.183,0.817,0,0,0,0,0,1,0]);
               break;
            case "Achromatopsia":
               concat([0.299,0.587,0.114,0,0,0.299,0.587,0.114,0,0,0.299,0.587,0.114,0,0,0,0,0,1,0]);
               break;
            case "Achromatomaly":
               concat([0.618,0.32,0.062,0,0,0.163,0.775,0.062,0,0,0.163,0.32,0.516,0,0,0,0,0,1,0]);
         }
      }
      
      public function RGB2YUV() : void
      {
         concat([0.299,0.587,0.114,0,0,-0.16874,-0.33126,0.5,0,128,0.5,-0.41869,-0.08131,0,128,0,0,0,1,0]);
      }
      
      public function YUV2RGB() : void
      {
         concat([1,-7.15478381607682e-6,1.40199756622314,0,-179.454772664234,1,-0.344133138656616,-0.714138031005859,0,135.458709716797,1,1.77200257778168,0.0000154256904352224,0,-226.81830444443,0,0,0,1,0]);
      }
      
      public function RGB2YIQ() : void
      {
         concat([0.299,0.587,0.114,0,0,0.595716,-0.274453,-0.321263,0,128,0.211456,-0.522591,-0.311135,0,128,0,0,0,1,0]);
      }
      
      public function autoDesaturate(param1:BitmapData, param2:Boolean = false, param3:Boolean = false, param4:Number = 0.01) : void
      {
         var _loc17_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc10_:int = 0;
         var _loc15_:Number = NaN;
         var _loc22_:* = NaN;
         var _loc18_:* = NaN;
         var _loc13_:* = NaN;
         var _loc9_:Number = NaN;
         var _loc14_:Vector.<Vector.<Number>> = param1.histogram(param1.rect);
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc7_:* = 0;
         var _loc5_:Boolean = false;
         var _loc21_:Vector.<Number> = _loc14_[0];
         var _loc12_:Vector.<Number> = _loc14_[1];
         var _loc11_:Vector.<Number> = _loc14_[2];
         _loc10_ = 0;
         while(_loc10_ < 256)
         {
            _loc19_ = Number(_loc19_ + _loc21_[_loc10_] * _loc10_);
            _loc20_ = Number(_loc20_ + _loc12_[_loc10_] * _loc10_);
            _loc7_ = Number(_loc7_ + _loc11_[_loc10_] * _loc10_);
            _loc10_++;
         }
         var _loc16_:* = Number(_loc19_ + _loc20_ + _loc7_);
         if(_loc16_ == 0)
         {
            _loc16_ = 3;
            _loc7_ = Number(3);
            _loc20_ = Number(3);
            _loc19_ = Number(3);
         }
         _loc19_ = Number(_loc19_ / _loc16_);
         _loc20_ = Number(_loc20_ / _loc16_);
         _loc7_ = Number(_loc7_ / _loc16_);
         var _loc6_:* = 0;
         if(param2)
         {
            _loc15_ = param1.rect.width * param1.rect.height * param4;
            _loc22_ = 0;
            _loc18_ = 0;
            _loc13_ = 0;
            _loc10_ = 0;
            while(_loc10_ < 256)
            {
               _loc22_ = Number(_loc22_ + _loc21_[_loc10_]);
               _loc18_ = Number(_loc18_ + _loc12_[_loc10_]);
               _loc13_ = Number(_loc13_ + _loc11_[_loc10_]);
               if(_loc22_ > _loc15_ || _loc18_ > _loc15_ || _loc13_ > _loc15_)
               {
                  _loc17_ = _loc10_;
                  break;
               }
               _loc10_++;
            }
            _loc22_ = 0;
            _loc18_ = 0;
            _loc13_ = 0;
            _loc10_ = 256;
            while(true, true)
            {
               _loc10_--;
               if(_loc10_ > -1)
               {
                  _loc22_ = Number(_loc22_ + _loc21_[_loc10_]);
                  _loc18_ = Number(_loc18_ + _loc12_[_loc10_]);
                  _loc13_ = Number(_loc13_ + _loc11_[_loc10_]);
                  if(_loc22_ > _loc15_ || _loc18_ > _loc15_ || _loc13_ > _loc15_)
                  {
                     _loc8_ = _loc10_;
                     break;
                  }
                  continue;
               }
               break;
            }
            if(_loc8_ - _loc17_ < 255)
            {
               _loc9_ = 256 / (_loc8_ - _loc17_ + 1);
               _loc19_ = Number(_loc19_ * _loc9_);
               _loc20_ = Number(_loc20_ * _loc9_);
               _loc7_ = Number(_loc7_ * _loc9_);
               _loc6_ = Number(-_loc17_);
            }
         }
         _loc9_ = 1 / Math.sqrt(_loc19_ * _loc19_ + _loc20_ * _loc20_ + _loc7_ * _loc7_);
         _loc19_ = Number(_loc19_ * _loc9_);
         _loc20_ = Number(_loc20_ * _loc9_);
         _loc7_ = Number(_loc7_ * _loc9_);
         if(!param3)
         {
            concat([_loc19_,_loc20_,_loc7_,0,_loc6_,_loc19_,_loc20_,_loc7_,0,_loc6_,_loc19_,_loc20_,_loc7_,0,_loc6_,0,0,0,1,0]);
         }
         else
         {
            concat([0,0,0,0,0,0,0,0,0,0,_loc19_,_loc20_,_loc7_,0,_loc6_,0,0,0,1,0]);
         }
      }
      
      public function invertMatrix() : Boolean
      {
         var _loc1_:Matrix3D = new Matrix3D(Vector.<Number>([matrix[0],matrix[1],matrix[2],matrix[3],matrix[5],matrix[6],matrix[7],matrix[8],matrix[10],matrix[11],matrix[12],matrix[13],matrix[15],matrix[16],matrix[17],matrix[18]]));
         var _loc3_:Boolean = _loc1_.invert();
         if(!_loc3_)
         {
            return false;
         }
         matrix[0] = _loc1_.rawData[0];
         matrix[1] = _loc1_.rawData[1];
         matrix[2] = _loc1_.rawData[2];
         matrix[3] = _loc1_.rawData[3];
         var _loc5_:Number = -(_loc1_.rawData[0] * matrix[4] + _loc1_.rawData[1] * matrix[9] + _loc1_.rawData[2] * matrix[14] + _loc1_.rawData[3] * matrix[15]);
         matrix[5] = _loc1_.rawData[4];
         matrix[6] = _loc1_.rawData[5];
         matrix[7] = _loc1_.rawData[6];
         matrix[8] = _loc1_.rawData[7];
         var _loc6_:Number = -(_loc1_.rawData[4] * matrix[4] + _loc1_.rawData[5] * matrix[9] + _loc1_.rawData[6] * matrix[14] + _loc1_.rawData[7] * matrix[15]);
         matrix[10] = _loc1_.rawData[8];
         matrix[11] = _loc1_.rawData[9];
         matrix[12] = _loc1_.rawData[10];
         matrix[13] = _loc1_.rawData[11];
         var _loc2_:Number = -(_loc1_.rawData[8] * matrix[4] + _loc1_.rawData[9] * matrix[9] + _loc1_.rawData[10] * matrix[14] + _loc1_.rawData[11] * matrix[15]);
         matrix[15] = _loc1_.rawData[12];
         matrix[16] = _loc1_.rawData[13];
         matrix[17] = _loc1_.rawData[14];
         matrix[18] = _loc1_.rawData[15];
         var _loc4_:Number = -(_loc1_.rawData[12] * matrix[4] + _loc1_.rawData[13] * matrix[9] + _loc1_.rawData[14] * matrix[14] + _loc1_.rawData[15] * matrix[15]);
         matrix[4] = _loc5_;
         matrix[9] = _loc6_;
         matrix[14] = _loc2_;
         matrix[19] = _loc4_;
         return true;
      }
      
      public function applyMatrix(param1:uint) : uint
      {
         var _loc4_:Number = param1 >>> 24 & 255;
         var _loc6_:Number = param1 >>> 16 & 255;
         var _loc8_:Number = param1 >>> 8 & 255;
         var _loc7_:Number = param1 & 255;
         var _loc2_:int = 0.5 + _loc6_ * matrix[0] + _loc8_ * matrix[1] + _loc7_ * matrix[2] + _loc4_ * matrix[3] + matrix[4];
         var _loc9_:int = 0.5 + _loc6_ * matrix[5] + _loc8_ * matrix[6] + _loc7_ * matrix[7] + _loc4_ * matrix[8] + matrix[9];
         var _loc3_:int = 0.5 + _loc6_ * matrix[10] + _loc8_ * matrix[11] + _loc7_ * matrix[12] + _loc4_ * matrix[13] + matrix[14];
         var _loc5_:int = 0.5 + _loc6_ * matrix[15] + _loc8_ * matrix[16] + _loc7_ * matrix[17] + _loc4_ * matrix[18] + matrix[19];
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(_loc5_ > 255)
         {
            _loc5_ = 255;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > 255)
         {
            _loc2_ = 255;
         }
         if(_loc9_ < 0)
         {
            _loc9_ = 0;
         }
         if(_loc9_ > 255)
         {
            _loc9_ = 255;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > 255)
         {
            _loc3_ = 255;
         }
         return _loc5_ << 24 | _loc2_ << 16 | _loc9_ << 8 | _loc3_;
      }
      
      public function transformVector(param1:Array) : void
      {
         if(param1.length != 4)
         {
            return;
         }
         var _loc3_:Number = param1[0] * matrix[0] + param1[1] * matrix[1] + param1[2] * matrix[2] + param1[3] * matrix[3] + matrix[4];
         var _loc5_:Number = param1[0] * matrix[5] + param1[1] * matrix[6] + param1[2] * matrix[7] + param1[3] * matrix[8] + matrix[9];
         var _loc4_:Number = param1[0] * matrix[10] + param1[1] * matrix[11] + param1[2] * matrix[12] + param1[3] * matrix[13] + matrix[14];
         var _loc2_:Number = param1[0] * matrix[15] + param1[1] * matrix[16] + param1[2] * matrix[17] + param1[3] * matrix[18] + matrix[19];
         param1[0] = _loc3_;
         param1[1] = _loc5_;
         param1[2] = _loc4_;
         param1[3] = _loc2_;
      }
      
      private function initHue() : void
      {
         var _loc4_:* = null;
         var _loc1_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc2_:* = 39.182655;
         if(!hueInitialized)
         {
            hueInitialized = true;
            preHue = new ColorMatrix();
            preHue.rotateRed(45);
            preHue.rotateGreen(-_loc2_);
            _loc4_ = [0.3086,0.6094,0.082,1];
            preHue.transformVector(_loc4_);
            _loc1_ = _loc4_[0] / _loc4_[2];
            _loc3_ = _loc4_[1] / _loc4_[2];
            preHue.shearBlue(_loc1_,_loc3_);
            postHue = new ColorMatrix();
            postHue.shearBlue(-_loc1_,-_loc3_);
            postHue.rotateGreen(_loc2_);
            postHue.rotateRed(-45);
         }
      }
      
      public function toString() : String
      {
         return matrix.toString();
      }
   }
}
