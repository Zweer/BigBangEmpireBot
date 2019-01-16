package com.playata.application
{
   import com.playata.framework.display.assets.SpineAssetDefinitionData;
   import com.playata.framework.display.assets.TextureAssetDefinitionData;
   
   public class AssetListCommon
   {
      
      public static var ASSET_LIST_TEXTURES:Vector.<TextureAssetDefinitionData> = new <TextureAssetDefinitionData>[new TextureAssetDefinitionData("ui_background.png"),new TextureAssetDefinitionData("ui_background.xml"),new TextureAssetDefinitionData("ui_foreground.png"),new TextureAssetDefinitionData("ui_foreground.xml"),new TextureAssetDefinitionData("ui_foreground2.png"),new TextureAssetDefinitionData("ui_foreground2.xml"),new TextureAssetDefinitionData("guild_emblems.png"),new TextureAssetDefinitionData("guild_emblems.xml"),new TextureAssetDefinitionData("citymap.png"),new TextureAssetDefinitionData("citymap.xml"),new TextureAssetDefinitionData("FontCopy.fnt"),new TextureAssetDefinitionData("FontHeadlineStyled.fnt"),new TextureAssetDefinitionData("FontHeadline.fnt")];
      
      public static var SPINE_DEFINITIONS:Vector.<SpineAssetDefinitionData> = new <SpineAssetDefinitionData>[new SpineAssetDefinitionData("chest_anim","ui_background",1),new SpineAssetDefinitionData("oc_snow_anim","ui_background",1),new SpineAssetDefinitionData("item_sparkle","ui_background",1)];
       
      
      public function AssetListCommon()
      {
         super();
      }
   }
}
