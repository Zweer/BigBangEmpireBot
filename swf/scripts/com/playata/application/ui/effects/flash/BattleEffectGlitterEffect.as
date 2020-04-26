package com.playata.application.ui.effects.flash
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.playata.framework.core.util.NumberUtil;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class BattleEffectGlitterEffect extends FlashEffect
   {
      
      private static const ZERO:Point = new Point();
      
      private static const ALPHA_REDUCER:ColorMatrixFilter = new ColorMatrixFilter();
       
      
      private var _bmpsSource:Vector.<BitmapData>;
      
      private var _spriteInformation:Vector.<SpriteInformationBattleGlitter>;
      
      private var _lastPos:Number;
      
      private var _alpha_matrix:Array;
      
      public var pos:Number;
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _radius:Number;
      
      private var _destroyed:Boolean = false;
      
      public function BattleEffectGlitterEffect(param1:Object)
      {
         _alpha_matrix = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         super();
         _startX = param1.x;
         _startY = param1.y;
         _radius = param1.r;
         var _loc2_:Vector.<BitmapData> = new <BitmapData>[new EffectBitmapDataBattleGlitterSmall(),new EffectBitmapDataBattleGlitterMedium(),new EffectBitmapDataBattleGlitterLarge()];
         _bmpsSource = new <BitmapData>[_loc2_[0],_loc2_[0],_loc2_[0],_loc2_[0],_loc2_[0],_loc2_[1],_loc2_[1],_loc2_[1],_loc2_[2]];
         _lastPos = 0;
         pos = 0;
         _spriteInformation = new Vector.<SpriteInformationBattleGlitter>(0);
         TweenMax.to(this,0.55,{
            "delay":0.05,
            "pos":1.1,
            "ease":Linear.easeNone,
            "onUpdate":spawnGlitter
         });
      }
      
      private function spawnGlitter() : void
      {
         var _loc13_:int = 0;
         var _loc12_:* = NaN;
         _loc12_ = 6.28318530717959;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:* = NaN;
         _loc1_ = 10;
         var _loc3_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc14_:* = null;
         var _loc9_:int = 0;
         if(_destroyed)
         {
            return;
         }
         var _loc8_:Number = pos - _lastPos;
         try
         {
            _loc13_ = Math.ceil(_loc8_ * 100);
            _loc5_ = _radius;
            _loc7_ = _radius * 0.2;
            _loc3_ = _startX + Math.sin(_lastPos * _loc12_) * _loc5_;
            _loc6_ = _startY - Math.cos(_lastPos * _loc12_) * _loc7_;
            _loc2_ = _startX + Math.sin(pos * _loc12_) * _loc5_;
            _loc4_ = _startY - Math.cos(pos * _loc12_) * _loc7_;
            _loc10_ = (_loc2_ - _loc3_) / _loc13_;
            _loc11_ = (_loc4_ - _loc6_) / _loc13_;
            _loc9_ = 0;
            while(_loc9_ < _loc13_)
            {
               _loc14_ = new SpriteInformationBattleGlitter();
               _loc14_.startY = _loc6_ + _loc9_ * _loc11_ + NumberUtil.randomNumber(-_loc1_,_loc1_);
               _loc14_.height = NumberUtil.randomNumber(150,180);
               _loc14_.source = FlashEffect.randomElement(_bmpsSource);
               _loc14_.sprite = FlashEffectSprite.allocate(_loc14_.source.clone(),_loc3_ + _loc9_ * _loc10_ + NumberUtil.randomNumber(-_loc1_,_loc1_),_loc14_.startY);
               sprites.push(_loc14_.sprite);
               _spriteInformation.push(_loc14_);
               TweenMax.to(_loc14_,1,{
                  "pos":1,
                  "ease":Linear.easeNone,
                  "onComplete":removeSprite,
                  "onCompleteParams":[_loc14_]
               });
               _loc9_++;
            }
         }
         catch(e:Error)
         {
         }
         _lastPos = pos;
      }
      
      private function removeSprite(param1:SpriteInformationBattleGlitter) : void
      {
         param1.sprite.bitmap.dispose();
         sprites.splice(sprites.indexOf(param1.sprite),1);
         FlashEffectSprite.dispose(param1.sprite);
         param1.sprite = null;
         _spriteInformation.splice(_spriteInformation.indexOf(param1),1);
         param1.source = null;
      }
      
      override public function update(param1:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _spriteInformation;
         for each(var _loc4_ in _spriteInformation)
         {
            _loc3_ = _loc4_.sprite;
            _loc3_.y = _loc4_.startY + _loc4_.height * _loc4_.pos;
            if(_loc4_.pos > 0.5)
            {
               _alpha_matrix[18] = 1 - (_loc4_.pos - 0.5) * 2;
               ALPHA_REDUCER.matrix = _alpha_matrix;
               _loc2_ = _loc3_.bitmap;
               _loc2_.lock();
               _loc2_.applyFilter(_loc4_.source,_loc2_.rect,ZERO,ALPHA_REDUCER);
               _loc2_.unlock();
            }
         }
         return super.update(param1) && pos > 0;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         TweenMax.killTweensOf(this);
         var _loc4_:int = 0;
         var _loc3_:* = _spriteInformation;
         for each(var _loc2_ in _spriteInformation)
         {
            TweenMax.killTweensOf(_loc2_);
         }
         var _loc6_:int = 0;
         var _loc5_:* = _bmpsSource;
         for each(_loc1_ in _bmpsSource)
         {
            _loc1_.dispose();
         }
         super.dispose();
         _destroyed = true;
      }
   }
}
