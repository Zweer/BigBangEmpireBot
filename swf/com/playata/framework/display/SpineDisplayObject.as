package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   import spine.Event;
   import spine.Skeleton;
   import spine.animation.AnimationState;
   import spine.animation.AnimationStateData;
   
   public class SpineDisplayObject extends DisplayObject implements ISpineDisplayObject
   {
       
      
      protected var _spineDisplayObject:ISpineDisplayObject;
      
      public function SpineDisplayObject(param1:TypedObject = null, param2:ISpineDisplayObject = null)
      {
         if(param2)
         {
            _spineDisplayObject = param2;
         }
         else
         {
            if(!param1)
            {
               param1 = TypedObject.empty;
            }
            param1.setData("implementer",this);
            _spineDisplayObject = DisplayObjectFactory.createSpineDisplayObjectFromSettings(param1);
         }
         super(_spineDisplayObject);
         animationState.onEnd.add(animationCompleteHandler);
         animationState.onEvent.add(eventHandler);
         skeleton.setToSetupPose();
      }
      
      override public function dispose() : void
      {
         animationState.onEnd.remove(animationCompleteHandler);
         animationState.onEvent.remove(eventHandler);
         super.dispose();
      }
      
      public function get identifier() : String
      {
         return _spineDisplayObject.identifier;
      }
      
      public function get skeleton() : Skeleton
      {
         return _spineDisplayObject.skeleton;
      }
      
      public function get animationState() : AnimationState
      {
         return _spineDisplayObject.animationState;
      }
      
      public function initStateData(param1:AnimationStateData) : void
      {
      }
      
      public function playAnimation(param1:String, param2:Boolean = true) : void
      {
         animationState.setAnimationByName(0,param1,param2);
      }
      
      public function chainAnimation(param1:String, param2:Boolean = true, param3:Number = 0) : void
      {
         animationState.addAnimationByName(0,param1,param2,param3);
      }
      
      protected function eventHandler(param1:int, param2:Event) : void
      {
         onEvent(param2.data.name);
      }
      
      protected function onEvent(param1:String) : void
      {
      }
      
      protected function animationCompleteHandler(param1:int) : void
      {
         var _loc2_:String = animationState.getCurrent(param1).animation.name;
         onAnimationComplete(_loc2_);
      }
      
      protected function onAnimationComplete(param1:String) : void
      {
      }
   }
}
