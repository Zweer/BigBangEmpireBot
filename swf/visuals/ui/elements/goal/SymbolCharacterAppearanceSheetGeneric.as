package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.avatar.SymbolAppearanceIconsGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolCharacterAppearanceSheetGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterAppearanceSheet = null;
      
      public var inactiveBackground:SymbolAppearanceSheetInactiveBackgroundGeneric = null;
      
      public var inactiveBackgroundOver:SymbolAppearanceSheetInactiveBackgroundGeneric = null;
      
      public var activeBackground:SymbolAppearanceSheetActiveBackgroundGeneric = null;
      
      public var icons:SymbolAppearanceIconsGeneric = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolCharacterAppearanceSheetGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterAppearanceSheet;
         }
         else
         {
            _nativeObject = new SymbolCharacterAppearanceSheet();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         inactiveBackground = new SymbolAppearanceSheetInactiveBackgroundGeneric(_nativeObject.inactiveBackground);
         inactiveBackgroundOver = new SymbolAppearanceSheetInactiveBackgroundGeneric(_nativeObject.inactiveBackgroundOver);
         activeBackground = new SymbolAppearanceSheetActiveBackgroundGeneric(_nativeObject.activeBackground);
         icons = new SymbolAppearanceIconsGeneric(_nativeObject.icons);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolCharacterAppearanceSheet) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.inactiveBackground)
         {
            inactiveBackground.setNativeInstance(_nativeObject.inactiveBackground);
         }
         if(_nativeObject.inactiveBackgroundOver)
         {
            inactiveBackgroundOver.setNativeInstance(_nativeObject.inactiveBackgroundOver);
         }
         if(_nativeObject.activeBackground)
         {
            activeBackground.setNativeInstance(_nativeObject.activeBackground);
         }
         if(_nativeObject.icons)
         {
            icons.setNativeInstance(_nativeObject.icons);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
