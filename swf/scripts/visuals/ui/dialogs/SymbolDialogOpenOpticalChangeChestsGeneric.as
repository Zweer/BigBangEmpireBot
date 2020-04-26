package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolDialogOpenOpticalChangeChestsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOpenOpticalChangeChests = null;
      
      public var clickLayer:SymbolDummyGeneric = null;
      
      public function SymbolDialogOpenOpticalChangeChestsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOpenOpticalChangeChests;
         }
         else
         {
            _nativeObject = new SymbolDialogOpenOpticalChangeChests();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         clickLayer = new SymbolDummyGeneric(_nativeObject.clickLayer);
      }
      
      public function setNativeInstance(param1:SymbolDialogOpenOpticalChangeChests) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.clickLayer)
         {
            clickLayer.setNativeInstance(_nativeObject.clickLayer);
         }
      }
   }
}
