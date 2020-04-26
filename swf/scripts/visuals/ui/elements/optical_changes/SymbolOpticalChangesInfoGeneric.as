package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolBackgroundMovieRewardTooltipGeneric;
   import visuals.ui.elements.payment.SymbolAvatarPreviewGeneric;
   
   public class SymbolOpticalChangesInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangesInfo = null;
      
      public var symbolBackgroundMovieRewardTooltip:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var symbolBackgroundMovieRewardTooltip2:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var slot1:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var slot2:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var slot3:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var slot4:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var slot5:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var slot6:SymbolOpticalChangeSlotButtonGeneric = null;
      
      public var progressBackground:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var rewardBackground:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtReward:ILabelArea = null;
      
      public var btnCollect:SymbolUiButtonDefaultGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var progressBarTotal:SymbolProgressBarBigGeneric = null;
      
      public var txtProgressTotal:ILabel = null;
      
      public var txtName:ILabelArea = null;
      
      public var previewAvatar:SymbolAvatarPreviewGeneric = null;
      
      public function SymbolOpticalChangesInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangesInfo;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangesInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundMovieRewardTooltip = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.symbolBackgroundMovieRewardTooltip);
         symbolBackgroundMovieRewardTooltip2 = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.symbolBackgroundMovieRewardTooltip2);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         slot1 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot1);
         slot2 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot2);
         slot3 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot3);
         slot4 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot4);
         slot5 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot5);
         slot6 = new SymbolOpticalChangeSlotButtonGeneric(_nativeObject.slot6);
         progressBackground = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.progressBackground);
         rewardBackground = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.rewardBackground);
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         btnCollect = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCollect);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         progressBarTotal = new SymbolProgressBarBigGeneric(_nativeObject.progressBarTotal);
         txtProgressTotal = FlashLabel.fromNative(_nativeObject.txtProgressTotal);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         previewAvatar = new SymbolAvatarPreviewGeneric(_nativeObject.previewAvatar);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangesInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundMovieRewardTooltip)
         {
            symbolBackgroundMovieRewardTooltip.setNativeInstance(_nativeObject.symbolBackgroundMovieRewardTooltip);
         }
         if(_nativeObject.symbolBackgroundMovieRewardTooltip2)
         {
            symbolBackgroundMovieRewardTooltip2.setNativeInstance(_nativeObject.symbolBackgroundMovieRewardTooltip2);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.slot1)
         {
            slot1.setNativeInstance(_nativeObject.slot1);
         }
         if(_nativeObject.slot2)
         {
            slot2.setNativeInstance(_nativeObject.slot2);
         }
         if(_nativeObject.slot3)
         {
            slot3.setNativeInstance(_nativeObject.slot3);
         }
         if(_nativeObject.slot4)
         {
            slot4.setNativeInstance(_nativeObject.slot4);
         }
         if(_nativeObject.slot5)
         {
            slot5.setNativeInstance(_nativeObject.slot5);
         }
         if(_nativeObject.slot6)
         {
            slot6.setNativeInstance(_nativeObject.slot6);
         }
         if(_nativeObject.progressBackground)
         {
            progressBackground.setNativeInstance(_nativeObject.progressBackground);
         }
         if(_nativeObject.rewardBackground)
         {
            rewardBackground.setNativeInstance(_nativeObject.rewardBackground);
         }
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.progressBarTotal)
         {
            progressBarTotal.setNativeInstance(_nativeObject.progressBarTotal);
         }
         FlashLabel.setNativeInstance(txtProgressTotal,_nativeObject.txtProgressTotal);
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.previewAvatar)
         {
            previewAvatar.setNativeInstance(_nativeObject.previewAvatar);
         }
      }
   }
}
