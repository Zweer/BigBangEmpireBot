package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.duel.SymbolMissedDuelContentGeneric;
   
   public class SymbolDialogMissedDuelsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMissedDuels = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var missedDuelContent:SymbolMissedDuelContentGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogMissedDuelsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMissedDuels;
         }
         else
         {
            _nativeObject = new SymbolDialogMissedDuels();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         missedDuelContent = new SymbolMissedDuelContentGeneric(_nativeObject.missedDuelContent);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogMissedDuels) : void
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
         if(_nativeObject.missedDuelContent)
         {
            missedDuelContent.setNativeInstance(_nativeObject.missedDuelContent);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
