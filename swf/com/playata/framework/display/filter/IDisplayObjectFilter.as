package com.playata.framework.display.filter
{
   public interface IDisplayObjectFilter
   {
       
      
      function get name() : String;
      
      function equals(param1:IDisplayObjectFilter) : Boolean;
   }
}
