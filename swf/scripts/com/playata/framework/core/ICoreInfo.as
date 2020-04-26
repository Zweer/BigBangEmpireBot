package com.playata.framework.core
{
   public interface ICoreInfo
   {
       
      
      function get os() : String;
      
      function get majorVersion() : int;
      
      function get minorVersion() : int;
      
      function get isTouchScreen() : Boolean;
      
      function get isFakeTouchScreen() : Boolean;
      
      function get isAndroid() : Boolean;
      
      function get isIOS() : Boolean;
      
      function get isBrowser() : Boolean;
      
      function get system() : String;
      
      function get airDescriptorVersionNumber() : String;
   }
}
