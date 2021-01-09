package com.playata.framework.audio.lib.flash
{
   import com.playata.framework.audio.ISound;
   import com.playata.framework.audio.ISoundProvider;
   import com.playata.framework.audio.SoundPackages;
   import com.playata.framework.core.logging.Logger;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class FlashUriSoundProvider implements ISoundProvider
   {
       
      
      private var _baseUri:String = null;
      
      private var _soundPackage:int = 0;
      
      public function FlashUriSoundProvider(param1:String)
      {
         super();
         _baseUri = param1;
      }
      
      public function get supportsCaching() : Boolean
      {
         return true;
      }
      
      public function get soundPackage() : int
      {
         return _soundPackage;
      }
      
      public function set soundPackage(param1:int) : void
      {
         _soundPackage = param1;
      }
      
      public function cacheSound(param1:String) : void
      {
         getSound(param1);
      }
      
      public function getSound(param1:String) : ISound
      {
         var _loc2_:String = SoundPackages.getPackageUrlForSound(soundPackage,param1);
         var _loc5_:String = _baseUri + _loc2_ + param1;
         var _loc3_:URLRequest = new URLRequest(_loc5_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener("complete",onStreamLoadComplete);
         _loc4_.addEventListener("progress",onStreamLoadProgress);
         _loc4_.addEventListener("ioError",ioErrorHandler);
         _loc4_.addEventListener("securityError",securityErrorHandler);
         _loc4_.load(_loc3_);
         return new FlashSound(_loc4_);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         Logger.error("[UriSoundProvider:" + getSoundName(param1) + "] Failed -> IO error: " + param1.text);
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         Logger.error("[UriSoundProvider:" + getSoundName(param1) + "] Failed -> security error: " + param1.text);
      }
      
      private function onStreamLoadComplete(param1:Event) : void
      {
         Logger.debug("[UriSoundProvider:" + getSoundName(param1) + "] Completed");
      }
      
      private function onStreamLoadProgress(param1:ProgressEvent) : void
      {
         Logger.debug("[UriSoundProvider:" + getSoundName(param1) + "] " + param1.bytesLoaded + "/" + param1.bytesTotal);
      }
      
      private function getSoundName(param1:Event) : String
      {
         var _loc2_:* = null;
         if(!Logger.enabled)
         {
            return "";
         }
         if(!param1)
         {
            return "unknown";
         }
         try
         {
            if(param1.target is Sound)
            {
               _loc2_ = param1.target as Sound;
               var _loc4_:* = _loc2_.url.substring(_loc2_.url.lastIndexOf("/") + 1);
               return _loc4_;
            }
         }
         catch(e:Error)
         {
            var _loc5_:String = "unknown";
            return _loc5_;
         }
         return "unknown";
      }
   }
}
