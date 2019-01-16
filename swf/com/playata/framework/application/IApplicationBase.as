package com.playata.framework.application
{
   import com.playata.framework.abtest.ABTests;
   import com.playata.framework.advertisement.AdvertisementCore;
   import com.playata.framework.core.IEnvironmentModule;
   import com.playata.framework.localization.Locale;
   import com.playata.framework.metric.MetricCore;
   
   public interface IApplicationBase extends IEnvironmentModule
   {
       
      
      function initApplication() : void;
      
      function initUi() : void;
      
      function start(param1:Function) : void;
      
      function updateData(param1:Object) : void;
      
      function get session() : ApplicationSession;
      
      function get metrics() : MetricCore;
      
      function get advertisment() : AdvertisementCore;
      
      function get abTests() : ABTests;
      
      function set currentLocale(param1:Locale) : void;
      
      function get currentLocale() : Locale;
      
      function loadLocale(param1:Locale, param2:Function) : void;
      
      function sendActionRequest(param1:String, param2:Object, param3:Function, param4:Boolean = true, param5:Boolean = false) : void;
   }
}
