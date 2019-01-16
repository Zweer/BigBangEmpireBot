package com.playata.application.ui.elements.item
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.SpineDisplayObject;
   
   public class SpineItemAnimationEffects extends SpineDisplayObject
   {
       
      
      private var _animationIdentifier:String;
      
      public function SpineItemAnimationEffects(param1:String, param2:int, param3:Boolean)
      {
         _animationIdentifier = getAnimationIdentifier(param1,param2,param3);
         super(new TypedObject({"identifier":param1}));
      }
      
      public static function getAnimationIdentifier(param1:String, param2:int, param3:Boolean) : String
      {
         var _loc4_:String = "";
         if(param2 == 1)
         {
            _loc4_ = "_head";
         }
         else if(param2 == 2)
         {
            _loc4_ = "_chest";
         }
         else if(param2 == 3)
         {
            _loc4_ = "_belt";
         }
         else if(param2 == 4)
         {
            _loc4_ = "_legs";
         }
         else if(param2 == 5)
         {
            _loc4_ = "_boots";
         }
         var _loc5_:String = "";
         if(param3)
         {
            _loc5_ = "_m";
         }
         else
         {
            _loc5_ = "_f";
         }
         return param1 + _loc4_ + _loc5_;
      }
      
      public function play() : void
      {
         playAnimation(_animationIdentifier);
      }
   }
}
