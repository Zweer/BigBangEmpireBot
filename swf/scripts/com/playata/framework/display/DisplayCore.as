package com.playata.framework.display
{
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.display.ui.panels.PanelManager;
   
   public final class DisplayCore
   {
      
      public static var current:IDisplayCore;
      
      public static var panelManager:PanelManager;
       
      
      public function DisplayCore()
      {
         super();
      }
      
      public static function getTexture(param1:String) : ITexture
      {
         return DisplayCoreConfig.assetManager.getLoader(AssetType.TEXTURE).getAsset(param1) as ITexture;
      }
   }
}
