package com.playata.application.module
{
   import com.playata.application.Application;
   import com.playata.application.data.user.User;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.user.IUser;
   import com.playata.framework.core.TypedObject;
   
   public class AppTrackingModule extends AppModuleBase
   {
       
      
      public function AppTrackingModule(param1:Application)
      {
         super(param1);
      }
      
      public function onPayment(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:Number = NaN;
         var _loc5_:* = null;
         var _loc2_:TypedObject = new TypedObject(param1);
         if(param1 && _loc2_.getInt("payments_made") === 1)
         {
            platform.trackPayConversion(User.current.uniqueUserId,User.current.ref,User.current.subId,_loc2_.getInt("payments_made"),param1 && _loc2_.hasData("payment_details")?_loc2_.getData("payment_details"):null);
         }
         if(param1 && _loc2_.getInt("payments_made") === 1)
         {
            Environment.application.metrics.trackEvent("Conversion_NAPU");
         }
         if(param1 && _loc2_.hasData("payment_details"))
         {
            _loc4_ = _loc2_.getTypedObject("payment_details");
            _loc3_ = _loc4_.getNumber("price_eur");
            _loc5_ = _loc4_.getString("transaction_id");
            Environment.application.metrics.trackRevenue(_loc3_,"EUR",_loc5_);
         }
      }
      
      public function onLevelUp(param1:int) : void
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case 5:
               Environment.application.metrics.trackEvent("Reached_Lvl_5");
               break;
            case 20:
               Environment.application.metrics.trackEvent("Reached_Lvl_20");
               break;
            case 50:
               Environment.application.metrics.trackEvent("Reached_Lvl_50");
               break;
            case 100:
               Environment.application.metrics.trackEvent("Reached_Lvl_100");
         }
         platform.trackLevelUpConversion(User.current.uniqueUserId,User.current.ref,User.current.subId,param1);
      }
      
      public function onTutorialComplete() : void
      {
         Environment.application.metrics.trackEvent("TutorialComplete");
      }
      
      override public function onUserRegister() : void
      {
         Environment.application.metrics.trackEvent("Registration");
         platform.trackRegConversion(User.current.uniqueUserId,User.current.ref,User.current.subId,User.current.rsExtra);
         platform.onLogin(User.current.ref,User.current.subId,User.current.rsExtra);
      }
      
      override public function onUserLogin(param1:AppRequestResponseData) : void
      {
         var _loc3_:int = 0;
         var _loc2_:IUser = Application.userController.user;
         if(_loc2_)
         {
            platform.onLogin(_loc2_.ref,_loc2_.subId,_loc2_.rsExtra);
         }
         if(param1.hasData("login_count",true))
         {
            _loc3_ = param1.login_count;
            if(_loc2_)
            {
               platform.trackLoginConversion(_loc2_.uniqueUserId,_loc2_.ref,_loc2_.subId,_loc3_);
            }
            if(_loc3_ == 0)
            {
               Environment.application.metrics.trackEvent("Registration");
            }
            else if(_loc3_ == 1)
            {
               Environment.application.metrics.trackEvent("Conversion_NAU");
            }
         }
      }
      
      override public function onUserLogout() : void
      {
         var _loc1_:User = Application.userController.appUser;
         if(_loc1_)
         {
            platform.trackLogoutConversion(_loc1_.uniqueUserId,_loc1_.ref,_loc1_.subId);
         }
      }
   }
}
