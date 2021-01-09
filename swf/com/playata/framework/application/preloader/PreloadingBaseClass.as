package com.playata.framework.application.preloader
{
   import com.playata.framework.core.Runtime;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class PreloadingBaseClass extends MovieClip
   {
       
      
      private var _mainClass:String;
      
      private var _progress:Number;
      
      private var _loaderAdjustment:Number;
      
      private var _autoStartUp:Boolean;
      
      private var _lastFrame:int = 1;
      
      public function PreloadingBaseClass(param1:String, param2:Boolean = true)
      {
         super();
         _mainClass = param1;
         _autoStartUp = param2;
         if(stage)
         {
            addedToStageHandler(null);
         }
         else
         {
            addEventListener("addedToStage",addedToStageHandler);
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         _loaderAdjustment = loaderInfo.bytesLoaded;
         addEventListener("enterFrame",enterFrameHandler);
         onInit();
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         _progress = _loaderAdjustment == loaderInfo.bytesTotal?1:Number((loaderInfo.bytesLoaded - _loaderAdjustment) / (loaderInfo.bytesTotal - _loaderAdjustment));
         onLoadProgress(_progress);
         if(_lastFrame != currentFrame)
         {
            onFrameChange(currentFrame);
            _lastFrame = currentFrame;
         }
         if(currentFrame == totalFrames)
         {
            removeEventListener("enterFrame",enterFrameHandler);
            stop();
            onLoadComplete();
            if(_autoStartUp)
            {
               startUp();
            }
         }
      }
      
      protected function onInit() : void
      {
      }
      
      protected function onLoadProgress(param1:Number) : void
      {
      }
      
      protected function onFrameChange(param1:int) : void
      {
      }
      
      protected function onLoadComplete() : void
      {
      }
      
      protected function startUp(... rest) : void
      {
         var _loc2_:Class = Runtime.getClass(_mainClass);
         var _loc3_:DisplayObject = new _loc2_();
         try
         {
            _loc3_["init"].apply(_loc3_,rest);
         }
         catch(error:Error)
         {
         }
         addChild(_loc3_);
      }
      
      protected function get progress() : Number
      {
         return _progress;
      }
   }
}
