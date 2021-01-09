package com.playata.application.data.server
{
   public interface IServerSelectionData
   {
       
      
      function get defaultLocale() : String;
      
      function get defaultServer() : String;
      
      function get availableLocales() : Vector.<String>;
      
      function availableServers(param1:String) : Vector.<String>;
   }
}
