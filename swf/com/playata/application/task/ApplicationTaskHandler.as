package com.playata.application.task
{
   import com.playata.application.AppErrorReporter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.AssetsConfig;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.config.Config;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.ObjectUtil;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.task.TaskManager;
   import com.playata.framework.task.lib.flash.FlashTaskHandler;
   import flash.system.Worker;
   import flash.utils.Dictionary;
   
   public class ApplicationTaskHandler extends FlashTaskHandler
   {
       
      
      public function ApplicationTaskHandler()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!TaskManager.isMainThread)
         {
            _loc3_ = Worker.current.getSharedProperty("config");
            Core.config = new Config(new TypedObject(_loc3_),{});
            _loc1_ = Worker.current.getSharedProperty("constants");
            if(_loc1_ != null)
            {
               Constants.current = new Constants(new TypedObject(_loc1_));
            }
            _loc2_ = Worker.current.getSharedProperty("localAssets");
            Assets.assetBasePath = AssetsConfig.cdnURL;
            if(_loc2_)
            {
               Assets.localAssetFiles = StringMap.fromDictionary(_loc2_);
            }
         }
         Logger.debug("[ApplicationTaskHandler] init");
         super.init();
      }
      
      override protected function get isReady() : Boolean
      {
         var _loc1_:* = null;
         try
         {
            _loc1_ = ObjectUtil.instantiateByClassName("SymbolCharacterMBody");
            var _loc3_:* = _loc1_ != null;
            return _loc3_;
         }
         catch(e:Error)
         {
            var _loc4_:Boolean = false;
            return _loc4_;
         }
      }
      
      override protected function reportError(param1:Error) : void
      {
         var _loc2_:* = null;
         if(TaskManager.isMainThread)
         {
            Environment.errorReporter.reportError("TaskHandler: " + param1.toString(),null,false);
         }
         else
         {
            _loc2_ = new AppErrorReporter();
            _loc2_.reportError("TaskHandler: " + param1.toString(),null,false);
         }
      }
   }
}
