package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonPlusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonPlus = null;
      
      public var highlight:SymbolButtonPlusStaticHighlightGeneric = null;
      
      public var mainButton:SymbolButtonPlusStaticGeneric = null;
      
      public function SymbolButtonPlusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonPlus;
         }
         else
         {
            _nativeObject = new SymbolButtonPlus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         highlight = new SymbolButtonPlusStaticHighlightGeneric(_nativeObject.highlight);
         mainButton = new SymbolButtonPlusStaticGeneric(_nativeObject.mainButton);
      }
      
      public function setNativeInstance(param1:SymbolButtonPlus) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.highlight)
         {
            highlight.setNativeInstance(_nativeObject.highlight);
         }
         if(_nativeObject.mainButton)
         {
            mainButton.setNativeInstance(_nativeObject.mainButton);
         }
      }
   }
}
