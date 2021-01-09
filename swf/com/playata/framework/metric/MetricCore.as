package com.playata.framework.metric
{
   import com.playata.framework.core.collection.StringMap;
   
   public class MetricCore
   {
       
      
      private var _handlers:StringMap = null;
      
      public function MetricCore()
      {
         super();
         _handlers = new StringMap();
      }
      
      public function addHandler(param1:IMetricHandler) : void
      {
         param1.init();
         _handlers.setData(param1.key,param1);
      }
      
      public function getHandler(param1:String) : IMetricHandler
      {
         if(_handlers == null)
         {
            return null;
         }
         if(!_handlers.exists(param1))
         {
            return null;
         }
         return _handlers.getData(param1);
      }
      
      public function trackEvent(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _handlers;
         for each(var _loc2_ in _handlers)
         {
            _loc2_.trackEvent(param1);
         }
      }
      
      public function trackRevenue(param1:Number, param2:String = null, param3:String = null) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = _handlers;
         for each(var _loc4_ in _handlers)
         {
            _loc4_.trackRevenue(param1,param2,param3);
         }
      }
      
      public function setOfflineMode(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _handlers;
         for each(var _loc2_ in _handlers)
         {
            _loc2_.setOfflineMode(param1);
         }
      }
   }
}
