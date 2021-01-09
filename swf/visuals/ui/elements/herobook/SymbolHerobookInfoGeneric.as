package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.streaming.SymbolIconStreamingResourceGeneric;
   
   public class SymbolHerobookInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookInfo = null;
      
      public var btnBack:SymbolButtonArrowLeftGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconCharacter:SymbolHerobookCharacterGeneric = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtProgressCaption:ILabelArea = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var txtRewardsCaption:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public var btnInstantFinish:SymbolButtonPremiumGeneric = null;
      
      public var txtShortDescription:ILabelArea = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public var btnRenewObjective:SymbolButtonRenewHerobookObjectiveGeneric = null;
      
      public function SymbolHerobookInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookInfo;
         }
         else
         {
            _nativeObject = new SymbolHerobookInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnBack = new SymbolButtonArrowLeftGeneric(_nativeObject.btnBack);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconCharacter = new SymbolHerobookCharacterGeneric(_nativeObject.iconCharacter);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtProgressCaption = FlashLabelArea.fromNative(_nativeObject.txtProgressCaption);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         txtRewardsCaption = FlashLabelArea.fromNative(_nativeObject.txtRewardsCaption);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         btnInstantFinish = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinish);
         txtShortDescription = FlashLabelArea.fromNative(_nativeObject.txtShortDescription);
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
         btnRenewObjective = new SymbolButtonRenewHerobookObjectiveGeneric(_nativeObject.btnRenewObjective);
      }
      
      public function setNativeInstance(param1:SymbolHerobookInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnBack)
         {
            btnBack.setNativeInstance(_nativeObject.btnBack);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconCharacter)
         {
            iconCharacter.setNativeInstance(_nativeObject.iconCharacter);
         }
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabelArea.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabelArea.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         FlashLabelArea.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
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
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
         if(_nativeObject.btnRenewObjective)
         {
            btnRenewObjective.setNativeInstance(_nativeObject.btnRenewObjective);
         }
      }
   }
}
