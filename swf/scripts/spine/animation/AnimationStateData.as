package spine.animation
{
   import spine.SkeletonData;
   
   public class AnimationStateData
   {
       
      
      var _skeletonData:SkeletonData;
      
      private var animationToMixTime:Object;
      
      public var defaultMix:Number = 0;
      
      public function AnimationStateData(param1:SkeletonData)
      {
         animationToMixTime = {};
         super();
         _skeletonData = param1;
      }
      
      public function get skeletonData() : SkeletonData
      {
         return _skeletonData;
      }
      
      public function setMixByName(param1:String, param2:String, param3:Number) : void
      {
         var _loc4_:Animation = _skeletonData.findAnimation(param1);
         if(_loc4_ == null)
         {
            throw new ArgumentError("Animation not found: " + param1);
         }
         var _loc5_:Animation = _skeletonData.findAnimation(param2);
         if(_loc5_ == null)
         {
            throw new ArgumentError("Animation not found: " + param2);
         }
         setMix(_loc4_,_loc5_,param3);
      }
      
      public function setMix(param1:Animation, param2:Animation, param3:Number) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("from cannot be null.");
         }
         if(param2 == null)
         {
            throw new ArgumentError("to cannot be null.");
         }
         animationToMixTime[param1.name + ":" + param2.name] = param3;
      }
      
      public function getMix(param1:Animation, param2:Animation) : Number
      {
         var _loc3_:Object = animationToMixTime[param1.name + ":" + param2.name];
         if(_loc3_ == null)
         {
            return defaultMix;
         }
         return _loc3_ as Number;
      }
   }
}
