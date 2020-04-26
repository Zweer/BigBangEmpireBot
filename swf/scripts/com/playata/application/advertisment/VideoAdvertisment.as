package com.playata.application.advertisment
{
   import com.playata.framework.advertisement.IVideoAd;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   
   public class VideoAdvertisment implements IVideoAd
   {
       
      
      protected var _type:int = 0;
      
      protected var _referenceId:int = 0;
      
      protected var _onError:Signal = null;
      
      protected var _onRewarded:Signal = null;
      
      protected var _videoAdvertismentId:int = 0;
      
      protected var _onInitSuccess:Function = null;
      
      protected var _onInitError:Function = null;
      
      public function VideoAdvertisment()
      {
         super();
         _onError = new Signal();
         _onRewarded = new Signal();
      }
      
      public function prepare(param1:int, param2:int) : void
      {
         _type = param1;
         _referenceId = param2;
         Environment.panelManager.locked = true;
      }
      
      public function error(param1:String) : void
      {
         Environment.panelManager.locked = false;
         _onError.dispatch(param1);
      }
      
      public function init(param1:Function, param2:Function) : void
      {
         _onInitSuccess = param1;
         _onInitError = param2;
         Environment.application.sendActionRequest("initVideoAdvertisment",{
            "type":_type,
            "reference_id":_referenceId
         },handleRequests);
      }
      
      public function completed(param1:Boolean, param2:String = null) : void
      {
         Environment.panelManager.locked = false;
         if(param1 && _videoAdvertismentId)
         {
            Environment.application.sendActionRequest("finishVideoAdvertisment",{
               "id":_videoAdvertismentId,
               "hash":param2
            },handleRequests);
         }
         else
         {
            _onRewarded.dispatch(false,{});
            dispose();
         }
      }
      
      public function get onRewarded() : ISignal
      {
         return _onRewarded;
      }
      
      public function get onError() : ISignal
      {
         return _onError;
      }
      
      private function dispose() : void
      {
         _onError.removeAll();
         _onError = null;
         _onRewarded.removeAll();
         _onRewarded = null;
      }
      
      public function get id() : int
      {
         return _videoAdvertismentId;
      }
      
      protected function onInit(param1:ActionRequestResponse) : void
      {
      }
      
      protected function onFinish(param1:ActionRequestResponse) : void
      {
      }
      
      protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "initVideoAdvertisment":
               onInit(param1);
               if(param1.error == "")
               {
                  _videoAdvertismentId = param1.appResponse.video_advertisment_id;
                  if(_onInitSuccess != null)
                  {
                     _onInitSuccess();
                  }
               }
               else if(_onInitError != null)
               {
                  _onInitError(param1.error);
               }
               break;
            case "finishVideoAdvertisment":
               onFinish(param1);
               if(param1.error == "")
               {
                  if(_onRewarded != null)
                  {
                     _onRewarded.dispatch(true,param1.data);
                  }
                  dispose();
               }
               else
               {
                  _onError.dispatch(param1.error);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
