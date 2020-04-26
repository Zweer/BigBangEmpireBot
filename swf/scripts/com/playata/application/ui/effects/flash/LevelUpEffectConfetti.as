package com.playata.application.ui.effects.flash
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.NumberUtil;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class LevelUpEffectConfetti extends FlashEffect
   {
       
      
      private var _initted:Boolean;
      
      private var _timeStamp:int;
      
      private var _possibleSprites:Vector.<BitmapData>;
      
      public function LevelUpEffectConfetti(param1:Object)
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         super();
         _possibleSprites = new <BitmapData>[new EffectBitmapLevelUp1(),new EffectBitmapLevelUp2(),new EffectBitmapLevelUp3(),new EffectBitmapLevelUp4(),new EffectBitmapLevelUp5(),new EffectBitmapLevelUp6()];
         var _loc4_:int = 50;
         if(param1 && param1["numSprites"] !== undefined)
         {
            _loc4_ = param1["numSprites"];
         }
         var _loc2_:Point = new Point();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.x = NumberUtil.randomInt(0,1120);
            _loc2_.y = NumberUtil.randomInt(0,-650);
            _loc3_ = FlashEffectSprite.allocate(FlashEffect.randomElement(_possibleSprites),_loc2_.x,_loc2_.y);
            _loc3_.userData = {
               "x":10 + Math.random() * 40,
               "y":100 + Math.random() * 180
            };
            sprites.push(_loc3_);
            _loc5_++;
         }
         _timeStamp = Runtime.getTimer();
         _initted = true;
      }
      
      override public function update(param1:Number) : Boolean
      {
         if(!_initted)
         {
            return false;
         }
         var _loc4_:int = Runtime.getTimer();
         var _loc2_:Number = (_loc4_ - _timeStamp) / 1000;
         _timeStamp = _loc4_;
         var _loc6_:int = 0;
         var _loc5_:* = sprites;
         for each(var _loc3_ in sprites)
         {
            _loc3_.x = _loc3_.x + _loc3_.userData.x * _loc2_;
            if(_loc3_.x > 900)
            {
               _loc3_.x = _loc3_.x - 950;
            }
            _loc3_.y = _loc3_.y + _loc3_.userData.y * _loc2_;
            if(_loc3_.y > 630)
            {
               _loc3_.y = _loc3_.y - 650;
            }
         }
         return super.update(param1);
      }
      
      override public function shutDown() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = sprites;
         for each(var _loc1_ in sprites)
         {
            FlashEffectSprite.dispose(_loc1_);
         }
         sprites.length = 0;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:* = _possibleSprites;
         for each(_loc1_ in _possibleSprites)
         {
            _loc1_.dispose();
         }
         super.dispose();
      }
   }
}
