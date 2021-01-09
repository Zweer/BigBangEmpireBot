package com.playata.framework.data.constants
{
   import com.playata.framework.assets.AssetLoaderBase;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.ICacheFile;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.logging.Logger;
   
   public class ConstantsLoader extends AssetLoaderBase
   {
      
      public static const FORMAT_AMF3:String = "amf3";
      
      public static const FORMAT_JSON:String = "json";
       
      
      private var _cacheFile:ICacheFile = null;
      
      public function ConstantsLoader(param1:ICacheFile = null)
      {
         super();
         _cacheFile = param1;
      }
      
      private static function setConstantsData(param1:IByteArray, param2:ConstantsAssetDefinitionData) : IAsset
      {
         var _loc3_:Object = null;
         if(param2.format == "json")
         {
            _loc3_ = AssetLoaderBase.getObjectFromCompressedJsonData(param1);
         }
         else if(param2.format == "amf3")
         {
            _loc3_ = AssetLoaderBase.getObjectFromCompressedAMF3Data(param1);
         }
         else
         {
            throw new Error("Unknown ConstantsLoader format \'" + param2.format + "\'");
         }
         if(Constants.current != null)
         {
            Constants.current.setData(new TypedObject(_loc3_));
         }
         else
         {
            Constants.current = new Constants(new TypedObject(_loc3_));
         }
         return Constants.current;
      }
      
      override public function load(param1:Function, param2:Function, param3:int = 1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(_queue.length == 1)
         {
            _loc4_ = _queue[0];
            _loc5_ = _loc4_.data as ConstantsAssetDefinitionData;
            _loc6_ = _loc5_.format + "_" + _loc5_.version;
            if(_cacheFile && _cacheFile.isValid(_loc6_))
            {
               _queue = new Vector.<AssetDefinition>(0);
               Logger.info("[ConstantsLoader] Loading data from cache (hash = " + _loc6_ + ".");
               setConstantsData(_cacheFile.data,_loc5_);
               if(param2 != null)
               {
                  param2();
               }
               return;
            }
            Logger.warn("[ConstantsLoader] Loading constants: " + _loc5_.version);
         }
         super.load(param1,param2,param3);
      }
      
      override protected function processAsset(param1:AssetDefinition, param2:IByteArray) : IAsset
      {
         var _loc4_:* = null;
         var _loc3_:ConstantsAssetDefinitionData = param1.data as ConstantsAssetDefinitionData;
         if(_cacheFile)
         {
            _loc4_ = _loc3_.format + "_" + _loc3_.version;
            _cacheFile.save(param2,_loc4_);
         }
         return setConstantsData(param2,_loc3_);
      }
   }
}
