package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CStreamingRoomUnlock extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "streaming_room_unlocks";
      
      public static const ID_NAME:String = "roomId";
       
      
      public function CStreamingRoomUnlock(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("streaming_room_unlocks");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("streaming_room_unlocks");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("streaming_room_unlocks");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("streaming_room_unlocks",param1);
      }
      
      public static function fromId(param1:int) : CStreamingRoomUnlock
      {
         return ConstantsData.getConstantsDataObject(param1,CStreamingRoomUnlock) as CStreamingRoomUnlock;
      }
      
      public function get roomId() : int
      {
         return getInt("roomId");
      }
      
      public function get streamingResource() : int
      {
         return getInt("streaming_resource");
      }
      
      public function get premiumCurrency() : int
      {
         return getInt("premium_currency");
      }
   }
}
