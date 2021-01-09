package com.playata.framework.assets
{
   import com.playata.framework.core.enum.Enum;
   
   public class AssetType extends Enum
   {
      
      public static const LOC_TEXT:AssetType = new AssetType();
      
      public static const CONSTANTS:AssetType = new AssetType();
      
      public static const TEXTURE:AssetType = new AssetType();
      
      public static const SPINE_DEFINITION:AssetType = new AssetType();
      
      public static const PARTICLE_EFFECT:AssetType = new AssetType();
      
      public static const STRING:AssetType = new AssetType();
      
      {
         initEnum(AssetType);
      }
      
      public function AssetType()
      {
         super();
      }
   }
}
