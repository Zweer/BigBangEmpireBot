package com.playata.framework.audio.lib.flash
{
   import com.playata.framework.audio.ISoundInstance;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.tween.Tween;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class FlashSoundInstance implements ISoundInstance
   {
       
      
      protected var _identifier:String = null;
      
      protected var _sound:Sound = null;
      
      protected var _transform:SoundTransform = null;
      
      protected var _channel:SoundChannel = null;
      
      protected var _isLooping:Boolean = false;
      
      protected var _isPlaying:Boolean = false;
      
      protected var _pauseOffset:Number = 0;
      
      protected var _disposed:Boolean = false;
      
      protected var _onComplete:ISignal = null;
      
      public function FlashSoundInstance(param1:String, param2:Sound, param3:Number = 1)
      {
         super();
         _identifier = param1;
         _sound = param2;
         _transform = new SoundTransform();
         _channel = null;
         this.volume = param3;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         stop();
         if(_onComplete != null)
         {
            _onComplete.removeAll();
            _onComplete = null;
         }
         try
         {
            _sound.close();
         }
         catch(e:Error)
         {
         }
         _sound = null;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get isLooping() : Boolean
      {
         return _isLooping;
      }
      
      public function get onComplete() : ISignal
      {
         if(_onComplete == null)
         {
            _onComplete = new Signal();
         }
         return _onComplete;
      }
      
      public function get isPlaying() : Boolean
      {
         if(_disposed)
         {
            return false;
         }
         if(_sound == null || _channel == null)
         {
            return false;
         }
         return _isPlaying;
      }
      
      public function get duration() : Number
      {
         try
         {
            var _loc2_:* = !!_sound?_sound.length / 1000:0;
            return _loc2_;
         }
         catch(e:Error)
         {
            var _loc3_:int = 0;
            return _loc3_;
         }
      }
      
      public function get volume() : Number
      {
         return _transform.volume;
      }
      
      public function set volume(param1:Number) : void
      {
         if(_disposed)
         {
            return;
         }
         _transform.volume = param1;
         if(_channel)
         {
            _channel.soundTransform = _transform;
         }
      }
      
      public function play(param1:Boolean = false) : void
      {
         try
         {
            if(_isPlaying)
            {
               return;
            }
            _isLooping = param1;
            _channel = _sound.play(0,!!_isLooping?9999:0,_transform);
            if(_channel == null)
            {
               return;
            }
            _channel.addEventListener("soundComplete",soundCompleteHandler);
            _isPlaying = true;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function stop() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_channel)
         {
            _channel.removeEventListener("soundComplete",soundCompleteHandler);
            _channel.stop();
            _channel = null;
         }
         _isPlaying = false;
      }
      
      public function pause() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_channel == null)
         {
            _pauseOffset = 0;
            return;
         }
         _pauseOffset = _channel.position;
         stop();
      }
      
      public function resume() : void
      {
         try
         {
            if(_sound == null)
            {
               return;
            }
            _channel = _sound.play(_pauseOffset,!!_isLooping?9999:0,_transform);
            if(_channel == null)
            {
               return;
            }
            _channel.addEventListener("soundComplete",soundCompleteHandler);
            _isPlaying = true;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function fadeIn(param1:Number, param2:Function = null) : void
      {
         if(_channel == null)
         {
            return;
         }
         Tween.from(_transform,param1,{
            "volume":0,
            "onUpdate":updateChannel,
            "onComplete":param2
         });
      }
      
      public function fadeOut(param1:Number, param2:Function = null) : void
      {
         if(_channel == null)
         {
            return;
         }
         Tween.to(_transform,param1,{
            "volume":0,
            "onUpdate":updateChannel,
            "onComplete":param2
         });
      }
      
      protected function updateChannel() : void
      {
         if(_channel == null)
         {
            return;
         }
         _channel.soundTransform = _transform;
      }
      
      protected function soundCompleteHandler(param1:Event) : void
      {
         _isPlaying = false;
         if(_onComplete != null)
         {
            _onComplete.dispatch();
         }
      }
   }
}
