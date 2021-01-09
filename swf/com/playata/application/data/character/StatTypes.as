package com.playata.application.data.character
{
   import com.playata.framework.core.collection.IntMap;
   
   public dynamic class StatTypes extends IntMap
   {
       
      
      private var _statCounter:int = 0;
      
      public function StatTypes()
      {
         super();
      }
      
      public function get statCount() : int
      {
         return _statCounter;
      }
      
      public function addStatType(param1:int) : void
      {
         _statCounter = Number(_statCounter) + 1;
         setData(Number(_statCounter),param1);
      }
      
      public function getStatType(param1:int) : int
      {
         return getData(param1);
      }
   }
}
