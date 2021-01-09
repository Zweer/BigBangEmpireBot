package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonSmallTabWhiteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonSmallTabWhite = null;
      
      public var clear:SymbolButtonSmallTabClearWhiteGeneric = null;
      
      public var tabbed:SymbolButtonSmallTabTabbedWhiteGeneric = null;
      
      public function SymbolButtonSmallTabWhiteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonSmallTabWhite;
         }
         else
         {
            _nativeObject = new SymbolButtonSmallTabWhite();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clear = new SymbolButtonSmallTabClearWhiteGeneric(_nativeObject.clear);
         tabbed = new SymbolButtonSmallTabTabbedWhiteGeneric(_nativeObject.tabbed);
      }
      
      public function setNativeInstance(param1:SymbolButtonSmallTabWhite) : void
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
