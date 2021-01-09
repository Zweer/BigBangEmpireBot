package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconFightAnimationCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconFightAnimationComplete = null;
      
      public var symbolQuestIconFightAnimation:SymbolQuestIconFightAnimationGeneric = null;
      
      public function SymbolQuestIconFightAnimationCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconFightAnimationComplete;
         }
         else
         {
            _nativeObject = new SymbolQuestIconFightAnimationComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolQuestIconFightAnimation = new SymbolQuestIconFightAnimationGeneric(_nativeObject.symbolQuestIconFightAnimation);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconFightAnimationComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolQuestIconFightAnimation)
         {
            symbolQuestIconFightAnimation.setNativeInstance(_nativeObject.symbolQuestIconFightAnimation);
         }
      }
   }
}
