package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogSeperatorGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogUserStoryUnlockGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStoryUnlock = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textMessage:ILabelArea = null;
      
      public var txtToSLink:ILabel = null;
      
      public var checkAcceptTerms:SymbolUiCheckboxGeneric = null;
      
      public var txtAcceptTerms:ILabelArea = null;
      
      public var textTitle:ILabelArea = null;
      
      public var btnUnlock:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var backgroundSeperator:SymbolSlice9BackgroundDialogSeperatorGeneric = null;
      
      public var textDeactivate:ILabelArea = null;
      
      public var btnDeactivate:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogUserStoryUnlockGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStoryUnlock;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStoryUnlock();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         textMessage = FlashLabelArea.fromNative(_nativeObject.textMessage);
         txtToSLink = FlashLabel.fromNative(_nativeObject.txtToSLink);
         checkAcceptTerms = new SymbolUiCheckboxGeneric(_nativeObject.checkAcceptTerms);
         txtAcceptTerms = FlashLabelArea.fromNative(_nativeObject.txtAcceptTerms);
         textTitle = FlashLabelArea.fromNative(_nativeObject.textTitle);
         btnUnlock = new SymbolUiButtonDefaultGeneric(_nativeObject.btnUnlock);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         backgroundSeperator = new SymbolSlice9BackgroundDialogSeperatorGeneric(_nativeObject.backgroundSeperator);
         textDeactivate = FlashLabelArea.fromNative(_nativeObject.textDeactivate);
         btnDeactivate = new SymbolUiButtonDefaultGeneric(_nativeObject.btnDeactivate);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStoryUnlock) : void
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
         FlashLabelArea.setNativeInstance(textMessage,_nativeObject.textMessage);
         FlashLabel.setNativeInstance(txtToSLink,_nativeObject.txtToSLink);
         if(_nativeObject.checkAcceptTerms)
         {
            checkAcceptTerms.setNativeInstance(_nativeObject.checkAcceptTerms);
         }
         FlashLabelArea.setNativeInstance(txtAcceptTerms,_nativeObject.txtAcceptTerms);
         FlashLabelArea.setNativeInstance(textTitle,_nativeObject.textTitle);
         if(_nativeObject.btnUnlock)
         {
            btnUnlock.setNativeInstance(_nativeObject.btnUnlock);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.backgroundSeperator)
         {
            backgroundSeperator.setNativeInstance(_nativeObject.backgroundSeperator);
         }
         FlashLabelArea.setNativeInstance(textDeactivate,_nativeObject.textDeactivate);
         if(_nativeObject.btnDeactivate)
         {
            btnDeactivate.setNativeInstance(_nativeObject.btnDeactivate);
         }
      }
   }
}
