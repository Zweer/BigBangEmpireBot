package com.playata.application.assets
{
   import com.playata.framework.assets.Assets;
   import com.playata.framework.display.Sprite;
   
   public class AppAssetUtil
   {
       
      
      public function AppAssetUtil()
      {
         super();
      }
      
      public static function setLocaleFlag(param1:String, param2:Sprite) : void
      {
         param2.setUriSprite(Assets.assetURL("flags/" + param1,"png"),28,23,false,-1);
      }
   }
}
