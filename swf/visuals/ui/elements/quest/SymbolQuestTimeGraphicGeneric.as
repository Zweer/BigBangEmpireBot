package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolQuestTimeGraphicGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestTimeGraphic = null;
      
      public var animation:SymbolQuestIconClockAnimationGeneric = null;
      
      public var swish:SymbolRewardSwishGeneric = null;
      
      public var effect:SymbolPlaceholderGeneric = null;
      
      public function SymbolQuestTimeGraphicGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestTimeGraphic;
         }
         else
         {
            _nativeObject = new SymbolQuestTimeGraphic();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         animation = new SymbolQuestIconClockAnimationGeneric(_nativeObject.animation);
         swish = new SymbolRewardSwishGeneric(_nativeObject.swish);
         effect = new SymbolPlaceholderGeneric(_nativeObject.effect);
      }
      
      public function setNativeInstance(param1:SymbolQuestTimeGraphic) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.animation)
         {
            animation.setNativeInstance(_nativeObject.animation);
         }
         if(_nativeObject.swish)
         {
            swish.setNativeInstance(_nativeObject.swish);
         }
         if(_nativeObject.effect)
         {
            effect.setNativeInstance(_nativeObject.effect);
         }
      }
   }
}
