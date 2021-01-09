package com.playata.framework.core
{
   import com.playata.framework.core.config.Config;
   
   public final class Core
   {
      
      public static var current:ICore = null;
      
      public static var config:Config = null;
       
      
      public function Core()
      {
         super();
      }
   }
}
