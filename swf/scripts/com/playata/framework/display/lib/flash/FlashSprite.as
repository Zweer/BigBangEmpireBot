package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ISprite;
   import flash.display.Sprite;
   
   public class FlashSprite extends FlashDisplayObjectContainer implements ISprite
   {
       
      
      public var _sprite:Sprite = null;
      
      public function FlashSprite(param1:TypedObject, param2:Sprite = null)
      {
         if(param2)
         {
            _sprite = param2;
         }
         else
         {
            _sprite = new Sprite();
         }
         super(_sprite);
         interactionEnabled = false;
         applySettings(param1);
      }
      
      public static function setNativeInstance(param1:ISprite, param2:Sprite) : void
      {
         (param1 as FlashSprite)._sprite = param2;
         (param1 as FlashSprite)._displayObjectContainer = param2;
         (param1 as FlashSprite)._displayObject = param2;
      }
      
      public static function fromNative(param1:Sprite) : FlashSprite
      {
         return new FlashSprite(null,param1);
      }
   }
}
