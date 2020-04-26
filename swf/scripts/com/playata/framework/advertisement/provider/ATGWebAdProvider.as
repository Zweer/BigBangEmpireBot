package com.playata.framework.advertisement.provider
{
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.advertisement.IAdvertismentFactory;
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   
   public class ATGWebAdProvider implements IAdProvider
   {
       
      
      private var _advertismentFactory:IAdvertismentFactory;
      
      private var _userId:String;
      
      private var _video:IVideoAd;
      
      public function ATGWebAdProvider()
      {
         super();
      }
      
      public function get key() : String
      {
         return "atg";
      }
      
      public function set advertismentFactory(param1:IAdvertismentFactory) : void
      {
         _advertismentFactory = param1;
      }
      
      public function get userId() : String
      {
         return _userId;
      }
      
      public function set userId(param1:String) : void
      {
         _userId = param1;
      }
      
      public function init() : void
      {
         Runtime.addJavaScriptCallback("callbackVideoAdvertisment",callbackVideoAdvertisment);
      }
      
      public function supports(param1:AdType) : Boolean
      {
         if(param1 == AdType.VIDEO)
         {
            return true;
         }
         return false;
      }
      
      public function showOfferwall(param1:Function, param2:Function) : void
      {
      }
      
      public function videoAvailable(param1:Function) : void
      {
      }
      
      public function showVideo(param1:int, param2:int = 0) : IVideoAd
      {
         type = param1;
         referenceId = param2;
         dispatchError = function(param1:String):void
         {
            Runtime.delayFunction(_video.error,0.05,[param1]);
         };
         onVideoInitError = function(param1:String):void
         {
         };
         startVideo = function():void
         {
            Runtime.callJavaScript("showVideoAdvertisment",[null,null,_video.id]);
         };
         _video = _advertismentFactory.newVideoAd(type,referenceId);
         _video.init(startVideo,onVideoInitError);
         return _video;
      }
      
      private function callbackVideoAdvertisment(param1:Boolean, param2:String, param3:String) : void
      {
         Logger.debug("[Application] Received response from external interface...");
         _video.completed(param1,param3);
      }
      
      public function interstitialAvailable(param1:Function, param2:String = "Interstitial") : void
      {
      }
      
      public function showInterstitial(param1:Function, param2:String = "Interstitial") : void
      {
      }
      
      public function dispose() : void
      {
         Runtime.addJavaScriptCallback("callbackVideoAdvertisment",null);
      }
   }
}
