package com.playata.application.main
{
   public class ApplicationMessage
   {
      
      public static const NOTIFY_APPLICATION_ERROR:String = "ApplicationMessage.notifyRequestError";
      
      public static const NOTIFY_LOGIN_USER_COMPLETE:String = "ApplicationMessage.notifyLoginUserComplete";
      
      public static const NOTIFY_REGISTER_USER_COMPLETE:String = "ApplicationMessage.notifyRegisterUserComplete";
      
      public static const NOTIFY_CREATE_CHARACTER_COMPLETE:String = "ApplicationMessage.notifyCreateCharacterComplete";
      
      public static const NOTIFY_LOGOUT_USER_COMPLETE:String = "ApplicationMessage.notifyLogoutUserComplete";
      
      public static const UPDATE_DATA:String = "ApplicationMessage.updateUserAndCharacter";
      
      public static const OPEN_CURTAIN:String = "ApplicationMessage.openCurtain";
      
      public static const CLOSE_CURTAIN:String = "ApplicationMessage.closeCurtain";
      
      public static const SHOW_MAINTENANCE:String = "ApplicationMessage.showMaintenance";
       
      
      public function ApplicationMessage()
      {
         super();
      }
   }
}
