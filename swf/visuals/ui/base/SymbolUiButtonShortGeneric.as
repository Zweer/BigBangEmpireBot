package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   
   public class SymbolUiButtonShortGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiButtonShort = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolUiButtonShortGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiButtonShort;
         }
         else
         {
            _nativeObject = new SymbolUiButtonShort();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolUiButtonShort) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
