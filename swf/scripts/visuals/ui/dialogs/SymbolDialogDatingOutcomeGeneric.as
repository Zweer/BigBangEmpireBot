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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.dating.SymbolDatingHearthGeneric;
   import visuals.ui.elements.dating.SymbolDatingImageGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogDatingOutcomeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDatingOutcome = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtFailed:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var txtFailedHint:ILabelArea = null;
      
      public var txtStatPoints:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtGirlPictureReward:ILabelArea = null;
      
      public var iconGirlPictureReward:SymbolDatingImageGeneric = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var hearth1:SymbolDatingHearthGeneric = null;
      
      public var hearth2:SymbolDatingHearthGeneric = null;
      
      public var hearth3:SymbolDatingHearthGeneric = null;
      
      public var hearth4:SymbolDatingHearthGeneric = null;
      
      public var hearth5:SymbolDatingHearthGeneric = null;
      
      public var girl:SymbolPlaceholderGeneric = null;
      
      public function SymbolDialogDatingOutcomeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDatingOutcome;
         }
         else
         {
            _nativeObject = new SymbolDialogDatingOutcome();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtFailed = FlashLabelArea.fromNative(_nativeObject.txtFailed);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         txtFailedHint = FlashLabelArea.fromNative(_nativeObject.txtFailedHint);
         txtStatPoints = FlashLabel.fromNative(_nativeObject.txtStatPoints);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtGirlPictureReward = FlashLabelArea.fromNative(_nativeObject.txtGirlPictureReward);
         iconGirlPictureReward = new SymbolDatingImageGeneric(_nativeObject.iconGirlPictureReward);
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         hearth1 = new SymbolDatingHearthGeneric(_nativeObject.hearth1);
         hearth2 = new SymbolDatingHearthGeneric(_nativeObject.hearth2);
         hearth3 = new SymbolDatingHearthGeneric(_nativeObject.hearth3);
         hearth4 = new SymbolDatingHearthGeneric(_nativeObject.hearth4);
         hearth5 = new SymbolDatingHearthGeneric(_nativeObject.hearth5);
         girl = new SymbolPlaceholderGeneric(_nativeObject.girl);
      }
      
      public function setNativeInstance(param1:SymbolDialogDatingOutcome) : void
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
         FlashLabelArea.setNativeInstance(txtFailed,_nativeObject.txtFailed);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtOutcome,_nativeObject.txtOutcome);
         FlashLabelArea.setNativeInstance(txtFailedHint,_nativeObject.txtFailedHint);
         FlashLabel.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtGirlPictureReward,_nativeObject.txtGirlPictureReward);
         if(_nativeObject.iconGirlPictureReward)
         {
            iconGirlPictureReward.setNativeInstance(_nativeObject.iconGirlPictureReward);
         }
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.hearth1)
         {
            hearth1.setNativeInstance(_nativeObject.hearth1);
         }
         if(_nativeObject.hearth2)
         {
            hearth2.setNativeInstance(_nativeObject.hearth2);
         }
         if(_nativeObject.hearth3)
         {
            hearth3.setNativeInstance(_nativeObject.hearth3);
         }
         if(_nativeObject.hearth4)
         {
            hearth4.setNativeInstance(_nativeObject.hearth4);
         }
         if(_nativeObject.hearth5)
         {
            hearth5.setNativeInstance(_nativeObject.hearth5);
         }
         if(_nativeObject.girl)
         {
            girl.setNativeInstance(_nativeObject.girl);
         }
      }
   }
}
