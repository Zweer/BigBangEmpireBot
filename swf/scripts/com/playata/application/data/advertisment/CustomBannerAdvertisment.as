package com.playata.application.data.advertisment
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dataobject.DOCustomBannerAdvertisment;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   
   public class CustomBannerAdvertisment extends DOCustomBannerAdvertisment
   {
       
      
      public function CustomBannerAdvertisment(param1:DOCustomBannerAdvertisment)
      {
         super(param1);
      }
      
      public function get availableStart() : DateTime
      {
         var _loc1_:String = availableTimeStart;
         if(!_loc1_)
         {
            return null;
         }
         return DateTime.fromStringServer(_loc1_);
      }
      
      public function get availableEnd() : DateTime
      {
         var _loc1_:String = availableTimeEnd;
         if(!_loc1_)
         {
            return null;
         }
         return DateTime.fromStringServer(_loc1_);
      }
      
      override public function get url() : String
      {
         var _loc1_:String = super.url;
         _loc1_ = StringUtil.replace(_loc1_,"[userid]",User.current.id.toString());
         _loc1_ = StringUtil.replace(_loc1_,"[serverid]",ServerInfo.serverId);
         return _loc1_;
      }
      
      public function get bannerImage() : String
      {
         var _loc1_:String = identifier;
         _loc1_ = StringUtil.replace(_loc1_,"[locale]",Environment.info.defaultLocale);
         return ServerInfo.assetURL("custom_banners/" + _loc1_,"png");
      }
      
      public function get rewardString() : String
      {
         var _loc3_:TypedObject = super.rewards;
         if(!_loc3_)
         {
            return "";
         }
         var _loc1_:String = "";
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_.keys;
         for each(var _loc2_ in _loc3_.keys)
         {
            _loc1_ = _loc1_ + GameUtil.getCustomBannerRewardString(_loc2_,_loc3_.getData(_loc2_),User.current.character.level);
         }
         return _loc1_;
      }
      
      public function get isAvailable() : Boolean
      {
         if(availableStart)
         {
            if(availableStart.timestamp > TimeUtil.now)
            {
               return false;
            }
         }
         if(availableEnd)
         {
            if(availableEnd.timestamp < TimeUtil.now)
            {
               return false;
            }
         }
         return true;
      }
      
      public function trackClick() : void
      {
         Environment.application.sendActionRequest("trackCustomBannerAdvertismentClick",{"identifier":identifier},handleRequests,false);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("trackCustomBannerAdvertismentClick" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            Environment.reportError(param1.error,param1.request,false,true);
         }
      }
   }
}
