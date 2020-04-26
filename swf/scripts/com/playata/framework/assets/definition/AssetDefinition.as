package com.playata.framework.assets.definition
{
   public class AssetDefinition
   {
       
      
      public var identifier:String;
      
      public var data:IAssetDefinitionData;
      
      public function AssetDefinition(param1:String, param2:IAssetDefinitionData = null)
      {
         super();
         this.identifier = param1;
         this.data = param2;
      }
   }
}
