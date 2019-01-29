package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDailyBonusRewardLegsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusRewardLegs = null;
      
      public function SymbolDailyBonusRewardLegsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusRewardLegs;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusRewardLegs();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDailyBonusRewardLegs) : void
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
