package com.playata.application.ui.effects.flash
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Sine;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.tween.Tween;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class BattleSkillGeneratedCloudEffect extends FlashEffect
   {
      
      public static const SHUTDOWN_DURATION:Number = 0.8;
      
      private static const ZERO:Point = new Point();
      
      private static const ALPHA_REDUCER:ColorMatrixFilter = new ColorMatrixFilter();
      
      private static const CLOUD_BITMAPS:Array = [new EffectBitmapDataBattleSkillCloud1(),new EffectBitmapDataBattleSkillCloud2(),new EffectBitmapDataBattleSkillCloud3(),new EffectBitmapDataBattleSkillCloud4(),new EffectBitmapDataBattleSkillHammer(),new EffectBitmapDataBattleSkillScrewdriver(),new EffectBitmapDataBattleSkillPincer(),new EffectBitmapDataBattleSkillSaw()];
      
      private static const QUALITY_BITMAPS:Array = [new EffectBitmapDataBattleSkillGlowCommon(),new EffectBitmapDataBattleSkillGlowRare(),new EffectBitmapDataBattleSkillGlowEpic()];
      
      private static const RADIUS:Number = 40;
      
      private static const P:Point = new Point();
       
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _tools:Vector.<FlashEffectSprite>;
      
      private var _bmps:Vector.<BitmapData>;
      
      private var _bmpQuality:BitmapData;
      
      private var _alpha_matrix:Array;
      
      private var _lastPos:Number;
      
      public var pos:Number;
      
      private var _lastPosGlow:Number;
      
      private var _quality:int;
      
      public var posGlow:Number;
      
      private var _glowSprite:FlashEffectSprite;
      
      public function BattleSkillGeneratedCloudEffect(param1:Object)
      {
         _alpha_matrix = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         super();
         calculateEmitterStartPosition(param1.emitter);
         _startX = EMITTER_POSITION.x;
         _startY = EMITTER_POSITION.y;
         _lastPos = 1;
         pos = 1;
         _lastPosGlow = 0;
         posGlow = 0;
         _bmps = new Vector.<BitmapData>(0);
         var _loc4_:int = 0;
         var _loc3_:* = CLOUD_BITMAPS;
         for each(var _loc2_ in CLOUD_BITMAPS)
         {
            _bmps.push(_loc2_.clone());
         }
         _quality = param1.quality - 1;
         _bmpQuality = QUALITY_BITMAPS[_quality].clone();
         _glowSprite = FlashEffectSprite.allocate(_bmpQuality,_startX,_startY);
         sprites.push(_glowSprite);
         Tween.to(this,1,{
            "posGlow":1,
            "ease":Linear.easeNone
         });
         _tools = new Vector.<FlashEffectSprite>(0);
         createNewSprite(0);
         createNewSprite(6);
         createNewSprite(2);
         createNewSprite(7);
         createNewSprite(1);
         createNewSprite(0);
         createNewSprite(5);
         createNewSprite(1);
         createNewSprite(0);
         createNewSprite(3);
         createNewSprite(4);
         createNewSprite(1);
         createNewSprite(2);
         createNewSprite(0);
      }
      
      override public function update(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(posGlow != _lastPosGlow)
         {
            _alpha_matrix[18] = posGlow;
            ALPHA_REDUCER.matrix = _alpha_matrix;
            _bmpQuality.lock();
            _bmpQuality.applyFilter(QUALITY_BITMAPS[_quality],_bmpQuality.rect,ZERO,ALPHA_REDUCER);
            _bmpQuality.unlock();
            _lastPosGlow = posGlow;
         }
         if(pos < 0.5 && pos != _lastPos)
         {
            _alpha_matrix[18] = pos * 2;
            ALPHA_REDUCER.matrix = _alpha_matrix;
            _loc3_ = 0;
            while(_loc3_ < _bmps.length)
            {
               _loc2_ = _bmps[_loc3_];
               _loc2_.lock();
               _loc2_.applyFilter(CLOUD_BITMAPS[_loc3_],_loc2_.rect,ZERO,ALPHA_REDUCER);
               _loc2_.unlock();
               _loc3_++;
            }
            _lastPos = pos;
         }
         if(pos == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < sprites.length)
            {
               FlashEffectSprite.dispose(sprites[_loc3_]);
               _loc3_++;
            }
            sprites.length = 0;
            TweenMax.killTweensOf(this);
         }
         return super.update(param1);
      }
      
      private function createNewSprite(param1:int) : void
      {
         calculateNewTarget(40);
         var _loc2_:FlashEffectSprite = FlashEffectSprite.allocate(_bmps[param1],P.x,P.y);
         sprites.push(_loc2_);
         startNewCloudTween(_loc2_);
         if(param1 > 3)
         {
            _tools.push(_loc2_);
         }
      }
      
      private function startNewCloudTween(param1:FlashEffectSprite) : void
      {
         var _loc4_:* = _tools.indexOf(param1) > -1;
         calculateNewTarget(40,_loc4_);
         Tween.to(param1,NumberUtil.randomNumber(0.2,0.5),{
            "x":P.x,
            "y":P.y,
            "ease":Sine.easeInOut,
            "onComplete":startNewCloudTween,
            "onCompleteParams":[param1]
         });
         var _loc3_:int = sprites.indexOf(param1);
         sprites.splice(_loc3_,1);
         var _loc2_:int = !!_loc4_?8:sprites.length;
         _loc3_ = NumberUtil.randomInt(1,_loc2_);
         sprites.splice(_loc3_,0,param1);
      }
      
      override public function shutDown() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         Tween.to(this,0.8,{
            "pos":0,
            "ease":Linear.easeNone
         });
         _loc2_ = 1;
         while(_loc2_ < sprites.length)
         {
            _loc1_ = sprites[_loc2_];
            TweenMax.killTweensOf(_loc1_);
            calculateNewTarget(40 * 2);
            Tween.to(_loc1_,0.8,{
               "x":P.x,
               "y":P.y,
               "ease":Sine.easeOut
            });
            _loc2_++;
         }
      }
      
      public function shotDownInstant() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < sprites.length)
         {
            TweenMax.killTweensOf(sprites[_loc1_]);
            FlashEffectSprite.dispose(sprites[_loc1_]);
            _loc1_++;
         }
         sprites.length = 0;
         TweenMax.killTweensOf(this);
      }
      
      private function calculateNewTarget(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:* = NaN;
         _loc3_ = 3.14159265358979;
         P.x = Math.sin(NumberUtil.randomNumber(0,3.14159265358979 * 2));
         P.y = Math.sin(NumberUtil.randomNumber(0,3.14159265358979 * 2));
         P.normalize(NumberUtil.randomNumber(0,param1));
         P.x = P.x + _startX;
         if(param2)
         {
            P.y = -Math.abs(P.y) - param1 * 0.25;
         }
         P.y = P.y + _startY;
      }
   }
}
