package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonNarrowTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonNarrowTab = null;
      
      public var clear:SymbolButtonNarrowTabClearGeneric = null;
      
      public var tabbed:SymbolButtonTabTabbedInventoryGeneric = null;
      
      public function SymbolButtonNarrowTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonNarrowTab;
         }
         else
         {
            _nativeObject = new SymbolButtonNarrowTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonNarrowTabClearGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonTabTabbedInventoryGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonNarrowTab) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.clear)
         {
            clear.setNativeInstance(_nativeObject.clear);
         }
         if(_nativeObject.tabbed)
         {
            tabbed.setNativeInstance(_nativeObject.tabbed);
         }
      }
   }
}
