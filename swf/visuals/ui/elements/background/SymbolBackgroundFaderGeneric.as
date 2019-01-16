package visuals.ui.elements.background
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBackgroundFaderGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundFader = null;
      
      public var bgLow:SymbolBackgroundFaderBgLowGeneric = null;
      
      public var bgHigh:SymbolBackgroundFaderBgHighGeneric = null;
      
      public var darkener:SymbolBackgroundFaderPlaneGeneric = null;
      
      public function SymbolBackgroundFaderGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundFader;
         }
         else
         {
            _nativeObject = new SymbolBackgroundFader();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgLow = new SymbolBackgroundFaderBgLowGeneric(_nativeObject.bgLow);
         bgHigh = new SymbolBackgroundFaderBgHighGeneric(_nativeObject.bgHigh);
         darkener = new SymbolBackgroundFaderPlaneGeneric(_nativeObject.darkener);
      }
      
      public function setNativeInstance(param1:SymbolBackgroundFader) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgLow)
         {
            bgLow.setNativeInstance(_nativeObject.bgLow);
         }
         if(_nativeObject.bgHigh)
         {
            bgHigh.setNativeInstance(_nativeObject.bgHigh);
         }
         if(_nativeObject.darkener)
         {
            darkener.setNativeInstance(_nativeObject.darkener);
         }
      }
   }
}
