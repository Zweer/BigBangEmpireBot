package visuals.ui.elements.work
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.booster.SymbolBoosterType3Strength2Generic;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolWorkBoosterButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolWorkBoosterButton = null;
      
      public var symbolBoosterType3Strength2:SymbolBoosterType3Strength2Generic = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolWorkBoosterButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolWorkBoosterButton;
         }
         else
         {
            _nativeObject = new SymbolWorkBoosterButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBoosterType3Strength2 = new SymbolBoosterType3Strength2Generic(_nativeObject.symbolBoosterType3Strength2);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolWorkBoosterButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBoosterType3Strength2)
         {
            symbolBoosterType3Strength2.setNativeInstance(_nativeObject.symbolBoosterType3Strength2);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
