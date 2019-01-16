package com.playata.application.ui.effects.flash
{
   import com.playata.application.ui.effects.Effect;
   import com.playata.application.ui.effects.IEffect;
   import flash.display.BitmapData;
   
   public class FlashEffect extends Effect implements IEffect
   {
       
      
      var sprites:Vector.<FlashEffectSprite>;
      
      public function FlashEffect()
      {
         super();
         sprites = new Vector.<FlashEffectSprite>();
      }
      
      public static function randomElement(param1:Vector.<BitmapData>) : *
      {
         var _loc2_:int = Math.floor(Math.random() * param1.length);
         return param1[_loc2_];
      }
      
      override public function update(param1:Number) : Boolean
      {
         super.update(param1);
         return sprites.length == 0;
      }
      
      protected function addEffectSprite(param1:FlashEffectSprite, param2:int = -1) : void
      {
         if(param2 < 0)
         {
            sprites.push(param1);
         }
         else
         {
            sprites[param2] = param1;
         }
      }
      
      protected function removeEffectSprite(param1:FlashEffectSprite) : void
      {
         sprites.removeAt(sprites.indexOf(param1));
         FlashEffectSprite.dispose(param1);
      }
      
      public function dispose() : void
      {
         while(sprites.length)
         {
            FlashEffectSprite.dispose(sprites.pop());
         }
      }
   }
}
