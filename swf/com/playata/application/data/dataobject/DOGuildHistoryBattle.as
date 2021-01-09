package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildHistoryBattle extends DataObject
   {
       
      
      public function DOGuildHistoryBattle(param1:Object)
      {
         super(param1);
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get battleTimestamp() : int
      {
         return getInt("battle_timestamp");
      }
      
      public function get enemy() : int
      {
         return getInt("enemy");
      }
      
      public function get won() : Boolean
      {
         return getBoolean("won");
      }
      
      public function get joinedCharacterIds() : String
      {
         return getString("joined_character_ids");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
      
      public function get enemyName() : String
      {
         return getString("enemy_name");
      }
      
      public function get ebs() : int
      {
         return getInt("ebs");
      }
      
      public function get ebc() : int
      {
         return getInt("ebc");
      }
      
      public function get ebbc() : int
      {
         return getInt("ebbc");
      }
      
      public function get eis() : int
      {
         return getInt("eis");
      }
      
      public function get eic() : int
      {
         return getInt("eic");
      }
      
      public function get eiz() : int
      {
         return getInt("eiz");
      }
   }
}
