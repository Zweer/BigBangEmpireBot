package com.playata.framework.task
{
   import com.playata.framework.task.lib.flash.FlashTaskManager;
   
   public class TaskManager
   {
      
      public static var verbose:Boolean = false;
       
      
      public function TaskManager()
      {
         super();
      }
      
      public static function get isMainThread() : Boolean
      {
         return FlashTaskManager.isMainThread;
      }
   }
}
