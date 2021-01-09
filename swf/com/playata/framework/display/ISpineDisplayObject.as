package com.playata.framework.display
{
   import spine.Skeleton;
   import spine.animation.AnimationState;
   
   public interface ISpineDisplayObject extends IDisplayObject
   {
       
      
      function get identifier() : String;
      
      function get skeleton() : Skeleton;
      
      function get animationState() : AnimationState;
   }
}
