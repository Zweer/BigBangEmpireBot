package spine.animation
{
   import spine.Poolable;
   
   public class TrackEntry implements Poolable
   {
       
      
      public var animation:Animation;
      
      public var next:TrackEntry;
      
      public var mixingFrom:TrackEntry;
      
      public var onStart:Listeners;
      
      public var onInterrupt:Listeners;
      
      public var onEnd:Listeners;
      
      public var onDispose:Listeners;
      
      public var onComplete:Listeners;
      
      public var onEvent:Listeners;
      
      public var trackIndex:int;
      
      public var loop:Boolean;
      
      public var eventThreshold:Number;
      
      public var attachmentThreshold:Number;
      
      public var drawOrderThreshold:Number;
      
      public var animationStart:Number;
      
      public var animationEnd:Number;
      
      public var animationLast:Number;
      
      public var nextAnimationLast:Number;
      
      public var delay:Number;
      
      public var trackTime:Number;
      
      public var trackLast:Number;
      
      public var nextTrackLast:Number;
      
      public var trackEnd:Number;
      
      public var timeScale:Number;
      
      public var alpha:Number;
      
      public var mixTime:Number;
      
      public var mixDuration:Number;
      
      public var mixAlpha:Number;
      
      public var timelinesFirst:Vector.<Boolean>;
      
      public var timelinesRotation:Vector.<Number>;
      
      public function TrackEntry()
      {
         onStart = new Listeners();
         onInterrupt = new Listeners();
         onEnd = new Listeners();
         onDispose = new Listeners();
         onComplete = new Listeners();
         onEvent = new Listeners();
         timelinesFirst = new Vector.<Boolean>();
         timelinesRotation = new Vector.<Number>();
         super();
      }
      
      public function getAnimationTime() : Number
      {
         var _loc1_:Number = NaN;
         if(loop)
         {
            _loc1_ = animationEnd - animationStart;
            if(_loc1_ == 0)
            {
               return animationStart;
            }
            return trackTime % _loc1_ + animationStart;
         }
         return Math.min(trackTime + animationStart,animationEnd);
      }
      
      public function reset() : void
      {
         next = null;
         mixingFrom = null;
         animation = null;
         onStart.listeners.length = 0;
         onInterrupt.listeners.length = 0;
         onEnd.listeners.length = 0;
         onDispose.listeners.length = 0;
         onComplete.listeners.length = 0;
         onEvent.listeners.length = 0;
         timelinesFirst.length = 0;
         timelinesRotation.length = 0;
      }
      
      public function resetRotationDirection() : void
      {
         timelinesRotation.length = 0;
      }
   }
}
