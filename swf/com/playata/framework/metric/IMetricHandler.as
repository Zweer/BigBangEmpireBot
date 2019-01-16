package com.playata.framework.metric
{
   public interface IMetricHandler
   {
       
      
      function get key() : String;
      
      function init() : Boolean;
      
      function trackEvent(param1:String) : void;
      
      function trackRevenue(param1:Number, param2:String = null, param3:String = null) : void;
      
      function setOfflineMode(param1:Boolean) : void;
   }
}
