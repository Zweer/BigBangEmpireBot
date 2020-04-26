package spine.animation
{
   import spine.Event;
   
   public class EventQueue
   {
       
      
      var objects:Vector.<Object>;
      
      var animationState:AnimationState;
      
      public var drainDisabled:Boolean;
      
      public function EventQueue(param1:AnimationState)
      {
         objects = new Vector.<Object>();
         super();
         this.animationState = param1;
      }
      
      public function start(param1:TrackEntry) : void
      {
         objects.push(EventType.start);
         objects.push(param1);
         animationState.animationsChanged = true;
      }
      
      public function interrupt(param1:TrackEntry) : void
      {
         objects.push(EventType.interrupt);
         objects.push(param1);
      }
      
      public function end(param1:TrackEntry) : void
      {
         objects.push(EventType.end);
         objects.push(param1);
         animationState.animationsChanged = true;
      }
      
      public function dispose(param1:TrackEntry) : void
      {
         objects.push(EventType.dispose);
         objects.push(param1);
      }
      
      public function complete(param1:TrackEntry) : void
      {
         objects.push(EventType.complete);
         objects.push(param1);
      }
      
      public function event(param1:TrackEntry, param2:Event) : void
      {
         objects.push(EventType.event);
         objects.push(param1);
         objects.push(param2);
      }
      
      public function drain() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc5_:* = null;
         if(drainDisabled)
         {
            return;
         }
         drainDisabled = true;
         var _loc2_:Vector.<Object> = this.objects;
         _loc3_ = 0;
         for(; _loc3_ < _loc2_.length; _loc3_ = _loc3_ + 2)
         {
            _loc4_ = EventType(_loc2_[_loc3_]);
            _loc1_ = TrackEntry(_loc2_[_loc3_ + 1]);
            var _loc6_:* = _loc4_;
            switch(_loc6_)
            {
               case EventType.start:
                  _loc1_.onStart.invoke(_loc1_);
                  animationState.onStart.invoke(_loc1_);
                  continue;
               case EventType.interrupt:
                  _loc1_.onInterrupt.invoke(_loc1_);
                  animationState.onInterrupt.invoke(_loc1_);
                  continue;
               case EventType.end:
                  _loc1_.onEnd.invoke(_loc1_);
                  animationState.onEnd.invoke(_loc1_);
               case EventType.dispose:
                  _loc1_.onDispose.invoke(_loc1_);
                  animationState.onDispose.invoke(_loc1_);
                  animationState.trackEntryPool.free(_loc1_);
                  continue;
               case EventType.complete:
                  _loc1_.onComplete.invoke(_loc1_);
                  animationState.onComplete.invoke(_loc1_);
                  continue;
               case EventType.event:
                  _loc3_++;
                  _loc5_ = Event(_loc2_[_loc3_ + 2]);
                  _loc1_.onEvent.invoke(_loc1_,_loc5_);
                  animationState.onEvent.invoke(_loc1_,_loc5_);
                  continue;
               default:
                  continue;
            }
         }
         clear();
         drainDisabled = false;
      }
      
      public function clear() : void
      {
         objects.length = 0;
      }
   }
}
