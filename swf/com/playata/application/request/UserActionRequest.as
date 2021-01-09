package com.playata.application.request
{
   import com.playata.application.AppConfig;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RequestData;
   
   public class UserActionRequest extends JsonActionRemoteRequest
   {
       
      
      public function UserActionRequest(param1:String, param2:Object, param3:Function = null, param4:Boolean = false)
      {
         super(false);
         if(!(param2 is RequestData))
         {
            param2 = RequestData.fromData(param2);
         }
         var _loc5_:RequestData = param2 as RequestData;
         var _loc6_:String = "";
         if(_loc5_.hasData("action"))
         {
            _loc6_ = "Error in UserActionRequest! Parameter \'action\' must not exist in specified request data (will be added internally).";
         }
         if(_loc5_.hasData("user_id"))
         {
            _loc6_ = "Error in UserActionRequest! Parameter \'user_id\' must not exist in specified request data (will be added internally).";
         }
         if(_loc5_.hasData("user_session_id"))
         {
            _loc6_ = "Error in UserActionRequest! Parameter \'user_session_id\' must not exist in specified request data (will be added internally).";
         }
         if(_loc5_.hasData("client_version"))
         {
            _loc6_ = "Error in UserActionRequest! Parameter \'client_version\' must not exist in specified request data (will be added internally).";
         }
         if(_loc5_.hasData("auth"))
         {
            _loc6_ = "Error in UserActionRequest! Parameter \'auth\' must not exist in specified request data (will be added internally).";
         }
         _loc5_.setString("action",param1);
         _followUpCallback = param3;
         _instantRequest = param4;
         createRequest(AppConfig.urlRequestServer,_loc5_);
         sendRequest(NetworkCore.current.serverConnection);
         if(_loc6_ != "")
         {
            throw new Error(_loc6_);
         }
      }
   }
}
