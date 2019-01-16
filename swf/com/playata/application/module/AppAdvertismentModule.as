package com.playata.application.module
{
   import com.playata.application.Application;
   import com.playata.application.advertisment.AppVideoAdvertisment;
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   
   public class AppAdvertismentModule extends AppModuleBase
   {
       
      
      private var _showAdvertisment:Boolean = false;
      
      private var _advertismentMinRefreshRate:int = 15;
      
      private var _lastAdvertismentRefreshTime:int = 0;
      
      public function AppAdvertismentModule(param1:Application)
      {
         super(param1);
      }
      
      override public function onInit(param1:ApplicationOptions = null) : void
      {
         Application.onInteraction.add(onInteraction);
      }
      
      override public function onUserLogin(param1:AppRequestResponseData) : void
      {
         Environment.application.advertisment.userId = ServerInfo.serverId + "_" + param1.user.id.toString();
         if(param1.hasData("advertisment_info",true))
         {
            platform.setAdvertismentInfo(param1.advertisment_info);
         }
         if(param1.show_preroll_advertisment === true)
         {
            platform.showPrerollAdvertisment();
         }
         _showAdvertisment = param1.show_advertisment === true && platform.isBannerAdvertismentAllowed;
         if(param1.hasData("advertisment_info",true))
         {
            _advertismentMinRefreshRate = param1.advertisment_info.getInt("advertisment_refresh_rate");
            AppVideoAdvertisment.setRemainingVideoAdvertismentCooldowns(param1.advertisment_info);
         }
         else
         {
            _advertismentMinRefreshRate = 15;
         }
         if(_showAdvertisment)
         {
            setLastAdvertismentRefreshTime();
            platform.showAdvertisment(param1.user.id);
         }
         else
         {
            platform.hideAdvertisment();
         }
      }
      
      override public function onUserLogout() : void
      {
         if(showAdvertisment)
         {
            platform.showLogoutAdvertisment();
         }
      }
      
      public function setLastAdvertismentRefreshTime() : void
      {
         _lastAdvertismentRefreshTime = TimeUtil.now;
      }
      
      public function set showAdvertisment(param1:Boolean) : void
      {
         _showAdvertisment = param1;
      }
      
      public function get showAdvertisment() : Boolean
      {
         return _showAdvertisment;
      }
      
      private function onInteraction() : void
      {
         if(!_showAdvertisment)
         {
            return;
         }
         if(_lastAdvertismentRefreshTime + _advertismentMinRefreshRate > TimeUtil.now)
         {
            return;
         }
         _lastAdvertismentRefreshTime = TimeUtil.now;
         platform.refreshAdvertisment();
      }
   }
}
