package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolQuestIconStatAnimationCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestIconStatAnimationComplete = null;
      
      public var stat1:SymbolQuestIconStatStaminaAnimationGeneric = null;
      
      public var stat2:SymbolQuestIconStatStrengthAnimationGeneric = null;
      
      public var stat3:SymbolQuestIconStatCritAnimationGeneric = null;
      
      public var stat4:SymbolQuestIconStatDodgeAnimationGeneric = null;
      
      public function SymbolQuestIconStatAnimationCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestIconStatAnimationComplete;
         }
         else
         {
            _nativeObject = new SymbolQuestIconStatAnimationComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         stat1 = new SymbolQuestIconStatStaminaAnimationGeneric(_nativeObject.stat1);
         stat2 = new SymbolQuestIconStatStrengthAnimationGeneric(_nativeObject.stat2);
         stat3 = new SymbolQuestIconStatCritAnimationGeneric(_nativeObject.stat3);
         stat4 = new SymbolQuestIconStatDodgeAnimationGeneric(_nativeObject.stat4);
      }
      
      public function setNativeInstance(param1:SymbolQuestIconStatAnimationComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.stat1)
         {
            stat1.setNativeInstance(_nativeObject.stat1);
         }
         if(_nativeObject.stat2)
         {
            stat2.setNativeInstance(_nativeObject.stat2);
         }
         if(_nativeObject.stat3)
         {
            stat3.setNativeInstance(_nativeObject.stat3);
         }
         if(_nativeObject.stat4)
         {
            stat4.setNativeInstance(_nativeObject.stat4);
         }
      }
   }
}
