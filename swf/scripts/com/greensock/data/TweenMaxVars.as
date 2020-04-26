package com.greensock.data
{
   import com.greensock.TweenLite;
   import com.greensock.motionPaths.MotionPath;
   import flash.display.Stage;
   import flash.geom.Point;
   
   public class TweenMaxVars
   {
      
      public static const version:String = "12.0.0";
       
      
      protected var _vars:Object;
      
      public function TweenMaxVars(param1:Object = null)
      {
         var _loc2_:* = null;
         super();
         this._vars = {};
         if(param1 != null)
         {
            for(_loc2_ in param1)
            {
               this._vars[_loc2_] = param1[_loc2_];
            }
         }
      }
      
      protected function _set(param1:String, param2:*, param3:Boolean = false) : TweenMaxVars
      {
         if(param2 == null)
         {
            delete this._vars[param1];
         }
         else
         {
            this._vars[param1] = param2;
         }
         if(param3 && !(param1 in TweenLite._plugins))
         {
            trace("WARNING: you must activate() the " + param1 + " plugin in order for the feature to work in TweenMax. See http://www.greensock.com/tweenlite/#plugins for details.");
         }
         return this;
      }
      
      public function prop(param1:String, param2:Number, param3:Boolean = false) : TweenMaxVars
      {
         return this._set(param1,!param3?param2:param2 < 0?"-=" + -param2:"+=" + param2);
      }
      
      public function data(param1:*) : TweenMaxVars
      {
         return this._set("data",param1);
      }
      
      public function delay(param1:Number) : TweenMaxVars
      {
         return this._set("delay",param1);
      }
      
      public function ease(param1:*, param2:Array = null) : TweenMaxVars
      {
         this._set("easeParams",param2);
         return this._set("ease",param1);
      }
      
      public function immediateRender(param1:Boolean) : TweenMaxVars
      {
         return this._set("immediateRender",param1,false);
      }
      
      public function onComplete(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onCompleteParams",param2);
         return this._set("onComplete",param1);
      }
      
      public function onCompleteRender(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onCompleteRenderParams",param2);
         return this._set("onCompleteRender",param1,true);
      }
      
      public function onCompleteListener(param1:Function) : TweenMaxVars
      {
         return this._set("onCompleteListener",param1);
      }
      
      public function onStart(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onStartParams",param2);
         return this._set("onStart",param1);
      }
      
      public function onStartListener(param1:Function) : TweenMaxVars
      {
         return this._set("onStartListener",param1);
      }
      
      public function onUpdate(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onUpdateParams",param2);
         return this._set("onUpdate",param1);
      }
      
      public function onUpdateListener(param1:Function) : TweenMaxVars
      {
         return this._set("onUpdateListener",param1);
      }
      
      public function onRepeat(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onRepeatParams",param2);
         return this._set("onRepeat",param1);
      }
      
      public function onReverseComplete(param1:Function, param2:Array = null) : TweenMaxVars
      {
         this._set("onReverseCompleteParams",param2);
         return this._set("onReverseComplete",param1);
      }
      
      public function onReverseCompleteListener(param1:Function) : TweenMaxVars
      {
         return this._set("onReverseCompleteListener",param1);
      }
      
      public function overwrite(param1:String) : TweenMaxVars
      {
         return this._set("overwrite",param1,false);
      }
      
      public function paused(param1:Boolean) : TweenMaxVars
      {
         return this._set("paused",param1,false);
      }
      
      public function repeat(param1:int) : TweenMaxVars
      {
         return this._set("repeat",param1);
      }
      
      public function repeatDelay(param1:Number) : TweenMaxVars
      {
         return this._set("repeatDelay",param1);
      }
      
      public function reversed(param1:Boolean) : TweenMaxVars
      {
         return this._set("reversed",param1);
      }
      
      public function runBackwards(param1:Boolean) : TweenMaxVars
      {
         return this._set("runBackwards",param1,false);
      }
      
      public function timeScale(param1:Number) : TweenMaxVars
      {
         return this._set("timeScale",param1,false);
      }
      
      public function useFrames(param1:Boolean) : TweenMaxVars
      {
         return this._set("useFrames",param1,false);
      }
      
      public function startAt(param1:TweenMaxVars) : TweenMaxVars
      {
         return this._set("startAt",param1.vars);
      }
      
      public function yoyo(param1:Boolean) : TweenMaxVars
      {
         return this._set("yoyo",param1);
      }
      
      public function move(param1:Number, param2:Number, param3:Boolean = false) : TweenMaxVars
      {
         this.prop("x",param1,param3);
         return this.prop("y",param2,param3);
      }
      
      public function scale(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         this.prop("scaleX",param1,param2);
         return this.prop("scaleY",param1,param2);
      }
      
      public function rotation(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("rotation",param1,param2);
      }
      
      public function scaleX(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("scaleX",param1,param2);
      }
      
      public function scaleY(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("scaleY",param1,param2);
      }
      
      public function width(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("width",param1,param2);
      }
      
      public function height(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("height",param1,param2);
      }
      
      public function x(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("x",param1,param2);
      }
      
      public function y(param1:Number, param2:Boolean = false) : TweenMaxVars
      {
         return this.prop("y",param1,param2);
      }
      
      public function autoAlpha(param1:Number) : TweenMaxVars
      {
         return this._set("autoAlpha",param1,true);
      }
      
      public function bevelFilter(param1:Number = 4, param2:Number = 45, param3:uint = 16777215, param4:Number = 0.5, param5:uint = 0, param6:Number = 0.5, param7:Number = 4, param8:Number = 4, param9:Number = 1, param10:int = 2, param11:Boolean = false, param12:Boolean = false, param13:int = -1) : TweenMaxVars
      {
         var _loc14_:Object = {
            "distance":param1,
            "angle":param2,
            "highlightColor":param3,
            "highlightAlpha":param4,
            "shadowColor":param5,
            "shadowAlpha":param6,
            "blurX":param7,
            "blurY":param8,
            "strength":param9,
            "quality":param10,
            "addFilter":param12,
            "remove":param11
         };
         if(param13 > -1)
         {
            _loc14_.index = param13;
         }
         return this._set("bevelFilter",_loc14_,true);
      }
      
      public function bezier(param1:Array) : TweenMaxVars
      {
         return this._set("bezier",param1,true);
      }
      
      public function bezierThrough(param1:Array) : TweenMaxVars
      {
         return this._set("bezierThrough",param1,true);
      }
      
      public function blurFilter(param1:Number, param2:Number, param3:int = 2, param4:Boolean = false, param5:Boolean = false, param6:int = -1) : TweenMaxVars
      {
         var _loc7_:Object = {
            "blurX":param1,
            "blurY":param2,
            "quality":param3,
            "addFilter":param5,
            "remove":param4
         };
         if(param6 > -1)
         {
            _loc7_.index = param6;
         }
         return this._set("blurFilter",_loc7_,true);
      }
      
      public function circlePath2D(param1:MotionPath, param2:Number, param3:Number, param4:Boolean = false, param5:String = "clockwise", param6:uint = 0, param7:Number = 0, param8:Boolean = false) : TweenMaxVars
      {
         return this._set("circlePath2D",{
            "path":param1,
            "startAngle":param2,
            "endAngle":param3,
            "autoRotate":param4,
            "direction":param5,
            "extraRevolutions":param6,
            "rotationOffset":param7,
            "useRadians":param8
         },true);
      }
      
      public function colorMatrixFilter(param1:uint = 16777215, param2:Number = 1, param3:Number = 1, param4:Number = 1, param5:Number = 1, param6:Number = 0, param7:Number = -1, param8:Boolean = false, param9:Boolean = false, param10:int = -1) : TweenMaxVars
      {
         var _loc11_:Object = {
            "saturation":param3,
            "contrast":param4,
            "brightness":param5,
            "hue":param6,
            "addFilter":param9,
            "remove":param8
         };
         if(param1 != 16777215)
         {
            _loc11_.colorize = param1;
            _loc11_.amount = param2;
         }
         if(param7 > -1)
         {
            _loc11_.threshold = param7;
         }
         if(param10 > -1)
         {
            _loc11_.index = param10;
         }
         return this._set("colorMatrixFilter",_loc11_,true);
      }
      
      public function colorTransform(param1:Number = NaN, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN, param5:Number = NaN, param6:Number = NaN, param7:Number = NaN, param8:Number = NaN, param9:Number = NaN, param10:Number = NaN, param11:Number = NaN, param12:Number = NaN) : TweenMaxVars
      {
         var _loc14_:* = null;
         var _loc13_:Object = {
            "tint":param1,
            "tintAmount":(!!isNaN(param1)?NaN:param2),
            "exposure":param3,
            "brightness":param4,
            "redMultiplier":param5,
            "greenMultiplier":param6,
            "blueMultiplier":param7,
            "alphaMultiplier":param8,
            "redOffset":param9,
            "greenOffset":param10,
            "blueOffset":param11,
            "alphaOffset":param12
         };
         for(_loc14_ in _loc13_)
         {
            if(isNaN(_loc13_[_loc14_]))
            {
               delete _loc13_[_loc14_];
            }
         }
         return this._set("colorTransform",_loc13_,true);
      }
      
      public function dropShadowFilter(param1:Number = 4, param2:Number = 4, param3:Number = 4, param4:Number = 1, param5:Number = 45, param6:uint = 0, param7:Number = 2, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:uint = 2, param12:Boolean = false, param13:Boolean = false, param14:int = -1) : TweenMaxVars
      {
         var _loc15_:Object = {
            "distance":param1,
            "blurX":param2,
            "blurY":param3,
            "alpha":param4,
            "angle":param5,
            "color":param6,
            "strength":param7,
            "inner":param8,
            "knockout":param9,
            "hideObject":param10,
            "quality":param11,
            "addFilter":param13,
            "remove":param12
         };
         if(param14 > -1)
         {
            _loc15_.index = param14;
         }
         return this._set("dropShadowFilter",_loc15_,true);
      }
      
      public function dynamicProps(param1:Object, param2:Object = null) : TweenMaxVars
      {
         if(param2 != null)
         {
            param1.params = param2;
         }
         return this._set("dynamicProps",param1,true);
      }
      
      public function endArray(param1:Array) : TweenMaxVars
      {
         return this._set("endArray",param1,true);
      }
      
      public function frame(param1:int, param2:Boolean = false) : TweenMaxVars
      {
         return this._set("frame",!!param2?String(param1):param1,true);
      }
      
      public function frameBackward(param1:int) : TweenMaxVars
      {
         return this._set("frameBackward",param1,true);
      }
      
      public function frameForward(param1:int) : TweenMaxVars
      {
         return this._set("frameForward",param1,true);
      }
      
      public function frameLabel(param1:String) : TweenMaxVars
      {
         return this._set("frameLabel",param1,true);
      }
      
      public function glowFilter(param1:Number = 10, param2:Number = 10, param3:uint = 16777215, param4:Number = 1, param5:Number = 2, param6:Boolean = false, param7:Boolean = false, param8:uint = 2, param9:Boolean = false, param10:Boolean = false, param11:int = -1) : TweenMaxVars
      {
         var _loc12_:Object = {
            "blurX":param1,
            "blurY":param2,
            "color":param3,
            "alpha":param4,
            "strength":param5,
            "inner":param6,
            "knockout":param7,
            "quality":param8,
            "addFilter":param10,
            "remove":param9
         };
         if(param11 > -1)
         {
            _loc12_.index = param11;
         }
         return this._set("glowFilter",_loc12_,true);
      }
      
      public function hexColors(param1:Object) : TweenMaxVars
      {
         return this._set("hexColors",param1,true);
      }
      
      public function motionBlur(param1:Number = 1, param2:Boolean = false, param3:int = 2, param4:int = 10) : TweenMaxVars
      {
         return this._set("motionBlur",{
            "strength":param1,
            "fastMode":param2,
            "quality":param3,
            "padding":param4
         },true);
      }
      
      public function orientToBezier(param1:Object = null) : TweenMaxVars
      {
         return this._set("orientToBezier",param1 == null?true:param1,false);
      }
      
      public function physics2D(param1:Number, param2:Number, param3:Number = 0, param4:Number = 90, param5:Number = 0) : TweenMaxVars
      {
         return this._set("physics2D",{
            "velocity":param1,
            "angle":param2,
            "acceleration":param3,
            "accelerationAngle":param4,
            "friction":param5
         },true);
      }
      
      public function physicsProps(param1:Object) : TweenMaxVars
      {
         return this._set("physicsProps",param1,true);
      }
      
      public function quaternions(param1:Object) : TweenMaxVars
      {
         return this._set("quaternions",param1,true);
      }
      
      public function removeTint(param1:Boolean = true) : TweenMaxVars
      {
         return this._set("removeTint",param1,true);
      }
      
      public function roundProps(param1:Array) : TweenMaxVars
      {
         return this._set("roundProps",param1,true);
      }
      
      public function scrollRect(param1:Object) : TweenMaxVars
      {
         return this._set("scrollRect",param1,true);
      }
      
      public function setSize(param1:Number = NaN, param2:Number = NaN) : TweenMaxVars
      {
         var _loc3_:Object = {};
         if(!isNaN(param1))
         {
            _loc3_.width = param1;
         }
         if(!isNaN(param2))
         {
            _loc3_.height = param2;
         }
         return this._set("setSize",_loc3_,true);
      }
      
      public function shortRotation(param1:Object) : TweenMaxVars
      {
         if(typeof param1 == "number")
         {
            param1 = {"rotation":param1};
         }
         return this._set("shortRotation",param1,true);
      }
      
      public function soundTransform(param1:Number = 1, param2:Number = 0, param3:Number = 1, param4:Number = 0, param5:Number = 0, param6:Number = 1) : TweenMaxVars
      {
         return this._set("soundTransform",{
            "volume":param1,
            "pan":param2,
            "leftToLeft":param3,
            "leftToRight":param4,
            "rightToLeft":param5,
            "rightToRight":param6
         },true);
      }
      
      public function stageQuality(param1:Stage, param2:String = "medium", param3:String = null) : TweenMaxVars
      {
         if(param3 == null)
         {
            param3 = param1.quality;
         }
         return this._set("stageQuality",{
            "stage":param1,
            "during":param2,
            "after":param3
         },true);
      }
      
      public function throwProps(param1:Object) : TweenMaxVars
      {
         return this._set("throwProps",param1,true);
      }
      
      public function tint(param1:uint) : TweenMaxVars
      {
         return this._set("tint",param1,true);
      }
      
      public function transformAroundCenter(param1:Object) : TweenMaxVars
      {
         return this._set("transformAroundCenter",param1,true);
      }
      
      public function transformAroundPoint(param1:Point, param2:Object) : TweenMaxVars
      {
         param2.point = param1;
         return this._set("transformAroundPoint",param2,true);
      }
      
      public function transformMatrix(param1:Object) : TweenMaxVars
      {
         return this._set("transformMatrix",param1,true);
      }
      
      public function visible(param1:Boolean) : TweenMaxVars
      {
         return this._set("visible",param1,true);
      }
      
      public function volume(param1:Number) : TweenMaxVars
      {
         return this._set("volume",param1,true);
      }
      
      public function get vars() : Object
      {
         return this._vars;
      }
      
      public function get _isGSVars() : Boolean
      {
         return true;
      }
   }
}
