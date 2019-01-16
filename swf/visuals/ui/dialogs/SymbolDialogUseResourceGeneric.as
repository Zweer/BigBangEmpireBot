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
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonResourceGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceGeneric;
   
   public class SymbolDialogUseResourceGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUseResource = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnUseResource:SymbolButtonResourceGeneric = null;
      
      public var txtResourceUsageCaption:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtResourcesLeft:ILabel = null;
      
      public var btnSendRequest:SymbolUiButtonWideGeneric = null;
      
      public var iconResource:SymbolIconResourceGeneric = null;
      
      public function SymbolDialogUseResourceGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUseResource;
         }
         else
         {
            _nativeObject = new SymbolDialogUseResource();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnUseResource = new SymbolButtonResourceGeneric(_nativeObject.btnUseResource);
         txtResourceUsageCaption = FlashLabel.fromNative(_nativeObject.txtResourceUsageCaption);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtResourcesLeft = FlashLabel.fromNative(_nativeObject.txtResourcesLeft);
         btnSendRequest = new SymbolUiButtonWideGeneric(_nativeObject.btnSendRequest);
         iconResource = new SymbolIconResourceGeneric(_nativeObject.iconResource);
      }
      
      public function setNativeInstance(param1:SymbolDialogUseResource) : void
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
         if(_nativeObject.btnUseResource)
         {
            btnUseResource.setNativeInstance(_nativeObject.btnUseResource);
         }
         FlashLabel.setNativeInstance(txtResourceUsageCaption,_nativeObject.txtResourceUsageCaption);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtResourcesLeft,_nativeObject.txtResourcesLeft);
         if(_nativeObject.btnSendRequest)
         {
            btnSendRequest.setNativeInstance(_nativeObject.btnSendRequest);
         }
         if(_nativeObject.iconResource)
         {
            iconResource.setNativeInstance(_nativeObject.iconResource);
         }
      }
   }
}
