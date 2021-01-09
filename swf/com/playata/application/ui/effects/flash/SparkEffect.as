package com.playata.application.ui.effects.flash
{
   import com.greensock.easing.Quart;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.tween.Tween;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class SparkEffect extends FlashEffect
   {
      
      private static var ZERO:Point = new Point();
      
      private static var ALPHA_REDUCER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static var SPARK1:BitmapData = new EffectBitmapDataSpark1();
      
      private static var SPARK2:BitmapData = new EffectBitmapDataSpark2();
      
      private static var SPARK3:BitmapData = new EffectBitmapDataSpark3();
      
      private static var SPARK4:BitmapData = new EffectBitmapDataSpark4();
       
      
      private var _spriteInformation:Vector.<SpriteInformationSpark>;
      
      private var _timeStamp:int;
      
      private var _active:Boolean;
      
      private var _p:Point;
      
      public function SparkEffect(param1:Object)
      {
         super();
         _active = true;
         _p = new Point();
         _timeStamp = Runtime.getTimer();
         _spriteInformation = new Vector.<SpriteInformationSpark>(0);
      }
      
      public function addSpark(param1:Number, param2:Number) : void
      {
         var _loc4_:SpriteInformationSpark = new SpriteInformationSpark();
         _loc4_.speed = Math.random() * 600 + 120;
         var _loc3_:int = NumberUtil.randomInt(0,3);
         if(_loc3_ == 1)
         {
            _p.x = NumberUtil.randomNumber(-1,0);
            _p.y = NumberUtil.randomNumber(-1,0);
            _loc4_.source = SPARK1;
         }
         else if(_loc3_ == 2)
         {
            _p.x = NumberUtil.randomNumber(0,1);
            _p.y = NumberUtil.randomNumber(-1,0);
            _loc4_.source = SPARK2;
         }
         else if(_loc3_ == 3)
         {
            _p.x = NumberUtil.randomNumber(-1,0);
            _p.y = NumberUtil.randomNumber(0,1);
            _loc4_.source = SPARK3;
         }
         else
         {
            _p.x = NumberUtil.randomNumber(0,1);
            _p.y = NumberUtil.randomNumber(0,1);
            _loc4_.source = SPARK4;
         }
         _loc4_.bmp = _loc4_.source.clone();
         _loc4_.sprite = FlashEffectSprite.allocate(_loc4_.bmp,param1,param2);
         _p.normalize(1);
         _loc4_.directionX = _p.x;
         _loc4_.directionY = _p.y;
         sprites.push(_loc4_.sprite);
         _spriteInformation.push(_loc4_);
         Tween.to(_loc4_,0.6,{
            "pos":0,
            "ease":Quart.easeOut
         });
      }
      
      override public function update(param1:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = Runtime.getTimer();
         _timeStamp = _loc5_;
         var _loc2_:Vector.<SpriteInformationSpark> = new Vector.<SpriteInformationSpark>(0);
         var _loc8_:int = 0;
         var _loc7_:* = _spriteInformation;
         for each(var _loc6_ in _spriteInformation)
         {
            if(_loc6_.pos < 0.2 && _loc6_.pos != _loc6_.lastPos)
            {
               _loc6_.alphaMatrix[18] = _loc6_.pos * 4;
               ALPHA_REDUCER.matrix = _loc6_.alphaMatrix;
               _loc6_.bmp.lock();
               _loc6_.bmp.applyFilter(_loc6_.source,_loc6_.bmp.rect,ZERO,ALPHA_REDUCER);
               _loc6_.bmp.unlock();
               _loc6_.lastPos = _loc6_.pos;
            }
            if(_loc6_.pos == 0)
            {
               _loc2_.push(_loc6_);
            }
            else
            {
               _loc3_ = _loc6_.sprite;
               _loc3_.x = _loc3_.x + _loc6_.directionX * _loc6_.speed * param1 * _loc6_.pos;
               _loc3_.y = _loc3_.y + (_loc6_.directionY * _loc6_.speed * param1 * _loc6_.pos + (1 - _loc6_.pos) * 2);
            }
         }
         var _loc10_:int = 0;
         var _loc9_:* = _loc2_;
         for each(_loc6_ in _loc2_)
         {
            _loc4_ = sprites.indexOf(_loc6_.sprite);
            sprites.splice(_loc4_,1);
            _loc4_ = _spriteInformation.indexOf(_loc6_);
            _spriteInformation.splice(_loc4_,1);
            FlashEffectSprite.dispose(_loc6_.sprite);
            _loc6_.bmp.dispose();
            _loc6_.sprite = null;
            _loc6_.bmp = null;
            _loc6_.source = null;
         }
         if(_active)
         {
            return false;
         }
         return super.update(param1);
      }
      
      override public function shutDown() : void
      {
         _active = false;
         super.shutDown();
      }
   }
}
