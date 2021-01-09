package com.playata.application.ui.elements.streaming
{
   import com.playata.application.AppEnvironment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.SpineDisplayObject;
   
   public class SpineStreamingActor extends SpineDisplayObject
   {
       
      
      public function SpineStreamingActor(param1:String, param2:String)
      {
         super(new TypedObject({"identifier":param1}));
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            param2 = param2 + "_ad";
         }
         else
         {
            param2 = param2 + "_nad";
         }
         skeleton.skinName = param2;
      }
      
      public function play() : void
      {
         playAnimation("animation");
      }
   }
}
