package visuals.ui.elements.backgrounds
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlice9BackgroundDialogGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlice9BackgroundDialog = null;
      
      public function SymbolSlice9BackgroundDialogGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlice9BackgroundDialog;
         }
         else
         {
            _nativeObject = new SymbolSlice9BackgroundDialog();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolSlice9BackgroundDialog) : void
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
