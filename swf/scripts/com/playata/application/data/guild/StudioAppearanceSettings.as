package com.playata.application.data.guild
{
   import com.playata.framework.core.TypedObject;
   
   public class StudioAppearanceSettings extends TypedObject
   {
       
      
      public function StudioAppearanceSettings(param1:Object)
      {
         super(param1);
      }
      
      public function set room(param1:String) : void
      {
         setString("room",param1);
      }
      
      public function get room() : String
      {
         return getString("room");
      }
      
      public function set quarter(param1:String) : void
      {
         setString("quarter",param1);
      }
      
      public function get quarter() : String
      {
         return getString("quarter");
      }
      
      public function set motivation(param1:String) : void
      {
         setString("motivation",param1);
      }
      
      public function get motivation() : String
      {
         return getString("motivation");
      }
      
      public function set popularity(param1:String) : void
      {
         setString("popularity",param1);
      }
      
      public function get popularity() : String
      {
         return getString("popularity");
      }
      
      public function set equipment(param1:String) : void
      {
         setString("equipment",param1);
      }
      
      public function get equipment() : String
      {
         return getString("equipment");
      }
      
      public function set actors_left(param1:String) : void
      {
         setString("actors_left",param1);
      }
      
      public function get actors_left() : String
      {
         return getString("actors_left");
      }
      
      public function set actors_right(param1:String) : void
      {
         setString("actors_right",param1);
      }
      
      public function get actors_right() : String
      {
         return getString("actors_right");
      }
   }
}
