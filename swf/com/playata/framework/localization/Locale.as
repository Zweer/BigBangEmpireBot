package com.playata.framework.localization
{
   public class Locale
   {
       
      
      private var _locale:String = null;
      
      private var _version:String = null;
      
      public function Locale(param1:String, param2:String = null)
      {
         super();
         _locale = param1;
         _version = param2;
      }
      
      public function get locale() : String
      {
         return _locale;
      }
      
      public function get version() : String
      {
         return _version;
      }
      
      public function isEqual(param1:Locale) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return param1.locale == _locale && param1.version == _version;
      }
   }
}
