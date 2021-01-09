package com.playata.framework.display.assets
{
   import com.playata.framework.assets.IAsset;
   import spine.SkeletonData;
   
   public class SpineDefinitionAsset implements IAsset
   {
       
      
      private var _skeletonData:SkeletonData = null;
      
      public function SpineDefinitionAsset(param1:SkeletonData)
      {
         super();
         _skeletonData = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get skeletonData() : SkeletonData
      {
         return _skeletonData;
      }
   }
}
