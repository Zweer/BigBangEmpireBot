package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonOptionsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeCurrencyGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesContentGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesShopContentGeneric;
   
   public class SymbolDialogOpticalChangesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOpticalChanges = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnTabShop:SymbolButtonTabGeneric = null;
      
      public var btnTabOpticalChanges:SymbolButtonTabGeneric = null;
      
      public var iconCount:SymbolCounterGeneric = null;
      
      public var opticalChanges:SymbolOpticalChangesContentGeneric = null;
      
      public var shopContent:SymbolOpticalChangesShopContentGeneric = null;
      
      public var opticalChangeResource:SymbolOpticalChangeCurrencyGeneric = null;
      
      public var btnOptions:SymbolButtonOptionsGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolDialogOpticalChangesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOpticalChanges;
         }
         else
         {
            _nativeObject = new SymbolDialogOpticalChanges();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnTabShop = new SymbolButtonTabGeneric(_nativeObject.btnTabShop);
         btnTabOpticalChanges = new SymbolButtonTabGeneric(_nativeObject.btnTabOpticalChanges);
         iconCount = new SymbolCounterGeneric(_nativeObject.iconCount);
         opticalChanges = new SymbolOpticalChangesContentGeneric(_nativeObject.opticalChanges);
         shopContent = new SymbolOpticalChangesShopContentGeneric(_nativeObject.shopContent);
         opticalChangeResource = new SymbolOpticalChangeCurrencyGeneric(_nativeObject.opticalChangeResource);
         btnOptions = new SymbolButtonOptionsGeneric(_nativeObject.btnOptions);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolDialogOpticalChanges) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnTabShop)
         {
            btnTabShop.setNativeInstance(_nativeObject.btnTabShop);
         }
         if(_nativeObject.btnTabOpticalChanges)
         {
            btnTabOpticalChanges.setNativeInstance(_nativeObject.btnTabOpticalChanges);
         }
         if(_nativeObject.iconCount)
         {
            iconCount.setNativeInstance(_nativeObject.iconCount);
         }
         if(_nativeObject.opticalChanges)
         {
            opticalChanges.setNativeInstance(_nativeObject.opticalChanges);
         }
         if(_nativeObject.shopContent)
         {
            shopContent.setNativeInstance(_nativeObject.shopContent);
         }
         if(_nativeObject.opticalChangeResource)
         {
            opticalChangeResource.setNativeInstance(_nativeObject.opticalChangeResource);
         }
         if(_nativeObject.btnOptions)
         {
            btnOptions.setNativeInstance(_nativeObject.btnOptions);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}
