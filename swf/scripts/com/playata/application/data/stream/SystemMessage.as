package com.playata.application.data.stream
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogRedeemVoucher;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   
   public class SystemMessage extends DataObject
   {
       
      
      public function SystemMessage(param1:Object = null)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get subject() : String
      {
         return getString("subject");
      }
      
      public function get message() : String
      {
         return getString("message");
      }
      
      public function get formattedMessage() : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc6_:User = User.current;
         var _loc1_:String = message;
         _loc1_ = StringUtil.replace(_loc1_,"[name]",_loc6_.character.name);
         _loc1_ = StringUtil.replace(_loc1_,"[email]",_loc6_.email);
         _loc1_ = StringUtil.replace(_loc1_,"[serverid]",ServerInfo.serverId);
         _loc1_ = StringUtil.replace(_loc1_,"[userid]",_loc6_.id.toString());
         var _loc2_:int = _loc1_.indexOf("[usertime:");
         if(_loc2_ >= 0)
         {
            _loc3_ = _loc1_.indexOf("]",_loc2_);
            _loc4_ = parseInt(_loc1_.substr(_loc2_ + 10,_loc3_ - _loc2_ - 10));
            _loc5_ = AppDateTime.getFormattedDateTime(_loc4_);
            _loc1_ = StringUtil.replace(_loc1_,"[usertime:" + _loc4_ + "]",_loc5_);
         }
         if(isHtml)
         {
            _loc7_ = _loc1_;
            _loc7_ = _loc7_.split("\r").join("");
            _loc7_ = _loc7_.split("\n").join("");
            return _loc7_;
         }
         return convertLinks(_loc1_);
      }
      
      private function convertLinks(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         if(param1 == "")
         {
            return "";
         }
         var _loc5_:RegExp = /\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/gi;
         var _loc2_:RegExp = /\"www/g;
         param1 = param1.replace(_loc5_,"<a href=\"$&\" target=\"_blank\">$&</a>");
         param1 = param1.replace(_loc2_,"\"http://www");
         if(param1.indexOf("<a href") != -1)
         {
            _loc4_ = "abcdefghijklmnopqrstuvwxyz";
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               param1 = param1.replace("<a href=\"" + _loc4_.charAt(_loc3_),"<a href=\"http://" + _loc4_.charAt(_loc3_));
               _loc3_++;
            }
            param1 = param1.replace("<a href=\"http://https://","<a href=\"https://");
            param1 = param1.replace("<a href=\"http://http://","<a href=\"http://");
         }
         return param1;
      }
      
      public function get isLinkMessage() : Boolean
      {
         return flag == "link" && flagValue != null;
      }
      
      public function get isHtml() : Boolean
      {
         return getBoolean("html");
      }
      
      public function get flag() : String
      {
         return getString("flag");
      }
      
      public function get flagValue() : String
      {
         return getString("flag_value");
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedDateTimeString(TimeUtil.localDateTime,getInt("ts_creation"));
      }
      
      public function get buttonLabel() : String
      {
         if(!isLinkMessage)
         {
            return null;
         }
         if(flagValue.indexOf("!BL!:") == -1)
         {
            return null;
         }
         var _loc1_:String = flagValue.substr(flagValue.indexOf("!BL!:") + 5);
         return _loc1_;
      }
      
      public function get linkUrl() : String
      {
         if(!isLinkMessage)
         {
            return null;
         }
         var _loc1_:String = flagValue;
         _loc1_ = StringUtil.replace(_loc1_,"[serverid]",ServerInfo.serverId);
         _loc1_ = StringUtil.replace(_loc1_,"[userid]",User.current.id.toString());
         _loc1_ = StringUtil.replace(_loc1_,"[sessionid]",User.current.sessionId.toString());
         if(_loc1_.indexOf("!BL!:") != -1)
         {
            _loc1_ = _loc1_.substr(0,_loc1_.indexOf("!BL!:"));
         }
         return _loc1_;
      }
      
      public function get isExternalLink() : Boolean
      {
         if(!linkUrl)
         {
            return false;
         }
         return linkUrl.indexOf("gamelink/open_") == -1;
      }
      
      public function openLink() : void
      {
         var _loc1_:* = null;
         if(!isLinkMessage)
         {
            return;
         }
         var _loc2_:String = linkUrl;
         if(_loc2_ == "gamelink/open_offerwall")
         {
            AppEnvironment.appPlatform.showOfferwall(User.current.id);
         }
         else if(_loc2_ == "gamelink/open_premium_shop")
         {
            ViewManager.instance.showBuyCurrencyDialog();
         }
         else if(_loc2_.indexOf("gamelink/open_voucher_dialog") >= 0)
         {
            _loc1_ = new DialogRedeemVoucher();
            if(_loc2_.indexOf("gamelink/open_voucher_dialog/") >= 0)
            {
               _loc1_.setVoucherCode(_loc2_.substr(29));
               _loc1_.setVoucherMessageId(id);
            }
            Environment.panelManager.showDialog(_loc1_);
         }
         else
         {
            AppEnvironment.appPlatform.openLink(_loc2_);
         }
      }
   }
}
