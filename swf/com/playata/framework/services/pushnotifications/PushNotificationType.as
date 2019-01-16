package com.playata.framework.services.pushnotifications
{
   import com.playata.framework.core.enum.Enum;
   
   public class PushNotificationType extends Enum
   {
      
      public static const NORMAL:PushNotificationType = new PushNotificationType();
      
      public static const BACKGROUND:PushNotificationType = new PushNotificationType();
      
      public static const FOREGROUND:PushNotificationType = new PushNotificationType();
      
      {
         initEnum(PushNotificationType);
      }
      
      public function PushNotificationType()
      {
         super();
      }
   }
}
