package com.playata.framework.task
{
   public class TaskToAppMessageType
   {
      
      public static const Unknown:int = 0;
      
      public static const WorkerReady:int = 1;
      
      public static const Progress:int = 2;
      
      public static const Result:int = 3;
      
      public static const ResultWithByteArray:int = 4;
       
      
      public function TaskToAppMessageType()
      {
         super();
      }
   }
}
