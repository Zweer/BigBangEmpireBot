package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOLeaderboardGuild extends DataObject
   {
       
      
      public function DOLeaderboardGuild(param1:Object)
      {
         super(param1);
      }
      
      public function get r() : int
      {
         return getInt("r");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get v() : int
      {
         return getInt("v");
      }
      
      public function get h() : int
      {
         return getInt("h");
      }
      
      public function get tp() : Number
      {
         return getNumber("tp");
      }
      
      public function get n() : String
      {
         return getString("n");
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
      
      public function get ga() : String
      {
         return getString("ga");
      }
      
      public function get gbd() : int
      {
         return getInt("gbd");
      }
      
      public function get m() : int
      {
         return getInt("m");
      }
      
      public function get f() : int
      {
         return getInt("f");
      }
      
      public function get am() : Boolean
      {
         return getBoolean("am");
      }
      
      public function get ao() : Boolean
      {
         return getBoolean("ao");
      }
      
      public function get l() : String
      {
         return getString("l");
      }
   }
}
