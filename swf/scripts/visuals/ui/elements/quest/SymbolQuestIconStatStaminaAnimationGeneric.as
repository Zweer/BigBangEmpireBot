package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconStatStaminaAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconStatStaminaAnimation = null;
      
      public var symbolStatQuestAnimationStaminaHeart:SymbolStatQuestAnimationStaminaHeartGeneric = null;
      
      public function SymbolQuestIconStatStaminaAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconStatStaminaAnimation;
         }
         else
         {
            _nativeObject = new SymbolQuestIconStatStaminaAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatQuestAnimationStaminaHeart = new SymbolStatQuestAnimationStaminaHeartGeneric(_nativeObject.symbolStatQuestAnimationStaminaHeart);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconStatStaminaAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolStatQuestAnimationStaminaHeart)
         {
            symbolStatQuestAnimationStaminaHeart.setNativeInstance(_nativeObject.symbolStatQuestAnimationStaminaHeart);
         }
      }
   }
}
