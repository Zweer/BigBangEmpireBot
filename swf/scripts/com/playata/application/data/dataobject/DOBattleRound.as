package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOBattleRound extends DataObject
   {
       
      
      public function DOBattleRound(param1:Object)
      {
         super(param1);
      }
      
      public function get a() : String
      {
         return getString("a");
      }
      
      public function get d() : String
      {
         return getString("d");
      }
      
      public function get v() : int
      {
         return getInt("v");
      }
      
      public function get r() : int
      {
         return getInt("r");
      }
      
      public function get dt() : int
      {
         return getInt("dt");
      }
      
      public function get bf() : int
      {
         return getInt("bf");
      }
      
      public function get m() : int
      {
         return getInt("m");
      }
      
      public function get ae() : Array
      {
         return getArray("ae");
      }
      
      public function get de() : Array
      {
         return getArray("de");
      }
   }
}
