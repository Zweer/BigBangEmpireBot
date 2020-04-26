package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonTab = null;
      
      public var clear:SymbolButtonTabClearGeneric = null;
      
      public var tabbed:SymbolButtonTabTabbedGeneric = null;
      
      public function SymbolButtonTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonTab;
         }
         else
         {
            _nativeObject = new SymbolButtonTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonTabClearGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonTabTabbedGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonTab) : void
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
