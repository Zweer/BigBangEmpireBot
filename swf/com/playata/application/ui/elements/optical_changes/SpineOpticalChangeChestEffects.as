package com.playata.application.ui.elements.optical_changes
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.SpineDisplayObject;
   import spine.animation.AnimationStateData;
   
   public class SpineOpticalChangeChestEffects extends SpineDisplayObject
   {
       
      
      private var _onAnimationComplete:Function;
      
      private var _openSoundPlayed:Boolean = false;
      
      public function SpineOpticalChangeChestEffects(param1:int)
      {
         super(new TypedObject({"identifier":"chest_anim"}));
         switch(int(param1) - 1)
         {
            case 0:
               skeleton.skinName = "common";
               break;
            case 1:
               skeleton.skinName = "rare";
               break;
            case 2:
               skeleton.skinName = "epic";
         }
      }
      
      override public function initStateData(param1:AnimationStateData) : void
      {
         param1.setMixByName("chest_idle_1","chest_idle_3",0.2);
         param1.setMixByName("chest_idle_2","chest_idle_3",0.2);
         param1.setMixByName("chest_idle_3","chest_idle_1",0.2);
         param1.setMixByName("chest_idle_3","chest_idle_2",0.2);
      }
      
      public function burst() : void
      {
         playAnimation("chest_burst_new",false);
      }
      
      public function open(param1:Function = null) : void
      {
         _onAnimationComplete = param1;
         playAnimation("chest_open",false);
         chainAnimation("chest_open_idle");
      }
      
      public function openIdle() : void
      {
         playAnimation("chest_open_idle");
      }
      
      public function idle() : void
      {
         var _loc1_:int = NumberUtil.randomInt(1,2);
         playAnimation("chest_idle_" + _loc1_,false);
      }
      
      public function mouseOver() : void
      {
         playAnimation("chest_idle_3");
      }
      
      override protected function onEvent(param1:String) : void
      {
         if(param1 == "af_chest_idle_1" || param1 == "af_chest_idle_2")
         {
            idle();
         }
         else if(param1 == "open_sound" && _onAnimationComplete)
         {
            _onAnimationComplete();
            _onAnimationComplete = null;
         }
         else if(param1 == "open_swoosh_sound")
         {
            if(!_openSoundPlayed)
            {
               _openSoundPlayed = true;
               Environment.audio.playFX("hideout_chest_open.mp3");
            }
         }
      }
   }
}
