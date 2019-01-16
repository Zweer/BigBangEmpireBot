package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.filter.IDisplayObjectFilter;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.tween.ITween;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DisplayObject implements IDisplayObject
   {
       
      
      protected var _displayObject:IDisplayObject;
      
      public function DisplayObject(param1:IDisplayObject)
      {
         super();
         _displayObject = param1;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _displayObject;
      }
      
      public function dispose() : void
      {
         _displayObject.dispose();
      }
      
      public function applySettings(param1:TypedObject) : void
      {
         _displayObject.applySettings(param1);
      }
      
      public function get onAdded() : ISignal
      {
         return _displayObject.onAdded;
      }
      
      public function get onAddedToStage() : ISignal
      {
         return _displayObject.onAddedToStage;
      }
      
      public function get onRemoved() : ISignal
      {
         return _displayObject.onRemoved;
      }
      
      public function get onRemovedFromStage() : ISignal
      {
         return _displayObject.onRemovedFromStage;
      }
      
      public function get onEnterFrame() : ISignal
      {
         return _displayObject.onEnterFrame;
      }
      
      public function get isAddedToStage() : Boolean
      {
         return _displayObject.isAddedToStage;
      }
      
      public function set x(param1:Number) : void
      {
         _displayObject.x = param1;
      }
      
      public function get x() : Number
      {
         return _displayObject.x;
      }
      
      public function set y(param1:Number) : void
      {
         _displayObject.y = param1;
      }
      
      public function get y() : Number
      {
         return _displayObject.y;
      }
      
      public function set pivotX(param1:Number) : void
      {
         _displayObject.pivotX = param1;
      }
      
      public function get pivotX() : Number
      {
         return _displayObject.pivotX;
      }
      
      public function set pivotY(param1:Number) : void
      {
         _displayObject.pivotY = param1;
      }
      
      public function get pivotY() : Number
      {
         return _displayObject.pivotY;
      }
      
      public function set width(param1:Number) : void
      {
         _displayObject.width = param1;
      }
      
      public function get width() : Number
      {
         return _displayObject.width;
      }
      
      public function set height(param1:Number) : void
      {
         _displayObject.height = param1;
      }
      
      public function get height() : Number
      {
         return _displayObject.height;
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         _displayObject.resize(param1,param2);
      }
      
      public function set scale(param1:Number) : void
      {
         _displayObject.scale = param1;
      }
      
      public function get scale() : Number
      {
         return _displayObject.scale;
      }
      
      public function set scaleX(param1:Number) : void
      {
         _displayObject.scaleX = param1;
      }
      
      public function get scaleX() : Number
      {
         return _displayObject.scaleX;
      }
      
      public function set scaleY(param1:Number) : void
      {
         _displayObject.scaleY = param1;
      }
      
      public function get scaleY() : Number
      {
         return _displayObject.scaleY;
      }
      
      public function set skewX(param1:Number) : void
      {
         _displayObject.skewX = param1;
      }
      
      public function get skewX() : Number
      {
         return _displayObject.skewX;
      }
      
      public function set skewY(param1:Number) : void
      {
         _displayObject.skewY = param1;
      }
      
      public function get skewY() : Number
      {
         return _displayObject.skewY;
      }
      
      public function set alpha(param1:Number) : void
      {
         _displayObject.alpha = param1;
      }
      
      public function get alpha() : Number
      {
         return _displayObject.alpha;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _displayObject.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _displayObject.visible;
      }
      
      public function set rotation(param1:Number) : void
      {
         _displayObject.rotation = param1;
      }
      
      public function get rotation() : Number
      {
         return _displayObject.rotation;
      }
      
      public function set name(param1:String) : void
      {
         _displayObject.name = param1;
      }
      
      public function get name() : String
      {
         return _displayObject.name;
      }
      
      public function set mask(param1:IDisplayObject) : void
      {
         _displayObject.mask = param1;
      }
      
      public function get mask() : IDisplayObject
      {
         return _displayObject.mask;
      }
      
      public function get parent() : IDisplayObjectContainer
      {
         return _displayObject.parent;
      }
      
      public function get bounds() : Rectangle
      {
         return _displayObject.bounds;
      }
      
      public function getBounds(param1:IDisplayObject, param2:Rectangle = null) : Rectangle
      {
         return _displayObject.getBounds(param1,param2);
      }
      
      public function hitTest(param1:Point) : IDisplayObject
      {
         return _displayObject.hitTest(param1);
      }
      
      public function hitTestMask(param1:Point) : Boolean
      {
         return _displayObject.hitTestMask(param1);
      }
      
      public function alignPivot(param1:Align, param2:Align) : void
      {
         _displayObject.alignPivot(param1,param2);
      }
      
      public function align(param1:Align, param2:Align, param3:Number = 0, param4:Number = 0) : void
      {
         _displayObject.align(param1,param2,param3,param4);
      }
      
      public function addFilter(param1:IDisplayObjectFilter) : void
      {
         _displayObject.addFilter(param1);
      }
      
      public function removeFilter(param1:IDisplayObjectFilter) : void
      {
         _displayObject.removeFilter(param1);
      }
      
      public function removeAllFilters() : void
      {
         _displayObject.removeAllFilters();
      }
      
      public function get filters() : Vector.<IDisplayObjectFilter>
      {
         return _displayObject.filters;
      }
      
      public function bringToTop() : void
      {
         _displayObject.bringToTop();
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         return _displayObject.localToGlobal(param1,param2);
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         return _displayObject.globalToLocal(param1,param2);
      }
      
      public function get transformationMatrix() : Matrix
      {
         return _displayObject.transformationMatrix;
      }
      
      public function get globalX() : Number
      {
         return _displayObject.globalX;
      }
      
      public function get globalY() : Number
      {
         return _displayObject.globalY;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _displayObject.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         _displayObject.colorTransform = param1;
      }
      
      public function get nativeInstance() : Object
      {
         return _displayObject.nativeInstance;
      }
      
      public function tweenTo(param1:Number, param2:Object) : ITween
      {
         return _displayObject.tweenTo(param1,param2);
      }
      
      public function tweenFrom(param1:Number, param2:Object) : ITween
      {
         return _displayObject.tweenFrom(param1,param2);
      }
      
      public function tweenFromTo(param1:Number, param2:Object, param3:Object) : ITween
      {
         return _displayObject.tweenFromTo(param1,param2,param3);
      }
      
      public function killTweens(param1:Boolean = false, param2:Object = null) : void
      {
         _displayObject.killTweens(param1,param2);
      }
      
      public function get isTweening() : Boolean
      {
         return _displayObject.isTweening;
      }
   }
}
