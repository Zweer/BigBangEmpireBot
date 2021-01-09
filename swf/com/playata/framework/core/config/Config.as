package com.playata.framework.core.config
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   
   public class Config
   {
       
      
      private var _configValues:TypedObject;
      
      public function Config(param1:TypedObject, param2:Object)
      {
         _configValues = TypedObject.empty;
         super();
         _configValues.setBoolean("testMode",true);
         var _loc6_:int = 0;
         var _loc5_:* = param1.rawData;
         for(var _loc4_ in param1.rawData)
         {
            Logger.debug("[Application] Initial configuration setting \'" + _loc4_ + "\' with value \'" + param1.rawData[_loc4_] + "\'...");
            _configValues.setData(_loc4_,param1.rawData[_loc4_]);
         }
         var _loc8_:int = 0;
         var _loc7_:* = param2;
         for(var _loc3_ in param2)
         {
            Logger.debug("[Application] Flash vars \'" + _loc3_ + "\' => \'" + param2[_loc3_] + "\' found...");
            _configValues.setData(_loc3_,param2[_loc3_]);
         }
      }
      
      public function cfg(param1:String) : Object
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getData(param1);
      }
      
      public function hasCfg(param1:String) : Boolean
      {
         return _configValues.hasData(param1);
      }
      
      public function getInt(param1:String) : int
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getInt(param1);
      }
      
      public function getString(param1:String) : String
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getString(param1);
      }
      
      public function getNumber(param1:String) : Number
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getNumber(param1);
      }
      
      public function getTypedObject(param1:String) : TypedObject
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getTypedObject(param1);
      }
      
      public function getArray(param1:String) : Array
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getArray(param1);
      }
      
      public function getIntVector(param1:String) : Vector.<int>
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getIntVector(param1);
      }
      
      public function getStringVector(param1:String) : Vector.<String>
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getStringVector(param1);
      }
      
      public function getNumberVector(param1:String) : Vector.<Number>
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getNumberVector(param1);
      }
      
      public function getBooleanVector(param1:String) : Vector.<Boolean>
      {
         if(!_configValues.hasData(param1))
         {
            throw new Exception("Application configuration value is not set or unknown! value=" + param1);
         }
         return _configValues.getBooleanVector(param1);
      }
      
      public function getBoolean(param1:String) : Boolean
      {
         return cfg(param1) == "true" || cfg(param1) === true;
      }
      
      public function overwrite(param1:String, param2:String) : void
      {
         Logger.debug("[Application] Overwriting application configuration setting \'" + param1 + "\' with value \'" + param2 + "\'...");
         if(_configValues.hasData(param1))
         {
            _configValues.setData(param1,param2);
            return;
         }
         throw new Exception("Application configuration value is not set or unknown! value=" + param1);
      }
      
      public function extend(param1:TypedObject, param2:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1.rawData;
         for(var _loc3_ in param1.rawData)
         {
            Logger.debug("[Application] Adding new config value \'" + _loc3_.toString() + "\' => \'" + param1.rawData[_loc3_] + "\' ...");
            if(param2 || !_configValues.hasData(_loc3_))
            {
               _configValues.setData(_loc3_,param1.rawData[_loc3_]);
            }
         }
      }
      
      public function get configValues() : TypedObject
      {
         return _configValues;
      }
   }
}
