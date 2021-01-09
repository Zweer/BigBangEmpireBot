package com.playata.framework.display.lib.flash
{
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.ISpineDisplayObject;
   import com.playata.framework.display.assets.SpineDefinitionAsset;
   import spine.Skeleton;
   import spine.SkeletonData;
   import spine.animation.AnimationState;
   import spine.animation.AnimationStateData;
   import spine.flash.SkeletonAnimation;
   
   public class FlashSpineDisplayObject extends FlashSprite implements ISpineDisplayObject
   {
       
      
      private var _skeleton:SkeletonAnimation = null;
      
      private var _identifier:String = null;
      
      public function FlashSpineDisplayObject(param1:TypedObject)
      {
         _identifier = param1.getString("identifier");
         var _loc2_:IAssetLoader = DisplayCoreConfig.assetManager.getLoader(AssetType.SPINE_DEFINITION);
         var _loc3_:SkeletonData = (_loc2_.getAsset(_identifier) as SpineDefinitionAsset).skeletonData;
         var _loc4_:AnimationStateData = new AnimationStateData(_loc3_);
         if(param1.hasData("implementer"))
         {
            param1.getData("implementer").initStateData(_loc4_);
         }
         _skeleton = new SkeletonAnimation(_loc3_,_loc4_);
         super(param1,_skeleton);
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get skeleton() : Skeleton
      {
         return _skeleton.skeleton;
      }
      
      public function get animationState() : AnimationState
      {
         return _skeleton.state;
      }
   }
}
