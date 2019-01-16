package com.playata.application
{
   import com.playata.application.config.DefaultConfigCommon;
   import com.playata.application.task.AppFlashTaskManager;
   import com.playata.application.util.DefaultLinkHandler;
   import com.playata.framework.application.EnvironmentConfig;
   import com.playata.framework.audio.lib.flash.FlashAudioCore;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.lib.flash.FlashCore;
   import com.playata.framework.device.lib.flash.FlashDevice;
   import com.playata.framework.display.lib.flash.FlashDisplayCore;
   import com.playata.framework.input.lib.flash.FlashInputCore;
   import com.playata.framework.network.WebNetworkInfo;
   import com.playata.framework.network.lib.flash.FlashNetworkCore;
   import com.playata.framework.tween.lib.greensock.GreenSockTweenHandler;
   
   public class AppEnvironmentConfig extends EnvironmentConfig
   {
       
      
      public function AppEnvironmentConfig(param1:Class, param2:Boolean)
      {
         super();
         this.clientVersion = 81;
         this.core = new FlashCore(new DefaultLinkHandler());
         this.defaultConfig = new TypedObject(DefaultConfigCommon.defaultConfig);
         this.tweenClass = GreenSockTweenHandler;
         this.applicationClass = param1;
         this.deviceClass = FlashDevice;
         this.networkCoreClass = FlashNetworkCore;
         this.audioCoreClass = FlashAudioCore;
         this.inputCoreClass = FlashInputCore;
         this.taskManagerClass = AppFlashTaskManager;
         this.layout = new AppLayout(param2);
         this.errorReporter = new AppErrorReporter();
         this.networkInfoClass = WebNetworkInfo;
         this.displayCoreClass = FlashDisplayCore;
      }
   }
}
