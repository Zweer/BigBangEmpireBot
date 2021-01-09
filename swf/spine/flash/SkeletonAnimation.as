package spine.flash
{
   import spine.SkeletonData;
   import spine.animation.AnimationState;
   import spine.animation.AnimationStateData;
   
   public class SkeletonAnimation extends SkeletonSprite
   {
       
      
      public var state:AnimationState;
      
      public function SkeletonAnimation(param1:SkeletonData, param2:AnimationStateData = null)
      {
         super(param1);
         state = new AnimationState(!!param2?param2:new AnimationStateData(param1));
      }
      
      override public function advanceTime(param1:Number) : void
      {
         state.update(param1 * timeScale);
         state.apply(skeleton);
         skeleton.updateWorldTransform();
         super.advanceTime(param1);
      }
   }
}
