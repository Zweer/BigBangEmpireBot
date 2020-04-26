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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGuildBoosterPurchaseGeneric;
   
   public class SymbolDialogGuildBoostersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBoosters = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var btnBoostQuest1:SymbolButtonGuildBoosterPurchaseGeneric = null;
      
      public var txtBoostQuest:ILabelArea = null;
      
      public var txtBoostDuel:ILabelArea = null;
      
      public var btnBoostDuel1:SymbolButtonGuildBoosterPurchaseGeneric = null;
      
      public function SymbolDialogGuildBoostersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBoosters;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBoosters();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         btnBoostQuest1 = new SymbolButtonGuildBoosterPurchaseGeneric(_nativeObject.btnBoostQuest1);
         txtBoostQuest = FlashLabelArea.fromNative(_nativeObject.txtBoostQuest);
         txtBoostDuel = FlashLabelArea.fromNative(_nativeObject.txtBoostDuel);
         btnBoostDuel1 = new SymbolButtonGuildBoosterPurchaseGeneric(_nativeObject.btnBoostDuel1);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBoosters) : void
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
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.btnBoostQuest1)
         {
            btnBoostQuest1.setNativeInstance(_nativeObject.btnBoostQuest1);
         }
         FlashLabelArea.setNativeInstance(txtBoostQuest,_nativeObject.txtBoostQuest);
         FlashLabelArea.setNativeInstance(txtBoostDuel,_nativeObject.txtBoostDuel);
         if(_nativeObject.btnBoostDuel1)
         {
            btnBoostDuel1.setNativeInstance(_nativeObject.btnBoostDuel1);
         }
      }
   }
}
