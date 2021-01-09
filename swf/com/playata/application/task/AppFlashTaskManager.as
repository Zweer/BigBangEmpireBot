package com.playata.application.task
{
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.Core;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.task.lib.flash.FlashTaskManager;
   import flash.system.Worker;
   import flash.utils.ByteArray;
   
   public class AppFlashTaskManager extends FlashTaskManager
   {
       
      
      public function AppFlashTaskManager(param1:ByteArray, param2:Class)
      {
         super(param1,param2);
      }
      
      public static function get useAsyncTask() : Boolean
      {
         var _loc1_:Boolean = false;
         return _loc1_;
      }
      
      override protected function setAppSharedProperties(param1:Worker) : void
      {
         param1.setSharedProperty("config",Core.config.configValues.rawData);
         param1.setSharedProperty("constants",Constants.current.constants.rawData);
         if(Assets.localAssetFiles)
         {
            param1.setSharedProperty("localAssets",Assets.localAssetFiles.asDictionary);
         }
      }
   }
}
