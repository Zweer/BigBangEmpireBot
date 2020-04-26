package com.playata.application.ui.effects.flash
{
   import com.greensock.easing.Quart;
   import com.greensock.easing.Sine;
   import com.playata.application.ui.effects.Effect;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.tween.Tween;
   import flash.display.BitmapData;
   
   public class TargetEffect extends FlashEffect
   {
       
      
      protected var _loaded:Boolean;
      
      protected var _isInitPhase:Boolean;
      
      protected var _bmp:BitmapData;
      
      protected var _startX:Number;
      
      protected var _startY:Number;
      
      protected var _targetX:Number;
      
      protected var _targetY:Number;
      
      protected var _duration:Number = 0.75;
      
      protected var _maxSprites:Number = 1;
      
      private var _createdSprites:int = 0;
      
      public function TargetEffect()
      {
         super();
      }
      
      public function createFromBitmapData(param1:IDisplayObject, param2:Number, param3:Number, param4:BitmapData) : void
      {
         _isInitPhase = true;
         _bmp = param4;
         Effect.calculateEmitterStartPosition(param1);
         _startX = Effect.EMITTER_POSITION.x;
         _startY = Effect.EMITTER_POSITION.y;
         _targetX = param2;
         _targetY = param3;
         _loaded = true;
      }
      
      public function createFromUriSprite(param1:IDisplayObject, param2:Number, param3:Number, param4:String) : void
      {
         _isInitPhase = true;
         var _loc5_:IDisplayObject = UriSprite.load(param4,60,60,true,1,startEffect);
         Effect.calculateEmitterStartPosition(param1);
         _startX = Effect.EMITTER_POSITION.x;
         _startY = Effect.EMITTER_POSITION.y;
         _targetX = param2;
         _targetY = param3;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_bmp)
         {
            _bmp.dispose();
         }
         _bmp = null;
         _createdSprites = 0;
      }
      
      private function startEffect(param1:IUriSprite) : void
      {
         try
         {
            param1.getChildAt(0).alpha = 1;
         }
         catch(e:Error)
         {
         }
         _bmp = new BitmapData(60,60,true,0);
         _bmp.draw(FlashDisplayObject.getNativeDisplayObject(param1));
         _loaded = true;
      }
      
      override public function update(param1:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(!_loaded)
         {
            return false;
         }
         if(_isInitPhase)
         {
            _loc3_ = FlashEffectSprite.allocate(_bmp,_startX + getStartXVariation(),_startY + getStartYVariation());
            addEffectSprite(_loc3_,sprites.length);
            _loc2_ = _duration + getDurationVariation();
            Tween.to(_loc3_,_loc2_,{
               "x":_targetX + getTargetXVariation(),
               "ease":Sine.easeIn
            });
            Tween.to(_loc3_,_loc2_,{
               "y":_targetY + getTargetYVariation(),
               "ease":Quart.easeIn,
               "onComplete":removeEffectSprite,
               "onCompleteParams":[_loc3_]
            });
            _createdSprites = Number(_createdSprites) + 1;
            if(_createdSprites == _maxSprites)
            {
               _isInitPhase = false;
            }
         }
         return super.update(param1);
      }
      
      protected function getDurationVariation() : Number
      {
         return 0;
      }
      
      protected function getStartXVariation() : Number
      {
         return 0;
      }
      
      protected function getStartYVariation() : Number
      {
         return 0;
      }
      
      protected function getTargetXVariation() : Number
      {
         return 0;
      }
      
      protected function getTargetYVariation() : Number
      {
         return 0;
      }
   }
}
