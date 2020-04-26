package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.streaming.SymbolButtonStreamingCurrencyGeneric;
   
   public class SymbolDialogUnlockStreamingActorAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUnlockStreamingActorAnimation = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnUnlockStreamingCurrency:SymbolButtonStreamingCurrencyGeneric = null;
      
      public var btnUnlockPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var textMessage:ILabelArea = null;
      
      public var textTitle:ILabelArea = null;
      
      public function SymbolDialogUnlockStreamingActorAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUnlockStreamingActorAnimation;
         }
         else
         {
            _nativeObject = new SymbolDialogUnlockStreamingActorAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         btnUnlockStreamingCurrency = new SymbolButtonStreamingCurrencyGeneric(_nativeObject.btnUnlockStreamingCurrency);
         btnUnlockPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockPremiumCurrency);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         textMessage = FlashLabelArea.fromNative(_nativeObject.textMessage);
         textTitle = FlashLabelArea.fromNative(_nativeObject.textTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogUnlockStreamingActorAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.btnUnlockStreamingCurrency)
         {
            btnUnlockStreamingCurrency.setNativeInstance(_nativeObject.btnUnlockStreamingCurrency);
         }
         if(_nativeObject.btnUnlockPremiumCurrency)
         {
            btnUnlockPremiumCurrency.setNativeInstance(_nativeObject.btnUnlockPremiumCurrency);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(textMessage,_nativeObject.textMessage);
         FlashLabelArea.setNativeInstance(textTitle,_nativeObject.textTitle);
      }
   }
}
