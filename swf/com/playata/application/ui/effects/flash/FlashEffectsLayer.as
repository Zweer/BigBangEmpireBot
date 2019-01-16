package com.playata.application.ui.effects.flash
{
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.IEffect;
   import com.playata.framework.display.lib.flash.FlashImage;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FlashEffectsLayer extends EffectsLayer
   {
      
      private static const POINT:Point = new Point();
       
      
      private var _canvasGeneric:BitmapData;
      
      private var _canvasSpecial:BitmapData;
      
      private var _rect:Rectangle;
      
      public function FlashEffectsLayer()
      {
         super();
         FlashEffectSprite.initPool();
         _canvasGeneric = new BitmapData(1120,630,true,0);
         _canvasSpecial = new BitmapData(1120,630,true,0);
         _rect = _canvasGeneric.rect;
         var _loc2_:Bitmap = new Bitmap(_canvasGeneric,"auto",true);
         var _loc1_:Bitmap = new Bitmap(_canvasSpecial,"auto",true);
         _genericLayer = FlashImage.fromBitmap(_loc2_);
         _specialLayer = FlashImage.fromBitmap(_loc1_);
      }
      
      override protected function makeEffect(param1:int, param2:Object, param3:Boolean) : IEffect
      {
         var _loc4_:* = param1;
         switch(_loc4_)
         {
            case 0:
               return new CoinsEffect(param2);
            case 1:
               return new XPEffect(param2);
            case 2:
               return new PremiumEffect(param2);
            case 3:
               return new ItemEffect(param2);
            case 4:
               return new DungeonEffect(param2);
            case 5:
               return new BoosterEffect(param2);
            case 6:
               return new HonorEffect(param2);
            case 7:
               return new StatpointEffect(param2);
            case 8:
               return new RatingEffect(param2);
            case 9:
               return new SparkEffect(param2);
            case 10:
               return new TitleEffect(param2);
            case 11:
               return new BattleEffectGlitterEffect(param2);
            case 12:
               return new MovieVoteEffect(param2);
            case 13:
               return new MovieProgressEffect(param2);
            case 14:
               return new StoryDungeonPointEffect(param2);
            case 100:
               return new QuestCompleteEffect(param2);
            case 101:
               return new LevelUpEffectConfetti(param2);
            case 102:
               return new LevelUpStars(param2);
            case 104:
               return new DuelCompleteEffect(param2);
            case 105:
               return new ConventionEffect(param2);
            case 106:
            case 107:
               return new BattleSkillGeneratedBackgroundEffect(param2);
            case 108:
               return new BattleSkillGeneratedEpicForegroundEffect(param2);
            case 109:
               return new BattleSkillGeneratedCloudEffect(param2);
            case 110:
               return new WorkCompleteEffect(param2);
            case 111:
               return new MovieQuestCompleteEffect(param2);
            case 112:
               return new MovieStarCompleteEffect(param2);
            case 113:
               return new MovieCompleteEffect(param2);
            case 114:
               return new StoryDungeonCompleteEffect(param2);
            default:
               return null;
         }
      }
      
      override protected function renderEffects(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            renderQueue(_canvasGeneric,_effectsGeneric);
         }
         if(param2)
         {
            renderQueue(_canvasSpecial,_effectsSpecial);
         }
      }
      
      private function renderQueue(param1:BitmapData, param2:Vector.<IEffect>) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         param1.lock();
         param1.fillRect(_rect,0);
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_ = param2[_loc5_] as FlashEffect;
            var _loc7_:int = 0;
            var _loc6_:* = _loc4_.sprites;
            for each(var _loc3_ in _loc4_.sprites)
            {
               POINT.x = _loc3_.x + _loc3_.offsetX;
               POINT.y = _loc3_.y + _loc3_.offsetY;
               param1.copyPixels(_loc3_.bitmap,_loc3_.rect,POINT,null,null,true);
            }
            _loc5_++;
         }
         param1.unlock();
      }
   }
}
