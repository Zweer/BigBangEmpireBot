package com.playata.framework.advertisement.provider
{
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.advertisement.IAdvertismentFactory;
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.core.Runtime;
   
   public class TrialpayAdProvider implements IAdProvider
   {
       
      
      private var _advertismentFactory:IAdvertismentFactory;
      
      private var _userId:String = null;
      
      private var _offerwallOnReward:Function = null;
      
      private var _rewardedPemiumCurrency:int = 0;
      
      public function TrialpayAdProvider()
      {
         super();
      }
      
      public function set advertismentFactory(param1:IAdvertismentFactory) : void
      {
         _advertismentFactory = param1;
      }
      
      public function get key() : String
      {
         return "trialpay";
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
         Runtime.addJavaScriptCallback("callbackOfferwallComplete",callbackOfferwallProductOnComplete);
         Runtime.addJavaScriptCallback("callbackOfferwallReward",callbackOfferwallReward);
      }
      
      public function supports(param1:AdType) : Boolean
      {
         if(param1 == AdType.OFFERWALL)
         {
            return true;
         }
         return false;
      }
      
      public function showOfferwall(param1:Function, param2:Function) : void
      {
         _rewardedPemiumCurrency = 0;
         _offerwallOnReward = param2;
         Runtime.callJavaScript("openOfferwallFrame",[_userId,key]);
      }
      
      public function videoAvailable(param1:Function) : void
      {
      }
      
      public function showVideo(param1:int, param2:int = 0) : IVideoAd
      {
         return null;
      }
      
      public function interstitialAvailable(param1:Function, param2:String = "Interstitial") : void
      {
      }
      
      public function showInterstitial(param1:Function, param2:String = "Interstitial") : void
      {
      }
      
      private function callbackOfferwallReward(param1:int) : void
      {
         _rewardedPemiumCurrency = _rewardedPemiumCurrency + param1;
      }
      
      private function callbackOfferwallProductOnComplete() : void
      {
         if(_offerwallOnReward != null)
         {
            _offerwallOnReward(_rewardedPemiumCurrency);
         }
      }
      
      public function dispose() : void
      {
         Runtime.addJavaScriptCallback("callbackOfferwallComplete",null);
         Runtime.addJavaScriptCallback("callbackOfferwallReward",null);
      }
   }
}
