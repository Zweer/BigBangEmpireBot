package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.util.MatrixTransformer;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.filter.AdjustColorFilter;
   import com.playata.framework.display.filter.BlurFilter;
   import com.playata.framework.display.filter.BrightnessFilter;
   import com.playata.framework.display.filter.ContrastFilter;
   import com.playata.framework.display.filter.DropShadowFilter;
   import com.playata.framework.display.filter.GlowFilter;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.display.filter.HueFilter;
   import com.playata.framework.display.filter.IDisplayObjectFilter;
   import com.playata.framework.display.filter.SaturationFilter;
   import com.playata.framework.display.filter.TintFilter;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.tween.ITween;
   import com.playata.framework.tween.Tween;
   import fl.motion.AdjustColor;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FlashDisplayObject extends FlashObject implements IDisplayObject
   {
      
      static var LOOKUP_DO:GenericMap = new GenericMap();
      
      private static const POINT:Point = new Point();
       
      
      var _displayObject:flash.display.DisplayObject = null;
      
      var _pivot:Point;
      
      private var _onAdded:ISignal = null;
      
      private var _onAddedToStage:ISignal = null;
      
      private var _onRemoved:ISignal = null;
      
      private var _onRemovedFromStage:ISignal = null;
      
      private var _onEnterFrame:ISignal = null;
      
      private var _filters:Vector.<IDisplayObjectFilter>;
      
      private var _hasTweens:Boolean = false;
      
      public function FlashDisplayObject(param1:flash.display.DisplayObject)
      {
         _pivot = new Point();
         _filters = new Vector.<IDisplayObjectFilter>(0);
         super();
         _displayObject = param1;
         LOOKUP_DO.setData(_displayObject,this);
      }
      
      public static function getNativeDisplayObject(param1:IDisplayObject) : flash.display.DisplayObject
      {
         if(param1 is FlashDisplayObject)
         {
            return (param1 as FlashDisplayObject)._displayObject;
         }
         if(param1 is FlashDisplayObjectContainer)
         {
            return (param1 as FlashDisplayObjectContainer)._displayObjectContainer;
         }
         if(param1 is FlashImage)
         {
            return (param1 as FlashImage)._image;
         }
         if(param1 is FlashSprite)
         {
            return (param1 as FlashSprite)._sprite;
         }
         if(param1 is FlashShape)
         {
            return (param1 as FlashShape)._shape;
         }
         if(param1 is com.playata.framework.display.DisplayObject)
         {
            return getNativeDisplayObject((param1 as com.playata.framework.display.DisplayObject).displayObject);
         }
         throw new Exception("Unknown display object type");
      }
      
      public function applySettings(param1:TypedObject) : void
      {
         if(!param1)
         {
            return;
         }
         if(hasSetting("wrapper_instance",param1))
         {
            LOOKUP_DO.setData(_displayObject,getSetting("wrapper_instance",param1,null));
         }
         if(hasSetting("name",param1))
         {
            _displayObject.name = getStringSetting("name",param1,null);
         }
         if(hasSetting("scaleX",param1))
         {
            _displayObject.scaleX = getNumberSetting("scaleX",param1,1);
         }
         if(hasSetting("scaleY",param1))
         {
            _displayObject.scaleY = getNumberSetting("scaleY",param1,1);
         }
         if(hasSetting("rotation",param1))
         {
            _displayObject.rotation = getNumberSetting("rotation",param1,0);
         }
         if(hasSetting("x",param1))
         {
            _displayObject.x = getNumberSetting("x",param1,0);
         }
         if(hasSetting("y",param1))
         {
            _displayObject.y = getNumberSetting("y",param1,0);
         }
         if(hasSetting("width",param1))
         {
            _displayObject.width = getNumberSetting("width",param1,0);
         }
         if(hasSetting("height",param1))
         {
            _displayObject.height = getNumberSetting("height",param1,0);
         }
         if(hasSetting("alpha",param1))
         {
            _displayObject.alpha = getNumberSetting("alpha",param1,1);
         }
         if(hasSetting("brightness",param1))
         {
            addFilter(new BrightnessFilter(getNumberSetting("brightness",param1,1)));
         }
         if(hasSetting("tintColor",param1))
         {
            addFilter(new TintFilter(getColorSetting("tintColor",param1,16777215),getNumberSetting("tintPercent",param1,1)));
         }
         if(hasSetting("useHandCursor",param1))
         {
            useHandCursor = getBooleanSetting("useHandCursor",param1,false);
         }
         if(hasSetting("interactionEnabled",param1))
         {
            interactionEnabled = getBooleanSetting("interactionEnabled",param1,false);
         }
      }
      
      public function dispose() : void
      {
         if(_hasTweens)
         {
            killTweens();
         }
         if(_displayObject != null)
         {
            if(LOOKUP_DO.exists(_displayObject))
            {
               LOOKUP_DO.remove(_displayObject);
            }
         }
         if(_onAdded != null)
         {
            _onAdded.removeAll();
            _onAdded = null;
         }
         if(_onAddedToStage != null)
         {
            _onAddedToStage.removeAll();
            _onAddedToStage = null;
         }
         if(_onRemoved != null)
         {
            _onRemoved.removeAll();
            _onRemoved = null;
         }
         if(_onRemovedFromStage != null)
         {
            _onRemovedFromStage.removeAll();
            _onRemovedFromStage = null;
         }
         if(_onEnterFrame != null)
         {
            _onEnterFrame.removeAll();
            _onEnterFrame = null;
         }
      }
      
      public function get onAdded() : ISignal
      {
         if(_onAdded === null)
         {
            _onAdded = new FlashDisplayObjectSignal("added",this,_displayObject);
         }
         return _onAdded;
      }
      
      public function get onAddedToStage() : ISignal
      {
         if(_onAddedToStage === null)
         {
            _onAddedToStage = new FlashDisplayObjectSignal("addedToStage",this,_displayObject);
         }
         return _onAddedToStage;
      }
      
      public function get onRemoved() : ISignal
      {
         if(_onRemoved === null)
         {
            _onRemoved = new FlashDisplayObjectSignal("removed",this,_displayObject);
         }
         return _onRemoved;
      }
      
      public function get onRemovedFromStage() : ISignal
      {
         if(_onRemovedFromStage === null)
         {
            _onRemovedFromStage = new FlashDisplayObjectSignal("removedFromStage",this,_displayObject);
         }
         return _onRemovedFromStage;
      }
      
      public function get onEnterFrame() : ISignal
      {
         if(_onEnterFrame === null)
         {
            _onEnterFrame = new FlashDisplayObjectSignal("enterFrame",this,_displayObject);
         }
         return _onEnterFrame;
      }
      
      public function get isAddedToStage() : Boolean
      {
         return _displayObject.stage != null;
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
         _pivot.x = param1;
      }
      
      public function get pivotX() : Number
      {
         return _pivot.x;
      }
      
      public function set pivotY(param1:Number) : void
      {
         _pivot.y = param1;
      }
      
      public function get pivotY() : Number
      {
         return _pivot.y;
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
         _displayObject.width = param1;
         _displayObject.height = param2;
      }
      
      public function set scale(param1:Number) : void
      {
         _displayObject.scaleX = param1;
         _displayObject.scaleY = param1;
      }
      
      public function get scale() : Number
      {
         return _displayObject.scaleX;
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
         _displayObject.transform.matrix = MatrixTransformer.skew(_displayObject.transform.matrix,param1,"right");
      }
      
      public function get skewX() : Number
      {
         var _loc2_:Matrix = _displayObject.transform.matrix;
         var _loc1_:Number = _loc2_.c / 3.14159265358979 * 180;
         return _loc1_;
      }
      
      public function set skewY(param1:Number) : void
      {
         _displayObject.transform.matrix = MatrixTransformer.skew(_displayObject.transform.matrix,param1,"bottom");
      }
      
      public function get skewY() : Number
      {
         var _loc2_:Matrix = _displayObject.transform.matrix;
         var _loc1_:Number = _loc2_.b / 3.14159265358979 * 180;
         return _loc1_;
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
         var _loc2_:* = null;
         if(param1 == null)
         {
            _displayObject.mask = null;
         }
         else
         {
            _loc2_ = getNativeDisplayObject(param1);
            if(_loc2_)
            {
               _displayObject.mask = _loc2_;
            }
         }
      }
      
      public function get mask() : IDisplayObject
      {
         if(_displayObject.mask == null)
         {
            return null;
         }
         if(LOOKUP_DO.exists(_displayObject.mask))
         {
            return LOOKUP_DO.getData(_displayObject.mask);
         }
         return null;
      }
      
      public function get parent() : IDisplayObjectContainer
      {
         if(_displayObject.parent == null)
         {
            return null;
         }
         if(LOOKUP_DO.exists(_displayObject.parent))
         {
            return LOOKUP_DO.getData(_displayObject.parent);
         }
         return null;
      }
      
      public function get bounds() : Rectangle
      {
         return _displayObject.getBounds(_displayObject.parent);
      }
      
      public function getBounds(param1:IDisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         param2.copyFrom(_displayObject.getBounds(getNativeDisplayObject(param1)));
         return param2;
      }
      
      public function hitTest(param1:Point) : IDisplayObject
      {
         var _loc3_:Point = localToGlobal(param1);
         var _loc2_:Boolean = _displayObject.hitTestPoint(_loc3_.x,_loc3_.y);
         if(!_loc2_)
         {
            return null;
         }
         return this;
      }
      
      public function hitTestMask(param1:Point) : Boolean
      {
         var _loc2_:Boolean = _displayObject.mask.hitTestPoint(param1.x,param1.y);
         if(!_loc2_)
         {
            return false;
         }
         return true;
      }
      
      public function alignPivot(param1:Align, param2:Align) : void
      {
      }
      
      public function align(param1:Align, param2:Align, param3:Number = 0, param4:Number = 0) : void
      {
         var _loc6_:* = null;
         var _loc5_:flash.display.DisplayObject = getNativeDisplayObject(this);
         POINT.x = param2 == Align.LEFT?0:param2 == Align.CENTER?DisplayCoreConfig.layout.appWidth >> 1:DisplayCoreConfig.layout.appWidth;
         POINT.y = param1 == Align.TOP?0:param1 == Align.CENTER?DisplayCoreConfig.layout.appHeight >> 1:DisplayCoreConfig.layout.appHeight;
         if(_loc5_.parent != null)
         {
            _loc6_ = _loc5_.parent.globalToLocal(POINT);
            POINT.x = _loc6_.x;
            POINT.y = _loc6_.y;
         }
         _loc5_.x = POINT.x + param3;
         _loc5_.y = POINT.y + param4;
      }
      
      public function addFilter(param1:IDisplayObjectFilter) : void
      {
         var _loc4_:* = null;
         var _loc14_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc8_:* = null;
         var _loc19_:* = null;
         var _loc12_:* = null;
         var _loc9_:* = null;
         var _loc13_:* = null;
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc5_:* = null;
         var _loc21_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc20_:* = null;
         var _loc6_:* = null;
         var _loc11_:* = null;
         var _loc18_:ColorMatrixFilter = null;
         var _loc3_:AdjustColor = null;
         var _loc22_:* = param1.name;
         switch(_loc22_)
         {
            case "grayscale":
               _loc4_ = param1 as GrayscaleFilter;
               _loc14_ = _loc4_.r;
               _loc7_ = _loc4_.g;
               _loc2_ = _loc4_.b;
               _loc8_ = [];
               _loc8_ = _loc8_.concat([_loc14_,_loc7_,_loc2_,0,0]);
               _loc8_ = _loc8_.concat([_loc14_,_loc7_,_loc2_,0,0]);
               _loc8_ = _loc8_.concat([_loc14_,_loc7_,_loc2_,0,0]);
               _loc8_ = _loc8_.concat([0,0,0,_loc4_.a,0]);
               _loc18_ = new ColorMatrixFilter(_loc8_);
               appendFilter(_loc18_);
               break;
            case "invert":
               _loc18_ = new ColorMatrixFilter([-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0]);
               appendFilter(_loc18_);
               break;
            case "brightness":
               _loc19_ = param1 as BrightnessFilter;
               _loc3_ = new AdjustColor();
               _loc3_.brightness = _loc19_.value * 100;
               _loc3_.contrast = 0;
               _loc3_.hue = 0;
               _loc3_.saturation = 0;
               _loc18_ = new ColorMatrixFilter(_loc3_.CalculateFinalFlatArray());
               appendFilter(_loc18_);
               break;
            case "contrast":
               _loc12_ = param1 as ContrastFilter;
               _loc3_ = new AdjustColor();
               _loc3_.brightness = 0;
               _loc3_.contrast = _loc12_.value * 100;
               _loc3_.hue = 0;
               _loc3_.saturation = 0;
               _loc18_ = new ColorMatrixFilter(_loc3_.CalculateFinalFlatArray());
               appendFilter(_loc18_);
               break;
            case "hue":
               _loc9_ = param1 as HueFilter;
               _loc3_ = new AdjustColor();
               _loc3_.brightness = 0;
               _loc3_.contrast = 0;
               _loc3_.hue = _loc9_.value * 100;
               _loc3_.saturation = 0;
               _loc18_ = new ColorMatrixFilter(_loc3_.CalculateFinalFlatArray());
               appendFilter(_loc18_);
               break;
            case "saturation":
               _loc13_ = param1 as SaturationFilter;
               _loc3_ = new AdjustColor();
               _loc3_.brightness = 0;
               _loc3_.contrast = 0;
               _loc3_.hue = 0;
               _loc3_.saturation = _loc13_.value * 100;
               _loc18_ = new ColorMatrixFilter(_loc3_.CalculateFinalFlatArray());
               appendFilter(_loc18_);
               break;
            case "tint":
               _loc10_ = param1 as TintFilter;
               _loc15_ = new ColorTransform();
               _loc15_.color = _loc10_.color;
               _displayObject.transform.colorTransform = _loc15_;
               break;
            case "glow":
               _loc5_ = param1 as com.playata.framework.display.filter.GlowFilter;
               _loc21_ = new flash.filters.GlowFilter(_loc5_.color,_loc5_.alpha,_loc5_.blur,_loc5_.blur,_loc5_.strength,_loc5_.resolution);
               appendFilter(_loc21_);
               break;
            case "dropshadow":
               _loc16_ = param1 as com.playata.framework.display.filter.DropShadowFilter;
               _loc17_ = new flash.filters.DropShadowFilter(_loc16_.distance,_loc16_.angle,_loc16_.color,_loc16_.alpha,_loc16_.blur,_loc16_.blur,1,_loc16_.resolution);
               appendFilter(_loc17_);
               break;
            case "adjustcolor":
               _loc20_ = param1 as AdjustColorFilter;
               _loc3_ = new AdjustColor();
               _loc3_.brightness = _loc20_.brightness;
               _loc3_.contrast = _loc20_.contrast;
               _loc3_.hue = _loc20_.hue;
               _loc3_.saturation = _loc20_.saturation;
               _loc18_ = new ColorMatrixFilter(_loc3_.CalculateFinalFlatArray());
               appendFilter(_loc18_);
               break;
            case "blur":
               _loc6_ = param1 as com.playata.framework.display.filter.BlurFilter;
               _loc11_ = new flash.filters.BlurFilter(_loc6_.blurX,_loc6_.blurY,_loc6_.quality);
               appendFilter(_loc11_);
               break;
            default:
               throw new Exception("Unsupported filter " + param1.name);
         }
         if(_filters.indexOf(param1) != -1)
         {
            _filters.push(param1);
         }
      }
      
      public function removeFilter(param1:IDisplayObjectFilter) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.name;
         switch(_loc3_)
         {
            case "grayscale":
            case "invert":
            case "brightness":
            case "contrast":
            case "hue":
            case "saturation":
            case "glow":
            case "dropshadow":
            case "adjustcolor":
            case "blur":
               _displayObject.filters = [];
               break;
            case "tint":
               _loc2_ = new ColorTransform();
               _displayObject.transform.colorTransform = _loc2_;
               break;
            default:
               throw new Exception("Unsupported filter " + param1.name);
         }
         if(_filters.indexOf(param1) != -1)
         {
            _filters.removeAt(_filters.indexOf(param1));
         }
      }
      
      public function removeAllFilters() : void
      {
         _filters = new Vector.<IDisplayObjectFilter>(0);
         _displayObject.filters = [];
         var _loc1_:ColorTransform = new ColorTransform();
         _displayObject.transform.colorTransform = _loc1_;
      }
      
      public function get filters() : Vector.<IDisplayObjectFilter>
      {
         return _filters;
      }
      
      public function bringToTop() : void
      {
         if(_displayObject.parent == null)
         {
            return;
         }
         _displayObject.parent.setChildIndex(_displayObject,_displayObject.parent.numChildren - 1);
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         param2.copyFrom(_displayObject.localToGlobal(param1));
         return param2;
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         param2.copyFrom(_displayObject.globalToLocal(param1));
         return param2;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return _displayObject.transform.matrix;
      }
      
      public function get globalX() : Number
      {
         POINT.x = this.x;
         POINT.y = this.y;
         if(_displayObject.parent != null)
         {
            return _displayObject.parent.localToGlobal(POINT).x;
         }
         return _displayObject.localToGlobal(POINT).x;
      }
      
      public function get globalY() : Number
      {
         POINT.x = this.x;
         POINT.y = this.y;
         if(_displayObject.parent != null)
         {
            return _displayObject.parent.localToGlobal(POINT).y;
         }
         return _displayObject.localToGlobal(POINT).y;
      }
      
      public function set interactionEnabled(param1:Boolean) : void
      {
         if(_displayObject is InteractiveObject)
         {
            (_displayObject as InteractiveObject).mouseEnabled = param1;
         }
         if(!param1)
         {
            if(_displayObject is Sprite)
            {
               (_displayObject as Sprite).useHandCursor = false;
            }
         }
      }
      
      public function get interactionEnabled() : Boolean
      {
         if(_displayObject is InteractiveObject)
         {
            return (_displayObject as InteractiveObject).mouseEnabled;
         }
         return false;
      }
      
      public function set useHandCursor(param1:Boolean) : void
      {
         if(_displayObject is Sprite)
         {
            (_displayObject as Sprite).buttonMode = param1;
         }
         if(_displayObject is Sprite)
         {
            (_displayObject as Sprite).useHandCursor = param1;
         }
      }
      
      public function get useHandCursor() : Boolean
      {
         if(_displayObject is Sprite)
         {
            return (_displayObject as Sprite).useHandCursor;
         }
         return false;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _displayObject.transform.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         _displayObject.transform.colorTransform = param1;
      }
      
      public function get nativeInstance() : Object
      {
         return _displayObject;
      }
      
      public function tweenTo(param1:Number, param2:Object) : ITween
      {
         _hasTweens = true;
         return Tween.to(_displayObject,param1,param2);
      }
      
      public function tweenFrom(param1:Number, param2:Object) : ITween
      {
         _hasTweens = true;
         return Tween.from(_displayObject,param1,param2);
      }
      
      public function tweenFromTo(param1:Number, param2:Object, param3:Object) : ITween
      {
         _hasTweens = true;
         return Tween.fromTo(_displayObject,param1,param2,param3);
      }
      
      public function killTweens(param1:Boolean = false, param2:Object = null) : void
      {
         _hasTweens = param1;
         return Tween.killTweensOf(_displayObject,param1,param2);
      }
      
      public function get isTweening() : Boolean
      {
         return Tween.isTweening(_displayObject);
      }
      
      private function appendFilter(param1:Object) : void
      {
         var _loc2_:Array = _displayObject.filters;
         _loc2_.push(param1);
         _displayObject.filters = _loc2_;
      }
   }
}
