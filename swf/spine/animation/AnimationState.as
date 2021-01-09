package spine.animation
{
   import flash.utils.Dictionary;
   import spine.Bone;
   import spine.Event;
   import spine.MathUtils;
   import spine.Pool;
   import spine.Skeleton;
   
   public class AnimationState
   {
      
      static var emptyAnimation:Animation = new Animation("<empty>",new Vector.<Timeline>(),0);
       
      
      public var data:AnimationStateData;
      
      public var tracks:Vector.<TrackEntry>;
      
      var events:Vector.<Event>;
      
      public var onStart:Listeners;
      
      public var onInterrupt:Listeners;
      
      public var onEnd:Listeners;
      
      public var onDispose:Listeners;
      
      public var onComplete:Listeners;
      
      public var onEvent:Listeners;
      
      var queue:EventQueue;
      
      var propertyIDs:Dictionary;
      
      var animationsChanged:Boolean;
      
      public var timeScale:Number = 1;
      
      var trackEntryPool:Pool;
      
      public function AnimationState(param1:AnimationStateData)
      {
         data = param1;
         tracks = new Vector.<TrackEntry>();
         events = new Vector.<Event>();
         onStart = new Listeners();
         onInterrupt = new Listeners();
         onEnd = new Listeners();
         onDispose = new Listeners();
         onComplete = new Listeners();
         onEvent = new Listeners();
         propertyIDs = new Dictionary();
         super();
         if(data == null)
         {
            throw new ArgumentError("data can not be null");
         }
         this.data = data;
         this.queue = new EventQueue(this);
         this.trackEntryPool = new Pool(function():Object
         {
            return new TrackEntry();
         });
      }
      
      public function update(param1:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc2_:* = null;
         var _loc5_:Number = NaN;
         param1 = param1 * timeScale;
         _loc6_ = 0;
         _loc7_ = tracks.length;
         for(; _loc6_ < _loc7_; _loc6_++)
         {
            _loc3_ = tracks[_loc6_];
            if(_loc3_ != null)
            {
               _loc3_.animationLast = _loc3_.nextAnimationLast;
               _loc3_.trackLast = _loc3_.nextTrackLast;
               _loc4_ = param1 * _loc3_.timeScale;
               if(_loc3_.delay > 0)
               {
                  _loc3_.delay = _loc3_.delay - _loc4_;
                  if(_loc3_.delay <= 0)
                  {
                     _loc4_ = -_loc3_.delay;
                     _loc3_.delay = 0;
                  }
                  continue;
               }
               _loc2_ = _loc3_.next;
               if(_loc2_ != null)
               {
                  _loc5_ = _loc3_.trackLast - _loc2_.delay;
                  if(_loc5_ >= 0)
                  {
                     _loc2_.delay = 0;
                     _loc2_.trackTime = _loc5_ + param1 * _loc2_.timeScale;
                     _loc3_.trackTime = _loc3_.trackTime + _loc4_;
                     setCurrent(_loc6_,_loc2_,true);
                     while(_loc2_.mixingFrom != null)
                     {
                        _loc2_.mixTime = _loc2_.mixTime + _loc4_;
                        _loc2_ = _loc2_.mixingFrom;
                     }
                     continue;
                  }
               }
               else if(_loc3_.trackLast >= _loc3_.trackEnd && _loc3_.mixingFrom == null)
               {
                  tracks[_loc6_] = null;
                  queue.end(_loc3_);
                  disposeNext(_loc3_);
                  continue;
               }
               updateMixingFrom(_loc3_,param1);
               _loc3_.trackTime = _loc3_.trackTime + _loc4_;
               continue;
            }
         }
         queue.drain();
      }
      
      private function updateMixingFrom(param1:TrackEntry, param2:Number) : void
      {
         var _loc3_:TrackEntry = param1.mixingFrom;
         if(_loc3_ == null)
         {
            return;
         }
         updateMixingFrom(_loc3_,param2);
         if(param1.mixTime >= param1.mixDuration && _loc3_.mixingFrom == null && param1.mixTime > 0)
         {
            param1.mixingFrom = null;
            queue.end(_loc3_);
            return;
         }
         _loc3_.animationLast = _loc3_.nextAnimationLast;
         _loc3_.trackLast = _loc3_.nextTrackLast;
         _loc3_.trackTime = _loc3_.trackTime + param2 * _loc3_.timeScale;
         param1.mixTime = param1.mixTime + param2 * param1.timeScale;
      }
      
      public function apply(param1:Skeleton) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc14_:* = NaN;
         var _loc11_:Number = NaN;
         var _loc9_:int = 0;
         var _loc7_:* = undefined;
         var _loc3_:int = 0;
         var _loc8_:* = false;
         var _loc13_:* = undefined;
         var _loc10_:* = undefined;
         var _loc12_:* = null;
         if(param1 == null)
         {
            throw new ArgumentError("skeleton cannot be null.");
         }
         if(animationsChanged)
         {
            _animationsChanged();
         }
         var _loc15_:Vector.<Event> = this.events;
         _loc4_ = 0;
         _loc5_ = tracks.length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = tracks[_loc4_];
            if(!(_loc6_ == null || _loc6_.delay > 0))
            {
               _loc14_ = Number(_loc6_.alpha);
               if(_loc6_.mixingFrom != null)
               {
                  _loc14_ = Number(_loc14_ * applyMixingFrom(_loc6_,param1));
               }
               else if(_loc6_.trackTime >= _loc6_.trackEnd)
               {
                  _loc14_ = 0;
               }
               _loc11_ = _loc6_.animationLast;
               var _loc2_:Number = _loc6_.getAnimationTime();
               _loc9_ = _loc6_.animation.timelines.length;
               _loc7_ = _loc6_.animation.timelines;
               _loc3_ = 0;
               if(_loc14_ == 1)
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc9_)
                  {
                     Timeline(_loc7_[_loc3_]).apply(param1,_loc11_,_loc2_,_loc15_,1,true,false);
                     _loc3_++;
                  }
               }
               else
               {
                  _loc8_ = _loc6_.timelinesRotation.length == 0;
                  if(_loc8_)
                  {
                     _loc6_.timelinesRotation.length = _loc9_ << 1;
                  }
                  _loc13_ = _loc6_.timelinesRotation;
                  _loc10_ = _loc6_.timelinesFirst;
                  _loc3_ = 0;
                  while(_loc3_ < _loc9_)
                  {
                     _loc12_ = _loc7_[_loc3_];
                     if(_loc12_ is RotateTimeline)
                     {
                        applyRotateTimeline(_loc12_,param1,_loc2_,_loc14_,_loc10_[_loc3_],_loc13_,_loc3_ << 1,_loc8_);
                     }
                     else
                     {
                        _loc12_.apply(param1,_loc11_,_loc2_,_loc15_,_loc14_,_loc10_[_loc3_],false);
                     }
                     _loc3_++;
                  }
               }
               queueEvents(_loc6_,_loc2_);
               _loc15_.length = 0;
               _loc6_.nextAnimationLast = _loc2_;
               _loc6_.nextTrackLast = _loc6_.trackTime;
            }
            _loc4_++;
         }
         queue.drain();
      }
      
      private function applyMixingFrom(param1:TrackEntry, param2:Skeleton) : Number
      {
         var _loc5_:int = 0;
         var _loc14_:* = null;
         var _loc6_:Boolean = false;
         var _loc15_:TrackEntry = param1.mixingFrom;
         if(_loc15_.mixingFrom != null)
         {
            applyMixingFrom(_loc15_,param2);
         }
         var _loc17_:* = 0;
         if(param1.mixDuration == 0)
         {
            _loc17_ = 1;
         }
         else
         {
            _loc17_ = Number(param1.mixTime / param1.mixDuration);
            if(_loc17_ > 1)
            {
               _loc17_ = 1;
            }
         }
         var _loc18_:Vector.<Event> = _loc17_ < _loc15_.eventThreshold?this.events:null;
         var _loc4_:* = _loc17_ < _loc15_.attachmentThreshold;
         var _loc11_:* = _loc17_ < _loc15_.drawOrderThreshold;
         var _loc12_:Number = _loc15_.animationLast;
         var _loc3_:Number = _loc15_.getAnimationTime();
         var _loc9_:int = _loc15_.animation.timelines.length;
         var _loc7_:Vector.<Timeline> = _loc15_.animation.timelines;
         var _loc10_:Vector.<Boolean> = _loc15_.timelinesFirst;
         var _loc13_:Number = _loc15_.alpha * param1.mixAlpha * (1 - _loc17_);
         var _loc8_:* = _loc15_.timelinesRotation.length == 0;
         if(_loc8_)
         {
            _loc15_.timelinesRotation.length = _loc9_ << 1;
         }
         var _loc16_:Vector.<Number> = _loc15_.timelinesRotation;
         _loc5_ = 0;
         for(; _loc5_ < _loc9_; _loc5_++)
         {
            _loc14_ = _loc7_[_loc5_];
            _loc6_ = _loc10_[_loc5_];
            if(_loc14_ is RotateTimeline)
            {
               applyRotateTimeline(_loc14_,param2,_loc3_,_loc13_,_loc6_,_loc16_,_loc5_ << 1,_loc8_);
            }
            else
            {
               if(!_loc6_)
               {
                  if(!(!_loc4_ && _loc14_ is AttachmentTimeline))
                  {
                     if(!_loc11_ && _loc14_ is DrawOrderTimeline)
                     {
                     }
                     continue;
                  }
                  continue;
               }
               _loc14_.apply(param2,_loc12_,_loc3_,_loc18_,_loc13_,_loc6_,true);
            }
         }
         if(param1.mixDuration > 0)
         {
            queueEvents(_loc15_,_loc3_);
         }
         this.events.length = 0;
         _loc15_.nextAnimationLast = _loc3_;
         _loc15_.nextTrackLast = _loc15_.trackTime;
         return _loc17_;
      }
      
      private function applyRotateTimeline(param1:Timeline, param2:Skeleton, param3:Number, param4:Number, param5:Boolean, param6:Vector.<Number>, param7:int, param8:Boolean) : void
      {
         var _loc9_:Number = NaN;
         var _loc22_:int = 0;
         var _loc21_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc10_:* = NaN;
         var _loc18_:* = NaN;
         var _loc20_:* = false;
         if(param8)
         {
            param6[param7] = 0;
         }
         if(param4 == 1)
         {
            param1.apply(param2,0,param3,null,1,param5,false);
            return;
         }
         var _loc13_:RotateTimeline = RotateTimeline(param1);
         var _loc11_:Vector.<Number> = _loc13_.frames;
         var _loc14_:Bone = param2.bones[_loc13_.boneIndex];
         if(param3 < _loc11_[0])
         {
            if(param5)
            {
               _loc14_.rotation = _loc14_.data.rotation;
            }
            return;
         }
         if(param3 >= _loc11_[_loc11_.length - 2])
         {
            _loc9_ = _loc14_.data.rotation + _loc11_[_loc11_.length + -1];
         }
         else
         {
            _loc22_ = Animation.binarySearch(_loc11_,param3,2);
            _loc21_ = _loc11_[_loc22_ + -1];
            _loc12_ = _loc11_[_loc22_];
            _loc17_ = _loc13_.getCurvePercent((_loc22_ >> 1) - 1,1 - (param3 - _loc12_) / (_loc11_[_loc22_ + -2] - _loc12_));
            _loc9_ = _loc11_[_loc22_ + 1] - _loc21_;
            _loc9_ = _loc9_ - (16384 - (int(16384.5 - _loc9_ / 360))) * 360;
            _loc9_ = _loc21_ + _loc9_ * _loc17_ + _loc14_.data.rotation;
            _loc9_ = _loc9_ - (16384 - (int(16384.5 - _loc9_ / 360))) * 360;
         }
         var _loc23_:Number = !!param5?_loc14_.data.rotation:Number(_loc14_.rotation);
         var _loc15_:Number = _loc9_ - _loc23_;
         if(_loc15_ == 0)
         {
            _loc19_ = param6[param7];
         }
         else
         {
            _loc15_ = _loc15_ - (16384 - (int(16384.5 - _loc15_ / 360))) * 360;
            if(param8)
            {
               _loc18_ = 0;
               _loc10_ = _loc15_;
            }
            else
            {
               _loc18_ = Number(param6[param7]);
               _loc10_ = Number(param6[param7 + 1]);
            }
            _loc20_ = _loc15_ > 0;
            var _loc16_:* = _loc18_ >= 0;
            if(MathUtils.signum(_loc10_) != MathUtils.signum(_loc15_) && Math.abs(_loc10_) <= 90)
            {
               if(Math.abs(_loc18_) > 180)
               {
                  _loc18_ = Number(_loc18_ + 360 * MathUtils.signum(_loc18_));
               }
               _loc16_ = _loc20_;
            }
            _loc19_ = _loc15_ + _loc18_ - _loc18_ % 360;
            if(_loc16_ != _loc20_)
            {
               _loc19_ = _loc19_ + 360 * MathUtils.signum(_loc18_);
            }
            param6[param7] = _loc19_;
         }
         param6[param7 + 1] = _loc15_;
         _loc23_ = _loc23_ + _loc19_ * param4;
         _loc14_.rotation = _loc23_ - (16384 - (int(16384.5 - _loc23_ / 360))) * 360;
      }
      
      private function queueEvents(param1:TrackEntry, param2:Number) : void
      {
         var _loc7_:* = null;
         var _loc6_:Number = param1.animationStart;
         var _loc10_:Number = param1.animationEnd;
         var _loc3_:Number = _loc10_ - _loc6_;
         var _loc4_:Number = param1.trackLast % _loc3_;
         var _loc8_:Vector.<Event> = this.events;
         var _loc5_:int = 0;
         var _loc9_:int = _loc8_.length;
         while(_loc5_ < _loc9_)
         {
            _loc7_ = _loc8_[_loc5_];
            if(_loc7_.time >= _loc4_)
            {
               if(_loc7_.time <= _loc10_)
               {
                  queue.event(param1,_loc7_);
               }
               _loc5_++;
               continue;
            }
            break;
         }
         if(!!param1.loop?_loc4_ > param1.trackTime % _loc3_:Boolean(param2 >= _loc10_ && param1.animationLast < _loc10_))
         {
            queue.complete(param1);
         }
         while(_loc5_ < _loc9_)
         {
            _loc7_ = _loc8_[_loc5_];
            if(_loc7_.time >= _loc6_)
            {
               queue.event(param1,_loc8_[_loc5_]);
            }
            _loc5_++;
         }
      }
      
      public function clearTracks() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Boolean = queue.drainDisabled;
         queue.drainDisabled = true;
         _loc2_ = 0;
         _loc3_ = tracks.length;
         while(_loc2_ < _loc3_)
         {
            clearTrack(_loc2_);
            _loc2_++;
         }
         tracks.length = 0;
         queue.drainDisabled = _loc1_;
         queue.drain();
      }
      
      public function clearTrack(param1:int) : void
      {
         var _loc4_:* = null;
         if(param1 >= tracks.length)
         {
            return;
         }
         var _loc3_:TrackEntry = tracks[param1];
         if(_loc3_ == null)
         {
            return;
         }
         queue.end(_loc3_);
         disposeNext(_loc3_);
         var _loc2_:* = _loc3_;
         while(true)
         {
            _loc4_ = _loc2_.mixingFrom;
            if(_loc4_ != null)
            {
               queue.end(_loc4_);
               _loc2_.mixingFrom = null;
               _loc2_ = _loc4_;
               continue;
            }
            break;
         }
         tracks[_loc3_.trackIndex] = null;
         queue.drain();
      }
      
      private function setCurrent(param1:int, param2:TrackEntry, param3:Boolean) : void
      {
         var _loc4_:TrackEntry = expandToIndex(param1);
         tracks[param1] = param2;
         if(_loc4_ != null)
         {
            if(param3)
            {
               queue.interrupt(_loc4_);
            }
            param2.mixingFrom = _loc4_;
            param2.mixTime = 0;
            _loc4_.timelinesRotation.length = 0;
            if(_loc4_.mixingFrom != null && _loc4_.mixDuration > 0)
            {
               param2.mixAlpha = param2.mixAlpha * Math.min(_loc4_.mixTime / _loc4_.mixDuration,1);
            }
         }
         queue.start(param2);
      }
      
      public function setAnimationByName(param1:int, param2:String, param3:Boolean) : TrackEntry
      {
         var _loc4_:Animation = data.skeletonData.findAnimation(param2);
         if(_loc4_ == null)
         {
            throw new ArgumentError("Animation not found: " + param2);
         }
         return setAnimation(param1,_loc4_,param3);
      }
      
      public function setAnimation(param1:int, param2:Animation, param3:Boolean) : TrackEntry
      {
         if(param2 == null)
         {
            throw new ArgumentError("animation cannot be null.");
         }
         var _loc6_:Boolean = true;
         var _loc5_:TrackEntry = expandToIndex(param1);
         if(_loc5_ != null)
         {
            if(_loc5_.nextTrackLast == -1)
            {
               tracks[param1] = _loc5_.mixingFrom;
               queue.interrupt(_loc5_);
               queue.end(_loc5_);
               disposeNext(_loc5_);
               _loc5_ = _loc5_.mixingFrom;
               _loc6_ = false;
            }
            else
            {
               disposeNext(_loc5_);
            }
         }
         var _loc4_:TrackEntry = trackEntry(param1,param2,param3,_loc5_);
         setCurrent(param1,_loc4_,_loc6_);
         queue.drain();
         return _loc4_;
      }
      
      public function addAnimationByName(param1:int, param2:String, param3:Boolean, param4:Number) : TrackEntry
      {
         var _loc5_:Animation = data.skeletonData.findAnimation(param2);
         if(_loc5_ == null)
         {
            throw new ArgumentError("Animation not found: " + param2);
         }
         return addAnimation(param1,_loc5_,param3,param4);
      }
      
      public function addAnimation(param1:int, param2:Animation, param3:Boolean, param4:Number) : TrackEntry
      {
         var _loc5_:Number = NaN;
         if(param2 == null)
         {
            throw new ArgumentError("animation cannot be null.");
         }
         var _loc7_:TrackEntry = expandToIndex(param1);
         if(_loc7_ != null)
         {
            while(_loc7_.next != null)
            {
               _loc7_ = _loc7_.next;
            }
         }
         var _loc6_:TrackEntry = trackEntry(param1,param2,param3,_loc7_);
         if(_loc7_ == null)
         {
            setCurrent(param1,_loc6_,true);
            queue.drain();
         }
         else
         {
            _loc7_.next = _loc6_;
            if(param4 <= 0)
            {
               _loc5_ = _loc7_.animationEnd - _loc7_.animationStart;
               if(_loc5_ != 0)
               {
                  param4 = Number(param4 + (_loc5_ * (1 + int(_loc7_.trackTime / _loc5_)) - data.getMix(_loc7_.animation,param2)));
               }
               else
               {
                  param4 = 0;
               }
            }
         }
         _loc6_.delay = param4;
         return _loc6_;
      }
      
      public function setEmptyAnimation(param1:int, param2:Number) : TrackEntry
      {
         var _loc3_:TrackEntry = setAnimation(param1,emptyAnimation,false);
         _loc3_.mixDuration = param2;
         _loc3_.trackEnd = param2;
         return _loc3_;
      }
      
      public function addEmptyAnimation(param1:int, param2:Number, param3:Number) : TrackEntry
      {
         if(param3 <= 0)
         {
            param3 = param3 - param2;
         }
         var _loc4_:TrackEntry = addAnimation(param1,emptyAnimation,false,param3);
         _loc4_.mixDuration = param2;
         _loc4_.trackEnd = param2;
         return _loc4_;
      }
      
      public function setEmptyAnimations(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Boolean = queue.drainDisabled;
         queue.drainDisabled = true;
         _loc4_ = 0;
         _loc5_ = tracks.length;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = tracks[_loc4_];
            if(_loc2_ != null)
            {
               setEmptyAnimation(_loc2_.trackIndex,param1);
            }
            _loc4_++;
         }
         queue.drainDisabled = _loc3_;
         queue.drain();
      }
      
      private function expandToIndex(param1:int) : TrackEntry
      {
         if(param1 < tracks.length)
         {
            return tracks[param1];
         }
         tracks.length = param1 + 1;
         return null;
      }
      
      private function trackEntry(param1:int, param2:Animation, param3:Boolean, param4:TrackEntry) : TrackEntry
      {
         var _loc5_:TrackEntry = TrackEntry(trackEntryPool.obtain());
         _loc5_.trackIndex = param1;
         _loc5_.animation = param2;
         _loc5_.loop = param3;
         _loc5_.eventThreshold = 0;
         _loc5_.attachmentThreshold = 0;
         _loc5_.drawOrderThreshold = 0;
         _loc5_.animationStart = 0;
         _loc5_.animationEnd = param2.duration;
         _loc5_.animationLast = -1;
         _loc5_.nextAnimationLast = -1;
         _loc5_.delay = 0;
         _loc5_.trackTime = 0;
         _loc5_.trackLast = -1;
         _loc5_.nextTrackLast = -1;
         _loc5_.trackEnd = 2147483647;
         _loc5_.timeScale = 1;
         _loc5_.alpha = 1;
         _loc5_.mixAlpha = 1;
         _loc5_.mixTime = 0;
         _loc5_.mixDuration = param4 == null?0:Number(data.getMix(param4.animation,param2));
         return _loc5_;
      }
      
      private function disposeNext(param1:TrackEntry) : void
      {
         var _loc2_:TrackEntry = param1.next;
         while(_loc2_ != null)
         {
            queue.dispose(_loc2_);
            _loc2_ = _loc2_.next;
         }
         param1.next = null;
      }
      
      private function _animationsChanged() : void
      {
         var _loc1_:* = null;
         animationsChanged = false;
         var _loc6_:* = new Dictionary();
         this.propertyIDs = _loc6_;
         var _loc2_:* = _loc6_;
         var _loc3_:int = 0;
         var _loc4_:int = tracks.length;
         var _loc8_:int = 0;
         var _loc7_:* = _loc2_;
         for(var _loc5_ in _loc2_)
         {
            delete _loc2_[_loc5_];
         }
         while(_loc3_ < _loc4_)
         {
            _loc1_ = tracks[_loc3_];
            if(_loc1_ != null)
            {
               setTimelinesFirst(_loc1_);
               _loc3_++;
               break;
            }
            _loc3_++;
         }
         while(_loc3_ < _loc4_)
         {
            _loc1_ = tracks[_loc3_];
            if(_loc1_ != null)
            {
               checkTimelinesFirst(_loc1_);
            }
            _loc3_++;
         }
      }
      
      private function setTimelinesFirst(param1:TrackEntry) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(param1.mixingFrom != null)
         {
            setTimelinesFirst(param1.mixingFrom);
            checkTimelinesUsage(param1,param1.timelinesFirst);
            return;
         }
         var _loc4_:Dictionary = this.propertyIDs;
         var _loc2_:Vector.<Timeline> = param1.animation.timelines;
         var _loc7_:int = _loc2_.length;
         var _loc3_:Vector.<Boolean> = param1.timelinesFirst;
         _loc3_.length = _loc7_;
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc6_ = _loc2_[_loc5_].getPropertyId().toString();
            _loc4_[_loc6_] = _loc6_;
            _loc3_[_loc5_] = true;
            _loc5_++;
         }
      }
      
      private function checkTimelinesFirst(param1:TrackEntry) : void
      {
         if(param1.mixingFrom != null)
         {
            checkTimelinesFirst(param1.mixingFrom);
         }
         checkTimelinesUsage(param1,param1.timelinesFirst);
      }
      
      private function checkTimelinesUsage(param1:TrackEntry, param2:Vector.<Boolean>) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc5_:Dictionary = this.propertyIDs;
         var _loc3_:Vector.<Timeline> = param1.animation.timelines;
         var _loc8_:int = _loc3_.length;
         var _loc4_:* = param2;
         param2.length = _loc8_;
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc7_ = _loc3_[_loc6_].getPropertyId().toString();
            _loc4_[_loc6_] = !_loc5_.hasOwnProperty(_loc7_);
            _loc5_[_loc7_] = _loc7_;
            _loc6_++;
         }
      }
      
      public function getCurrent(param1:int) : TrackEntry
      {
         if(param1 >= tracks.length)
         {
            return null;
         }
         return tracks[param1];
      }
      
      public function clearListeners() : void
      {
         onStart.listeners.length = 0;
         onInterrupt.listeners.length = 0;
         onEnd.listeners.length = 0;
         onDispose.listeners.length = 0;
         onComplete.listeners.length = 0;
         onEvent.listeners.length = 0;
      }
      
      public function clearListenerNotifications() : void
      {
         queue.clear();
      }
   }
}
