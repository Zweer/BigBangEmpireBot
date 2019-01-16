package com.playata.application.data.dataobject
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   
   public class DOIngameNotification extends DataObject
   {
       
      
      public function DOIngameNotification(param1:Object)
      {
         super(param1);
      }
      
      public function get frequency() : int
      {
         return getInt("frequency");
      }
      
      public function get availableTimeStart() : String
      {
         return getString("available_time_start");
      }
      
      public function get availableTimeEnd() : String
      {
         return getString("available_time_end");
      }
      
      public function get textIdentifier() : String
      {
         return getString("text_identifier");
      }
      
      public function get redirectToPaymentDialog() : Boolean
      {
         return getBoolean("redirect_to_payment_dialog");
      }
      
      public function get redirectToOfferwallDialog() : Boolean
      {
         return getBoolean("redirect_to_offerwall_dialog");
      }
      
      public function get display() : TypedObject
      {
         return getTypedObject("display");
      }
   }
}
