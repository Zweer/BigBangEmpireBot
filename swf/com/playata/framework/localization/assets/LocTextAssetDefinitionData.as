package com.playata.framework.localization.assets
{
   import com.playata.framework.assets.definition.IAssetDefinitionData;
   import com.playata.framework.localization.Locale;
   
   public class LocTextAssetDefinitionData implements IAssetDefinitionData
   {
       
      
      public var locale:Locale;
      
      public var format:String;
      
      public function LocTextAssetDefinitionData(param1:Locale, param2:String)
      {
         super();
         this.locale = param1;
         this.format = param2;
      }
   }
}
