package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameCurrencyGeneric;
   
   public class SymbolDialogGuildCreateGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildCreate = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var checkAcceptMembers:SymbolUiCheckboxGeneric = null;
      
      public var txtAcceptMembers:ILabelArea = null;
      
      public var inputDescription:ITextInputArea = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var inputName:ITextInput = null;
      
      public var txtDescriptionCaption:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnCreate:SymbolButtonGameCurrencyGeneric = null;
      
      public function SymbolDialogGuildCreateGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildCreate;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildCreate();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         checkAcceptMembers = new SymbolUiCheckboxGeneric(_nativeObject.checkAcceptMembers);
         txtAcceptMembers = FlashLabelArea.fromNative(_nativeObject.txtAcceptMembers);
         inputDescription = FlashTextInputArea.fromNative(_nativeObject.inputDescription);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         inputName = FlashTextInput.fromNative(_nativeObject.inputName);
         txtDescriptionCaption = FlashLabel.fromNative(_nativeObject.txtDescriptionCaption);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnCreate = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnCreate);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildCreate) : void
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
         if(_nativeObject.checkAcceptMembers)
         {
            checkAcceptMembers.setNativeInstance(_nativeObject.checkAcceptMembers);
         }
         FlashLabelArea.setNativeInstance(txtAcceptMembers,_nativeObject.txtAcceptMembers);
         FlashTextInputArea.setNativeInstance(inputDescription,_nativeObject.inputDescription);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashTextInput.setNativeInstance(inputName,_nativeObject.inputName);
         FlashLabel.setNativeInstance(txtDescriptionCaption,_nativeObject.txtDescriptionCaption);
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
