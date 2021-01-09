package com.playata.application.advertisment
{
   import com.playata.framework.advertisement.provider.ATGWebAdProvider;
   import com.playata.framework.advertisement.provider.IAdProvider;
   import com.playata.framework.advertisement.provider.TrialpayAdProvider;
   
   public class WebAdvertismentFactory extends AdvertismentFactory
   {
       
      
      public function WebAdvertismentFactory()
      {
         super();
      }
      
      override protected function createAdProvider(param1:String) : IAdProvider
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "trialpay":
               return new TrialpayAdProvider();
            case "atg":
               return new ATGWebAdProvider();
            default:
               return null;
         }
      }
   }
}
