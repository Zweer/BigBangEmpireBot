package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonSmallWideTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonSmallWideTab = null;
      
      public var clear:SymbolButtonSmallWideTabClearGeneric = null;
      
      public var tabbed:SymbolButtonSmallWideTabTabbedGeneric = null;
      
      public function SymbolButtonSmallWideTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonSmallWideTab;
         }
         else
         {
            _nativeObject = new SymbolButtonSmallWideTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonSmallWideTabClearGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonSmallWideTabTabbedGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonSmallWideTab) : void
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
