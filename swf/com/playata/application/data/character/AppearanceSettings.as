package com.playata.application.data.character
{
   import com.playata.framework.core.TypedObject;
   
   public class AppearanceSettings extends TypedObject
   {
       
      
      public function AppearanceSettings(param1:Object)
      {
         super(param1);
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function set gender(param1:String) : void
      {
         setString("gender",param1);
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get sexuality() : String
      {
         return getString("sexuality");
      }
      
      public function set sexuality(param1:String) : void
      {
         setString("sexuality",param1);
      }
      
      public function getAppearance(param1:String) : int
      {
         return getInt(param1);
      }
      
      public function setAppearance(param1:String, param2:int) : void
      {
         setInt(param1,param2);
      }
      
      public function get panties_type() : int
      {
         return getInt("panties_type");
      }
      
      public function set panties_type(param1:int) : void
      {
         setInt("panties_type",param1);
      }
      
      public function get photo_rect_type() : int
      {
         return getInt("photo_rect_type");
      }
      
      public function set photo_rect_type(param1:int) : void
      {
         setInt("photo_rect_type",param1);
      }
      
      public function get skin_color() : int
      {
         return getInt("skin_color");
      }
      
      public function set skin_color(param1:int) : void
      {
         setInt("skin_color",param1);
      }
      
      public function get genitals_hair_type() : int
      {
         return getInt("genitals_hair_type");
      }
      
      public function set genitals_hair_type(param1:int) : void
      {
         setInt("genitals_hair_type",param1);
      }
      
      public function get genitals_hair_color() : int
      {
         return getInt("genitals_hair_color");
      }
      
      public function set genitals_hair_color(param1:int) : void
      {
         setInt("genitals_hair_color",param1);
      }
      
      public function get genitals_type() : int
      {
         return getInt("genitals_type");
      }
      
      public function set genitals_type(param1:int) : void
      {
         setInt("genitals_type",param1);
      }
      
      public function get bra_type() : int
      {
         return getInt("bra_type");
      }
      
      public function set bra_type(param1:int) : void
      {
         setInt("bra_type",param1);
      }
      
      public function get bra_quality() : Object
      {
         return getData("bra_quality");
      }
      
      public function set bra_quality(param1:Object) : void
      {
         setData("bra_quality",param1);
      }
      
      public function get show_head_item() : Boolean
      {
         return getBoolean("show_head_item");
      }
      
      public function set show_head_item(param1:Boolean) : void
      {
         setBoolean("show_head_item",param1);
      }
      
      public function get head() : String
      {
         return getString("head");
      }
      
      public function set head(param1:String) : void
      {
         setString("head",param1);
      }
      
      public function get show_belt_item() : Boolean
      {
         return getBoolean("show_belt_item");
      }
      
      public function set show_belt_item(param1:Boolean) : void
      {
         setBoolean("show_belt_item",param1);
      }
      
      public function get belt() : String
      {
         return getString("belt");
      }
      
      public function set belt(param1:String) : void
      {
         setString("belt",param1);
      }
      
      public function get show_boots_item() : Boolean
      {
         return getBoolean("show_boots_item");
      }
      
      public function set show_boots_item(param1:Boolean) : void
      {
         setBoolean("show_boots_item",param1);
      }
      
      public function get boots() : String
      {
         return getString("boots");
      }
      
      public function set boots(param1:String) : void
      {
         setString("boots",param1);
      }
      
      public function get show_chest_item() : Boolean
      {
         return getBoolean("show_chest_item");
      }
      
      public function set show_chest_item(param1:Boolean) : void
      {
         setBoolean("show_chest_item",param1);
      }
      
      public function get chest() : String
      {
         return getString("chest");
      }
      
      public function set chest(param1:String) : void
      {
         setString("chest",param1);
      }
      
      public function get show_legs_item() : Boolean
      {
         return getBoolean("show_legs_item");
      }
      
      public function set show_legs_item(param1:Boolean) : void
      {
         setBoolean("show_legs_item",param1);
      }
      
      public function get legs() : String
      {
         return getString("legs");
      }
      
      public function set legs(param1:String) : void
      {
         setString("legs",param1);
      }
      
      public function get missiles() : String
      {
         return getString("missiles");
      }
      
      public function set missiles(param1:String) : void
      {
         setString("missiles",param1);
      }
      
      public function get hair_type() : int
      {
         return getInt("hair_type");
      }
      
      public function set hair_type(param1:int) : void
      {
         setInt("hair_type",param1);
      }
      
      public function get hair_front() : int
      {
         return getInt("hair_front");
      }
      
      public function set hair_front(param1:int) : void
      {
         setInt("hair_front",param1);
      }
      
      public function get hair_back() : int
      {
         return getInt("hair_back");
      }
      
      public function set hair_back(param1:int) : void
      {
         setInt("hair_back",param1);
      }
      
      public function get hair_middle() : int
      {
         return getInt("hair_middle");
      }
      
      public function set hair_middle(param1:int) : void
      {
         setInt("hair_middle",param1);
      }
      
      public function get eyes_type() : int
      {
         return getInt("eyes_type");
      }
      
      public function set eyes_type(param1:int) : void
      {
         setInt("eyes_type",param1);
      }
      
      public function get decoration_type() : int
      {
         return getInt("decoration_type");
      }
      
      public function set decoration_type(param1:int) : void
      {
         setInt("decoration_type",param1);
      }
      
      public function get eyebrows_type() : int
      {
         return getInt("eyebrows_type");
      }
      
      public function set eyebrows_type(param1:int) : void
      {
         setInt("eyebrows_type",param1);
      }
      
      public function get eyes_blink() : int
      {
         return getInt("eyes_blink");
      }
      
      public function set eyes_blink(param1:int) : void
      {
         setInt("eyes_blink",param1);
      }
      
      public function get hair_color() : int
      {
         return getInt("hair_color");
      }
      
      public function set hair_color(param1:int) : void
      {
         setInt("hair_color",param1);
      }
      
      public function get eyebrows_color() : int
      {
         return getInt("eyebrows_color");
      }
      
      public function set eyebrows_color(param1:int) : void
      {
         setInt("eyebrows_color",param1);
      }
      
      public function get facial_hair_type() : int
      {
         return getInt("facial_hair_type");
      }
      
      public function set facial_hair_type(param1:int) : void
      {
         setInt("facial_hair_type",param1);
      }
      
      public function get facial_hair_color() : int
      {
         return getInt("facial_hair_color");
      }
      
      public function set facial_hair_color(param1:int) : void
      {
         setInt("facial_hair_color",param1);
      }
      
      public function get head_type() : int
      {
         return getInt("head_type");
      }
      
      public function set head_type(param1:int) : void
      {
         setInt("head_type",param1);
      }
      
      public function get mouth_type() : int
      {
         return getInt("mouth_type");
      }
      
      public function set mouth_type(param1:int) : void
      {
         setInt("mouth_type",param1);
      }
      
      public function get nose_type() : int
      {
         return getInt("nose_type");
      }
      
      public function set nose_type(param1:int) : void
      {
         setInt("nose_type",param1);
      }
      
      public function get tattoo_arm_left() : int
      {
         return getInt("tattoo_arm_left");
      }
      
      public function set tattoo_arm_left(param1:int) : void
      {
         setInt("tattoo_arm_left",param1);
      }
      
      public function get tattoo_arm_right() : int
      {
         return getInt("tattoo_arm_right");
      }
      
      public function set tattoo_arm_right(param1:int) : void
      {
         setInt("tattoo_arm_right",param1);
      }
      
      public function get tattoo_body() : int
      {
         return getInt("tattoo_body");
      }
      
      public function set tattoo_body(param1:int) : void
      {
         setInt("tattoo_body",param1);
      }
      
      public function get tattoo_leg_left() : int
      {
         return getInt("tattoo_leg_left");
      }
      
      public function set tattoo_leg_left(param1:int) : void
      {
         setInt("tattoo_leg_left",param1);
      }
      
      public function get tattoo_leg_right() : int
      {
         return getInt("tattoo_leg_right");
      }
      
      public function set tattoo_leg_right(param1:int) : void
      {
         setInt("tattoo_leg_right",param1);
      }
   }
}
