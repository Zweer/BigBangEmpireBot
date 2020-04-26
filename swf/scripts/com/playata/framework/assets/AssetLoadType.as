package com.playata.framework.assets
{
   import com.playata.framework.core.enum.Enum;
   
   public class AssetLoadType extends Enum
   {
      
      public static const EMBEDDED:AssetLoadType = new AssetLoadType();
      
      public static const URL:AssetLoadType = new AssetLoadType();
      
      {
         initEnum(AssetLoadType);
      }
      
      public function AssetLoadType()
      {
         super();
      }
   }
}
