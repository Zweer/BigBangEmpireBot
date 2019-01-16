package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStatQuestAnimationStrengthArmGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatQuestAnimationStrengthArm = null;
      
      public function SymbolStatQuestAnimationStrengthArmGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatQuestAnimationStrengthArm;
         }
         else
         {
            _nativeObject = new SymbolStatQuestAnimationStrengthArm();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolStatQuestAnimationStrengthArm) : void
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
