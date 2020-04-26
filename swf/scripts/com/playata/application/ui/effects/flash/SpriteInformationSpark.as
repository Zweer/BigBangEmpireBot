package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class SpriteInformationSpark
   {
       
      
      public var pos:Number = 1;
      
      public var lastPos:Number = 1;
      
      public var bmp:BitmapData;
      
      public var source:BitmapData;
      
      public var sprite:FlashEffectSprite;
      
      public var directionX:Number;
      
      public var directionY:Number;
      
      public var speed:Number;
      
      public var alphaMatrix:Array;
      
      public function SpriteInformationSpark()
      {
         alphaMatrix = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         super();
      }
   }
}
