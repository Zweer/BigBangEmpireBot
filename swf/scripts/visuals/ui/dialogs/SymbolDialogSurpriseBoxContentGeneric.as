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
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogSurpriseBoxContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogSurpriseBoxContent = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var item1Reward:SymbolItemSlotGeneric = null;
      
      public var item2Reward:SymbolItemSlotGeneric = null;
      
      public var item3Reward:SymbolItemSlotGeneric = null;
      
      public function SymbolDialogSurpriseBoxContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogSurpriseBoxContent;
         }
         else
         {
            _nativeObject = new SymbolDialogSurpriseBoxContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         item1Reward = new SymbolItemSlotGeneric(_nativeObject.item1Reward);
         item2Reward = new SymbolItemSlotGeneric(_nativeObject.item2Reward);
         item3Reward = new SymbolItemSlotGeneric(_nativeObject.item3Reward);
      }
      
      public function setNativeInstance(param1:SymbolDialogSurpriseBoxContent) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.item1Reward)
         {
            item1Reward.setNativeInstance(_nativeObject.item1Reward);
         }
         if(_nativeObject.item2Reward)
         {
            item2Reward.setNativeInstance(_nativeObject.item2Reward);
         }
         if(_nativeObject.item3Reward)
         {
            item3Reward.setNativeInstance(_nativeObject.item3Reward);
         }
      }
   }
}
