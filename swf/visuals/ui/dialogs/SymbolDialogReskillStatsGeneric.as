package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDecreaseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonIncreaseGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingBigGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingBigGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaBigGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthBigGeneric;
   
   public class SymbolDialogReskillStatsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogReskillStats = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtAvailablePoints:ILabelArea = null;
      
      public var txtStamina:ILabel = null;
      
      public var inputStamina:ITextInput = null;
      
      public var btnStaminaDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnStaminaIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var txtCriticalRating:ILabel = null;
      
      public var txtDodgeRating:ILabel = null;
      
      public var inputCriticalRating:ITextInput = null;
      
      public var btnCriticalRatingDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnCriticalRatingIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var btnDodgeRatingDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnDodgeRatingIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var inputDodgeRating:ITextInput = null;
      
      public var txtStrength:ILabel = null;
      
      public var btnStrengthDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnStrengthIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var inputStrength:ITextInput = null;
      
      public var iconStrength:SymbolIconStrengthBigGeneric = null;
      
      public var iconStamina:SymbolIconStaminaBigGeneric = null;
      
      public var iconCriticalRating:SymbolIconCriticalHitRatingBigGeneric = null;
      
      public var iconDodgeRating:SymbolIconDodgeRatingBigGeneric = null;
      
      public var warningStrength:SymbolIconExclamationMarkGeneric = null;
      
      public var warningStamina:SymbolIconExclamationMarkGeneric = null;
      
      public var warningCriticalRating:SymbolIconExclamationMarkGeneric = null;
      
      public var warningDodgeRating:SymbolIconExclamationMarkGeneric = null;
      
      public var btnApply:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogReskillStatsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogReskillStats;
         }
         else
         {
            _nativeObject = new SymbolDialogReskillStats();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtAvailablePoints = FlashLabelArea.fromNative(_nativeObject.txtAvailablePoints);
         txtStamina = FlashLabel.fromNative(_nativeObject.txtStamina);
         inputStamina = FlashTextInput.fromNative(_nativeObject.inputStamina);
         btnStaminaDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnStaminaDecrease);
         btnStaminaIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnStaminaIncrease);
         txtCriticalRating = FlashLabel.fromNative(_nativeObject.txtCriticalRating);
         txtDodgeRating = FlashLabel.fromNative(_nativeObject.txtDodgeRating);
         inputCriticalRating = FlashTextInput.fromNative(_nativeObject.inputCriticalRating);
         btnCriticalRatingDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnCriticalRatingDecrease);
         btnCriticalRatingIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnCriticalRatingIncrease);
         btnDodgeRatingDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnDodgeRatingDecrease);
         btnDodgeRatingIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnDodgeRatingIncrease);
         inputDodgeRating = FlashTextInput.fromNative(_nativeObject.inputDodgeRating);
         txtStrength = FlashLabel.fromNative(_nativeObject.txtStrength);
         btnStrengthDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnStrengthDecrease);
         btnStrengthIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnStrengthIncrease);
         inputStrength = FlashTextInput.fromNative(_nativeObject.inputStrength);
         iconStrength = new SymbolIconStrengthBigGeneric(_nativeObject.iconStrength);
         iconStamina = new SymbolIconStaminaBigGeneric(_nativeObject.iconStamina);
         iconCriticalRating = new SymbolIconCriticalHitRatingBigGeneric(_nativeObject.iconCriticalRating);
         iconDodgeRating = new SymbolIconDodgeRatingBigGeneric(_nativeObject.iconDodgeRating);
         warningStrength = new SymbolIconExclamationMarkGeneric(_nativeObject.warningStrength);
         warningStamina = new SymbolIconExclamationMarkGeneric(_nativeObject.warningStamina);
         warningCriticalRating = new SymbolIconExclamationMarkGeneric(_nativeObject.warningCriticalRating);
         warningDodgeRating = new SymbolIconExclamationMarkGeneric(_nativeObject.warningDodgeRating);
         btnApply = new SymbolUiButtonDefaultGeneric(_nativeObject.btnApply);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogReskillStats) : void
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
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtAvailablePoints,_nativeObject.txtAvailablePoints);
         FlashLabel.setNativeInstance(txtStamina,_nativeObject.txtStamina);
         FlashTextInput.setNativeInstance(inputStamina,_nativeObject.inputStamina);
         if(_nativeObject.btnStaminaDecrease)
         {
            btnStaminaDecrease.setNativeInstance(_nativeObject.btnStaminaDecrease);
         }
         if(_nativeObject.btnStaminaIncrease)
         {
            btnStaminaIncrease.setNativeInstance(_nativeObject.btnStaminaIncrease);
         }
         FlashLabel.setNativeInstance(txtCriticalRating,_nativeObject.txtCriticalRating);
         FlashLabel.setNativeInstance(txtDodgeRating,_nativeObject.txtDodgeRating);
         FlashTextInput.setNativeInstance(inputCriticalRating,_nativeObject.inputCriticalRating);
         if(_nativeObject.btnCriticalRatingDecrease)
         {
            btnCriticalRatingDecrease.setNativeInstance(_nativeObject.btnCriticalRatingDecrease);
         }
         if(_nativeObject.btnCriticalRatingIncrease)
         {
            btnCriticalRatingIncrease.setNativeInstance(_nativeObject.btnCriticalRatingIncrease);
         }
         if(_nativeObject.btnDodgeRatingDecrease)
         {
            btnDodgeRatingDecrease.setNativeInstance(_nativeObject.btnDodgeRatingDecrease);
         }
         if(_nativeObject.btnDodgeRatingIncrease)
         {
            btnDodgeRatingIncrease.setNativeInstance(_nativeObject.btnDodgeRatingIncrease);
         }
         FlashTextInput.setNativeInstance(inputDodgeRating,_nativeObject.inputDodgeRating);
         FlashLabel.setNativeInstance(txtStrength,_nativeObject.txtStrength);
         if(_nativeObject.btnStrengthDecrease)
         {
            btnStrengthDecrease.setNativeInstance(_nativeObject.btnStrengthDecrease);
         }
         if(_nativeObject.btnStrengthIncrease)
         {
            btnStrengthIncrease.setNativeInstance(_nativeObject.btnStrengthIncrease);
         }
         FlashTextInput.setNativeInstance(inputStrength,_nativeObject.inputStrength);
         if(_nativeObject.iconStrength)
         {
            iconStrength.setNativeInstance(_nativeObject.iconStrength);
         }
         if(_nativeObject.iconStamina)
         {
            iconStamina.setNativeInstance(_nativeObject.iconStamina);
         }
         if(_nativeObject.iconCriticalRating)
         {
            iconCriticalRating.setNativeInstance(_nativeObject.iconCriticalRating);
         }
         if(_nativeObject.iconDodgeRating)
         {
            iconDodgeRating.setNativeInstance(_nativeObject.iconDodgeRating);
         }
         if(_nativeObject.warningStrength)
         {
            warningStrength.setNativeInstance(_nativeObject.warningStrength);
         }
         if(_nativeObject.warningStamina)
         {
            warningStamina.setNativeInstance(_nativeObject.warningStamina);
         }
         if(_nativeObject.warningCriticalRating)
         {
            warningCriticalRating.setNativeInstance(_nativeObject.warningCriticalRating);
         }
         if(_nativeObject.warningDodgeRating)
         {
            warningDodgeRating.setNativeInstance(_nativeObject.warningDodgeRating);
         }
         if(_nativeObject.btnApply)
         {
            btnApply.setNativeInstance(_nativeObject.btnApply);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
