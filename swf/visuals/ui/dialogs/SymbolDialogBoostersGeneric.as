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
   import visuals.ui.elements.booster.SymbolButtonHeroSenseBoosterGeneric;
   import visuals.ui.elements.buttons.SymbolButtonBoosterPurchaseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   
   public class SymbolDialogBoostersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBoosters = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable3:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable4:SymbolBackgroundScalableGeneric = null;
      
      public var btnBoostQuest1:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var txtBoostQuest:ILabelArea = null;
      
      public var txtBoostStats:ILabelArea = null;
      
      public var txtBoostWork:ILabelArea = null;
      
      public var btnBoostStats1:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostWork1:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostQuest2:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostStats2:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostWork2:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostQuest3:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostStats3:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var btnBoostWork3:SymbolButtonBoosterPurchaseGeneric = null;
      
      public var boosterHeroSense:SymbolButtonHeroSenseBoosterGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolDialogBoostersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBoosters;
         }
         else
         {
            _nativeObject = new SymbolDialogBoosters();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         symbolBackgroundScalable3 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable3);
         symbolBackgroundScalable4 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable4);
         btnBoostQuest1 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostQuest1);
         txtBoostQuest = FlashLabelArea.fromNative(_nativeObject.txtBoostQuest);
         txtBoostStats = FlashLabelArea.fromNative(_nativeObject.txtBoostStats);
         txtBoostWork = FlashLabelArea.fromNative(_nativeObject.txtBoostWork);
         btnBoostStats1 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostStats1);
         btnBoostWork1 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork1);
         btnBoostQuest2 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostQuest2);
         btnBoostStats2 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostStats2);
         btnBoostWork2 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork2);
         btnBoostQuest3 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostQuest3);
         btnBoostStats3 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostStats3);
         btnBoostWork3 = new SymbolButtonBoosterPurchaseGeneric(_nativeObject.btnBoostWork3);
         boosterHeroSense = new SymbolButtonHeroSenseBoosterGeneric(_nativeObject.boosterHeroSense);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolDialogBoosters) : void
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
         if(_nativeObject.symbolBackgroundScalable3)
         {
            symbolBackgroundScalable3.setNativeInstance(_nativeObject.symbolBackgroundScalable3);
         }
         if(_nativeObject.symbolBackgroundScalable4)
         {
            symbolBackgroundScalable4.setNativeInstance(_nativeObject.symbolBackgroundScalable4);
         }
         if(_nativeObject.btnBoostQuest1)
         {
            btnBoostQuest1.setNativeInstance(_nativeObject.btnBoostQuest1);
         }
         FlashLabelArea.setNativeInstance(txtBoostQuest,_nativeObject.txtBoostQuest);
         FlashLabelArea.setNativeInstance(txtBoostStats,_nativeObject.txtBoostStats);
         FlashLabelArea.setNativeInstance(txtBoostWork,_nativeObject.txtBoostWork);
         if(_nativeObject.btnBoostStats1)
         {
            btnBoostStats1.setNativeInstance(_nativeObject.btnBoostStats1);
         }
         if(_nativeObject.btnBoostWork1)
         {
            btnBoostWork1.setNativeInstance(_nativeObject.btnBoostWork1);
         }
         if(_nativeObject.btnBoostQuest2)
         {
            btnBoostQuest2.setNativeInstance(_nativeObject.btnBoostQuest2);
         }
         if(_nativeObject.btnBoostStats2)
         {
            btnBoostStats2.setNativeInstance(_nativeObject.btnBoostStats2);
         }
         if(_nativeObject.btnBoostWork2)
         {
            btnBoostWork2.setNativeInstance(_nativeObject.btnBoostWork2);
         }
         if(_nativeObject.btnBoostQuest3)
         {
            btnBoostQuest3.setNativeInstance(_nativeObject.btnBoostQuest3);
         }
         if(_nativeObject.btnBoostStats3)
         {
            btnBoostStats3.setNativeInstance(_nativeObject.btnBoostStats3);
         }
         if(_nativeObject.btnBoostWork3)
         {
            btnBoostWork3.setNativeInstance(_nativeObject.btnBoostWork3);
         }
         if(_nativeObject.boosterHeroSense)
         {
            boosterHeroSense.setNativeInstance(_nativeObject.boosterHeroSense);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}
