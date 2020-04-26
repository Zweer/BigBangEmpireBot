package com.playata.framework.services.facebook
{
   public interface IFacebook
   {
       
      
      function get accessToken() : String;
      
      function get userId() : String;
      
      function get loggedIn() : Boolean;
      
      function login(param1:Function, param2:Boolean) : void;
      
      function logout() : void;
      
      function inviteFriends(param1:String, param2:String) : void;
      
      function share(param1:String, param2:String, param3:String, param4:String, param5:String = null, param6:Array = null, param7:String = null) : void;
   }
}
