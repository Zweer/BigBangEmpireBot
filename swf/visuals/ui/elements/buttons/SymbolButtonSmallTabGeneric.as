package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonSmallTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonSmallTab = null;
      
      public var clear:SymbolButtonSmallTabClearGeneric = null;
      
      public var tabbed:SymbolButtonSmallTabTabbedGeneric = null;
      
      public function SymbolButtonSmallTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonSmallTab;
         }
         else
         {
            _nativeObject = new SymbolButtonSmallTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonSmallTabClearGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonSmallTabTabbedGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonSmallTab) : void
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
