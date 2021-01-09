package starling.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.utils.Pool;
   
   public class TouchProcessor
   {
      
      private static var sUpdatedTouches:Vector.<Touch> = new Vector.<Touch>(0);
      
      private static var sHoveringTouchData:Vector.<Object> = new Vector.<Object>(0);
      
      private static var sHelperPoint:Point = new Point();
      
      private static const TOP:int = 0;
      
      private static const BOTTOM:int = 1;
      
      private static const LEFT:int = 2;
      
      private static const RIGHT:int = 3;
       
      
      private var _stage:Stage;
      
      private var _root:DisplayObject;
      
      private var _elapsedTime:Number;
      
      private var _lastTaps:Vector.<Touch>;
      
      private var _shiftDown:Boolean = false;
      
      private var _ctrlDown:Boolean = false;
      
      private var _multitapTime:Number = 0.3;
      
      private var _multitapDistance:Number = 25;
      
      private var _touchEvent:TouchEvent;
      
      private var _isProcessing:Boolean;
      
      private var _cancelRequested:Boolean;
      
      private var _touchMarker:TouchMarker;
      
      private var _simulateMultitouch:Boolean;
      
      private var _occlusionTest:Function;
      
      private var _discardSystemGestures:Boolean;
      
      private var _systemGestureTouchID:int = -1;
      
      private var _systemGestureMargins:Array;
      
      protected var _queue:Vector.<TouchData>;
      
      protected var _currentTouches:Vector.<Touch>;
      
      public function TouchProcessor(param1:Stage)
      {
         _systemGestureMargins = [10,10,0,0];
         super();
         _stage = param1;
         _root = param1;
         _elapsedTime = 0;
         _currentTouches = new Vector.<Touch>(0);
         _queue = new Vector.<TouchData>(0);
         _lastTaps = new Vector.<Touch>(0);
         _touchEvent = new TouchEvent("touch");
         _stage.addEventListener("keyDown",onKey);
         _stage.addEventListener("keyUp",onKey);
         monitorInterruptions(true);
      }
      
      public function dispose() : void
      {
         monitorInterruptions(false);
         _stage.removeEventListener("keyDown",onKey);
         _stage.removeEventListener("keyUp",onKey);
         if(_touchMarker)
         {
            _touchMarker.dispose();
         }
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_isProcessing)
         {
            return;
         }
         _isProcessing = true;
         var _loc2_:int = 0;
         _elapsedTime = _elapsedTime + param1;
         sUpdatedTouches.length = 0;
         if(_lastTaps.length > 0)
         {
            _loc3_ = _lastTaps.length - 1;
            while(_loc3_ >= 0)
            {
               if(_elapsedTime - _lastTaps[_loc3_].timestamp > _multitapTime)
               {
                  _lastTaps.removeAt(_loc3_);
               }
               _loc3_--;
            }
         }
         while(_queue.length > 0 || _loc2_ == 0)
         {
            _loc2_++;
            var _loc7_:int = 0;
            var _loc6_:* = _currentTouches;
            for each(_loc4_ in _currentTouches)
            {
               if(_loc4_.phase == "began" || _loc4_.phase == "moved")
               {
                  _loc4_.phase = "stationary";
               }
            }
            while(_queue.length > 0 && !containsTouchWithID(sUpdatedTouches,_queue[_queue.length - 1].id))
            {
               _loc5_ = _queue.pop();
               _loc4_ = createOrUpdateTouch(_loc5_);
               sUpdatedTouches[sUpdatedTouches.length] = _loc4_;
               TouchData.toPool(_loc5_);
            }
            _loc3_ = _currentTouches.length - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = _currentTouches[_loc3_];
               if(_loc4_.phase == "hover" && !containsTouchWithID(sUpdatedTouches,_loc4_.id))
               {
                  sHelperPoint.setTo(_loc4_.globalX,_loc4_.globalY);
                  if(_loc4_.target != _root.hitTest(sHelperPoint))
                  {
                     sUpdatedTouches[sUpdatedTouches.length] = _loc4_;
                  }
               }
               _loc3_--;
            }
            if(sUpdatedTouches.length)
            {
               processTouches(sUpdatedTouches,_shiftDown,_ctrlDown);
            }
            _loc3_ = _currentTouches.length - 1;
            while(_loc3_ >= 0)
            {
               if(_currentTouches[_loc3_].phase == "ended")
               {
                  _currentTouches.removeAt(_loc3_);
               }
               _loc3_--;
            }
            sUpdatedTouches.length = 0;
         }
         _isProcessing = false;
         if(_cancelRequested)
         {
            cancelTouches();
         }
      }
      
      protected function processTouches(param1:Vector.<Touch>, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         sHoveringTouchData.length = 0;
         _touchEvent.resetTo("touch",_currentTouches,param2,param3);
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(_loc4_ in param1)
         {
            if(_loc4_.phase == "hover" && _loc4_.target)
            {
               sHoveringTouchData[sHoveringTouchData.length] = {
                  "touch":_loc4_,
                  "target":_loc4_.target,
                  "bubbleChain":_loc4_.bubbleChain
               };
            }
            if(_loc4_.phase == "hover" || _loc4_.phase == "began")
            {
               sHelperPoint.setTo(_loc4_.globalX,_loc4_.globalY);
               if(_occlusionTest != null && _occlusionTest(_loc4_.globalX,_loc4_.globalY))
               {
                  _loc4_.target = null;
               }
               else
               {
                  _loc4_.target = _root.hitTest(sHelperPoint);
               }
            }
         }
         var _loc9_:int = 0;
         var _loc8_:* = sHoveringTouchData;
         for each(var _loc5_ in sHoveringTouchData)
         {
            if(_loc5_.touch.target != _loc5_.target)
            {
               _touchEvent.dispatch(_loc5_.bubbleChain);
            }
         }
         var _loc11_:int = 0;
         var _loc10_:* = param1;
         for each(_loc4_ in param1)
         {
            _loc4_.dispatchEvent(_touchEvent);
         }
         _touchEvent.resetTo("touch");
      }
      
      private function checkForSystemGesture(param1:int, param2:String, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         if(!_discardSystemGestures || param2 == "hover")
         {
            return false;
         }
         if(_systemGestureTouchID == param1)
         {
            if(param2 == "ended")
            {
               _systemGestureTouchID = -1;
            }
            return true;
         }
         if(_systemGestureTouchID >= 0)
         {
            return false;
         }
         if(param2 == "began")
         {
            _loc6_ = _stage.getScreenBounds(_stage,Pool.getRectangle());
            _loc5_ = param3 < _loc6_.left + _systemGestureMargins[2] || param3 > _loc6_.right - _systemGestureMargins[3] || param4 < _loc6_.top + _systemGestureMargins[0] || param4 > _loc6_.bottom - _systemGestureMargins[1];
            Pool.putRectangle(_loc6_);
            if(_loc5_)
            {
               _systemGestureTouchID = param1;
            }
            return _loc5_;
         }
         return false;
      }
      
      public function enqueue(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1.0, param6:Number = 1.0, param7:Number = 1.0) : void
      {
         if(checkForSystemGesture(param1,param2,param3,param4))
         {
            return;
         }
         queue_unshift(param1,param2,param3,param4,param5,param6,param7);
         if(_ctrlDown && _touchMarker && param1 == 0)
         {
            _touchMarker.moveMarker(param3,param4,_shiftDown);
            queue_unshift(1,param2,_touchMarker.mockX,_touchMarker.mockY);
         }
      }
      
      private function queue_unshift(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1.0, param6:Number = 1.0, param7:Number = 1.0) : void
      {
         _queue.unshift(TouchData.fromPool(param1,param2,param3,param4,param5,param6,param7));
      }
      
      public function enqueueMouseLeftStage() : void
      {
         var _loc1_:Touch = getCurrentTouch(0);
         if(_loc1_ == null || _loc1_.phase != "hover")
         {
            return;
         }
         var _loc2_:int = 1;
         var _loc8_:Number = _loc1_.globalX;
         var _loc6_:Number = _loc1_.globalY;
         var _loc4_:Number = _loc1_.globalX;
         var _loc7_:Number = _stage.stageWidth - _loc4_;
         var _loc3_:Number = _loc1_.globalY;
         var _loc9_:Number = _stage.stageHeight - _loc3_;
         var _loc5_:Number = Math.min(_loc4_,_loc7_,_loc3_,_loc9_);
         if(_loc5_ == _loc4_)
         {
            _loc8_ = -_loc2_;
         }
         else if(_loc5_ == _loc7_)
         {
            _loc8_ = _stage.stageWidth + _loc2_;
         }
         else if(_loc5_ == _loc3_)
         {
            _loc6_ = -_loc2_;
         }
         else
         {
            _loc6_ = _stage.stageHeight + _loc2_;
         }
         enqueue(0,"hover",_loc8_,_loc6_);
      }
      
      public function cancelTouches() : void
      {
         if(_isProcessing)
         {
            _cancelRequested = true;
            return;
         }
         _cancelRequested = false;
         if(_currentTouches.length > 0)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _currentTouches;
            for each(var _loc1_ in _currentTouches)
            {
               if(_loc1_.phase == "began" || _loc1_.phase == "moved" || _loc1_.phase == "stationary")
               {
                  _loc1_.phase = "ended";
                  _loc1_.cancelled = true;
               }
            }
            processTouches(_currentTouches,_shiftDown,_ctrlDown);
         }
         _currentTouches.length = 0;
         while(_queue.length)
         {
            TouchData.toPool(_queue.pop());
         }
      }
      
      private function createOrUpdateTouch(param1:TouchData) : Touch
      {
         var _loc2_:Touch = getCurrentTouch(param1.id);
         if(_loc2_ == null)
         {
            _loc2_ = new Touch(param1.id);
            addCurrentTouch(_loc2_);
         }
         _loc2_.update(_elapsedTime,param1.phase,param1.globalX,param1.globalY,param1.pressure,param1.width,param1.height);
         if(param1.phase == "began")
         {
            updateTapCount(_loc2_);
         }
         return _loc2_;
      }
      
      private function updateTapCount(param1:Touch) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         var _loc2_:Number = _multitapDistance * _multitapDistance;
         var _loc7_:int = 0;
         var _loc6_:* = _lastTaps;
         for each(var _loc3_ in _lastTaps)
         {
            _loc4_ = Math.pow(_loc3_.globalX - param1.globalX,2) + Math.pow(_loc3_.globalY - param1.globalY,2);
            if(_loc4_ <= _loc2_)
            {
               _loc5_ = _loc3_;
               break;
            }
         }
         if(_loc5_)
         {
            param1.tapCount = _loc5_.tapCount + 1;
            _lastTaps.removeAt(_lastTaps.indexOf(_loc5_));
         }
         else
         {
            param1.tapCount = 1;
         }
         _lastTaps[_lastTaps.length] = param1.clone();
      }
      
      private function addCurrentTouch(param1:Touch) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _currentTouches.length - 1;
         while(_loc2_ >= 0)
         {
            if(_currentTouches[_loc2_].id == param1.id)
            {
               _currentTouches.removeAt(_loc2_);
            }
            _loc2_--;
         }
         _currentTouches[_currentTouches.length] = param1;
      }
      
      private function getCurrentTouch(param1:int) : Touch
      {
         var _loc4_:int = 0;
         var _loc3_:* = _currentTouches;
         for each(var _loc2_ in _currentTouches)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function containsTouchWithID(param1:Vector.<Touch>, param2:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function setSystemGestureMargins(param1:Number = 10, param2:Number = 10, param3:Number = 0, param4:Number = 0) : void
      {
         _systemGestureMargins[0] = param1;
         _systemGestureMargins[1] = param2;
         _systemGestureMargins[2] = param3;
         _systemGestureMargins[3] = param4;
      }
      
      public function get simulateMultitouch() : Boolean
      {
         return _simulateMultitouch;
      }
      
      public function set simulateMultitouch(param1:Boolean) : void
      {
         value = param1;
         createTouchMarker = function():void
         {
            target.removeEventListener("context3DCreate",createTouchMarker);
            if(_touchMarker == null)
            {
               _touchMarker = new TouchMarker();
               _touchMarker.visible = false;
               _stage.addChild(_touchMarker);
            }
         };
         if(simulateMultitouch == value)
         {
            return;
         }
         _simulateMultitouch = value;
         var target:Starling = Starling.current;
         if(value && _touchMarker == null)
         {
            if(Starling.current.contextValid)
            {
               createTouchMarker();
            }
            else
            {
               target.addEventListener("context3DCreate",createTouchMarker);
            }
         }
         else if(!value && _touchMarker)
         {
            _touchMarker.removeFromParent(true);
            _touchMarker = null;
         }
      }
      
      public function get multitapTime() : Number
      {
         return _multitapTime;
      }
      
      public function set multitapTime(param1:Number) : void
      {
         _multitapTime = param1;
      }
      
      public function get multitapDistance() : Number
      {
         return _multitapDistance;
      }
      
      public function set multitapDistance(param1:Number) : void
      {
         _multitapDistance = param1;
      }
      
      public function get root() : DisplayObject
      {
         return _root;
      }
      
      public function set root(param1:DisplayObject) : void
      {
         _root = param1;
      }
      
      public function get stage() : Stage
      {
         return _stage;
      }
      
      public function get numCurrentTouches() : int
      {
         return _currentTouches.length;
      }
      
      public function set occlusionTest(param1:Function) : void
      {
         _occlusionTest = param1;
      }
      
      public function get occlusionTest() : Function
      {
         return _occlusionTest;
      }
      
      public function get discardSystemGestures() : Boolean
      {
         return _discardSystemGestures;
      }
      
      public function set discardSystemGestures(param1:Boolean) : void
      {
         if(_discardSystemGestures != param1)
         {
            _discardSystemGestures = param1;
            _systemGestureTouchID = -1;
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1.keyCode == 17 || param1.keyCode == 15)
         {
            _loc2_ = _ctrlDown;
            _ctrlDown = param1.type == "keyDown";
            if(_touchMarker && _loc2_ != _ctrlDown)
            {
               _touchMarker.visible = _ctrlDown;
               _touchMarker.moveCenter(_stage.stageWidth / 2,_stage.stageHeight / 2);
               _loc4_ = getCurrentTouch(0);
               _loc3_ = getCurrentTouch(1);
               if(_loc4_)
               {
                  _touchMarker.moveMarker(_loc4_.globalX,_loc4_.globalY);
               }
               if(_loc2_ && _loc3_ && _loc3_.phase != "ended")
               {
                  queue_unshift(1,"ended",_loc3_.globalX,_loc3_.globalY);
               }
               else if(_ctrlDown && _loc4_)
               {
                  if(_loc4_.phase == "hover" || _loc4_.phase == "ended")
                  {
                     queue_unshift(1,"hover",_touchMarker.mockX,_touchMarker.mockY);
                  }
                  else
                  {
                     queue_unshift(1,"began",_touchMarker.mockX,_touchMarker.mockY);
                  }
               }
            }
         }
         else if(param1.keyCode == 16)
         {
            _shiftDown = param1.type == "keyDown";
         }
      }
      
      private function monitorInterruptions(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            _loc3_ = getDefinitionByName("flash.desktop::NativeApplication");
            _loc2_ = _loc3_["nativeApplication"];
            if(param1)
            {
               _loc2_.addEventListener("deactivate",onInterruption,false,0,true);
            }
            else
            {
               _loc2_.removeEventListener("deactivate",onInterruption);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onInterruption(param1:Object) : void
      {
         cancelTouches();
      }
   }
}
