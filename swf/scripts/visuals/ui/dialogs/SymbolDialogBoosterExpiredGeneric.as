package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonBoosterExtendGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogBoosterExpiredGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBoosterExpired = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var booster1:SymbolButtonBoosterExtendGeneric = null;
      
      public var booster2:SymbolButtonBoosterExtendGeneric = null;
      
      public var booster3:SymbolButtonBoosterExtendGeneric = null;
      
      public var booster4:SymbolButtonBoosterExtendGeneric = null;
      
      public var booster5:SymbolButtonBoosterExtendGeneric = null;
      
      public function SymbolDialogBoosterExpiredGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBoosterExpired;
         }
         else
         {
            _nativeObject = new SymbolDialogBoosterExpired();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         booster1 = new SymbolButtonBoosterExtendGeneric(_nativeObject.booster1);
         booster2 = new SymbolButtonBoosterExtendGeneric(_nativeObject.booster2);
         booster3 = new SymbolButtonBoosterExtendGeneric(_nativeObject.booster3);
         booster4 = new SymbolButtonBoosterExtendGeneric(_nativeObject.booster4);
         booster5 = new SymbolButtonBoosterExtendGeneric(_nativeObject.booster5);
      }
      
      public function setNativeInstance(param1:SymbolDialogBoosterExpired) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.booster1)
         {
            booster1.setNativeInstance(_nativeObject.booster1);
         }
         if(_nativeObject.booster2)
         {
            booster2.setNativeInstance(_nativeObject.booster2);
         }
         if(_nativeObject.booster3)
         {
            booster3.setNativeInstance(_nativeObject.booster3);
         }
         if(_nativeObject.booster4)
         {
            booster4.setNativeInstance(_nativeObject.booster4);
         }
         if(_nativeObject.booster5)
         {
            booster5.setNativeInstance(_nativeObject.booster5);
         }
      }
   }
}
