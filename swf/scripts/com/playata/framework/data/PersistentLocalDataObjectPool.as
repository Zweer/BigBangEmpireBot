package com.playata.framework.data
{
   import com.playata.framework.core.logging.Logger;
   
   public class PersistentLocalDataObjectPool
   {
      
      private static var INSTANCES:Vector.<LocalDataObject> = new Vector.<LocalDataObject>(0);
       
      
      public function PersistentLocalDataObjectPool()
      {
         super();
      }
      
      public static function register(param1:LocalDataObject) : void
      {
         INSTANCES.push(param1);
      }
      
      public static function unregister(param1:LocalDataObject) : void
      {
         var _loc2_:int = INSTANCES.indexOf(param1);
         if(_loc2_ >= 0)
         {
            INSTANCES.splice(_loc2_,1);
         }
      }
      
      public static function saveAll() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = INSTANCES;
         for each(var _loc1_ in INSTANCES)
         {
            _loc1_.save();
         }
         Logger.warn("[PersistentLocalDataObjectPool] Saved " + INSTANCES.length + " instances to disc.",[INSTANCES]);
      }
   }
}
