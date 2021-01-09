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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonBoosterPurchaseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogBoostersWorkGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBoostersWork = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable3:SymbolBackgroundScalableGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnBoostWork1:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostWork2:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostWork3:SymbolButtonBoosterPurchaseGeneric = null;
      
      public function SymbolDialogBoostersWorkGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBoostersWork;
         }
         else
         {
            _nativeObject = new SymbolDialogBoostersWork();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         symbolBackgroundScalable3 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable3);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnBoostWork1 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork1);
         btnBoostWork2 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork2);
         btnBoostWork3 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork3);
      }
      
      public function setNativeInstance(param1:SymbolDialogBoostersWork) : void
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
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.symbolBackgroundScalable3)
         {
            symbolBackgroundScalable3.setNativeInstance(_nativeObject.symbolBackgroundScalable3);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnBoostWork1)
         {
            btnBoostWork1.setNativeInstance(_nativeObject.btnBoostWork1);
         }
         if(_nativeObject.btnBoostWork2)
         {
            btnBoostWork2.setNativeInstance(_nativeObject.btnBoostWork2);
         }
         if(_nativeObject.btnBoostWork3)
         {
            btnBoostWork3.setNativeInstance(_nativeObject.btnBoostWork3);
         }
      }
   }
}
