package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.IUpdatable;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.IDisplayContext;
   import com.playata.framework.display.IDisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class FlashDisplayContext implements IDisplayContext
   {
       
      
      private var _nativeStage:Stage;
      
      private var _stage:FlashDisplayObjectContainer;
      
      private var _statsInfo:FPSMonitor = null;
      
      private var _showStats:Boolean = false;
      
      private var _onResize:ISignal = null;
      
      private var _updatables:Vector.<FlashUpdatable>;
      
      public function FlashDisplayContext(param1:Stage)
      {
         _updatables = new Vector.<FlashUpdatable>(0);
         super();
         _nativeStage = param1;
         _stage = new FlashDisplayObjectContainer(_nativeStage);
         _nativeStage.addEventListener("resize",handleResize);
         start();
         showStats = false;
      }
      
      public function dispose() : void
      {
         _nativeStage.removeEventListener("resize",handleResize,false);
         _onResize.removeAll();
         _onResize = null;
      }
      
      public function start() : void
      {
      }
      
      public function stop(param1:Boolean) : void
      {
      }
      
      public function get canUseHighResTextures() : Boolean
      {
         return false;
      }
      
      public function get stage() : IDisplayObjectContainer
      {
         return _stage;
      }
      
      public function get nativeStage() : Stage
      {
         return _nativeStage;
      }
      
      public function get softKeyboardRect() : Rectangle
      {
         return new Rectangle();
      }
      
      public function set showStats(param1:Boolean) : void
      {
         _showStats = param1;
         if(param1 == true)
         {
            if(!_statsInfo)
            {
               _statsInfo = new FPSMonitor(_nativeStage.frameRate as int,5,20,10,100);
               _statsInfo.x = 10;
               _statsInfo.y = 10;
            }
            _statsInfo.start();
            _nativeStage.addChild(_statsInfo);
         }
         else if(param1 == false && _statsInfo != null)
         {
            _statsInfo.stop();
            _nativeStage.removeChild(_statsInfo);
            _statsInfo = null;
         }
      }
      
      public function get showStats() : Boolean
      {
         return _showStats;
      }
      
      public function setViewPort(param1:int, param2:int, param3:int, param4:int, param5:Number) : void
      {
      }
      
      public function get onResize() : ISignal
      {
         if(_onResize === null)
         {
            _onResize = new Signal();
         }
         return _onResize;
      }
      
      public function attachUpdatable(param1:IUpdatable) : void
      {
         var _loc2_:FlashUpdatable = new FlashUpdatable(param1);
         Core.current.heartbeat.add(_loc2_.onUpdate);
         _updatables.push(_loc2_);
      }
      
      public function dettachUpdatable(param1:IUpdatable) : void
      {
         var _loc2_:FlashUpdatable = null;
         var _loc4_:int = 0;
         var _loc3_:* = _updatables;
         for each(_loc2_ in _updatables)
         {
            if(_loc2_.updatable === param1)
            {
               Core.current.heartbeat.remove(_loc2_.onUpdate);
               break;
            }
         }
      }
      
      private function handleResize(param1:Event) : void
      {
         var _loc2_:int = param1.target.stageWidth as int;
         var _loc3_:int = param1.target.stageHeight as int;
         Logger.info("[FlashDisplayContext] Resize (" + _loc2_ + "x" + _loc3_ + ")");
         if(!§§pop())
         {
            _onResize.dispatch(_loc2_,_loc3_);
         }
      }
   }
}
