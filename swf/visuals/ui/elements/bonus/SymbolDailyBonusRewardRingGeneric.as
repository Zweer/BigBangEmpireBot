package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDailyBonusRewardRingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusRewardRing = null;
      
      public function SymbolDailyBonusRewardRingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusRewardRing;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusRewardRing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDailyBonusRewardRing) : void
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
