package com.playata.application.ui.effects.flash
{
   import com.greensock.easing.Quart;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.tween.Tween;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class ExplosionEffect extends FlashEffect
   {
      
      protected static const ZERO:Point = new Point();
      
      protected static const ALPHA_REDUCER:ColorMatrixFilter = new ColorMatrixFilter();
       
      
      protected var _numSprites:int = 20;
      
      protected var _startX:int = 560;
      
      protected var _startY:int = 315;
      
      protected var _startXOffset:int = 250;
      
      protected var _startYOffset:int = 200;
      
      protected var _bmpsSource:Vector.<BitmapData> = null;
      
      protected var _bmps:Vector.<BitmapData>;
      
      protected var _spriteInformation:Vector.<ExplosionEffectSpriteInformation>;
      
      protected var _lastPos:Number;
      
      protected var _initted:Boolean;
      
      protected var _alpha_matrix:Array;
      
      public var pos:Number;
      
      public function ExplosionEffect()
      {
         _alpha_matrix = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         super();
      }
      
      protected function start(param1:Vector.<BitmapData>) : void
      {
         _bmpsSource = param1;
         Runtime.delayFunction(startEffect,0.3);
      }
      
      protected function startEffect() : void
      {
         var _loc5_:int = 0;
         var _loc3_:Number = NaN;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         _lastPos = 1;
         pos = 1;
         _bmps = new Vector.<BitmapData>(0);
         var _loc8_:int = 0;
         var _loc7_:* = _bmpsSource;
         for each(var _loc2_ in _bmpsSource)
         {
            _bmps.push(_loc2_.clone());
         }
         _spriteInformation = new Vector.<ExplosionEffectSpriteInformation>(0);
         var _loc1_:Point = new Point();
         _loc4_ = 0;
         while(_loc4_ < _numSprites)
         {
            _loc6_ = new ExplosionEffectSpriteInformation();
            _loc3_ = Math.random();
            _loc6_.speed = Math.random() * 600 + 120;
            _loc5_ = NumberUtil.randomInt(0,3);
            if(_loc5_ == 0)
            {
               _loc1_.x = -1;
               _loc1_.y = NumberUtil.randomNumber(-1,0.3);
            }
            else if(_loc5_ == 3)
            {
               _loc1_.x = 1;
               _loc1_.y = NumberUtil.randomNumber(-1,0.3);
            }
            else
            {
               _loc1_.x = NumberUtil.randomNumber(-1,1);
               _loc1_.y = -1;
            }
            _loc6_.sprite = FlashEffectSprite.allocate(!!_bmps?FlashEffect.randomElement(_bmps):null,_startX + _startXOffset * _loc1_.x,_startY + _startYOffset * _loc1_.y);
            _loc1_.normalize(1);
            _loc6_.directionX = _loc1_.x;
            _loc6_.directionY = _loc1_.y;
            addEffectSprite(_loc6_.sprite);
            _spriteInformation.push(_loc6_);
            _loc4_++;
         }
         Tween.to(this,2,{
            "pos":0,
            "ease":Quart.easeOut
         });
         _initted = true;
      }
      
      override public function update(param1:Number) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Number = NaN;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(!_initted)
         {
            return false;
         }
         if(pos < 0.2 && pos != _lastPos)
         {
            _loc3_ = pos * 4;
            _alpha_matrix[18] = _loc3_;
            ALPHA_REDUCER.matrix = _alpha_matrix;
            _loc5_ = 0;
            while(_loc5_ < _bmpsSource.length)
            {
               _loc2_ = _bmps[_loc5_];
               _loc2_.lock();
               _loc2_.applyFilter(_bmpsSource[_loc5_],_loc2_.rect,ZERO,ALPHA_REDUCER);
               _loc2_.unlock();
               _loc5_++;
            }
            _lastPos = pos;
         }
         if(pos == 0)
         {
            _loc5_ = sprites.length - 1;
            while(_loc5_ >= 0)
            {
               _spriteInformation[_loc5_].sprite = null;
               removeEffectSprite(sprites[_loc5_]);
               _loc5_--;
            }
            _spriteInformation.length = 0;
         }
         var _loc8_:int = 0;
         var _loc7_:* = _spriteInformation;
         for each(_loc6_ in _spriteInformation)
         {
            _loc4_ = _loc6_.sprite;
            _loc4_.x = _loc4_.x + _loc6_.directionX * _loc6_.speed * param1 * pos;
            _loc4_.y = _loc4_.y + (_loc6_.directionY * _loc6_.speed * param1 * pos + (1 - pos) * 1);
         }
         return super.update(param1);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:* = _bmpsSource;
         for each(_loc1_ in _bmpsSource)
         {
            _loc1_.dispose();
         }
         var _loc5_:int = 0;
         var _loc4_:* = _bmps;
         for each(_loc1_ in _bmps)
         {
            _loc1_.dispose();
         }
         super.dispose();
      }
   }
}
