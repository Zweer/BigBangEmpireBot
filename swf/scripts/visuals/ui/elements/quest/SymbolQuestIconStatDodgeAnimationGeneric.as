package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconStatDodgeAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconStatDodgeAnimation = null;
      
      public var symbolStatQuestAnimationDodgeEyeInner:SymbolStatQuestAnimationDodgeEyeInnerGeneric = null;
      
      public function SymbolQuestIconStatDodgeAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconStatDodgeAnimation;
         }
         else
         {
            _nativeObject = new SymbolQuestIconStatDodgeAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatQuestAnimationDodgeEyeInner = new SymbolStatQuestAnimationDodgeEyeInnerGeneric(_nativeObject.symbolStatQuestAnimationDodgeEyeInner);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconStatDodgeAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolStatQuestAnimationDodgeEyeInner)
         {
            symbolStatQuestAnimationDodgeEyeInner.setNativeInstance(_nativeObject.symbolStatQuestAnimationDodgeEyeInner);
         }
      }
   }
}
