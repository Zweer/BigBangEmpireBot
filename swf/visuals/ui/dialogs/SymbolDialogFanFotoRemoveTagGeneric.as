package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDialogFanFotoRemoveTagGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogFanFotoRemoveTag = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textMessage:ILabelArea = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnRemove:SymbolButtonPremiumGeneric = null;
      
      public var btnRemoveAll:SymbolButtonPremiumGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogFanFotoRemoveTagGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogFanFotoRemoveTag;
         }
         else
         {
            _nativeObject = new SymbolDialogFanFotoRemoveTag();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         textMessage = FlashLabelArea.fromNative(_nativeObject.textMessage);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnRemove = new SymbolButtonPremiumGeneric(_nativeObject.btnRemove);
         btnRemoveAll = new SymbolButtonPremiumGeneric(_nativeObject.btnRemoveAll);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogFanFotoRemoveTag) : void
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
         FlashLabelArea.setNativeInstance(textMessage,_nativeObject.textMessage);
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnRemove)
         {
            btnRemove.setNativeInstance(_nativeObject.btnRemove);
         }
         if(_nativeObject.btnRemoveAll)
         {
            btnRemoveAll.setNativeInstance(_nativeObject.btnRemoveAll);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
