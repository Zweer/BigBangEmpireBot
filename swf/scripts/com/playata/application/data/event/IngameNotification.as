package com.playata.application.data.event
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOIngameNotification;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class IngameNotification extends DOIngameNotification
   {
       
      
      private var _identifier:String;
      
      private var _viewed:Boolean;
      
      public function IngameNotification(param1:String, param2:DOIngameNotification)
      {
         super(param2);
         _identifier = param1;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get needsDisplay() : Boolean
      {
         if(_viewed)
         {
            return false;
         }
         if(startDate > TimeUtil.now)
         {
            return false;
         }
         if(getDisplayValue("min_level") && User.current.character.level < getDisplayValue("min_level"))
         {
            return false;
         }
         switch(int(frequency))
         {
            case 0:
               return true;
            case 1:
               return viewedDays.length == 0;
            case 2:
            case 3:
               var _loc3_:int = 0;
               var _loc2_:* = viewedDays;
               for each(var _loc1_ in viewedDays)
               {
                  if(TimeUtil.localDateTime.isToday(_loc1_))
                  {
                     return false;
                  }
               }
               return true;
         }
      }
      
      public function trackView() : void
      {
         _viewed = true;
         var _loc1_:Vector.<int> = viewedDays;
         _loc1_.push(TimeUtil.now);
         User.current.setSettingValue(settingsIdentifier,_loc1_);
      }
      
      public function get subject() : String
      {
         return LocText.current.text("notification/" + textIdentifier + "/subject");
      }
      
      public function get body() : String
      {
         var _loc1_:String = LocText.current.text("notification/" + textIdentifier + "/body");
         _loc1_ = StringUtil.replace(_loc1_,"[name]",User.current.character.name);
         _loc1_ = StringUtil.replace(_loc1_,"[email]",User.current.email);
         _loc1_ = StringUtil.replace(_loc1_,"[serverid]",ServerInfo.serverId);
         _loc1_ = StringUtil.replace(_loc1_,"[userid]",User.current.id.toString());
         _loc1_ = StringUtil.replace(_loc1_,"[sessionid]",User.current.sessionId.toString());
         _loc1_ = StringUtil.replace(_loc1_,"<date_start>",AppDateTime.timestampToLocalString(startDate,AppDateTime.dateFormat));
         _loc1_ = StringUtil.replace(_loc1_,"<date_end>",AppDateTime.timestampToLocalString(endDate,AppDateTime.dateFormat));
         if(identifier == "prereg_notification" || identifier == "prereg_notification_international")
         {
            _loc1_ = StringUtil.replace(_loc1_,"<server_start>",getString("server_start"));
            _loc1_ = StringUtil.replace(_loc1_,"<new_server_id>",getString("new_server_id"));
         }
         if(identifier == "launch_reward_notification_start" || identifier == "launch_reward_notification_halftime" || identifier == "launch_reward_notification_preend")
         {
            _loc1_ = StringUtil.replace(_loc1_,"<launch_reward_date>",getString("launch_reward_date"));
         }
         return _loc1_;
      }
      
      public function get button() : String
      {
         if(getDisplayValue("custom_button_text") === true)
         {
            return LocText.current.text("notification/" + textIdentifier + "/button");
         }
         return LocText.current.text("general/button_ok");
      }
      
      public function get openPaymentDialog() : Boolean
      {
         return redirectToPaymentDialog;
      }
      
      public function get openOfferwallDialog() : Boolean
      {
         if(!hasData("redirect_to_offerwall_dialog"))
         {
            return false;
         }
         return redirectToOfferwallDialog;
      }
      
      public function get openUrl() : String
      {
         if(!hasData("redirect_url"))
         {
            return null;
         }
         var _loc1_:String = getString("redirect_url");
         _loc1_ = StringUtil.replace(_loc1_,"[serverid]",ServerInfo.serverId);
         _loc1_ = StringUtil.replace(_loc1_,"[userid]",User.current.id.toString());
         _loc1_ = StringUtil.replace(_loc1_,"[sessionid]",User.current.sessionId.toString());
         return _loc1_;
      }
      
      public function get isHTML() : Boolean
      {
         return getDisplayValue("html");
      }
      
      public function get imageURL() : String
      {
         var _loc1_:String = getDisplayValue("image");
         return ServerInfo.assetURL("ingame_notifications/" + _loc1_,null);
      }
      
      private function get startDate() : int
      {
         return DateTime.fromStringServer(availableTimeStart).timestamp;
      }
      
      private function get endDate() : int
      {
         return DateTime.fromStringServer(availableTimeEnd).timestamp;
      }
      
      private function get viewedDays() : Vector.<int>
      {
         var _loc1_:Object = User.current.getSettingValue(settingsIdentifier);
         if(_loc1_ is Array)
         {
            return Vector.<int>(_loc1_ as Array);
         }
         return new Vector.<int>(0);
      }
      
      private function get settingsIdentifier() : String
      {
         return "ign_" + identifier;
      }
      
      private function getDisplayValue(param1:String) : *
      {
         var _loc2_:TypedObject = this.display;
         if(!_loc2_)
         {
            return false;
         }
         if(!_loc2_.hasData(param1))
         {
            return false;
         }
         return _loc2_.getData(param1);
      }
   }
}
