package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOLeaderboardSoloGuildCompetition extends DataObject
   {
       
      
      public function DOLeaderboardSoloGuildCompetition(param1:Object)
      {
         super(param1);
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get r() : int
      {
         return getInt("r");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get g() : String
      {
         return getString("g");
      }
      
      public function get n() : String
      {
         return getString("n");
      }
      
      public function get os() : int
      {
         return getInt("os");
      }
      
      public function get gi() : int
      {
         return getInt("gi");
      }
      
      public function get gn() : String
      {
         return getString("gn");
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
      
      public function get s() : int
      {
         return getInt("s");
      }
   }
}
