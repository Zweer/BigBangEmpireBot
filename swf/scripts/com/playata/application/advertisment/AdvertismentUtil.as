package com.playata.application.advertisment
{
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.advertisement.provider.IAdProvider;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.logging.Logger;
   
   public class AdvertismentUtil
   {
      
      private static var PROVIDERS:Vector.<IAdProvider> = new Vector.<IAdProvider>(0);
      
      private static var _prefecthedVideoProvider:IAdProvider;
      
      private static var _currentVideoAd:IVideoAd;
       
      
      public function AdvertismentUtil()
      {
         super();
      }
      
      public static function checkVideoAvailability(param1:Function = null) : void
      {
         onChecked = param1;
         checkNextProvider = function():void
         {
            if(PROVIDERS.length == 0)
            {
               if(onChecked != null)
               {
                  onChecked(false);
               }
               return;
            }
            provider = PROVIDERS.pop();
            Logger.info("[AdvertismentUtil] Checking provider",[provider.key]);
            provider.videoAvailable(providerChecked);
         };
         if(_prefecthedVideoProvider)
         {
            Logger.info("[AdvertismentUtil] Video already available!");
            if(onChecked != null)
            {
               onChecked(true);
            }
            return;
         }
         Logger.info("[AdvertismentUtil] Starting to check video availability!");
         Environment.application.advertisment.getAdProvidersForType(AdType.VIDEO,PROVIDERS);
         var providerChecked:Function = null;
         providerChecked = function(param1:Boolean):void
         {
            Logger.info("[AdvertismentUtil] Video available from",[provider.key,param1]);
            if(param1)
            {
               Logger.info("[AdvertismentUtil] Video available!");
               _prefecthedVideoProvider = provider;
               if(onChecked != null)
               {
                  onChecked(true);
               }
            }
            else
            {
               checkNextProvider();
            }
         };
         §§push(checkNextProvider());
      }
      
      public static function playVideo(param1:int, param2:int, param3:Function) : void
      {
         type = param1;
         referenceId = param2;
         onComplete = param3;
         onError = function(param1:String):void
         {
            _prefecthedVideoProvider = null;
            _currentVideoAd = null;
            Logger.info("[Video] Error showing video",[param1]);
         };
         onVideoRewarded = function(param1:Boolean, param2:Object):void
         {
            _prefecthedVideoProvider = null;
            _currentVideoAd = null;
            Logger.info("[Video] success = " + param1,[param2]);
         };
         if(!_prefecthedVideoProvider)
         {
            §§push(onError("noVideoAvailable"));
            return;
         }
         _currentVideoAd = _prefecthedVideoProvider.showVideo(type,referenceId);
         _currentVideoAd.onError.addOnce(onError);
         _currentVideoAd.onRewarded.addOnce(onVideoRewarded);
      }
      
      public static function get currentVideoAd() : IVideoAd
      {
         if(!_currentVideoAd)
         {
            return null;
         }
         return _currentVideoAd;
      }
   }
}
