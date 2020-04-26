package com.playata.framework.assets.definition
{
   public class StringAssetDefinitionData implements IAssetDefinitionData
   {
       
      
      public var format:String;
      
      public function StringAssetDefinitionData(param1:String = "plain")
      {
         super();
         this.format = param1;
      }
   }
}
