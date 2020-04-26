package com.playata.framework.assets.download
{
   import com.playata.framework.assets.AssetLoaderBase;
   import com.playata.framework.assets.IAsset;
   import com.playata.framework.assets.StringDefinitionAsset;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.definition.StringAssetDefinitionData;
   import com.playata.framework.core.data.IByteArray;
   
   public class StringLoader extends AssetLoaderBase
   {
      
      public static const FORMAT_PLAIN:String = "plain";
      
      public static const FORMAT_AMF3:String = "amf3";
       
      
      public function StringLoader()
      {
         super();
      }
      
      override public function load(param1:Function, param2:Function, param3:int = 1) : void
      {
         var _loc4_:* = null;
         if(_queue.length == 1)
         {
            _loc4_ = _queue[0];
            if(getAsset(_loc4_.identifier))
            {
               if(param2 != null)
               {
                  param2();
               }
               return;
            }
         }
         super.load(param1,param2,param3);
      }
      
      override protected function processAsset(param1:AssetDefinition, param2:IByteArray) : IAsset
      {
         var _loc3_:StringAssetDefinitionData = param1.data as StringAssetDefinitionData;
         if(_loc3_.format == "amf3")
         {
            param2.uncompress();
         }
         param2.position = 0;
         return new StringDefinitionAsset(param2.readUTFBytes(param2.bytesAvailable));
      }
   }
}
