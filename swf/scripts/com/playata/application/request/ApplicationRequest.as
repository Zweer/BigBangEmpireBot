package com.playata.application.request
{
   import com.playata.application.AppConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   
   public class ApplicationRequest extends JsonActionRemoteRequest
   {
      
      private static const SIMULTANEOUS_REQUEST_TIME:Number = 500;
      
      private static var SECURE_REQUEST_ACTIONS:Vector.<String> = new <String>["requestCharacter","loginUser","registerUser","setUserPassword","setUserEmail","unbindUserFromNetwork","deleteUser"];
      
      private static var _lastRequestTimestamp:Number = 0;
      
      private static var _lastRequestKey:String = "";
      
      private static var _lastRequestAction:String = "";
       
      
      public function ApplicationRequest(param1:String, param2:Object, param3:Function = null, param4:String = null, param5:String = null, param6:int = 0, param7:Boolean = true)
      {
         super(true);
         if(!(param2 is RequestData))
         {
            param2 = RequestData.fromData(param2);
         }
         var _loc9_:RequestData = param2 as RequestData;
         var _loc8_:String = param1 + _loc9_.asJsonString;
         if(param7 && _lastRequestKey == _loc8_ && _lastRequestTimestamp + 500 >= DateTime.now.timestampMilliseconds)
         {
            Logger.debug("[Request:" + param1 + "] Skipping simultaneous request " + param1);
            return;
         }
         _lastRequestTimestamp = DateTime.now.timestampMilliseconds;
         _lastRequestKey = _loc8_;
         _lastRequestAction = param1;
         var _loc10_:String = "";
         if(_loc9_.hasData("action"))
         {
            _loc10_ = "Error in ApplicationRequest! Parameter \'action\' must not exist in specified request data (will be added internally).";
         }
         if(_loc9_.hasData("user_id"))
         {
            _loc10_ = "Error in ApplicationRequest! Parameter \'user_id\' must not exist in specified request data (will be added internally).";
         }
         if(_loc9_.hasData("user_session_id"))
         {
            _loc10_ = "Error in ApplicationRequest! Parameter \'user_session_id\' must not exist in specified request data (will be added internally).";
         }
         if(_loc9_.hasData("client_version"))
         {
            _loc10_ = "Error in ApplicationRequest! Parameter \'client_version\' must not exist in specified request data (will be added internally).";
         }
         if(_loc9_.hasData("auth"))
         {
            _loc10_ = "Error in ApplicationRequest! Parameter \'auth\' must not exist in specified request data (will be added internally).";
         }
         if(_loc10_ != "")
         {
            throw new Error(_loc10_);
         }
         _loc9_.setString("action",param1);
         if(Environment.platform.isFacebook && Core.config.hasCfg("facebook_signed_request"))
         {
            _loc9_.setString("signed_request",PlatformConfig.facebookSignedRequest);
         }
         if(!param4)
         {
            param4 = AppConfig.urlRequestServer;
         }
         if(!Environment.info.isTestMode && Core.config.hasCfg("secure_requests_enabled") && AppConfig.secureRequestsEnabled == true)
         {
            if(SECURE_REQUEST_ACTIONS.indexOf(param1) != -1)
            {
               if(param4.indexOf("http://") === 0)
               {
                  param4 = "https://" + param4.substr(7);
               }
            }
         }
         _followUpCallback = param3;
         createRequest(param4,_loc9_,param5,param6);
         sendRequest(NetworkCore.current.serverConnection);
      }
      
      public static function get lastRequestAction() : String
      {
         return _lastRequestAction;
      }
      
      public static function set lastRequestKey(param1:String) : void
      {
         _lastRequestKey = param1;
      }
   }
}
