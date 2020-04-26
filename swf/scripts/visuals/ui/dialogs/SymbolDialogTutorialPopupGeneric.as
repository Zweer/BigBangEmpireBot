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
   import visuals.ui.elements.tutorial.SymbolLadyFrontGeneric;
   
   public class SymbolDialogTutorialPopupGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogTutorialPopup = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtTutorialText:ILabelArea = null;
      
      public var lady:SymbolLadyFrontGeneric = null;
      
      public function SymbolDialogTutorialPopupGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogTutorialPopup;
         }
         else
         {
            _nativeObject = new SymbolDialogTutorialPopup();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtTutorialText = FlashLabelArea.fromNative(_nativeObject.txtTutorialText);
         lady = new SymbolLadyFrontGeneric(_nativeObject.lady);
      }
      
      public function setNativeInstance(param1:SymbolDialogTutorialPopup) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtTutorialText,_nativeObject.txtTutorialText);
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
      }
   }
}
