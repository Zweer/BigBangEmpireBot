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
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   
   public class SymbolDialogNewUserVoucherGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogNewUserVoucher = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtVoucherCode:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var btnRedeem:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogNewUserVoucherGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogNewUserVoucher;
         }
         else
         {
            _nativeObject = new SymbolDialogNewUserVoucher();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtVoucherCode = FlashLabel.fromNative(_nativeObject.txtVoucherCode);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         btnRedeem = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRedeem);
      }
      
      public function setNativeInstance(param1:SymbolDialogNewUserVoucher) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtVoucherCode,_nativeObject.txtVoucherCode);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.btnRedeem)
         {
            btnRedeem.setNativeInstance(_nativeObject.btnRedeem);
         }
      }
   }
}
