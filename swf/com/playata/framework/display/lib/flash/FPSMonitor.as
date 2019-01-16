package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.StringUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class FPSMonitor extends Sprite
   {
      
      private static const FRAMES_COUNTED:uint = 60;
      
      private static const MS_TO_PIXELS_HEIGHT_SCALE:Number = 2;
      
      private static const MONITOR_H:uint = 200;
      
      private static const MONITOR_W:uint = 400;
      
      private static const MONITOR_BG_COLOR:uint = 2566914048;
      
      private static const MONITOR_MEM_COLOR:uint = 3425688319;
      
      private static const MONITOR_TXT_COLOR:uint = 16777215;
      
      private static const MONITOR_FPS_COLOR_TARGET:uint = 4294967295;
      
      private static const MONITOR_FPS_COLOR_IDEAL:uint = 3745185594;
      
      private static const MONITOR_FPS_COLOR_BETTER_THAN_MEDIUM:uint = 3753836347;
      
      private static const MONITOR_FPS_COLOR_BETTER_THAN_CRITICAL:uint = 3758079547;
      
      private static const MONITOR_FPS_COLOR_CRITICAL:uint = 3758046011;
      
      private static const MONITOR_FPS_COLOR_GUIDE:uint = 4294967295;
       
      
      private var _started:Boolean = false;
      
      private var _idealFps:uint = 0;
      
      private var _idealFpsWithTolerance:uint = 0;
      
      private var _mediumFps:uint = 0;
      
      private var _criticalFps:uint = 0;
      
      private var _memMax:uint = 0;
      
      private var _buttonGc:Sprite;
      
      private var _textInfo:TextField;
      
      private var _textTargetFps:TextField;
      
      private var _textMediumFps:TextField;
      
      private var _textCriticalFps:TextField;
      
      private var _monitor:Bitmap;
      
      private var _monitorImg:BitmapData;
      
      private var _currFrame:uint = 0;
      
      private var _frameTimes:Array;
      
      private var _lastFrameTime:int = 0;
      
      private var _avgTime:int = 0;
      
      private var _longestTime:int = 0;
      
      private var _shortestTime:int = 0;
      
      public function FPSMonitor(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint)
      {
         _frameTimes = [];
         super();
         _idealFps = param1;
         _idealFpsWithTolerance = param1 - param2;
         _mediumFps = param3;
         _criticalFps = param4;
         _memMax = param5;
         _monitorImg = new BitmapData(400,200,true,2566914048);
         _monitor = new Bitmap(_monitorImg);
         var _loc7_:TextFormat = new TextFormat();
         _loc7_.color = 16777215;
         _loc7_.font = "Verdana";
         _loc7_.size = 10;
         var _loc6_:TextFormat = new TextFormat();
         _loc6_.color = 4294967295;
         _loc6_.font = "Verdana";
         _loc6_.size = 10;
         _loc6_.bold = true;
         _textInfo = new TextField();
         _textInfo.defaultTextFormat = _loc7_;
         _textInfo.autoSize = "left";
         _textInfo.selectable = false;
         _textTargetFps = new TextField();
         _textTargetFps.defaultTextFormat = _loc6_;
         _textTargetFps.autoSize = "left";
         _textTargetFps.selectable = false;
         _textTargetFps.text = _idealFps.toString() + "fps";
         _textMediumFps = new TextField();
         _textMediumFps.defaultTextFormat = _loc6_;
         _textMediumFps.autoSize = "left";
         _textMediumFps.selectable = false;
         _textMediumFps.text = _mediumFps.toString() + "fps";
         _textCriticalFps = new TextField();
         _textCriticalFps.defaultTextFormat = _loc6_;
         _textCriticalFps.autoSize = "left";
         _textCriticalFps.selectable = false;
         _textCriticalFps.text = _criticalFps.toString() + "fps";
         _buttonGc = new Sprite();
         _buttonGc.graphics.beginFill(2566914048,0.5);
         _buttonGc.graphics.drawRect(0,0,400,20);
         _buttonGc.graphics.endFill();
         var _loc8_:TextField = new TextField();
         _loc8_.defaultTextFormat = _loc7_;
         _loc8_.text = "Run System.gc()";
         _loc8_.autoSize = "left";
         _loc8_.selectable = false;
         _loc8_.x = (400 - _loc8_.width) * 0.5;
         _loc8_.y = (_buttonGc.height - _loc8_.height) * 0.5;
         _buttonGc.mouseChildren = false;
         _buttonGc.buttonMode = true;
         _buttonGc.addChild(_loc8_);
         _buttonGc.y = _monitor.y + 200;
         addChild(_monitor);
         addChild(_textInfo);
         addChild(_textTargetFps);
         addChild(_textMediumFps);
         addChild(_textCriticalFps);
         addChild(_buttonGc);
         _buttonGc.addEventListener("click",runGC);
         mouseEnabled = false;
         visible = false;
      }
      
      public function dispose() : void
      {
         if(_started)
         {
            stop();
         }
         _buttonGc.removeEventListener("click",runGC);
         removeChild(_monitor);
         removeChild(_textInfo);
         removeChild(_textTargetFps);
         removeChild(_textMediumFps);
         removeChild(_textCriticalFps);
         removeChild(_buttonGc);
         _buttonGc = null;
         _textCriticalFps = null;
         _textMediumFps = null;
         _textTargetFps = null;
         _textInfo = null;
         _monitor = null;
         _monitorImg.dispose();
         _monitorImg = null;
      }
      
      public function start() : void
      {
         _started = true;
         visible = true;
         addEventListener("enterFrame",onEnterFrame);
      }
      
      public function stop() : void
      {
         _started = false;
         visible = false;
         removeEventListener("enterFrame",onEnterFrame);
      }
      
      private function runGC(param1:MouseEvent = null) : void
      {
         Logger.debug("[Application] Running garbage collection");
         System.gc();
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc5_:int = Runtime.getTimer();
         _frameTimes[_currFrame] = _loc5_ - _lastFrameTime;
         _lastFrameTime = _loc5_;
         var _loc4_:Number = _frameTimes[_currFrame];
         _currFrame = Number(_currFrame) + 1;
         if(_currFrame == 60)
         {
            _longestTime = 0;
            _shortestTime = 10000000;
            _loc3_ = 0;
            while(_loc3_ < 60)
            {
               _avgTime = _avgTime + _frameTimes[_loc3_];
               if(_frameTimes[_loc3_] > _longestTime)
               {
                  _longestTime = _frameTimes[_loc3_];
               }
               if(_frameTimes[_loc3_] < _shortestTime)
               {
                  _shortestTime = _frameTimes[_loc3_];
               }
               _loc3_++;
            }
            _avgTime = Math.round(_avgTime / 60);
            _currFrame = 0;
         }
         _monitorImg.scroll(1,0);
         _textTargetFps.y = 200 - 2 * (int(1000 / _idealFps)) - 10;
         _textMediumFps.y = 200 - 2 * (int(1000 / _mediumFps)) - 10;
         _textCriticalFps.y = 200 - 2 * (int(1000 / _criticalFps)) - 10;
         var _loc6_:int = 200 - 2 * _loc4_;
         if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         if(_loc4_ <= int(1000 / _idealFpsWithTolerance))
         {
            _loc2_ = 3745185594;
         }
         else if(_loc4_ <= int(1000 / _mediumFps))
         {
            _loc2_ = 3753836347;
         }
         else if(_loc4_ <= int(1000 / _criticalFps))
         {
            _loc2_ = 3758079547;
         }
         else
         {
            _loc2_ = 3758046011;
         }
         _loc3_ = _loc6_;
         while(_loc3_ < 200)
         {
            _monitorImg.setPixel32(1,_loc3_,_loc2_);
            _loc3_++;
         }
         _monitorImg.setPixel32(1,Math.round(200 - System.totalMemory / 1048576 / _memMax * 200),3425688319);
         _monitorImg.setPixel32(1,Math.round(200 - System.totalMemory / 1048576 / _memMax * 200 - 1),3425688319);
         var _loc7_:String = StringUtil.formatBytes(System.totalMemory) + "\n";
         _loc7_ = _loc7_ + (int(1000 / _avgTime) + "fps\n");
         _loc7_ = _loc7_ + ("Avg: " + _avgTime + "ms. Best: " + _shortestTime + "ms (" + int(1000 / _shortestTime) + "fps). Worst: " + _longestTime + "ms (" + int(1000 / _longestTime) + "fps). Div: " + (int(100 * _longestTime / (_shortestTime != 0?_shortestTime:1) - 100)) + "%\n");
         _textInfo.text = _loc7_;
      }
   }
}
