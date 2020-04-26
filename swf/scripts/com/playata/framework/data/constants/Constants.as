package com.playata.framework.data.constants
{
   import com.playata.application.data.dataobject.DOConstantsOverride;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObjectArray;
   import flash.utils.ByteArray;
   
   public class Constants implements IAsset
   {
      
      public static var current:Constants = null;
       
      
      protected var _constantsOverride:DataObjectArray = null;
      
      protected var _constants:TypedObject;
      
      protected var _mergedConstants:TypedObject = null;
      
      protected var _processor:IConstantProcessor;
      
      private var _lastConstantsCleanup:int = 0;
      
      public function Constants(param1:TypedObject, param2:IConstantProcessor = null)
      {
         _constants = TypedObject.empty;
         super();
         _processor = param2;
         setData(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function constant(param1:String) : *
      {
         cleanupMergedConstants();
         if(_mergedConstants.hasData(param1))
         {
            return _mergedConstants.getData(param1);
         }
         throw new Exception("Error in Constants! Trying to retrieve unknown constant! key=" + param1);
      }
      
      public function addConstantsOverride(param1:DataObjectArray) : void
      {
         _constantsOverride = param1;
         _lastConstantsCleanup = 0;
         cleanupMergedConstants(true);
      }
      
      private function cleanupMergedConstants(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:Boolean = false;
         if(_constantsOverride && _lastConstantsCleanup <= TimeUtil.serverDateTime.timestamp)
         {
            _loc3_ = _constantsOverride.length - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = _constantsOverride[_loc3_];
               if(DateTime.fromStringServer(_loc4_.availableTimeEnd).timestamp < TimeUtil.serverDateTime.timestamp)
               {
                  _constantsOverride.removeAt(_loc3_);
                  _loc2_ = true;
               }
               _loc3_--;
            }
            _lastConstantsCleanup = TimeUtil.serverDateTime.timestamp + TimeUtil.serverDateTime.secondsUntilTomorrow;
            if(_loc2_ && _constantsOverride.length <= 0)
            {
               ConstantsData.clearCache();
               _constantsOverride = null;
            }
         }
         if(param1 || _loc2_ || !_mergedConstants)
         {
            mergeConstants();
         }
      }
      
      private function mergeConstants() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(_mergedConstants && _mergedConstants !== _constants)
         {
            _mergedConstants.dispose();
         }
         if(_constantsOverride && _constantsOverride.length > 0)
         {
            _loc1_ = new ByteArray();
            _loc1_.writeObject(_constants.rawData);
            _loc1_.position = 0;
            _mergedConstants = new TypedObject(_loc1_.readObject());
            _loc3_ = 0;
            while(_loc3_ < _constantsOverride.length)
            {
               _loc4_ = _constantsOverride[_loc3_];
               _loc2_ = {};
               var _loc7_:int = 0;
               var _loc6_:* = _loc4_.constants.rawData;
               for(var _loc5_ in _loc4_.constants.rawData)
               {
                  if(_loc5_ == "constants")
                  {
                     extendConstants(_mergedConstants.rawData,_loc4_.constants[_loc5_]);
                  }
                  else
                  {
                     _loc2_[_loc5_] = _loc4_.constants.getData(_loc5_);
                  }
               }
               extendConstants(_mergedConstants.rawData,_loc2_);
               _loc3_++;
            }
            ConstantsData.clearCache();
         }
         else
         {
            _mergedConstants = _constants;
         }
      }
      
      public function set processor(param1:IConstantProcessor) : void
      {
         _processor = param1;
      }
      
      public function get processor() : IConstantProcessor
      {
         return _processor;
      }
      
      public function get constants() : TypedObject
      {
         return _mergedConstants;
      }
      
      public function getInt(param1:String) : int
      {
         return constant(param1);
      }
      
      public function getString(param1:String) : String
      {
         return constant(param1);
      }
      
      public function getNumber(param1:String) : Number
      {
         return constant(param1);
      }
      
      public function hasConstant(param1:String) : Boolean
      {
         return _mergedConstants.hasData(param1);
      }
      
      public function setData(param1:TypedObject) : void
      {
         if(param1 === null)
         {
            return;
         }
         var _loc2_:TypedObject = _processor != null?_processor.process(param1):param1;
         if(_constants != null)
         {
            extendConstants(_constants.rawData,_loc2_.rawData);
         }
         else
         {
            _constants = _loc2_;
         }
         cleanupMergedConstants(true);
      }
      
      private function extendConstants(param1:Object, param2:Object, param3:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = param2;
         for(var _loc4_ in param2)
         {
            if(param1[_loc4_] !== undefined && Runtime.getClassName(param1[_loc4_]) == "Array")
            {
               extendConstants(param1[_loc4_],param2[_loc4_],param3);
            }
            else if(param3 || param1[_loc4_] === undefined)
            {
               param1[_loc4_] = param2[_loc4_];
            }
         }
      }
   }
}
