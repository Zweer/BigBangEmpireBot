package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildListEntry extends DataObject
   {
       
      
      public function DOGuildListEntry(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get leaderName() : String
      {
         return getString("leader_name");
      }
      
      public function get totalPercentage() : Number
      {
         return getNumber("total_percentage");
      }
      
      public function get memberCount() : int
      {
         return getInt("member_count");
      }
      
      public function get emblemBackgroundShape() : int
      {
         return getInt("emblem_background_shape");
      }
      
      public function get emblemBackgroundColor() : int
      {
         return getInt("emblem_background_color");
      }
      
      public function get emblemBackgroundBorderColor() : int
      {
         return getInt("emblem_background_border_color");
      }
      
      public function get emblemIconShape() : int
      {
         return getInt("emblem_icon_shape");
      }
      
      public function get emblemIconColor() : int
      {
         return getInt("emblem_icon_color");
      }
      
      public function get emblemIconSize() : int
      {
         return getInt("emblem_icon_size");
      }
      
      public function get applyOpen() : Boolean
      {
         return getBoolean("apply_open");
      }
   }
}
