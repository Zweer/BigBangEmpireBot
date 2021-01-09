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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookCharacterGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookTimerGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.streaming.SymbolIconStreamingResourceGeneric;
   
   public class SymbolDialogHerobookObjectiveRenewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogHerobookObjectiveRenew = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnRenew:SymbolButtonPremiumGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtObjectiveCaption:ILabelArea = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var iconCharacter:SymbolHerobookCharacterGeneric = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var txtReward:ILabelArea = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public function SymbolDialogHerobookObjectiveRenewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogHerobookObjectiveRenew;
         }
         else
         {
            _nativeObject = new SymbolDialogHerobookObjectiveRenew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnRenew = new SymbolButtonPremiumGeneric(_nativeObject.btnRenew);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtObjectiveCaption = FlashLabelArea.fromNative(_nativeObject.txtObjectiveCaption);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         iconCharacter = new SymbolHerobookCharacterGeneric(_nativeObject.iconCharacter);
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
      }
      
      public function setNativeInstance(param1:SymbolDialogHerobookObjectiveRenew) : void
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
         if(_nativeObject.btnRenew)
         {
            btnRenew.setNativeInstance(_nativeObject.btnRenew);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtObjectiveCaption,_nativeObject.txtObjectiveCaption);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.iconCharacter)
         {
            iconCharacter.setNativeInstance(_nativeObject.iconCharacter);
         }
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
      }
   }
}
