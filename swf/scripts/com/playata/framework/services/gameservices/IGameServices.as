package com.playata.framework.services.gameservices
{
   public interface IGameServices
   {
       
      
      function init() : void;
      
      function get platformId() : String;
      
      function get platformName() : String;
      
      function get userId() : String;
      
      function get isLoggedIn() : Boolean;
      
      function login(param1:Function) : void;
      
      function logout(param1:Function) : void;
      
      function getAuthToken(param1:Function) : void;
      
      function progress(param1:String, param2:int) : void;
      
      function setProgress(param1:String, param2:int) : void;
      
      function complete(param1:String) : void;
   }
}
