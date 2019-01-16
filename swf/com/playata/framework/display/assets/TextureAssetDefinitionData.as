package com.playata.framework.display.assets
{
   import com.playata.framework.assets.definition.IAssetDefinitionData;
   
   public class TextureAssetDefinitionData implements IAssetDefinitionData
   {
       
      
      public var identifier:String;
      
      public function TextureAssetDefinitionData(param1:String)
      {
         super();
         this.identifier = param1;
      }
   }
}
