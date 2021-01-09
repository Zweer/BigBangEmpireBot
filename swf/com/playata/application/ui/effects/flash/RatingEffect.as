package com.playata.application.ui.effects.flash
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Expo;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class RatingEffect extends FlashEffect
   {
      
      private static const ZERO:Point = new Point();
      
      private static const ALPHA_REDUCER:ColorMatrixFilter = new ColorMatrixFilter();
       
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _bmpSource:BitmapData;
      
      private var _alpha_matrix:Array;
      
      public function RatingEffect(param1:Object)
      {
         var _loc11_:* = NaN;
         _loc11_ = 20;
         var _loc3_:* = NaN;
         _loc3_ = 40;
         var _loc2_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc8_:* = null;
         _alpha_matrix = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         super();
         calculateEmitterStartPosition(param1.emitter);
         _startX = EMITTER_POSITION.x;
         _startY = EMITTER_POSITION.y;
         _bmpSource = new EffectBitmapStar1(0,0);
         _loc2_ = 0;
         while(_loc2_ < param1.amount)
         {
            _loc9_ = Math.sin(Math.random() * 2 * 3.14159265358979);
            _loc10_ = Math.sin(Math.random() * 2 * 3.14159265358979);
            _loc13_ = _startX + _loc9_ * Math.random() * 10;
            _loc12_ = _startY + _loc10_ * Math.random() * 10;
            _loc4_ = 20 + Math.random() * 40;
            _loc7_ = 0.5 + (_loc4_ - 20) / 40;
            _loc7_ = _loc7_ * 1.2;
            _loc6_ = _startX + _loc9_ * _loc4_;
            _loc5_ = _startY + _loc10_ * _loc4_;
            _loc8_ = FlashEffectSprite.allocate(_bmpSource.clone(),_loc13_,_loc12_);
            sprites.push(_loc8_);
            TweenMax.to(_loc8_,_loc7_,{
               "x":_loc6_,
               "y":_loc5_,
               "ease":Expo.easeOut,
               "onComplete":removeSprite,
               "onUpdate":updateSpriteAlpha,
               "onUpdateParams":[_loc8_,_loc13_,_loc12_,_loc6_,_loc5_],
               "onCompleteParams":[_loc8_]
            });
            _loc2_++;
         }
      }
      
      private function updateSpriteAlpha(param1:FlashEffectSprite, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = param4 - param2;
         var _loc15_:Number = param5 - param3;
         var _loc7_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc15_ * _loc15_);
         var _loc13_:Number = param1.x;
         var _loc14_:Number = param1.y;
         var _loc8_:Number = _loc13_ - param2;
         var _loc9_:Number = _loc14_ - param3;
         var _loc10_:Number = Math.sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_);
         var _loc12_:Number = _loc10_ / _loc7_;
         if(_loc12_ < 0.75)
         {
            return;
         }
         _alpha_matrix[18] = 1 - (_loc12_ - 0.75) * 4;
         ALPHA_REDUCER.matrix = _alpha_matrix;
         var _loc11_:BitmapData = param1.bitmap;
         _loc11_.lock();
         _loc11_.applyFilter(_bmpSource,_loc11_.rect,ZERO,ALPHA_REDUCER);
         _loc11_.unlock();
      }
      
      private function removeSprite(param1:FlashEffectSprite) : void
      {
         sprites.splice(sprites.indexOf(param1),1);
         param1.bitmap.dispose();
         FlashEffectSprite.dispose(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _bmpSource.dispose();
      }
   }
}
