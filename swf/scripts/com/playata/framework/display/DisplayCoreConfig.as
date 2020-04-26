package com.playata.framework.display
{
   import com.playata.framework.assets.AssetManager;
   import com.playata.framework.display.layout.ILayout;
   
   public final class DisplayCoreConfig
   {
      
      public static var layout:ILayout = null;
      
      public static var assetManager:AssetManager = null;
       
      
      public function DisplayCoreConfig()
      {
         super();
      }
   }
}
