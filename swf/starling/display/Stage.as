package starling.display
{
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import starling.core.Starling;
   import starling.events.EnterFrameEvent;
   import starling.filters.FragmentFilter;
   import starling.utils.MatrixUtil;
   import starling.utils.RectangleUtil;
   
   public class Stage extends DisplayObjectContainer
   {
      
      private static var sMatrix:Matrix = new Matrix();
      
      private static var sMatrix3D:Matrix3D = new Matrix3D();
       
      
      private var _width:int;
      
      private var _height:int;
      
      private var _color:uint;
      
      private var _fieldOfView:Number;
      
      private var _projectionOffset:Point;
      
      private var _cameraPosition:Vector3D;
      
      private var _enterFrameEvent:EnterFrameEvent;
      
      private var _enterFrameListeners:Vector.<DisplayObject>;
      
      public function Stage(param1:int, param2:int, param3:uint = 0)
      {
         super();
         _width = param1;
         _height = param2;
         _color = param3;
         _fieldOfView = 1;
         _projectionOffset = new Point();
         _cameraPosition = new Vector3D();
         _enterFrameEvent = new EnterFrameEvent("enterFrame",0);
         _enterFrameListeners = new Vector.<DisplayObject>(0);
      }
      
      public function advanceTime(param1:Number) : void
      {
         _enterFrameEvent.reset("enterFrame",false,param1);
         broadcastEvent(_enterFrameEvent);
      }
      
      override public function hitTest(param1:Point) : DisplayObject
      {
         if(!visible || !touchable)
         {
            return null;
         }
         if(param1.x < 0 || param1.x > _width || param1.y < 0 || param1.y > _height)
         {
            return null;
         }
         var _loc2_:DisplayObject = super.hitTest(param1);
         return !!_loc2_?_loc2_:this;
      }
      
      public function getStageBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         param2.setTo(0,0,_width,_height);
         getTransformationMatrix(param1,sMatrix);
         return RectangleUtil.getBounds(param2,sMatrix,param2);
      }
      
      public function getCameraPosition(param1:DisplayObject = null, param2:Vector3D = null) : Vector3D
      {
         getTransformationMatrix3D(param1,sMatrix3D);
         return MatrixUtil.transformCoords3D(sMatrix3D,_width / 2 + _projectionOffset.x,_height / 2 + _projectionOffset.y,-focalLength,param2);
      }
      
      function addEnterFrameListener(param1:DisplayObject) : void
      {
         var _loc2_:int = _enterFrameListeners.indexOf(param1);
         if(_loc2_ < 0)
         {
            _enterFrameListeners[_enterFrameListeners.length] = param1;
         }
      }
      
      function removeEnterFrameListener(param1:DisplayObject) : void
      {
         var _loc2_:int = _enterFrameListeners.indexOf(param1);
         if(_loc2_ >= 0)
         {
            _enterFrameListeners.removeAt(_loc2_);
         }
      }
      
      override function getChildEventListeners(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         if(param2 == "enterFrame" && param1 == this)
         {
            _loc5_ = 0;
            _loc4_ = _enterFrameListeners.length;
            while(_loc5_ < _loc4_)
            {
               param3[param3.length] = _enterFrameListeners[_loc5_];
               _loc5_++;
            }
         }
         else
         {
            super.getChildEventListeners(param1,param2,param3);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set width of stage");
      }
      
      override public function set height(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set height of stage");
      }
      
      override public function set x(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set x-coordinate of stage");
      }
      
      override public function set y(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set y-coordinate of stage");
      }
      
      override public function set scaleX(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set scaleY(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set rotation(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot rotate stage");
      }
      
      override public function set skewX(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot skew stage");
      }
      
      override public function set skewY(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot skew stage");
      }
      
      override public function set filter(param1:FragmentFilter) : void
      {
         throw new IllegalOperationError("Cannot add filter to stage. Add it to \'root\' instead!");
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get stageWidth() : int
      {
         return _width;
      }
      
      public function set stageWidth(param1:int) : void
      {
         _width = param1;
         setRequiresRedraw();
      }
      
      public function get stageHeight() : int
      {
         return _height;
      }
      
      public function set stageHeight(param1:int) : void
      {
         _height = param1;
         setRequiresRedraw();
      }
      
      public function get starling() : Starling
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<Starling> = Starling.all;
         var _loc2_:int = _loc1_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_[_loc3_].stage == this)
            {
               return _loc1_[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get focalLength() : Number
      {
         return _width / (2 * Math.tan(_fieldOfView / 2));
      }
      
      public function set focalLength(param1:Number) : void
      {
         _fieldOfView = 2 * Math.atan(stageWidth / (2 * param1));
         setRequiresRedraw();
      }
      
      public function get fieldOfView() : Number
      {
         return _fieldOfView;
      }
      
      public function set fieldOfView(param1:Number) : void
      {
         _fieldOfView = param1;
         setRequiresRedraw();
      }
      
      public function get projectionOffset() : Point
      {
         return _projectionOffset;
      }
      
      public function set projectionOffset(param1:Point) : void
      {
         _projectionOffset.setTo(param1.x,param1.y);
         setRequiresRedraw();
      }
      
      public function get cameraPosition() : Vector3D
      {
         return getCameraPosition(null,_cameraPosition);
      }
   }
}
