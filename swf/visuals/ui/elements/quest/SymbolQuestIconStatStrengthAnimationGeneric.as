package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconStatStrengthAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconStatStrengthAnimation = null;
      
      public var symbolStatQuestAnimationStrengthArm:SymbolStatQuestAnimationStrengthArmGeneric = null;
      
      public function SymbolQuestIconStatStrengthAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconStatStrengthAnimation;
         }
         else
         {
            _nativeObject = new SymbolQuestIconStatStrengthAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatQuestAnimationStrengthArm = new SymbolStatQuestAnimationStrengthArmGeneric(_nativeObject.symbolStatQuestAnimationStrengthArm);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconStatStrengthAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolStatQuestAnimationStrengthArm)
         {
            symbolStatQuestAnimationStrengthArm.setNativeInstance(_nativeObject.symbolStatQuestAnimationStrengthArm);
         }
      }
   }
}
