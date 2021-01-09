package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDialogUserStoryWriteConfirmGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStoryWriteConfirm = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textInfoToS:ILabelArea = null;
      
      public var textInfo:ILabelArea = null;
      
      public var textTitle:ILabelArea = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnCreate:SymbolButtonPremiumGeneric = null;
      
      public function SymbolDialogUserStoryWriteConfirmGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStoryWriteConfirm;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStoryWriteConfirm();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         textInfoToS = FlashLabelArea.fromNative(_nativeObject.textInfoToS);
         textInfo = FlashLabelArea.fromNative(_nativeObject.textInfo);
         textTitle = FlashLabelArea.fromNative(_nativeObject.textTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         btnCreate = new SymbolButtonPremiumGeneric(_nativeObject.btnCreate);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStoryWriteConfirm) : void
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
         FlashLabelArea.setNativeInstance(textInfoToS,_nativeObject.textInfoToS);
         FlashLabelArea.setNativeInstance(textInfo,_nativeObject.textInfo);
         FlashLabelArea.setNativeInstance(textTitle,_nativeObject.textTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnCreate)
         {
            btnCreate.setNativeInstance(_nativeObject.btnCreate);
         }
      }
   }
}
