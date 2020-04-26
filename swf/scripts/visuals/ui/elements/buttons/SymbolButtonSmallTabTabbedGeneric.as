package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolButtonSmallTabTabbedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonSmallTabTabbed = null;
      
      public var symbolButtonSmallTabTabbedBackground:SymbolButtonSmallTabTabbedBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonSmallTabTabbedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonSmallTabTabbed;
         }
         else
         {
            _nativeObject = new SymbolButtonSmallTabTabbed();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonSmallTabTabbedBackground = new SymbolButtonSmallTabTabbedBackgroundGeneric(_nativeObject.symbolButtonSmallTabTabbedBackground);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonSmallTabTabbed) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonSmallTabTabbedBackground)
         {
            symbolButtonSmallTabTabbedBackground.setNativeInstance(_nativeObject.symbolButtonSmallTabTabbedBackground);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
