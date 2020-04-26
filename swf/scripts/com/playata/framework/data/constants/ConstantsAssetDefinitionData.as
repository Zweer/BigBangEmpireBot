package com.playata.framework.data.constants
{
   import com.playata.framework.assets.definition.IAssetDefinitionData;
   
   public class ConstantsAssetDefinitionData implements IAssetDefinitionData
   {
       
      
      public var version:String;
      
      public var format:String;
      
      public function ConstantsAssetDefinitionData(param1:String, param2:String)
      {
         super();
         this.version = param1;
         this.format = param2;
      }
   }
}
