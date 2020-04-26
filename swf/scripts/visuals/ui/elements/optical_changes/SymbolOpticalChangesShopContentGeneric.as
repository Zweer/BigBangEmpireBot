package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolOpticalChangesShopContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangesShopContent = null;
      
      public var offer1:SymbolOpticalChangeShopOfferGeneric = null;
      
      public var offer2:SymbolOpticalChangeShopOfferGeneric = null;
      
      public function SymbolOpticalChangesShopContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangesShopContent;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangesShopContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         offer1 = new SymbolOpticalChangeShopOfferGeneric(_nativeObject.offer1);
         offer2 = new SymbolOpticalChangeShopOfferGeneric(_nativeObject.offer2);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangesShopContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.offer1)
         {
            offer1.setNativeInstance(_nativeObject.offer1);
         }
         if(_nativeObject.offer2)
         {
            offer2.setNativeInstance(_nativeObject.offer2);
         }
      }
   }
}
