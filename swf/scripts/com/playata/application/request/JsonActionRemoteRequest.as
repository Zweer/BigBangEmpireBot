package com.playata.application.request
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.UserController;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.CryptoUtil;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RemoteRequest;
   
   public class JsonActionRemoteRequest extends RemoteRequest
   {
      
      public static const AUTH_SALT:String = "bpHgj5214";
      
      protected static var _clientVersion:String = "";
       
      
      protected var _lockApplication:Boolean = false;
      
      protected var _requestStartTime:Number = -1;
      
      protected var _followUpCallback:Function = null;
      
      public function JsonActionRemoteRequest(param1:Boolean)
      {
         super();
         _lockApplication = param1;
      }
      
      public static function set clientVersion(param1:String) : void
      {
         _clientVersion = param1;
      }
      
      public static function get clientVersion() : String
      {
         return _clientVersion;
      }
      
      override protected function addRequestParams() : void
      {
         _request.setString("user_id",Core.config.getString("userId"));
         _request.setString("user_session_id",UserController.userSessionId);
         _request.setString("client_version",_clientVersion);
         _request.setString("auth",getRequestSignature(_request.getString("action"),_request.getString("user_id")));
         _request.setInt("rct",NetworkCore.current.serverConnection.sessionConnectionType);
         _request.setBoolean("keep_active",true);
         if(!_request.hasData("device_type"))
         {
            _request.setString("device_type",Environment.info.system);
         }
      }
      
      override public function get requestName() : String
      {
         if(!_request)
         {
            return "unknown";
         }
         if(!_request.hasData("action"))
         {
            return "unknown;";
         }
         return _request.getString("action");
      }
      
      protected function getRequestSignature(param1:String, param2:String) : String
      {
         return CryptoUtil.md5Hash(param1 + "bpHgj5214" + param2);
      }
      
      override public function onSend() : void
      {
         _requestStartTime = TimeUtil.localDateTime.timestampMilliseconds;
         if(_lockApplication)
         {
            if(Environment.panelManager)
            {
               Environment.panelManager.lockApplication();
            }
         }
      }
      
      override public function onRequestCompleted(param1:String, param2:String, param3:int) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc11_:int = 0;
         var _loc7_:Number = TimeUtil.localDateTime.timestampMilliseconds;
         if(_lockApplication)
         {
            if(Environment.panelManager)
            {
               Environment.panelManager.unlockApplication();
            }
         }
         var _loc12_:* = param1;
         var _loc4_:Object = null;
         var _loc8_:String = _request.getString("action");
         if(_loc12_ == "")
         {
            _loc9_ = param2;
            _loc10_ = null;
            try
            {
               _loc10_ = new TypedObject(JsonUtil.decode(_loc9_));
               if(_loc10_.rawData == null)
               {
                  throw new Error("Failed to decode JSON");
               }
               if(!_loc10_.hasData("data"))
               {
                  throw new Error("Field \'data\' not found.");
               }
               if(!_loc10_.hasData("error"))
               {
                  throw new Error("Field \'error\' not found.");
               }
               if(_loc10_.getString("error") === null)
               {
                  throw new Error("Field \'error\' not a string.");
               }
               if(_loc10_.getString("error") == "")
               {
                  _loc4_ = _loc10_.getData("data");
               }
               else
               {
                  _loc12_ = _loc10_.getString("error");
                  _loc4_ = null;
                  Logger.error("[Request:" + _loc8_ + "] Error on server-side detected: " + _loc12_);
               }
            }
            catch(e:Error)
            {
               if(!_loc9_)
               {
                  _loc12_ = "errorIO";
               }
               else
               {
                  _loc12_ = "errorInvalidResponseFormat";
                  Logger.error("[Request:" + _loc8_ + "] Error: Invalid server response");
                  Logger.error("[Request:" + _loc8_ + "] Exception: \'" + e.message + "\'");
                  Logger.error("[Request:" + _loc8_ + "] JSON: \'" + _loc9_ + "\'");
                  if(_lockApplication)
                  {
                     Environment.reportError("JSON error",new TypedObject({
                        "message":e.message,
                        "json_string":_loc9_
                     }),false,true);
                  }
               }
               _loc4_ = null;
            }
            if(_loc4_ && _loc4_.hasOwnProperty("server_time") && _requestStartTime != -1)
            {
               _loc5_ = _loc7_ - _requestStartTime;
               if(_loc4_.hasOwnProperty("time_correction"))
               {
                  _loc5_ = _loc5_ - _loc4_.time_correction * 1000;
               }
               _loc6_ = _loc5_ * 0.5;
               _loc11_ = _loc4_.server_time;
               TimeUtil.correctTime(_loc11_,_loc6_);
            }
         }
         if(_followUpCallback != null)
         {
            _followUpCallback(_loc8_,_request,_loc12_ == ""?_loc4_:null,_loc12_);
         }
      }
   }
}
