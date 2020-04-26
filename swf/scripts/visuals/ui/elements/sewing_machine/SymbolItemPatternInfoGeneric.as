package visuals.ui.elements.sewing_machine
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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconTitleGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolItemPatternInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemPatternInfo = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var slot1:SymbolItemSlotGeneric = null;
      
      public var slot2:SymbolItemSlotGeneric = null;
      
      public var slot3:SymbolItemSlotGeneric = null;
      
      public var slot4:SymbolItemSlotGeneric = null;
      
      public var slot5:SymbolItemSlotGeneric = null;
      
      public var slot6:SymbolItemSlotGeneric = null;
      
      public var slot7:SymbolItemSlotGeneric = null;
      
      public var slot8:SymbolItemSlotGeneric = null;
      
      public var slot9:SymbolItemSlotGeneric = null;
      
      public var slot10:SymbolItemSlotGeneric = null;
      
      public var slot11:SymbolItemSlotGeneric = null;
      
      public var slot12:SymbolItemSlotGeneric = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public var rewardTitle:SymbolIconTitleGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconStatPoints:SymbolButtonPlusStaticGeneric = null;
      
      public var txtReward:ILabelArea = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var btnCollect:SymbolUiButtonDefaultGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var progressBarTotal:SymbolProgressBarBigGeneric = null;
      
      public var txtProgressTotal:ILabelArea = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtNoItems:ILabelArea = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnSourceInfo:SymbolButtonHelpGeneric = null;
      
      public function SymbolItemPatternInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemPatternInfo;
         }
         else
         {
            _nativeObject = new SymbolItemPatternInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         slot1 = new SymbolItemSlotGeneric(_nativeObject.slot1);
         slot2 = new SymbolItemSlotGeneric(_nativeObject.slot2);
         slot3 = new SymbolItemSlotGeneric(_nativeObject.slot3);
         slot4 = new SymbolItemSlotGeneric(_nativeObject.slot4);
         slot5 = new SymbolItemSlotGeneric(_nativeObject.slot5);
         slot6 = new SymbolItemSlotGeneric(_nativeObject.slot6);
         slot7 = new SymbolItemSlotGeneric(_nativeObject.slot7);
         slot8 = new SymbolItemSlotGeneric(_nativeObject.slot8);
         slot9 = new SymbolItemSlotGeneric(_nativeObject.slot9);
         slot10 = new SymbolItemSlotGeneric(_nativeObject.slot10);
         slot11 = new SymbolItemSlotGeneric(_nativeObject.slot11);
         slot12 = new SymbolItemSlotGeneric(_nativeObject.slot12);
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         rewardTitle = new SymbolIconTitleGeneric(_nativeObject.rewardTitle);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconStatPoints = new SymbolButtonPlusStaticGeneric(_nativeObject.iconStatPoints);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         btnCollect = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCollect);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         progressBarTotal = new SymbolProgressBarBigGeneric(_nativeObject.progressBarTotal);
         txtProgressTotal = FlashLabelArea.fromNative(_nativeObject.txtProgressTotal);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtNoItems = FlashLabelArea.fromNative(_nativeObject.txtNoItems);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnSourceInfo = new SymbolButtonHelpGeneric(_nativeObject.btnSourceInfo);
      }
      
      public function setNativeInstance(param1:SymbolItemPatternInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
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
         if(_nativeObject.slot7)
         {
            slot7.setNativeInstance(_nativeObject.slot7);
         }
         if(_nativeObject.slot8)
         {
            slot8.setNativeInstance(_nativeObject.slot8);
         }
         if(_nativeObject.slot9)
         {
            slot9.setNativeInstance(_nativeObject.slot9);
         }
         if(_nativeObject.slot10)
         {
            slot10.setNativeInstance(_nativeObject.slot10);
         }
         if(_nativeObject.slot11)
         {
            slot11.setNativeInstance(_nativeObject.slot11);
         }
         if(_nativeObject.slot12)
         {
            slot12.setNativeInstance(_nativeObject.slot12);
         }
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.rewardTitle)
         {
            rewardTitle.setNativeInstance(_nativeObject.rewardTitle);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
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
         FlashLabelArea.setNativeInstance(txtProgressTotal,_nativeObject.txtProgressTotal);
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtNoItems,_nativeObject.txtNoItems);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnSourceInfo)
         {
            btnSourceInfo.setNativeInstance(_nativeObject.btnSourceInfo);
         }
      }
   }
}
