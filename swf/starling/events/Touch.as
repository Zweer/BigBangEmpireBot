package starling.events
{
   import flash.geom.Point;
   import starling.display.DisplayObject;
   import starling.utils.Pool;
   import starling.utils.StringUtil;
   
   public class Touch
   {
      
      private static var sHelperPoint:Point = new Point();
       
      
      private var _id:int;
      
      private var _globalX:Number;
      
      private var _globalY:Number;
      
      private var _previousGlobalX:Number;
      
      private var _previousGlobalY:Number;
      
      private var _startGlobalX:Number;
      
      private var _startGlobalY:Number;
      
      private var _startTimestamp:Number;
      
      private var _tapCount:int;
      
      private var _phase:String;
      
      private var _target:DisplayObject;
      
      private var _timestamp:Number;
      
      private var _pressure:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _cancelled:Boolean;
      
      private var _bubbleChain:Vector.<EventDispatcher>;
      
      public function Touch(param1:int)
      {
         super();
         _id = param1;
         _tapCount = 0;
         _phase = "hover";
         _height = 1;
         _width = 1;
         _pressure = 1;
         _bubbleChain = new Vector.<EventDispatcher>(0);
         _startTimestamp = -1;
         _timestamp = -1;
      }
      
      private static function getMovementBetween(param1:Number, param2:Number, param3:Number, param4:Number, param5:DisplayObject, param6:Point = null) : Point
      {
         if(param6 == null)
         {
            param6 = new Point();
         }
         var _loc7_:Point = Pool.getPoint(param1,param2);
         var _loc8_:Point = Pool.getPoint(param3,param4);
         param5.globalToLocal(_loc7_,_loc7_);
         param5.globalToLocal(_loc8_,_loc8_);
         param6.setTo(_loc8_.x - _loc7_.x,_loc8_.y - _loc7_.y);
         Pool.putPoint(_loc7_);
         Pool.putPoint(_loc8_);
         return param6;
      }
      
      public function getLocation(param1:DisplayObject, param2:Point = null) : Point
      {
         sHelperPoint.setTo(_globalX,_globalY);
         return param1.globalToLocal(sHelperPoint,param2);
      }
      
      public function getPreviousLocation(param1:DisplayObject, param2:Point = null) : Point
      {
         sHelperPoint.setTo(_previousGlobalX,_previousGlobalY);
         return param1.globalToLocal(sHelperPoint,param2);
      }
      
      public function getStartLocation(param1:DisplayObject, param2:Point = null) : Point
      {
         sHelperPoint.setTo(_startGlobalX,_startGlobalY);
         return param1.globalToLocal(sHelperPoint,param2);
      }
      
      public function getMovement(param1:DisplayObject, param2:Point = null) : Point
      {
         return getMovementBetween(_previousGlobalX,_previousGlobalY,_globalX,_globalY,param1,param2);
      }
      
      public function getMovementSinceStart(param1:DisplayObject, param2:Point = null) : Point
      {
         return getMovementBetween(_startGlobalX,_startGlobalY,_globalX,_globalY,param1,param2);
      }
      
      public function isTouching(param1:DisplayObject) : Boolean
      {
         return _bubbleChain.indexOf(param1) != -1;
      }
      
      public function toString() : String
      {
         return StringUtil.format("[Touch {0}: globalX={1}, globalY={2}, phase={3}]",_id,_globalX,_globalY,_phase);
      }
      
      public function clone() : Touch
      {
         var _loc1_:Touch = new Touch(_id);
         _loc1_._globalX = _globalX;
         _loc1_._globalY = _globalY;
         _loc1_._previousGlobalX = _previousGlobalX;
         _loc1_._previousGlobalY = _previousGlobalY;
         _loc1_._startGlobalX = _startGlobalX;
         _loc1_._startGlobalY = _startGlobalY;
         _loc1_._startTimestamp = _startTimestamp;
         _loc1_._phase = _phase;
         _loc1_._tapCount = _tapCount;
         _loc1_._timestamp = _timestamp;
         _loc1_._pressure = _pressure;
         _loc1_._width = _width;
         _loc1_._height = _height;
         _loc1_._cancelled = _cancelled;
         _loc1_.target = _target;
         return _loc1_;
      }
      
      private function updateBubbleChain() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_target)
         {
            _loc1_ = 1;
            _loc2_ = _target;
            _bubbleChain.length = 1;
            _bubbleChain[0] = _loc2_;
            while(true)
            {
               _loc2_ = _loc2_.parent;
               if(_loc2_.parent == null)
               {
                  break;
               }
               _loc1_++;
               _bubbleChain[int(_loc1_)] = _loc2_;
            }
         }
         else
         {
            _bubbleChain.length = 0;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get previousGlobalX() : Number
      {
         return _previousGlobalX;
      }
      
      public function get previousGlobalY() : Number
      {
         return _previousGlobalY;
      }
      
      public function get startGlobalX() : Number
      {
         return _startGlobalX;
      }
      
      public function get startGlobalY() : Number
      {
         return _startGlobalY;
      }
      
      public function get globalX() : Number
      {
         return _globalX;
      }
      
      public function set globalX(param1:Number) : void
      {
         if(_globalX != _globalX)
         {
            _startGlobalX = param1;
            _previousGlobalX = param1;
         }
         else
         {
            _previousGlobalX = _globalX;
         }
         _globalX = param1;
      }
      
      public function get globalY() : Number
      {
         return _globalY;
      }
      
      public function set globalY(param1:Number) : void
      {
         if(_globalY != _globalY)
         {
            _startGlobalY = param1;
            _previousGlobalY = param1;
         }
         else
         {
            _previousGlobalY = _globalY;
         }
         _globalY = param1;
      }
      
      public function get tapCount() : int
      {
         return _tapCount;
      }
      
      public function set tapCount(param1:int) : void
      {
         _tapCount = param1;
      }
      
      public function get phase() : String
      {
         return _phase;
      }
      
      public function set phase(param1:String) : void
      {
         _phase = param1;
         if(param1 == "began")
         {
            _startGlobalX = _globalX;
            _startGlobalY = _globalY;
            _startTimestamp = _timestamp;
         }
      }
      
      public function get target() : DisplayObject
      {
         return _target;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         if(_target != param1)
         {
            _target = param1;
            updateBubbleChain();
         }
      }
      
      public function get timestamp() : Number
      {
         return _timestamp;
      }
      
      public function set timestamp(param1:Number) : void
      {
         if(_startTimestamp < 0)
         {
            _startTimestamp = param1;
         }
         _timestamp = param1;
      }
      
      public function get pressure() : Number
      {
         return _pressure;
      }
      
      public function set pressure(param1:Number) : void
      {
         _pressure = param1;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function set width(param1:Number) : void
      {
         _width = param1;
      }
      
      public function get height() : Number
      {
         return _height;
      }
      
      public function set height(param1:Number) : void
      {
         _height = param1;
      }
      
      public function get cancelled() : Boolean
      {
         return _cancelled;
      }
      
      public function set cancelled(param1:Boolean) : void
      {
         _cancelled = param1;
      }
      
      public function get duration() : Number
      {
         if(_timestamp < 0 || _startTimestamp < 0 || _startTimestamp > _timestamp)
         {
            return -1;
         }
         return _timestamp - _startTimestamp;
      }
      
      function update(param1:Number, param2:String, param3:Number, param4:Number, param5:Number = 1.0, param6:Number = 1.0, param7:Number = 1.0) : void
      {
         _pressure = param5;
         _width = param6;
         _height = param7;
         this.timestamp = param1;
         this.globalX = param3;
         this.globalY = param4;
         this.phase = param2;
      }
      
      function dispatchEvent(param1:TouchEvent) : void
      {
         if(_target)
         {
            param1.dispatch(_bubbleChain);
         }
      }
      
      function get bubbleChain() : Vector.<EventDispatcher>
      {
         return _bubbleChain.concat();
      }
   }
}
