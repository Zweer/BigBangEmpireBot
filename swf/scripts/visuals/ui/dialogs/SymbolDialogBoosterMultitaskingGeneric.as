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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconMultitaskingGirlsGeneric;
   
   public class SymbolDialogBoosterMultitaskingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBoosterMultitasking = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnUnlock:SymbolButtonPremiumGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var girls:SymbolIconMultitaskingGirlsGeneric = null;
      
      public function SymbolDialogBoosterMultitaskingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBoosterMultitasking;
         }
         else
         {
            _nativeObject = new SymbolDialogBoosterMultitasking();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnUnlock = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlock);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         girls = new SymbolIconMultitaskingGirlsGeneric(_nativeObject.girls);
      }
      
      public function setNativeInstance(param1:SymbolDialogBoosterMultitasking) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnUnlock)
         {
            btnUnlock.setNativeInstance(_nativeObject.btnUnlock);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.girls)
         {
            girls.setNativeInstance(_nativeObject.girls);
         }
      }
   }
}
