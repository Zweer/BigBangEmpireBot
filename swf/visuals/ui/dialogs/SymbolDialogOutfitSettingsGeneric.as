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
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   
   public class SymbolDialogOutfitSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOutfitSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var checkBattle:SymbolUiCheckboxGeneric = null;
      
      public var checkGuildAttack:SymbolUiCheckboxGeneric = null;
      
      public var checkGuildDefense:SymbolUiCheckboxGeneric = null;
      
      public var checkMovieCover:SymbolUiCheckboxGeneric = null;
      
      public var checkPhoto:SymbolUiCheckboxGeneric = null;
      
      public var checkStamina:SymbolUiCheckboxGeneric = null;
      
      public var checkStrength:SymbolUiCheckboxGeneric = null;
      
      public var checkCriticalRating:SymbolUiCheckboxGeneric = null;
      
      public var checkDodgeRating:SymbolUiCheckboxGeneric = null;
      
      public var txtBattle:ILabelArea = null;
      
      public var txtGuildAttack:ILabelArea = null;
      
      public var txtGuildDefense:ILabelArea = null;
      
      public var txtMovieCover:ILabelArea = null;
      
      public var txtPhoto:ILabelArea = null;
      
      public var txtStamina:ILabelArea = null;
      
      public var txtStrength:ILabelArea = null;
      
      public var txtCriticalRating:ILabelArea = null;
      
      public var txtDodgeRating:ILabelArea = null;
      
      public var symbolIconGuildBattleAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolUiButtonWideGeneric = null;
      
      public function SymbolDialogOutfitSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOutfitSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogOutfitSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         checkBattle = new SymbolUiCheckboxGeneric(_nativeObject.checkBattle);
         checkGuildAttack = new SymbolUiCheckboxGeneric(_nativeObject.checkGuildAttack);
         checkGuildDefense = new SymbolUiCheckboxGeneric(_nativeObject.checkGuildDefense);
         checkMovieCover = new SymbolUiCheckboxGeneric(_nativeObject.checkMovieCover);
         checkPhoto = new SymbolUiCheckboxGeneric(_nativeObject.checkPhoto);
         checkStamina = new SymbolUiCheckboxGeneric(_nativeObject.checkStamina);
         checkStrength = new SymbolUiCheckboxGeneric(_nativeObject.checkStrength);
         checkCriticalRating = new SymbolUiCheckboxGeneric(_nativeObject.checkCriticalRating);
         checkDodgeRating = new SymbolUiCheckboxGeneric(_nativeObject.checkDodgeRating);
         txtBattle = FlashLabelArea.fromNative(_nativeObject.txtBattle);
         txtGuildAttack = FlashLabelArea.fromNative(_nativeObject.txtGuildAttack);
         txtGuildDefense = FlashLabelArea.fromNative(_nativeObject.txtGuildDefense);
         txtMovieCover = FlashLabelArea.fromNative(_nativeObject.txtMovieCover);
         txtPhoto = FlashLabelArea.fromNative(_nativeObject.txtPhoto);
         txtStamina = FlashLabelArea.fromNative(_nativeObject.txtStamina);
         txtStrength = FlashLabelArea.fromNative(_nativeObject.txtStrength);
         txtCriticalRating = FlashLabelArea.fromNative(_nativeObject.txtCriticalRating);
         txtDodgeRating = FlashLabelArea.fromNative(_nativeObject.txtDodgeRating);
         symbolIconGuildBattleAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.symbolIconGuildBattleAttack);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolUiButtonWideGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogOutfitSettings) : void
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
         if(_nativeObject.checkBattle)
         {
            checkBattle.setNativeInstance(_nativeObject.checkBattle);
         }
         if(_nativeObject.checkGuildAttack)
         {
            checkGuildAttack.setNativeInstance(_nativeObject.checkGuildAttack);
         }
         if(_nativeObject.checkGuildDefense)
         {
            checkGuildDefense.setNativeInstance(_nativeObject.checkGuildDefense);
         }
         if(_nativeObject.checkMovieCover)
         {
            checkMovieCover.setNativeInstance(_nativeObject.checkMovieCover);
         }
         if(_nativeObject.checkPhoto)
         {
            checkPhoto.setNativeInstance(_nativeObject.checkPhoto);
         }
         if(_nativeObject.checkStamina)
         {
            checkStamina.setNativeInstance(_nativeObject.checkStamina);
         }
         if(_nativeObject.checkStrength)
         {
            checkStrength.setNativeInstance(_nativeObject.checkStrength);
         }
         if(_nativeObject.checkCriticalRating)
         {
            checkCriticalRating.setNativeInstance(_nativeObject.checkCriticalRating);
         }
         if(_nativeObject.checkDodgeRating)
         {
            checkDodgeRating.setNativeInstance(_nativeObject.checkDodgeRating);
         }
         FlashLabelArea.setNativeInstance(txtBattle,_nativeObject.txtBattle);
         FlashLabelArea.setNativeInstance(txtGuildAttack,_nativeObject.txtGuildAttack);
         FlashLabelArea.setNativeInstance(txtGuildDefense,_nativeObject.txtGuildDefense);
         FlashLabelArea.setNativeInstance(txtMovieCover,_nativeObject.txtMovieCover);
         FlashLabelArea.setNativeInstance(txtPhoto,_nativeObject.txtPhoto);
         FlashLabelArea.setNativeInstance(txtStamina,_nativeObject.txtStamina);
         FlashLabelArea.setNativeInstance(txtStrength,_nativeObject.txtStrength);
         FlashLabelArea.setNativeInstance(txtCriticalRating,_nativeObject.txtCriticalRating);
         FlashLabelArea.setNativeInstance(txtDodgeRating,_nativeObject.txtDodgeRating);
         if(_nativeObject.symbolIconGuildBattleAttack)
         {
            symbolIconGuildBattleAttack.setNativeInstance(_nativeObject.symbolIconGuildBattleAttack);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
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
