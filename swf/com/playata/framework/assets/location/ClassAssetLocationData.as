package com.playata.framework.assets.location
{
   public class ClassAssetLocationData implements IAssetLocationData
   {
       
      
      private var _data:Class;
      
      public function ClassAssetLocationData(param1:Class)
      {
         super();
         _data = param1;
      }
      
      public function get data() : Class
      {
         return _data;
      }
   }
}
