package com.playata.framework.localization.assets
{
   import com.playata.framework.assets.AssetLoaderBase;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.ICacheFile;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.localization.LocText;
   
   public class LocTextLoader extends AssetLoaderBase
   {
      
      public static const FORMAT_AMF3:String = "amf3";
      
      public static const FORMAT_JSON:String = "json";
       
      
      private var _cacheFile:ICacheFile = null;
      
      public function LocTextLoader(param1:ICacheFile = null)
      {
         super();
         _cacheFile = param1;
      }
      
      override public function load(param1:Function, param2:Function, param3:int = 1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(_queue.length == 1)
         {
            _loc4_ = _queue[0];
            _loc5_ = _loc4_.data as LocTextAssetDefinitionData;
            _loc6_ = _loc5_.format + "_" + _loc5_.locale.version;
            if(_cacheFile && _cacheFile.isValid(_loc6_))
            {
               _queue = new Vector.<AssetDefinition>(0);
               Logger.info("[LocTextLoader] Loading data from cache (hash = " + _loc6_ + ".");
               setLocaData(_cacheFile.data,_loc5_);
               if(param2 != null)
               {
                  param2();
               }
               return;
            }
            Logger.warn("[LocTextLoader] Loading Locale: " + _loc5_.locale.locale + " (" + _loc5_.locale.version + ")");
         }
         super.load(param1,param2,param3);
      }
      
      override protected function processAsset(param1:AssetDefinition, param2:IByteArray) : IAsset
      {
         var _loc4_:* = null;
         var _loc3_:LocTextAssetDefinitionData = param1.data as LocTextAssetDefinitionData;
         if(_cacheFile)
         {
            _loc4_ = _loc3_.format + "_" + _loc3_.locale.version;
            _cacheFile.save(param2,_loc4_);
         }
         return setLocaData(param2,_loc3_);
      }
      
      private function setLocaData(param1:IByteArray, param2:LocTextAssetDefinitionData) : IAsset
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
            throw new Exception("Unknown LocTextLoader format \'" + param2.format + "\'");
         }
         if(LocText.current != null)
         {
            LocText.current.setData(new TypedObject(_loc3_),param2.locale.locale);
         }
         else
         {
            LocText.current = new LocText(new TypedObject(_loc3_),param2.locale.locale);
         }
         return LocText.current;
      }
   }
}
