package com.playata.framework.display.assets
{
   import com.playata.framework.assets.definition.IAssetDefinitionData;
   
   public class SpineAssetDefinitionData implements IAssetDefinitionData
   {
       
      
      public var identifier:String;
      
      public var textureAtlas:String;
      
      public var scale:Number;
      
      public function SpineAssetDefinitionData(param1:String, param2:String, param3:Number = 1)
      {
         super();
         this.identifier = param1;
         this.textureAtlas = param2;
         this.scale = param3;
      }
   }
}
