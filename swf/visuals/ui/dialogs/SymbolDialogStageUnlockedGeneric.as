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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolStageUnlockedIconGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogStageUnlockedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogStageUnlocked = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var unlockedIcon:SymbolStageUnlockedIconGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtStageName:ILabel = null;
      
      public var txtCongratulations:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public var txtStageIntro:ILabelArea = null;
      
      public var iconReward:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolDialogStageUnlockedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogStageUnlocked;
         }
         else
         {
            _nativeObject = new SymbolDialogStageUnlocked();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         unlockedIcon = new SymbolStageUnlockedIconGeneric(_nativeObject.unlockedIcon);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtStageName = FlashLabel.fromNative(_nativeObject.txtStageName);
         txtCongratulations = FlashLabelArea.fromNative(_nativeObject.txtCongratulations);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         txtStageIntro = FlashLabelArea.fromNative(_nativeObject.txtStageIntro);
         iconReward = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconReward);
      }
      
      public function setNativeInstance(param1:SymbolDialogStageUnlocked) : void
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
         if(_nativeObject.unlockedIcon)
         {
            unlockedIcon.setNativeInstance(_nativeObject.unlockedIcon);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtStageName,_nativeObject.txtStageName);
         FlashLabelArea.setNativeInstance(txtCongratulations,_nativeObject.txtCongratulations);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         FlashLabelArea.setNativeInstance(txtStageIntro,_nativeObject.txtStageIntro);
         if(_nativeObject.iconReward)
         {
            iconReward.setNativeInstance(_nativeObject.iconReward);
         }
      }
   }
}
