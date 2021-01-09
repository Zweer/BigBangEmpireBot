package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDailyLoginBonusBackgroundPendingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyLoginBonusBackgroundPending = null;
      
      public function SymbolDailyLoginBonusBackgroundPendingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyLoginBonusBackgroundPending;
         }
         else
         {
            _nativeObject = new SymbolDailyLoginBonusBackgroundPending();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDailyLoginBonusBackgroundPending) : void
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
