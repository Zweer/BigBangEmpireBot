package starling.events
{
   import flash.utils.Dictionary;
   import starling.display.DisplayObject;
   
   public class EventDispatcher
   {
      
      private static var sBubbleChains:Array = [];
       
      
      private var _eventListeners:Dictionary;
      
      private var _eventStack:Vector.<String> = null;
      
      public function EventDispatcher()
      {
         super();
      }
      
      public function addEventListener(param1:String, param2:Function) : void
      {
         if(_eventListeners == null)
         {
            _eventListeners = new Dictionary();
         }
         var _loc3_:Vector.<Function> = _eventListeners[param1] as Vector.<Function>;
         if(_loc3_ == null)
         {
            _eventListeners[param1] = new <Function>[param2];
         }
         else if(_loc3_.indexOf(param2) == -1)
         {
            _loc3_[_loc3_.length] = param2;
         }
      }
      
      public function removeEventListener(param1:String, param2:Function) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:* = undefined;
         var _loc6_:int = 0;
         if(_eventListeners)
         {
            _loc3_ = _eventListeners[param1] as Vector.<Function>;
            _loc4_ = !!_loc3_?_loc3_.length:0;
            if(_loc4_ > 0)
            {
               _loc5_ = _loc3_.indexOf(param2);
               if(_loc5_ != -1)
               {
                  if(_eventStack === null)
                  {
                     _eventStack = new Vector.<String>(0);
                  }
                  if(_eventStack.indexOf(param1) == -1)
                  {
                     _loc3_.removeAt(_loc5_);
                  }
                  else
                  {
                     _loc7_ = _loc3_.slice(0,_loc5_);
                     _loc6_ = _loc5_ + 1;
                     while(_loc6_ < _loc4_)
                     {
                        _loc7_[_loc6_ - 1] = _loc3_[_loc6_];
                        _loc6_++;
                     }
                     _eventListeners[param1] = _loc7_;
                  }
               }
            }
         }
      }
      
      public function removeEventListeners(param1:String = null) : void
      {
         if(param1 && _eventListeners)
         {
            delete _eventListeners[param1];
         }
         else
         {
            _eventListeners = null;
         }
      }
      
      public function dispatchEvent(param1:Event) : void
      {
         var _loc2_:Boolean = param1.bubbles;
         if(!_loc2_ && (_eventListeners == null || !(param1.type in _eventListeners)))
         {
            return;
         }
         var _loc3_:EventDispatcher = param1.target;
         param1.setTarget(this);
         if(_loc2_ && this is DisplayObject)
         {
            bubbleEvent(param1);
         }
         else
         {
            invokeEvent(param1);
         }
         if(_loc3_)
         {
            param1.setTarget(_loc3_);
         }
      }
      
      function invokeEvent(param1:Event) : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Vector.<Function> = !!_eventListeners?_eventListeners[param1.type] as Vector.<Function>:null;
         var _loc4_:int = _loc3_ == null?0:_loc3_.length;
         if(_loc4_)
         {
            if(_eventStack === null)
            {
               _eventStack = new Vector.<String>(0);
            }
            param1.setCurrentTarget(this);
            _eventStack[_eventStack.length] = param1.type;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = _loc3_[_loc6_] as Function;
               _loc2_ = _loc5_.length;
               if(_loc2_ == 0)
               {
                  _loc5_();
               }
               else if(_loc2_ == 1)
               {
                  _loc5_(param1);
               }
               else
               {
                  _loc5_(param1,param1.data);
               }
               if(param1.stopsImmediatePropagation)
               {
                  return true;
               }
               _loc6_++;
            }
            _eventStack.pop();
            return param1.stopsPropagation;
         }
         return false;
      }
      
      function bubbleEvent(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:DisplayObject = this as DisplayObject;
         var _loc3_:int = 1;
         if(sBubbleChains.length > 0)
         {
            _loc2_ = sBubbleChains.pop();
            _loc2_[0] = _loc6_;
         }
         else
         {
            _loc2_ = new <EventDispatcher>[_loc6_];
         }
         while(true)
         {
            _loc6_ = _loc6_.parent;
            if(_loc6_.parent == null)
            {
               break;
            }
            _loc3_++;
            _loc2_[int(_loc3_)] = _loc6_;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_].invokeEvent(param1);
            if(!_loc5_)
            {
               _loc4_++;
               continue;
            }
            break;
         }
         _loc2_.length = 0;
         sBubbleChains[sBubbleChains.length] = _loc2_;
      }
      
      public function dispatchEventWith(param1:String, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:* = null;
         if(param2 || hasEventListener(param1))
         {
            _loc4_ = Event.fromPool(param1,param2,param3);
            dispatchEvent(_loc4_);
            Event.toPool(_loc4_);
         }
      }
      
      public function hasEventListener(param1:String, param2:Function = null) : Boolean
      {
         var _loc3_:Vector.<Function> = !!_eventListeners?_eventListeners[param1]:null;
         if(_loc3_ == null)
         {
            return false;
         }
         if(param2 != null)
         {
            return _loc3_.indexOf(param2) != -1;
         }
         return _loc3_.length != 0;
      }
   }
}
