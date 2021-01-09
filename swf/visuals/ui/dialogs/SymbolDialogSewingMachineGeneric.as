package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.payment.SymbolAvatarPreviewGeneric;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternContentGeneric;
   import visuals.ui.elements.sewing_machine.SymbolSewingMachineContentGeneric;
   
   public class SymbolDialogSewingMachineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogSewingMachine = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnTabSewingMachine:SymbolButtonTabGeneric = null;
      
      public var btnTabItemPattern:SymbolButtonTabGeneric = null;
      
      public var iconCount:SymbolCounterGeneric = null;
      
      public var itemPattern:SymbolItemPatternContentGeneric = null;
      
      public var sewingMachine:SymbolSewingMachineContentGeneric = null;
      
      public var avatar:SymbolAvatarPreviewGeneric = null;
      
      public function SymbolDialogSewingMachineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogSewingMachine;
         }
         else
         {
            _nativeObject = new SymbolDialogSewingMachine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnTabSewingMachine = new SymbolButtonTabGeneric(_nativeObject.btnTabSewingMachine);
         btnTabItemPattern = new SymbolButtonTabGeneric(_nativeObject.btnTabItemPattern);
         iconCount = new SymbolCounterGeneric(_nativeObject.iconCount);
         itemPattern = new SymbolItemPatternContentGeneric(_nativeObject.itemPattern);
         sewingMachine = new SymbolSewingMachineContentGeneric(_nativeObject.sewingMachine);
         avatar = new SymbolAvatarPreviewGeneric(_nativeObject.avatar);
      }
      
      public function setNativeInstance(param1:SymbolDialogSewingMachine) : void
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
         if(_nativeObject.btnTabSewingMachine)
         {
            btnTabSewingMachine.setNativeInstance(_nativeObject.btnTabSewingMachine);
         }
         if(_nativeObject.btnTabItemPattern)
         {
            btnTabItemPattern.setNativeInstance(_nativeObject.btnTabItemPattern);
         }
         if(_nativeObject.iconCount)
         {
            iconCount.setNativeInstance(_nativeObject.iconCount);
         }
         if(_nativeObject.itemPattern)
         {
            itemPattern.setNativeInstance(_nativeObject.itemPattern);
         }
         if(_nativeObject.sewingMachine)
         {
            sewingMachine.setNativeInstance(_nativeObject.sewingMachine);
         }
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
      }
   }
}
