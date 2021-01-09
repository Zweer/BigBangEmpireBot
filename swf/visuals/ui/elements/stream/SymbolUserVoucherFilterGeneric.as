package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.goal.SymbolIconSaveFilterGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   
   public class SymbolUserVoucherFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserVoucherFilter = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var ckbShowEnergyVoucher:SymbolUiCheckboxGeneric = null;
      
      public var txtShowEnergyVoucher:ILabelArea = null;
      
      public var ckbShowBoosterVoucher:SymbolUiCheckboxGeneric = null;
      
      public var txtShowBoosterVoucher:ILabelArea = null;
      
      public var symbolIconEnergy:SymbolIconEnergyGeneric = null;
      
      public var symbolIconBooster:SymbolIconBoosterGeneric = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public function SymbolUserVoucherFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserVoucherFilter;
         }
         else
         {
            _nativeObject = new SymbolUserVoucherFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         ckbShowEnergyVoucher = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowEnergyVoucher);
         txtShowEnergyVoucher = FlashLabelArea.fromNative(_nativeObject.txtShowEnergyVoucher);
         ckbShowBoosterVoucher = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowBoosterVoucher);
         txtShowBoosterVoucher = FlashLabelArea.fromNative(_nativeObject.txtShowBoosterVoucher);
         symbolIconEnergy = new SymbolIconEnergyGeneric(_nativeObject.symbolIconEnergy);
         symbolIconBooster = new SymbolIconBoosterGeneric(_nativeObject.symbolIconBooster);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
      }
      
      public function setNativeInstance(param1:SymbolUserVoucherFilter) : void
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
         if(_nativeObject.ckbShowEnergyVoucher)
         {
            ckbShowEnergyVoucher.setNativeInstance(_nativeObject.ckbShowEnergyVoucher);
         }
         FlashLabelArea.setNativeInstance(txtShowEnergyVoucher,_nativeObject.txtShowEnergyVoucher);
         if(_nativeObject.ckbShowBoosterVoucher)
         {
            ckbShowBoosterVoucher.setNativeInstance(_nativeObject.ckbShowBoosterVoucher);
         }
         FlashLabelArea.setNativeInstance(txtShowBoosterVoucher,_nativeObject.txtShowBoosterVoucher);
         if(_nativeObject.symbolIconEnergy)
         {
            symbolIconEnergy.setNativeInstance(_nativeObject.symbolIconEnergy);
         }
         if(_nativeObject.symbolIconBooster)
         {
            symbolIconBooster.setNativeInstance(_nativeObject.symbolIconBooster);
         }
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
      }
   }
}
