package com.playata.framework.assets
{
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.ClassAssetLocationData;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.assets.location.StringAssetLocationData;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.data.ByteArray;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.NotImplementedException;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.network.DataProgress;
   import com.playata.framework.network.IUriData;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.UriDataType;
   
   public class AssetLoaderBase implements IAssetLoader
   {
       
      
      protected var _queue:Vector.<AssetDefinition>;
      
      protected var _assetLocations:Vector.<IAssetLocation>;
      
      protected var _loadedAssets:StringMap;
      
      public function AssetLoaderBase()
      {
         super();
         _queue = new Vector.<AssetDefinition>(0);
         _assetLocations = new Vector.<IAssetLocation>(0);
         _loadedAssets = new StringMap();
      }
      
      public static function getObjectFromCompressedJsonData(param1:IByteArray) : Object
      {
         param1.uncompress();
         param1.position = 0;
         var _loc2_:String = param1.readUTFBytes(param1.bytesAvailable);
         return JsonUtil.decode(_loc2_);
      }
      
      public static function getObjectFromCompressedAMF3Data(param1:IByteArray) : Object
      {
         param1.uncompress();
         param1.position = 0;
         return param1.readObject();
      }
      
      public static function getStringFromData(param1:IByteArray) : String
      {
         return param1.readUTFBytes(param1.length);
      }
      
      public function dispose() : void
      {
         _queue = null;
         var _loc4_:int = 0;
         var _loc3_:* = _assetLocations;
         for each(var _loc2_ in _assetLocations)
         {
            _loc2_.dispose();
         }
         _assetLocations = null;
         var _loc6_:int = 0;
         var _loc5_:* = _loadedAssets;
         for(var _loc1_ in _loadedAssets)
         {
            if(_loadedAssets.getData(_loc1_) is IDisposable)
            {
               (_loadedAssets.getData(_loc1_) as IDisposable).dispose();
            }
         }
         _loadedAssets = null;
      }
      
      protected function processAsset(param1:AssetDefinition, param2:IByteArray) : IAsset
      {
         throw new NotImplementedException();
      }
      
      public function addAssetLocation(param1:IAssetLocation) : void
      {
         _assetLocations.push(param1);
      }
      
      public function get assetLocations() : Vector.<IAssetLocation>
      {
         return _assetLocations;
      }
      
      public function getAsset(param1:String) : IAsset
      {
         if(!_loadedAssets.exists(param1))
         {
            return null;
         }
         return _loadedAssets.getData(param1);
      }
      
      public function removeAsset(param1:String, param2:Boolean) : void
      {
         if(!_loadedAssets.exists(param1))
         {
            return;
         }
         if(_loadedAssets.getData(param1) is IDisposable)
         {
            (_loadedAssets.getData(param1) as IDisposable).dispose();
         }
         _loadedAssets.setData(param1,null);
         _loadedAssets.remove(param1);
      }
      
      public function get loadedAssetIdentifiers() : Vector.<String>
      {
         return _loadedAssets.keys;
      }
      
      public function enqueue(param1:AssetDefinition, param2:Boolean = false) : void
      {
         if(!param2 && _loadedAssets.exists(param1.identifier))
         {
            return;
         }
         _queue.push(param1);
      }
      
      public function load(param1:Function, param2:Function, param3:int = 1) : void
      {
         onProgress = param1;
         onLoaded = param2;
         retryAttempts = param3;
         if(_assetLocations.length == 0)
         {
            Logger.debug("[Asset Loader] No assets locations registered");
            if(onProgress != null)
            {
               onProgress(1);
            }
            §§push(onLoaded());
            return;
         }
         if(_queue.length == 0)
         {
            Logger.debug("[Asset Loader] Nothing to load");
            if(onProgress != null)
            {
               onProgress(1);
            }
            §§push(onLoaded());
            return;
         }
         var queue:Vector.<AssetDefinition> = _queue.concat();
         _queue.length = 0;
         var stepsize:Number = 1 / queue.length;
         var toLoad:int = queue.length;
         var loaded:int = 0;
         var assetDefinition:AssetDefinition = null;
         var assetLocationIndex:int = 0;
         var assetLocation:IAssetLocation = null;
         var loadNextAsset:Function = null;
         var loadAsset:Function = null;
         var onAssetProgress:Function = null;
         var onAssetComplete:Function = null;
         loadNextAsset = function():void
         {
            var retries:int = 0;
            if(queue.length == 0)
            {
               Logger.debug("[Asset Loader] All loaded");
               if(onProgress != null)
               {
                  onProgress(1);
               }
               §§push(onLoaded());
               return;
            }
            loadAsset = function(param1:AssetDefinition):void
            {
               var _loc2_:* = null;
               var _loc3_:* = null;
               assetLocation = _assetLocations[assetLocationIndex];
               if(assetLocation.supportsLookup)
               {
                  if(!assetLocation.containsAsset(param1.identifier))
                  {
                     assetLocationIndex = Number(assetLocationIndex) + 1;
                     if(assetLocationIndex < _assetLocations.length)
                     {
                        §§push(loadAsset(param1));
                        return;
                     }
                     assetLocationIndex = 0;
                     loaded = Number(loaded) + 1;
                     §§push(loadNextAsset());
                     return;
                  }
               }
               var _loc4_:* = assetLocation.loadType;
               switch(_loc4_)
               {
                  case AssetLoadType.EMBEDDED:
                     _loc2_ = (assetLocation.getLocationData(param1) as ClassAssetLocationData).data;
                     loadEmbeddedAsset(onAssetProgress,onAssetComplete,_loc2_);
                     break;
                  case AssetLoadType.URL:
                     _loc3_ = (assetLocation.getLocationData(param1) as StringAssetLocationData).data;
                     loadUrlAsset(onAssetProgress,onAssetComplete,_loc3_);
               }
            };
            onAssetProgress = function(param1:Number):void
            {
               var _loc3_:Number = loaded * stepsize;
               var _loc2_:Number = _loc3_ + stepsize * param1;
               if(_loc2_ < 1)
               {
                  if(onProgress != null)
                  {
                     onProgress(_loc2_);
                  }
               }
            };
            onAssetComplete = function(param1:IByteArray):void
            {
               if(param1 === null && retries < retryAttempts)
               {
                  retries = Number(retries) + 1;
                  §§push(loadAsset(assetDefinition));
                  return;
               }
               if(param1 === null)
               {
                  retries = 0;
                  assetLocationIndex = Number(assetLocationIndex) + 1;
                  if(assetLocationIndex < _assetLocations.length)
                  {
                     §§push(loadAsset(assetDefinition));
                     return;
                  }
               }
               if(param1 !== null)
               {
                  _loadedAssets.setData(assetDefinition.identifier,processAsset(assetDefinition,param1));
               }
               assetLocationIndex = 0;
               loaded = Number(loaded) + 1;
               §§push(loadNextAsset());
            };
            assetDefinition = queue.pop();
            §§push(loadAsset(assetDefinition));
         };
         §§push(loadNextAsset());
      }
      
      protected function loadEmbeddedAsset(param1:Function, param2:Function, param3:Class) : void
      {
         var _loc4_:IByteArray = ByteArray.fromClass(param3);
         param1(1);
      }
      
      protected function loadUrlAsset(param1:Function, param2:Function, param3:String) : void
      {
         onAssetProgress = param1;
         onAssetComplete = param2;
         requestUrl = param3;
         onLoadProgress = function(param1:DataProgress):void
         {
            if(onAssetProgress != null && param1.bytesTotal > 0)
            {
               onAssetProgress(param1.bytesLoaded / param1.bytesTotal);
            }
         };
         complete = function(param1:IByteArray):void
         {
            if(uriData)
            {
               uriData.dispose();
            }
         };
         onError = function(param1:Exception):void
         {
            Logger.error("[Asset Loader] URL Asset - Error: " + param1.errorID);
         };
         onUrlLoaderComplete = function():void
         {
            var _loc1_:IByteArray = uriData.dataAsBytes;
         };
         var uriData:IUriData = NetworkCore.current.createUriData(requestUrl,UriDataType.BINARY);
         uriData.load(onError,onUrlLoaderComplete,onLoadProgress);
      }
   }
}
