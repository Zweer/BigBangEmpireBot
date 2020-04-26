package com.playata.framework.core.lib.flash
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.ICore;
   import com.playata.framework.core.ICoreInfo;
   import com.playata.framework.core.IHeartbeat;
   import com.playata.framework.core.ILinkHandler;
   import com.playata.framework.core.timer.ITimer;
   
   public class FlashCore implements ICore
   {
       
      
      private var _info:FlashCoreInfo = null;
      
      private var _heartbeat:FlashHeartbeat = null;
      
      private var _linkHandler:ILinkHandler = null;
      
      public function FlashCore(param1:ILinkHandler)
      {
         super();
         if(Core.current == null)
         {
            Core.current = this;
         }
         _info = new FlashCoreInfo();
         _heartbeat = new FlashHeartbeat();
         _linkHandler = param1;
      }
      
      public function get info() : ICoreInfo
      {
         return _info;
      }
      
      public function get heartbeat() : IHeartbeat
      {
         return _heartbeat;
      }
      
      public function get linkHandler() : ILinkHandler
      {
         return _linkHandler;
      }
      
      public function createTimer(param1:String, param2:int, param3:Function, param4:Function = null, param5:int = 0, param6:Boolean = false) : ITimer
      {
         return new FlashTimer(param1,param2,param3,param4,param5,param6);
      }
   }
}
