package com.playata.framework.advertisement
{
   import com.playata.framework.advertisement.provider.IAdProvider;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.collection.StringMap;
   
   public class AdvertisementCore implements IDisposable
   {
       
      
      private var _adProviders:StringMap;
      
      private var _userId:String;
      
      public function AdvertisementCore()
      {
         super();
         _adProviders = new StringMap();
      }
      
      public function set userId(param1:String) : void
      {
         _userId = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _adProviders;
         for each(var _loc2_ in _adProviders)
         {
            _loc2_.userId = param1;
         }
      }
      
      public function getAdProviderKeys(param1:Vector.<String> = null) : Vector.<String>
      {
         if(!param1)
         {
            param1 = new Vector.<String>(0);
         }
         else
         {
            param1.length = 0;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _adProviders;
         for each(var _loc2_ in _adProviders)
         {
            param1.push(_loc2_.key);
         }
         return param1;
      }
      
      public function addAdProvider(param1:IAdProvider) : void
      {
         if(hasAdProvider(param1.key))
         {
            removeAdProvider(param1.key);
         }
         param1.init();
         _adProviders.setData(param1.key,param1);
         if(_userId)
         {
            param1.userId = _userId;
         }
      }
      
      public function removeAdProvider(param1:String, param2:Boolean = true) : void
      {
         if(hasAdProvider(param1))
         {
            if(param2)
            {
               (_adProviders.getData(param1) as IAdProvider).dispose();
            }
            _adProviders.remove(param1);
         }
      }
      
      public function hasAdProvider(param1:String) : Boolean
      {
         if(!_adProviders)
         {
            return false;
         }
         if(!_adProviders.exists(param1))
         {
            return false;
         }
         return true;
      }
      
      public function getAdProvider(param1:String) : IAdProvider
      {
         if(!hasAdProvider(param1))
         {
            return null;
         }
         return _adProviders.getData(param1);
      }
      
      public function hasAdProviderForType(param1:AdType) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _adProviders;
         for each(var _loc2_ in _adProviders)
         {
            if(_loc2_.supports(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function getAdProvidersForType(param1:AdType, param2:Vector.<IAdProvider> = null) : Vector.<IAdProvider>
      {
         if(param2)
         {
            param2.length = 0;
         }
         else
         {
            param2 = new Vector.<IAdProvider>(0);
         }
         var _loc5_:int = 0;
         var _loc4_:* = _adProviders;
         for each(var _loc3_ in _adProviders)
         {
            if(_loc3_.supports(param1))
            {
               param2.push(_loc3_);
            }
         }
         return param2;
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _adProviders;
         for each(var _loc1_ in _adProviders)
         {
            _loc1_.dispose();
         }
         _adProviders = new StringMap();
      }
   }
}
