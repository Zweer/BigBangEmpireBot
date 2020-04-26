package com.playata.framework.advertisement.provider
{
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.advertisement.IAdvertismentFactory;
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.core.IDisposable;
   
   public interface IAdProvider extends IDisposable
   {
       
      
      function get key() : String;
      
      function set advertismentFactory(param1:IAdvertismentFactory) : void;
      
      function get userId() : String;
      
      function set userId(param1:String) : void;
      
      function init() : void;
      
      function supports(param1:AdType) : Boolean;
      
      function showOfferwall(param1:Function, param2:Function) : void;
      
      function interstitialAvailable(param1:Function, param2:String = "Interstitial") : void;
      
      function showInterstitial(param1:Function, param2:String = "Interstitial") : void;
      
      function videoAvailable(param1:Function) : void;
      
      function showVideo(param1:int, param2:int = 0) : IVideoAd;
   }
}
