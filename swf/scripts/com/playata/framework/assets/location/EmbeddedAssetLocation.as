package com.playata.framework.assets.location
{
   import com.playata.framework.assets.AssetLoadType;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.collection.StringMap;
   import flash.utils.describeType;
   
   public class EmbeddedAssetLocation implements IAssetLocation
   {
       
      
      private var _clazz:Class;
      
      private var _embeddedClasses:StringMap;
      
      public function EmbeddedAssetLocation(param1:Class)
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         super();
         _clazz = param1;
         _embeddedClasses = new StringMap();
         var _loc3_:XML = describeType(_clazz);
         var _loc10_:int = 0;
         var _loc5_:* = _loc3_.constant;
         var _loc6_:int = 0;
         var _loc8_:* = new XMLList("");
         var _loc9_:* = _loc3_.constant.(@type == "Class");
         for each(_loc4_ in _loc3_.constant.(@type == "Class"))
         {
            _loc2_ = _loc4_.@name;
            _embeddedClasses.setData(_loc2_,_clazz[_loc2_]);
         }
      }
      
      public function get loadType() : AssetLoadType
      {
         return AssetLoadType.EMBEDDED;
      }
      
      public function getLocationData(param1:AssetDefinition) : IAssetLocationData
      {
         if(!containsAsset(param1.identifier))
         {
            return null;
         }
         return new ClassAssetLocationData(_embeddedClasses.getData(param1.identifier));
      }
      
      public function get supportsLookup() : Boolean
      {
         return true;
      }
      
      public function containsAsset(param1:String) : Boolean
      {
         return _embeddedClasses.exists(param1);
      }
      
      public function dispose() : void
      {
      }
   }
}
