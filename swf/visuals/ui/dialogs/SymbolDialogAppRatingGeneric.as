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
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogAppRatingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogAppRating = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnNo:SymbolUiButtonDefaultGeneric = null;
      
      public var btnRate:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogAppRatingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogAppRating;
         }
         else
         {
            _nativeObject = new SymbolDialogAppRating();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnNo = new SymbolUiButtonDefaultGeneric(_nativeObject.btnNo);
         btnRate = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRate);
      }
      
      public function setNativeInstance(param1:SymbolDialogAppRating) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnNo)
         {
            btnNo.setNativeInstance(_nativeObject.btnNo);
         }
         if(_nativeObject.btnRate)
         {
            btnRate.setNativeInstance(_nativeObject.btnRate);
         }
      }
   }
}
