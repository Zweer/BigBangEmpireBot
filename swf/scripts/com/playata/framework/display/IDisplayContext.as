package com.playata.framework.display
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.IUpdatable;
   import com.playata.framework.core.signal.ISignal;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   
   public interface IDisplayContext extends IDisposable
   {
       
      
      function start() : void;
      
      function stop(param1:Boolean) : void;
      
      function get stage() : IDisplayObjectContainer;
      
      function get nativeStage() : Stage;
      
      function get softKeyboardRect() : Rectangle;
      
      function setViewPort(param1:int, param2:int, param3:int, param4:int, param5:Number) : void;
      
      function get onResize() : ISignal;
      
      function get canUseHighResTextures() : Boolean;
      
      function set showStats(param1:Boolean) : void;
      
      function get showStats() : Boolean;
      
      function attachUpdatable(param1:IUpdatable) : void;
      
      function dettachUpdatable(param1:IUpdatable) : void;
   }
}
