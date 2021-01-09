package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogPrivateConversationRenameGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogPrivateConversationRename = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var inputTitle:ITextInput = null;
      
      public var txtTitleCaption:ILabel = null;
      
      public var btnRename:SymbolUiButtonWideGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogPrivateConversationRenameGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogPrivateConversationRename;
         }
         else
         {
            _nativeObject = new SymbolDialogPrivateConversationRename();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         inputTitle = FlashTextInput.fromNative(_nativeObject.inputTitle);
         txtTitleCaption = FlashLabel.fromNative(_nativeObject.txtTitleCaption);
         btnRename = new SymbolUiButtonWideGeneric(_nativeObject.btnRename);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogPrivateConversationRename) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashTextInput.setNativeInstance(inputTitle,_nativeObject.inputTitle);
         FlashLabel.setNativeInstance(txtTitleCaption,_nativeObject.txtTitleCaption);
         if(_nativeObject.btnRename)
         {
            btnRename.setNativeInstance(_nativeObject.btnRename);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
