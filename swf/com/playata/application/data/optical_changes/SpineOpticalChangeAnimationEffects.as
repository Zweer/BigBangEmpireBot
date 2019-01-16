package com.playata.application.data.optical_changes
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.SpineDisplayObject;
   
   public class SpineOpticalChangeAnimationEffects extends SpineDisplayObject
   {
       
      
      private var _animationIdentifier:String;
      
      public function SpineOpticalChangeAnimationEffects(param1:String, param2:String)
      {
         _animationIdentifier = param2;
         super(new TypedObject({"identifier":param1}));
      }
      
      public function play() : void
      {
         playAnimation(_animationIdentifier);
      }
   }
}
