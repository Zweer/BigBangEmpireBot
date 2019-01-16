package com.playata.framework.advertisement
{
   public interface IAdvertismentFactory
   {
       
      
      function update(param1:Vector.<String>) : void;
      
      function newVideoAd(param1:int, param2:int = 0) : IVideoAd;
   }
}
