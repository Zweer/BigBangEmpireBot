package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDailyBonusProgressBarFrameGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusProgressBarFrame = null;
      
      public function SymbolDailyBonusProgressBarFrameGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusProgressBarFrame;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusProgressBarFrame();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDailyBonusProgressBarFrame) : void
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
