package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonTabTabbedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonTabTabbed = null;
      
      public var symbolButtonTabTabbedBackground:SymbolButtonTabTabbedBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonTabTabbedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonTabTabbed;
         }
         else
         {
            _nativeObject = new SymbolButtonTabTabbed();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonTabTabbedBackground = new SymbolButtonTabTabbedBackgroundGeneric(_nativeObject.symbolButtonTabTabbedBackground);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonTabTabbed) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonTabTabbedBackground)
         {
            symbolButtonTabTabbedBackground.setNativeInstance(_nativeObject.symbolButtonTabTabbedBackground);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
