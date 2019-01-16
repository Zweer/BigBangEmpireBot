package com.playata.application.advertisment
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import flash.external.ExternalInterface;
   
   public class AppVideoAdvertisment extends VideoAdvertisment
   {
      
      private static var _shownAdvertisments:StringMap = new StringMap();
      
      private static var _lastShownAdvertismentTimestamp:IntMap = new IntMap();
       
      
      public function AppVideoAdvertisment()
      {
         super();
      }
      
      public static function setRemainingVideoAdvertismentCooldowns(param1:TypedObject) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1.keys;
         for each(var _loc4_ in param1.keys)
         {
            if(_loc4_.indexOf("remaining_video_advertisment_cooldown__") != -1)
            {
               _loc3_ = parseInt(StringUtil.replace(_loc4_,"remaining_video_advertisment_cooldown__",""));
               _loc2_ = param1.getInt(_loc4_);
               if(!(!_loc2_ || _loc2_ < 0))
               {
                  _lastShownAdvertismentTimestamp.setData(_loc3_,TimeUtil.now - (AppEnvironment.appPlatform.getAdvertismentInfoInt("video_advertisment_blocked_time__" + _loc3_.toString(),3600) - _loc2_));
               }
            }
         }
      }
      
      public static function getLastShownAdvertismentTimestamp(param1:int) : int
      {
         if(!_lastShownAdvertismentTimestamp)
         {
            return 0;
         }
         if(!_lastShownAdvertismentTimestamp.exists(param1))
         {
            return 0;
         }
         return _lastShownAdvertismentTimestamp.getData(param1);
      }
      
      public static function updateLastShownAdvertismentTimestamp(param1:int) : void
      {
         if(!_lastShownAdvertismentTimestamp)
         {
            return;
         }
         _lastShownAdvertismentTimestamp.setData(param1,TimeUtil.now);
      }
      
      public static function resetShownAdvertisments() : void
      {
         _shownAdvertisments = new StringMap();
         _lastShownAdvertismentTimestamp = new IntMap();
      }
      
      public static function advertismentShownCount(param1:int, param2:int) : int
      {
         var _loc3_:String = param1.toString() + "_" + param2.toString();
         if(!_shownAdvertisments.exists(_loc3_))
         {
            return 0;
         }
         return _shownAdvertisments.getData(_loc3_);
      }
      
      public static function increaseShownCount(param1:int, param2:int) : void
      {
         var _loc3_:String = param1.toString() + "_" + param2.toString();
         if(!_shownAdvertisments.exists(_loc3_))
         {
            _shownAdvertisments.setData(_loc3_,1);
         }
         else
         {
            _shownAdvertisments.setData(_loc3_,_shownAdvertisments.getData(_loc3_) + 1);
         }
      }
      
      public static function isAvailable(param1:int, param2:int) : Boolean
      {
         type = param1;
         referenceId = param2;
         if(referenceId == 0)
         {
            return false;
         }
         if(AppConfig.videoAdvertismentEnabled != true)
         {
            return false;
         }
         if(!AppEnvironment.appPlatform.isVideoAdvertismentAllowed)
         {
            return false;
         }
         if(User.current.character.level < 2)
         {
            return false;
         }
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("callbackHasVideoAdvertisment",function(param1:Boolean):void
            {
            });
            ExternalInterface.call("hasGANVideoAdvertisment");
         }
         switch(int(type) - 1)
         {
            case 0:
               return advertismentShownCount(type,referenceId) < CConstant.video_advertisment_max_views_quest;
            case 1:
               return advertismentShownCount(type,referenceId) < CConstant.video_advertisment_max_views_convention_show;
            default:
               return false;
            case 3:
               return advertismentShownCount(type,referenceId) < CConstant.video_advertisment_max_views_dungeon_cooldown;
         }
      }
      
      override protected function onInit(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            updateLastShownAdvertismentTimestamp(_type);
         }
         else if(param1.error == "errStartMaxViewsReached")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/video_advertisment/max_views_reached/title"),LocText.current.text("dialog/video_advertisment/max_views_reached/text"),LocText.current.text("general/button_ok")));
            updateLastShownAdvertismentTimestamp(_type);
         }
         else if(param1.error.indexOf("errStartNotYetAvailable_") != 1)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/video_advertisment/not_yet_available/title"),LocText.current.text("dialog/video_advertisment/not_yet_available/text"),LocText.current.text("general/button_ok")));
            _loc2_ = parseInt(param1.error.substr("errStartNotYetAvailable_".length));
            _lastShownAdvertismentTimestamp.setData(_type,TimeUtil.now - (AppEnvironment.appPlatform.getAdvertismentInfoInt("video_advertisment_blocked_time__" + _type.toString(),3600) - _loc2_));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override protected function onFinish(param1:ActionRequestResponse) : void
      {
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            MessageRouter.dispatch(new Message("ViewMessage.notifyVideoAdvertismentFinished",{
               "type":_type,
               "reference_id":_referenceId
            },this));
            increaseShownCount(_type,_referenceId);
            if(param1.appResponse.saved_seconds)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/video_advertisment/finished/title"),LocText.current.text("dialog/video_advertisment/finished/text",TimeUtil.secondsToString(param1.appResponse.saved_seconds)),LocText.current.text("general/button_ok")));
            }
         }
         else if(param1.error != "errFinishInvalidQuestStatus")
         {
            if(param1.error != "errFinishInvalidConventionShowStatus")
            {
               if(param1.error != "errFinishInvalidDungeonCooldown")
               {
                  if(param1.error != "errFinishInvalidStatus")
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
            }
         }
      }
   }
}
