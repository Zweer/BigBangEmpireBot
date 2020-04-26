package com.playata.framework.display
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.filter.IDisplayObjectFilter;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.tween.ITween;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public interface IDisplayObject extends IDisposable
   {
       
      
      function get onAdded() : ISignal;
      
      function get onAddedToStage() : ISignal;
      
      function get onRemoved() : ISignal;
      
      function get onRemovedFromStage() : ISignal;
      
      function get onEnterFrame() : ISignal;
      
      function get isAddedToStage() : Boolean;
      
      function applySettings(param1:TypedObject) : void;
      
      function set x(param1:Number) : void;
      
      function get x() : Number;
      
      function set y(param1:Number) : void;
      
      function get y() : Number;
      
      function set pivotX(param1:Number) : void;
      
      function get pivotX() : Number;
      
      function set pivotY(param1:Number) : void;
      
      function get pivotY() : Number;
      
      function set width(param1:Number) : void;
      
      function get width() : Number;
      
      function set height(param1:Number) : void;
      
      function get height() : Number;
      
      function resize(param1:Number, param2:Number) : void;
      
      function set scale(param1:Number) : void;
      
      function get scale() : Number;
      
      function set scaleX(param1:Number) : void;
      
      function get scaleX() : Number;
      
      function set scaleY(param1:Number) : void;
      
      function get scaleY() : Number;
      
      function set skewX(param1:Number) : void;
      
      function get skewX() : Number;
      
      function set skewY(param1:Number) : void;
      
      function get skewY() : Number;
      
      function set alpha(param1:Number) : void;
      
      function get alpha() : Number;
      
      function set visible(param1:Boolean) : void;
      
      function get visible() : Boolean;
      
      function set rotation(param1:Number) : void;
      
      function get rotation() : Number;
      
      function set name(param1:String) : void;
      
      function get name() : String;
      
      function set mask(param1:IDisplayObject) : void;
      
      function get mask() : IDisplayObject;
      
      function get parent() : IDisplayObjectContainer;
      
      function get bounds() : Rectangle;
      
      function getBounds(param1:IDisplayObject, param2:Rectangle = null) : Rectangle;
      
      function hitTest(param1:Point) : IDisplayObject;
      
      function hitTestMask(param1:Point) : Boolean;
      
      function alignPivot(param1:Align, param2:Align) : void;
      
      function align(param1:Align, param2:Align, param3:Number = 0, param4:Number = 0) : void;
      
      function bringToTop() : void;
      
      function get globalX() : Number;
      
      function get globalY() : Number;
      
      function localToGlobal(param1:Point, param2:Point = null) : Point;
      
      function globalToLocal(param1:Point, param2:Point = null) : Point;
      
      function get transformationMatrix() : Matrix;
      
      function addFilter(param1:IDisplayObjectFilter) : void;
      
      function removeFilter(param1:IDisplayObjectFilter) : void;
      
      function removeAllFilters() : void;
      
      function get filters() : Vector.<IDisplayObjectFilter>;
      
      function get colorTransform() : ColorTransform;
      
      function set colorTransform(param1:ColorTransform) : void;
      
      function get nativeInstance() : Object;
      
      function tweenTo(param1:Number, param2:Object) : ITween;
      
      function tweenFrom(param1:Number, param2:Object) : ITween;
      
      function tweenFromTo(param1:Number, param2:Object, param3:Object) : ITween;
      
      function killTweens(param1:Boolean = false, param2:Object = null) : void;
      
      function get isTweening() : Boolean;
   }
}
