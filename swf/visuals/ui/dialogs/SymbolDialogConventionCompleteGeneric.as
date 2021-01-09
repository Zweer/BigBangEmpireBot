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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.conventions.SymbolConventionRewardGeneric;
   import visuals.ui.elements.icons.SymbolIconCharacterSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconVisitorsGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.quest.SymbolNPCPictureGeneric;
   
   public class SymbolDialogConventionCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogConventionComplete = null;
      
      public var conventionBannerRight:SymbolPlaceholderGeneric = null;
      
      public var conventionBannerLeft:SymbolPlaceholderGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtNpcName:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var reward1:SymbolConventionRewardGeneric = null;
      
      public var reward2:SymbolConventionRewardGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtNoRewardText:ILabelArea = null;
      
      public var txtStatisticCaption:ILabel = null;
      
      public var txtTopCaption:ILabel = null;
      
      public var symbolIconVisitors:SymbolIconVisitorsGeneric = null;
      
      public var iconWinningShow:SymbolIconCharacterSmallGeneric = null;
      
      public var txtFansTotal:ILabel = null;
      
      public var txtShowCountTotal:ILabel = null;
      
      public var txtShowCountOwn:ILabel = null;
      
      public var txtTopShows:ILabel = null;
      
      public var txtWinningShow:ILabel = null;
      
      public var conventionLogo:SymbolNPCPictureGeneric = null;
      
      public var txtFailed:ILabelArea = null;
      
      public var txtSuccessful:ILabelArea = null;
      
      public function SymbolDialogConventionCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogConventionComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogConventionComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         conventionBannerRight = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerRight);
         conventionBannerLeft = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerLeft);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtNpcName = FlashLabel.fromNative(_nativeObject.txtNpcName);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         reward1 = new SymbolConventionRewardGeneric(_nativeObject.reward1);
         reward2 = new SymbolConventionRewardGeneric(_nativeObject.reward2);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtNoRewardText = FlashLabelArea.fromNative(_nativeObject.txtNoRewardText);
         txtStatisticCaption = FlashLabel.fromNative(_nativeObject.txtStatisticCaption);
         txtTopCaption = FlashLabel.fromNative(_nativeObject.txtTopCaption);
         symbolIconVisitors = new SymbolIconVisitorsGeneric(_nativeObject.symbolIconVisitors);
         iconWinningShow = new SymbolIconCharacterSmallGeneric(_nativeObject.iconWinningShow);
         txtFansTotal = FlashLabel.fromNative(_nativeObject.txtFansTotal);
         txtShowCountTotal = FlashLabel.fromNative(_nativeObject.txtShowCountTotal);
         txtShowCountOwn = FlashLabel.fromNative(_nativeObject.txtShowCountOwn);
         txtTopShows = FlashLabel.fromNative(_nativeObject.txtTopShows);
         txtWinningShow = FlashLabel.fromNative(_nativeObject.txtWinningShow);
         conventionLogo = new SymbolNPCPictureGeneric(_nativeObject.conventionLogo);
         txtFailed = FlashLabelArea.fromNative(_nativeObject.txtFailed);
         txtSuccessful = FlashLabelArea.fromNative(_nativeObject.txtSuccessful);
      }
      
      public function setNativeInstance(param1:SymbolDialogConventionComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.conventionBannerRight)
         {
            conventionBannerRight.setNativeInstance(_nativeObject.conventionBannerRight);
         }
         if(_nativeObject.conventionBannerLeft)
         {
            conventionBannerLeft.setNativeInstance(_nativeObject.conventionBannerLeft);
         }
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtNpcName,_nativeObject.txtNpcName);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.reward1)
         {
            reward1.setNativeInstance(_nativeObject.reward1);
         }
         if(_nativeObject.reward2)
         {
            reward2.setNativeInstance(_nativeObject.reward2);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabelArea.setNativeInstance(txtNoRewardText,_nativeObject.txtNoRewardText);
         FlashLabel.setNativeInstance(txtStatisticCaption,_nativeObject.txtStatisticCaption);
         FlashLabel.setNativeInstance(txtTopCaption,_nativeObject.txtTopCaption);
         if(_nativeObject.symbolIconVisitors)
         {
            symbolIconVisitors.setNativeInstance(_nativeObject.symbolIconVisitors);
         }
         if(_nativeObject.iconWinningShow)
         {
            iconWinningShow.setNativeInstance(_nativeObject.iconWinningShow);
         }
         FlashLabel.setNativeInstance(txtFansTotal,_nativeObject.txtFansTotal);
         FlashLabel.setNativeInstance(txtShowCountTotal,_nativeObject.txtShowCountTotal);
         FlashLabel.setNativeInstance(txtShowCountOwn,_nativeObject.txtShowCountOwn);
         FlashLabel.setNativeInstance(txtTopShows,_nativeObject.txtTopShows);
         FlashLabel.setNativeInstance(txtWinningShow,_nativeObject.txtWinningShow);
         if(_nativeObject.conventionLogo)
         {
            conventionLogo.setNativeInstance(_nativeObject.conventionLogo);
         }
         FlashLabelArea.setNativeInstance(txtFailed,_nativeObject.txtFailed);
         FlashLabelArea.setNativeInstance(txtSuccessful,_nativeObject.txtSuccessful);
      }
   }
}
