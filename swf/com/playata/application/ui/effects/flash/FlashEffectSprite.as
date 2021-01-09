package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class FlashEffectSprite
   {
      
      private static var POOL:Vector.<FlashEffectSprite> = new Vector.<FlashEffectSprite>(0);
       
      
      public var bitmap:BitmapData;
      
      public var x:Number;
      
      public var y:Number;
      
      public var offsetX:Number;
      
      public var offsetY:Number;
      
      public var rect:Rectangle;
      
      public var userData;
      
      public function FlashEffectSprite()
      {
         super();
      }
      
      public static function initPool() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 100)
         {
            POOL[POOL.length] = new FlashEffectSprite();
            _loc1_++;
         }
      }
      
      public static function allocate(param1:BitmapData, param2:Number, param3:Number) : FlashEffectSprite
      {
         var _loc4_:FlashEffectSprite = POOL.length > 0?POOL.pop():new FlashEffectSprite();
         _loc4_.x = param2;
         _loc4_.y = param3;
         _loc4_.bitmap = param1;
         _loc4_.offsetX = -param1.width >> 1;
         _loc4_.offsetY = -param1.height >> 1;
         _loc4_.rect = param1.rect;
         return _loc4_;
      }
      
      public static function dispose(param1:FlashEffectSprite) : void
      {
         param1.bitmap = null;
         param1.rect = null;
         POOL.push(param1);
      }
   }
}
