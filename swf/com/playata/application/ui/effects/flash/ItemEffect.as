package com.playata.application.ui.effects.flash
{
   public class ItemEffect extends TargetEffect
   {
       
      
      public function ItemEffect(param1:Object)
      {
         super();
         createFromUriSprite(param1.emitter,65,560,param1.imageUrl);
      }
   }
}
