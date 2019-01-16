package com.playata.application.data.advertisment
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.dataobject.DOCustomBannerAdvertisment;
   import com.playata.framework.data.DataObjectArray;
   
   public class CustomBannerAdvertisments
   {
      
      private static var _instance:CustomBannerAdvertisments = null;
       
      
      private var _customBannerAdvertisments:Vector.<CustomBannerAdvertisment>;
      
      public function CustomBannerAdvertisments()
      {
         _customBannerAdvertisments = new Vector.<CustomBannerAdvertisment>();
         super();
         if(_instance != null)
         {
            throw new Error("Custom Banner Advertisments can only have a single instance!");
         }
         _instance = this;
      }
      
      public static function get instance() : CustomBannerAdvertisments
      {
         if(!_instance)
         {
            _instance = new CustomBannerAdvertisments();
         }
         return _instance;
      }
      
      public function setData(param1:DataObjectArray) : void
      {
         var _loc3_:* = null;
         if(param1)
         {
            _customBannerAdvertisments = new Vector.<CustomBannerAdvertisment>();
            var _loc5_:int = 0;
            var _loc4_:* = param1;
            for each(var _loc2_ in param1)
            {
               _loc3_ = new CustomBannerAdvertisment(_loc2_);
               _customBannerAdvertisments.push(_loc3_);
            }
         }
      }
      
      public function dispose() : void
      {
         _instance = null;
         _customBannerAdvertisments = null;
      }
      
      public function getCustomBannerAdvertisments() : Vector.<CustomBannerAdvertisment>
      {
         var _loc1_:Vector.<CustomBannerAdvertisment> = new Vector.<CustomBannerAdvertisment>();
         if(!AppEnvironment.appPlatform.isCustomAdvertismentAllowed)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _customBannerAdvertisments;
         for each(var _loc2_ in _customBannerAdvertisments)
         {
            if(_loc2_.isAvailable)
            {
               _loc1_.push(_loc2_);
            }
         }
         _loc1_.sort(sortByIndex);
         return _loc1_;
      }
      
      private function sortByIndex(param1:CustomBannerAdvertisment, param2:CustomBannerAdvertisment) : int
      {
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
   }
}
