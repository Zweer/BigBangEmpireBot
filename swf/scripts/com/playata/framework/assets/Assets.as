package com.playata.framework.assets
{
   import com.playata.framework.core.collection.StringMap;
   
   public class Assets
   {
      
      private static var _assetOverwrites:StringMap = null;
      
      private static var _localAssetFiles:StringMap = null;
      
      private static var _assetBasePath:String = "";
       
      
      public function Assets()
      {
         super();
      }
      
      public static function set assetBasePath(param1:String) : void
      {
         _assetBasePath = param1;
      }
      
      public static function get assetBasePath() : String
      {
         return _assetBasePath;
      }
      
      public static function assetURL(param1:String, param2:String = null) : String
      {
         if(_assetOverwrites && _assetOverwrites.exists(param1))
         {
            param1 = _assetOverwrites.getData(param1);
         }
         var _loc3_:String = "assets/" + param1;
         if(param2)
         {
            _loc3_ = "assets/" + param1 + "." + param2;
         }
         var _loc4_:String = getLocalAssetFile(_loc3_);
         if(_loc4_)
         {
            return _loc4_;
         }
         return _assetBasePath + _loc3_;
      }
      
      public static function setAssetOverwrites(param1:StringMap) : void
      {
         _assetOverwrites = param1;
      }
      
      public static function get localAssetFiles() : StringMap
      {
         return _localAssetFiles;
      }
      
      public static function set localAssetFiles(param1:StringMap) : void
      {
         _localAssetFiles = param1;
      }
      
      public static function extendLocalAssetFiles(param1:StringMap) : void
      {
         if(!_localAssetFiles)
         {
            _localAssetFiles = new StringMap();
         }
         _localAssetFiles.extend(param1);
      }
      
      public static function getLocalAssetFile(param1:String) : String
      {
         if(!_localAssetFiles)
         {
            return null;
         }
         if(!_localAssetFiles.exists(param1))
         {
            return null;
         }
         return _localAssetFiles.getData(param1);
      }
   }
}
