package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonTabClearGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonTabClear = null;
      
      public var symbolButtonTabClearBackground:SymbolButtonTabClearBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonTabClearGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonTabClear;
         }
         else
         {
            _nativeObject = new SymbolButtonTabClear();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonTabClearBackground = new SymbolButtonTabClearBackgroundGeneric(_nativeObject.symbolButtonTabClearBackground);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonTabClear) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonTabClearBackground)
         {
            symbolButtonTabClearBackground.setNativeInstance(_nativeObject.symbolButtonTabClearBackground);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
