package com.playata.application
{
   import com.playata.framework.display.assets.SpineAssetDefinitionData;
   import com.playata.framework.display.assets.TextureAssetDefinitionData;
   
   public class AssetListCommon
   {
      
      public static var ASSET_LIST_TEXTURES:Vector.<TextureAssetDefinitionData> = new <TextureAssetDefinitionData>[new TextureAssetDefinitionData("ui_background.png"),new TextureAssetDefinitionData("ui_background.xml"),new TextureAssetDefinitionData("oc_animation.png"),new TextureAssetDefinitionData("oc_animation.xml"),new TextureAssetDefinitionData("streaming_animation.png"),new TextureAssetDefinitionData("streaming_animation.xml"),new TextureAssetDefinitionData("ui_foreground.png"),new TextureAssetDefinitionData("ui_foreground.xml"),new TextureAssetDefinitionData("ui_foreground2.png"),new TextureAssetDefinitionData("ui_foreground2.xml"),new TextureAssetDefinitionData("guild_emblems.png"),new TextureAssetDefinitionData("guild_emblems.xml"),new TextureAssetDefinitionData("citymap.png"),new TextureAssetDefinitionData("citymap.xml"),new TextureAssetDefinitionData("FontCopy.fnt"),new TextureAssetDefinitionData("FontHeadlineStyled.fnt"),new TextureAssetDefinitionData("FontHeadline.fnt")];
      
      public static var SPINE_DEFINITIONS:Vector.<SpineAssetDefinitionData> = new <SpineAssetDefinitionData>[new SpineAssetDefinitionData("chest_anim","oc_animation",1),new SpineAssetDefinitionData("oc_snow_anim","oc_animation",1),new SpineAssetDefinitionData("oc_confetti_anim","oc_animation",1),new SpineAssetDefinitionData("oc_new_year","oc_animation",1),new SpineAssetDefinitionData("streaming_pose_1","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_2","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_3","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_4","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_5","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_6","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_7","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_8","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_9","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_10","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_11","streaming_animation",1),new SpineAssetDefinitionData("streaming_pose_12","streaming_animation",1)];
       
      
      public function AssetListCommon()
      {
         super();
      }
   }
}
