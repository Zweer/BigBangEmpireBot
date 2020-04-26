package com.playata.application.advertisment
{
   import com.playata.framework.advertisement.IAdvertismentFactory;
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.advertisement.provider.IAdProvider;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.logging.Logger;
   
   public class AdvertismentFactory implements IAdvertismentFactory
   {
      
      private static var EXISTING:Vector.<String> = new Vector.<String>(0);
       
      
      public function AdvertismentFactory()
      {
         super();
      }
      
      public function update(param1:Vector.<String>) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         Environment.application.advertisment.getAdProviderKeys(EXISTING);
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(_loc3_ in param1)
         {
            if(!Environment.application.advertisment.hasAdProvider(_loc3_))
            {
               _loc2_ = createAdProvider(_loc3_);
               if(!_loc2_)
               {
                  Logger.warn("[AdvertismentFactory] Skipping unknown provider",[_loc3_]);
               }
               else
               {
                  _loc2_.advertismentFactory = this;
                  Environment.application.advertisment.addAdProvider(_loc2_);
               }
            }
         }
         var _loc7_:int = 0;
         var _loc6_:* = EXISTING;
         for each(_loc3_ in EXISTING)
         {
            if(param1.indexOf(_loc3_) == -1)
            {
               Environment.application.advertisment.removeAdProvider(_loc3_);
            }
         }
      }
      
      protected function createAdProvider(param1:String) : IAdProvider
      {
         throw new Error("MUST be implemented in child class");
      }
      
      public function newVideoAd(param1:int, param2:int = 0) : IVideoAd
      {
         var _loc3_:IVideoAd = new AppVideoAdvertisment();
         _loc3_.prepare(param1,param2);
         return _loc3_;
      }
   }
}
