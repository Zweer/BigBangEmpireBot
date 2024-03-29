package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDailyBonusQuestsProgressBarFrameGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusQuestsProgressBarFrame = null;
      
      public function SymbolDailyBonusQuestsProgressBarFrameGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusQuestsProgressBarFrame;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusQuestsProgressBarFrame();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDailyBonusQuestsProgressBarFrame) : void
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
