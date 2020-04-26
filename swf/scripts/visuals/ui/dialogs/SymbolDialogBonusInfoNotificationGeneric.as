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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.bonus.SymbolBonusInfoGeneric;
   
   public class SymbolDialogBonusInfoNotificationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBonusInfoNotification = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var bonusBackground:SymbolBackgroundScalableGeneric = null;
      
      public var txtBonusCaption:ILabel = null;
      
      public var txtBonusInfo:ILabelArea = null;
      
      public var position5:SymbolBonusInfoGeneric = null;
      
      public var position4:SymbolBonusInfoGeneric = null;
      
      public var position3:SymbolBonusInfoGeneric = null;
      
      public var position2:SymbolBonusInfoGeneric = null;
      
      public var position1:SymbolBonusInfoGeneric = null;
      
      public var position6:SymbolBonusInfoGeneric = null;
      
      public var position7:SymbolBonusInfoGeneric = null;
      
      public var btnOk:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogBonusInfoNotificationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBonusInfoNotification;
         }
         else
         {
            _nativeObject = new SymbolDialogBonusInfoNotification();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         bonusBackground = new SymbolBackgroundScalableGeneric(_nativeObject.bonusBackground);
         txtBonusCaption = FlashLabel.fromNative(_nativeObject.txtBonusCaption);
         txtBonusInfo = FlashLabelArea.fromNative(_nativeObject.txtBonusInfo);
         position5 = new SymbolBonusInfoGeneric(_nativeObject.position5);
         position4 = new SymbolBonusInfoGeneric(_nativeObject.position4);
         position3 = new SymbolBonusInfoGeneric(_nativeObject.position3);
         position2 = new SymbolBonusInfoGeneric(_nativeObject.position2);
         position1 = new SymbolBonusInfoGeneric(_nativeObject.position1);
         position6 = new SymbolBonusInfoGeneric(_nativeObject.position6);
         position7 = new SymbolBonusInfoGeneric(_nativeObject.position7);
         btnOk = new SymbolUiButtonDefaultGeneric(_nativeObject.btnOk);
      }
      
      public function setNativeInstance(param1:SymbolDialogBonusInfoNotification) : void
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
         if(_nativeObject.bonusBackground)
         {
            bonusBackground.setNativeInstance(_nativeObject.bonusBackground);
         }
         FlashLabel.setNativeInstance(txtBonusCaption,_nativeObject.txtBonusCaption);
         FlashLabelArea.setNativeInstance(txtBonusInfo,_nativeObject.txtBonusInfo);
         if(_nativeObject.position5)
         {
            position5.setNativeInstance(_nativeObject.position5);
         }
         if(_nativeObject.position4)
         {
            position4.setNativeInstance(_nativeObject.position4);
         }
         if(_nativeObject.position3)
         {
            position3.setNativeInstance(_nativeObject.position3);
         }
         if(_nativeObject.position2)
         {
            position2.setNativeInstance(_nativeObject.position2);
         }
         if(_nativeObject.position1)
         {
            position1.setNativeInstance(_nativeObject.position1);
         }
         if(_nativeObject.position6)
         {
            position6.setNativeInstance(_nativeObject.position6);
         }
         if(_nativeObject.position7)
         {
            position7.setNativeInstance(_nativeObject.position7);
         }
         if(_nativeObject.btnOk)
         {
            btnOk.setNativeInstance(_nativeObject.btnOk);
         }
      }
   }
}
