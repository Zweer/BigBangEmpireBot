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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolDialogLevelUpGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogLevelUp = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var symbolSlice9BackgroundTooltip:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtLevelNumber:ILabel = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtLevelCaption:ILabel = null;
      
      public var txtUnlockedItems:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public function SymbolDialogLevelUpGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogLevelUp;
         }
         else
         {
            _nativeObject = new SymbolDialogLevelUp();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         symbolSlice9BackgroundTooltip = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.symbolSlice9BackgroundTooltip);
         txtLevelNumber = FlashLabel.fromNative(_nativeObject.txtLevelNumber);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtLevelCaption = FlashLabel.fromNative(_nativeObject.txtLevelCaption);
         txtUnlockedItems = FlashLabelArea.fromNative(_nativeObject.txtUnlockedItems);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
      }
      
      public function setNativeInstance(param1:SymbolDialogLevelUp) : void
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
         if(_nativeObject.symbolSlice9BackgroundTooltip)
         {
            symbolSlice9BackgroundTooltip.setNativeInstance(_nativeObject.symbolSlice9BackgroundTooltip);
         }
         FlashLabel.setNativeInstance(txtLevelNumber,_nativeObject.txtLevelNumber);
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtLevelCaption,_nativeObject.txtLevelCaption);
         FlashLabelArea.setNativeInstance(txtUnlockedItems,_nativeObject.txtUnlockedItems);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
      }
   }
}
