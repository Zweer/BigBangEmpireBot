package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonSmallTabClearGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonSmallTabClear = null;
      
      public var symbolButtonSmallTabClearBackground:SymbolButtonSmallTabClearBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonSmallTabClearGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonSmallTabClear;
         }
         else
         {
            _nativeObject = new SymbolButtonSmallTabClear();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonSmallTabClearBackground = new SymbolButtonSmallTabClearBackgroundGeneric(_nativeObject.symbolButtonSmallTabClearBackground);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonSmallTabClear) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonSmallTabClearBackground)
         {
            symbolButtonSmallTabClearBackground.setNativeInstance(_nativeObject.symbolButtonSmallTabClearBackground);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
