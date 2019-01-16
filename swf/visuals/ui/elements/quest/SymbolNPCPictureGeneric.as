package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolNPCPictureGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolNPCPicture = null;
      
      public var dummy:SymbolPlaceholderGeneric = null;
      
      public function SymbolNPCPictureGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolNPCPicture;
         }
         else
         {
            _nativeObject = new SymbolNPCPicture();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dummy = new SymbolPlaceholderGeneric(_nativeObject.dummy);
      }
      
      public function setNativeInstance(param1:SymbolNPCPicture) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dummy)
         {
            dummy.setNativeInstance(_nativeObject.dummy);
         }
      }
   }
}
