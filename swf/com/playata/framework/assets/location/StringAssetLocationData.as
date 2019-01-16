package com.playata.framework.assets.location
{
   public class StringAssetLocationData implements IAssetLocationData
   {
       
      
      private var _data:String;
      
      public function StringAssetLocationData(param1:String)
      {
         super();
         _data = param1;
      }
      
      public function get data() : String
      {
         return _data;
      }
   }
}
