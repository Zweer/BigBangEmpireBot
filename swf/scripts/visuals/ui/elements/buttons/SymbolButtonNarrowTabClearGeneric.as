package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonNarrowTabClearGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonNarrowTabClear = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonNarrowTabClearGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonNarrowTabClear;
         }
         else
         {
            _nativeObject = new SymbolButtonNarrowTabClear();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonNarrowTabClear) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
