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
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogOpticalChangeSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOpticalChangeSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var checkQuests:SymbolUiCheckboxGeneric = null;
      
      public var checkDuel:SymbolUiCheckboxGeneric = null;
      
      public var checkBank:SymbolUiCheckboxGeneric = null;
      
      public var txtQuests:ILabelArea = null;
      
      public var txtDuel:ILabelArea = null;
      
      public var txtBank:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolUiButtonWideGeneric = null;
      
      public function SymbolDialogOpticalChangeSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOpticalChangeSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogOpticalChangeSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         checkQuests = new SymbolUiCheckboxGeneric(_nativeObject.checkQuests);
         checkDuel = new SymbolUiCheckboxGeneric(_nativeObject.checkDuel);
         checkBank = new SymbolUiCheckboxGeneric(_nativeObject.checkBank);
         txtQuests = FlashLabelArea.fromNative(_nativeObject.txtQuests);
         txtDuel = FlashLabelArea.fromNative(_nativeObject.txtDuel);
         txtBank = FlashLabelArea.fromNative(_nativeObject.txtBank);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolUiButtonWideGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogOpticalChangeSettings) : void
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
         if(_nativeObject.checkQuests)
         {
            checkQuests.setNativeInstance(_nativeObject.checkQuests);
         }
         if(_nativeObject.checkDuel)
         {
            checkDuel.setNativeInstance(_nativeObject.checkDuel);
         }
         if(_nativeObject.checkBank)
         {
            checkBank.setNativeInstance(_nativeObject.checkBank);
         }
         FlashLabelArea.setNativeInstance(txtQuests,_nativeObject.txtQuests);
         FlashLabelArea.setNativeInstance(txtDuel,_nativeObject.txtDuel);
         FlashLabelArea.setNativeInstance(txtBank,_nativeObject.txtBank);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
      }
   }
}
