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
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogSlotmachineRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogSlotmachineReward = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtReward:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var boosterReward:SymbolBoosterGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public function SymbolDialogSlotmachineRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogSlotmachineReward;
         }
         else
         {
            _nativeObject = new SymbolDialogSlotmachineReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         boosterReward = new SymbolBoosterGeneric(_nativeObject.boosterReward);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogSlotmachineReward) : void
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
         FlashLabelArea.setNativeInstance(txtOutcome,_nativeObject.txtOutcome);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.boosterReward)
         {
            boosterReward.setNativeInstance(_nativeObject.boosterReward);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
      }
   }
}
