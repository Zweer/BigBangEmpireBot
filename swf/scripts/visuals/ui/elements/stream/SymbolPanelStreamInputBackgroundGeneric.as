package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolPanelStreamInputBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelStreamInputBackground = null;
      
      public function SymbolPanelStreamInputBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelStreamInputBackground;
         }
         else
         {
            _nativeObject = new SymbolPanelStreamInputBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolPanelStreamInputBackground) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
