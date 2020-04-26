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
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.story_dungeon.SymbolIconMoreMissionRewardGeneric;
   import visuals.ui.elements.story_dungeon.SymbolIconStageChangeRewardGeneric;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonUnlockBossGeneric;
   
   public class SymbolDialogStoryDungeonFoughtGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogStoryDungeonFought = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtFailed:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var boss:SymbolStoryDungeonUnlockBossGeneric = null;
      
      public var txtStatPoints:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtStageReward:ILabelArea = null;
      
      public var txtStageMissionReward:ILabelArea = null;
      
      public var iconStageReward:SymbolIconStageChangeRewardGeneric = null;
      
      public var iconStageMissionReward:SymbolIconMoreMissionRewardGeneric = null;
      
      public function SymbolDialogStoryDungeonFoughtGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogStoryDungeonFought;
         }
         else
         {
            _nativeObject = new SymbolDialogStoryDungeonFought();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtFailed = FlashLabelArea.fromNative(_nativeObject.txtFailed);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         boss = new SymbolStoryDungeonUnlockBossGeneric(_nativeObject.boss);
         txtStatPoints = FlashLabel.fromNative(_nativeObject.txtStatPoints);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtStageReward = FlashLabelArea.fromNative(_nativeObject.txtStageReward);
         txtStageMissionReward = FlashLabelArea.fromNative(_nativeObject.txtStageMissionReward);
         iconStageReward = new SymbolIconStageChangeRewardGeneric(_nativeObject.iconStageReward);
         iconStageMissionReward = new SymbolIconMoreMissionRewardGeneric(_nativeObject.iconStageMissionReward);
      }
      
      public function setNativeInstance(param1:SymbolDialogStoryDungeonFought) : void
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
         if(_nativeObject.boss)
         {
            boss.setNativeInstance(_nativeObject.boss);
         }
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
         FlashLabelArea.setNativeInstance(txtStageReward,_nativeObject.txtStageReward);
         FlashLabelArea.setNativeInstance(txtStageMissionReward,_nativeObject.txtStageMissionReward);
         if(_nativeObject.iconStageReward)
         {
            iconStageReward.setNativeInstance(_nativeObject.iconStageReward);
         }
         if(_nativeObject.iconStageMissionReward)
         {
            iconStageMissionReward.setNativeInstance(_nativeObject.iconStageMissionReward);
         }
      }
   }
}
