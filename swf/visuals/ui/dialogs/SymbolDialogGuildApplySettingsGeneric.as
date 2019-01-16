package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolIconGuildApplyOpenGeneric;
   import visuals.ui.elements.icons.SymbolIconHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   
   public class SymbolDialogGuildApplySettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildApplySettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var txtOpen:ILabelArea = null;
      
      public var checkLevel:SymbolUiCheckboxGeneric = null;
      
      public var checkOpen:SymbolUiCheckboxGeneric = null;
      
      public var inputLevel:ITextInput = null;
      
      public var txtHonor:ILabelArea = null;
      
      public var checkHonor:SymbolUiCheckboxGeneric = null;
      
      public var inputHonor:ITextInput = null;
      
      public var checkOpenMail:SymbolUiCheckboxGeneric = null;
      
      public var txtOpenMail:ILabelArea = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnApply:SymbolUiButtonDefaultGeneric = null;
      
      public var symbolIconLevelStar:SymbolIconLevelStarGeneric = null;
      
      public var symbolIconHonor:SymbolIconHonorGeneric = null;
      
      public var symbolIconGuildApplyOpen:SymbolIconGuildApplyOpenGeneric = null;
      
      public function SymbolDialogGuildApplySettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildApplySettings;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildApplySettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         txtOpen = FlashLabelArea.fromNative(_nativeObject.txtOpen);
         checkLevel = new SymbolUiCheckboxGeneric(_nativeObject.checkLevel);
         checkOpen = new SymbolUiCheckboxGeneric(_nativeObject.checkOpen);
         inputLevel = FlashTextInput.fromNative(_nativeObject.inputLevel);
         txtHonor = FlashLabelArea.fromNative(_nativeObject.txtHonor);
         checkHonor = new SymbolUiCheckboxGeneric(_nativeObject.checkHonor);
         inputHonor = FlashTextInput.fromNative(_nativeObject.inputHonor);
         checkOpenMail = new SymbolUiCheckboxGeneric(_nativeObject.checkOpenMail);
         txtOpenMail = FlashLabelArea.fromNative(_nativeObject.txtOpenMail);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnApply = new SymbolUiButtonDefaultGeneric(_nativeObject.btnApply);
         symbolIconLevelStar = new SymbolIconLevelStarGeneric(_nativeObject.symbolIconLevelStar);
         symbolIconHonor = new SymbolIconHonorGeneric(_nativeObject.symbolIconHonor);
         symbolIconGuildApplyOpen = new SymbolIconGuildApplyOpenGeneric(_nativeObject.symbolIconGuildApplyOpen);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildApplySettings) : void
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
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         FlashLabelArea.setNativeInstance(txtOpen,_nativeObject.txtOpen);
         if(_nativeObject.checkLevel)
         {
            checkLevel.setNativeInstance(_nativeObject.checkLevel);
         }
         if(_nativeObject.checkOpen)
         {
            checkOpen.setNativeInstance(_nativeObject.checkOpen);
         }
         FlashTextInput.setNativeInstance(inputLevel,_nativeObject.inputLevel);
         FlashLabelArea.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.checkHonor)
         {
            checkHonor.setNativeInstance(_nativeObject.checkHonor);
         }
         FlashTextInput.setNativeInstance(inputHonor,_nativeObject.inputHonor);
         if(_nativeObject.checkOpenMail)
         {
            checkOpenMail.setNativeInstance(_nativeObject.checkOpenMail);
         }
         FlashLabelArea.setNativeInstance(txtOpenMail,_nativeObject.txtOpenMail);
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnApply)
         {
            btnApply.setNativeInstance(_nativeObject.btnApply);
         }
         if(_nativeObject.symbolIconLevelStar)
         {
            symbolIconLevelStar.setNativeInstance(_nativeObject.symbolIconLevelStar);
         }
         if(_nativeObject.symbolIconHonor)
         {
            symbolIconHonor.setNativeInstance(_nativeObject.symbolIconHonor);
         }
         if(_nativeObject.symbolIconGuildApplyOpen)
         {
            symbolIconGuildApplyOpen.setNativeInstance(_nativeObject.symbolIconGuildApplyOpen);
         }
      }
   }
}
