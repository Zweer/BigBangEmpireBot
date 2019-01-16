package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStatQuestAnimationStaminaHeartGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatQuestAnimationStaminaHeart = null;
      
      public function SymbolStatQuestAnimationStaminaHeartGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatQuestAnimationStaminaHeart;
         }
         else
         {
            _nativeObject = new SymbolStatQuestAnimationStaminaHeart();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolStatQuestAnimationStaminaHeart) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
