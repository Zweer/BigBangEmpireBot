package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonIconOnlyTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonIconOnlyTab = null;
      
      public var clear:SymbolButtonIconOnlyTabClearGeneric = null;
      
      public var tabbed:SymbolButtonIconOnlyTabTabbedGeneric = null;
      
      public function SymbolButtonIconOnlyTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonIconOnlyTab;
         }
         else
         {
            _nativeObject = new SymbolButtonIconOnlyTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonIconOnlyTabClearGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonIconOnlyTabTabbedGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonIconOnlyTab) : void
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
