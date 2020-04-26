package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconFightAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconFightAnimation = null;
      
      public var symbolQuestIconFightFingers:SymbolQuestIconFightFingersGeneric = null;
      
      public var symbolQuestIconFightThumb:SymbolQuestIconFightThumbGeneric = null;
      
      public function SymbolQuestIconFightAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconFightAnimation;
         }
         else
         {
            _nativeObject = new SymbolQuestIconFightAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolQuestIconFightFingers = new SymbolQuestIconFightFingersGeneric(_nativeObject.symbolQuestIconFightFingers);
         symbolQuestIconFightThumb = new SymbolQuestIconFightThumbGeneric(_nativeObject.symbolQuestIconFightThumb);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconFightAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolQuestIconFightFingers)
         {
            symbolQuestIconFightFingers.setNativeInstance(_nativeObject.symbolQuestIconFightFingers);
         }
         if(_nativeObject.symbolQuestIconFightThumb)
         {
            symbolQuestIconFightThumb.setNativeInstance(_nativeObject.symbolQuestIconFightThumb);
         }
      }
   }
}
