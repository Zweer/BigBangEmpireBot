package com.playata.application.data.character
{
   import com.playata.application.data.dataobject.DOCharacter;
   import com.playata.application.data.dataobject.DOGuild;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObjectArray;
   
   public class RequestedCharacterData extends TypedObject
   {
       
      
      public function RequestedCharacterData(param1:Object)
      {
         super(param1);
      }
      
      public function get requested_character() : DOCharacter
      {
         if(hasData("requested_character"))
         {
            return new DOCharacter(getData("requested_character"));
         }
         return null;
      }
      
      public function get requested_character_inventory() : Object
      {
         return getData("requested_character_inventory");
      }
      
      public function get requested_character_inventory_items() : DataObjectArray
      {
         if(hasData("requested_character_inventory_items"))
         {
            return new DataObjectArray(getArray("requested_character_inventory_items"),DOItem);
         }
         return null;
      }
      
      public function get requested_character_current_goal_values() : TypedObject
      {
         return getTypedObject("requested_character_current_goal_values");
      }
      
      public function get requested_character_collected_goals() : TypedObject
      {
         return getTypedObject("requested_character_collected_goals");
      }
      
      public function get requested_character_guild() : DOGuild
      {
         if(hasData("requested_character_guild"))
         {
            return new DOGuild(getData("requested_character_guild"));
         }
         return null;
      }
      
      public function get requested_character_optical_changes() : Object
      {
         return getData("requested_character_optical_changes");
      }
   }
}
