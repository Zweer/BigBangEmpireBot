package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.streaming.SymbolIconStreamingResourceGeneric;
   
   public class SymbolHerobookCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookComplete = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconCharacter:SymbolHerobookCharacterGeneric = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var txtRewardsCaption:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var btnCollect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var txtShortDescription:ILabelArea = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public function SymbolHerobookCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookComplete;
         }
         else
         {
            _nativeObject = new SymbolHerobookComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconCharacter = new SymbolHerobookCharacterGeneric(_nativeObject.iconCharacter);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         txtRewardsCaption = FlashLabelArea.fromNative(_nativeObject.txtRewardsCaption);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         btnCollect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnCollect);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         txtShortDescription = FlashLabelArea.fromNative(_nativeObject.txtShortDescription);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
      }
      
      public function setNativeInstance(param1:SymbolHerobookComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
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
         FlashLabelArea.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
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
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabelArea.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
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
