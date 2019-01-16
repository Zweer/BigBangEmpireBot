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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.payment.SymbolAvatarPreviewGeneric;
   
   public class SymbolDialogSelectItemForOutfitGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogSelectItemForOutfit = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtItemCaption:ILabel = null;
      
      public var currentItemSlot:SymbolItemSlotGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtItemsCaption:ILabel = null;
      
      public var itemSlot1:SymbolItemSlotGeneric = null;
      
      public var itemSlot2:SymbolItemSlotGeneric = null;
      
      public var itemSlot3:SymbolItemSlotGeneric = null;
      
      public var itemSlot4:SymbolItemSlotGeneric = null;
      
      public var itemSlot5:SymbolItemSlotGeneric = null;
      
      public var itemSlot6:SymbolItemSlotGeneric = null;
      
      public var itemSlot7:SymbolItemSlotGeneric = null;
      
      public var itemSlot8:SymbolItemSlotGeneric = null;
      
      public var itemSlot9:SymbolItemSlotGeneric = null;
      
      public var itemSlot10:SymbolItemSlotGeneric = null;
      
      public var btnScrollUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnScrollDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnChange:SymbolUiButtonWideGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var avatarPreview:SymbolAvatarPreviewGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public function SymbolDialogSelectItemForOutfitGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogSelectItemForOutfit;
         }
         else
         {
            _nativeObject = new SymbolDialogSelectItemForOutfit();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtItemCaption = FlashLabel.fromNative(_nativeObject.txtItemCaption);
         currentItemSlot = new SymbolItemSlotGeneric(_nativeObject.currentItemSlot);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtItemsCaption = FlashLabel.fromNative(_nativeObject.txtItemsCaption);
         itemSlot1 = new SymbolItemSlotGeneric(_nativeObject.itemSlot1);
         itemSlot2 = new SymbolItemSlotGeneric(_nativeObject.itemSlot2);
         itemSlot3 = new SymbolItemSlotGeneric(_nativeObject.itemSlot3);
         itemSlot4 = new SymbolItemSlotGeneric(_nativeObject.itemSlot4);
         itemSlot5 = new SymbolItemSlotGeneric(_nativeObject.itemSlot5);
         itemSlot6 = new SymbolItemSlotGeneric(_nativeObject.itemSlot6);
         itemSlot7 = new SymbolItemSlotGeneric(_nativeObject.itemSlot7);
         itemSlot8 = new SymbolItemSlotGeneric(_nativeObject.itemSlot8);
         itemSlot9 = new SymbolItemSlotGeneric(_nativeObject.itemSlot9);
         itemSlot10 = new SymbolItemSlotGeneric(_nativeObject.itemSlot10);
         btnScrollUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnScrollUp);
         btnScrollDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnScrollDown);
         btnChange = new SymbolUiButtonWideGeneric(_nativeObject.btnChange);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         avatarPreview = new SymbolAvatarPreviewGeneric(_nativeObject.avatarPreview);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogSelectItemForOutfit) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtItemCaption,_nativeObject.txtItemCaption);
         if(_nativeObject.currentItemSlot)
         {
            currentItemSlot.setNativeInstance(_nativeObject.currentItemSlot);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabel.setNativeInstance(txtItemsCaption,_nativeObject.txtItemsCaption);
         if(_nativeObject.itemSlot1)
         {
            itemSlot1.setNativeInstance(_nativeObject.itemSlot1);
         }
         if(_nativeObject.itemSlot2)
         {
            itemSlot2.setNativeInstance(_nativeObject.itemSlot2);
         }
         if(_nativeObject.itemSlot3)
         {
            itemSlot3.setNativeInstance(_nativeObject.itemSlot3);
         }
         if(_nativeObject.itemSlot4)
         {
            itemSlot4.setNativeInstance(_nativeObject.itemSlot4);
         }
         if(_nativeObject.itemSlot5)
         {
            itemSlot5.setNativeInstance(_nativeObject.itemSlot5);
         }
         if(_nativeObject.itemSlot6)
         {
            itemSlot6.setNativeInstance(_nativeObject.itemSlot6);
         }
         if(_nativeObject.itemSlot7)
         {
            itemSlot7.setNativeInstance(_nativeObject.itemSlot7);
         }
         if(_nativeObject.itemSlot8)
         {
            itemSlot8.setNativeInstance(_nativeObject.itemSlot8);
         }
         if(_nativeObject.itemSlot9)
         {
            itemSlot9.setNativeInstance(_nativeObject.itemSlot9);
         }
         if(_nativeObject.itemSlot10)
         {
            itemSlot10.setNativeInstance(_nativeObject.itemSlot10);
         }
         if(_nativeObject.btnScrollUp)
         {
            btnScrollUp.setNativeInstance(_nativeObject.btnScrollUp);
         }
         if(_nativeObject.btnScrollDown)
         {
            btnScrollDown.setNativeInstance(_nativeObject.btnScrollDown);
         }
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.avatarPreview)
         {
            avatarPreview.setNativeInstance(_nativeObject.avatarPreview);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
      }
   }
}
