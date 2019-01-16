package visuals.ui.elements.event
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconTitleGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolEventQuestRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEventQuestReward = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconXP:SymbolIconXpGeneric = null;
      
      public var iconBooster:SymbolBoosterGeneric = null;
      
      public var iconTitle:SymbolIconTitleGeneric = null;
      
      public var iconItem:SymbolEventQuestItemRewardGeneric = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var txtValue:ILabel = null;
      
      public function SymbolEventQuestRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEventQuestReward;
         }
         else
         {
            _nativeObject = new SymbolEventQuestReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconXP = new SymbolIconXpGeneric(_nativeObject.iconXP);
         iconBooster = new SymbolBoosterGeneric(_nativeObject.iconBooster);
         iconTitle = new SymbolIconTitleGeneric(_nativeObject.iconTitle);
         iconItem = new SymbolEventQuestItemRewardGeneric(_nativeObject.iconItem);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         txtValue = FlashLabel.fromNative(_nativeObject.txtValue);
      }
      
      public function setNativeInstance(param1:SymbolEventQuestReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconXP)
         {
            iconXP.setNativeInstance(_nativeObject.iconXP);
         }
         if(_nativeObject.iconBooster)
         {
            iconBooster.setNativeInstance(_nativeObject.iconBooster);
         }
         if(_nativeObject.iconTitle)
         {
            iconTitle.setNativeInstance(_nativeObject.iconTitle);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         FlashLabel.setNativeInstance(txtValue,_nativeObject.txtValue);
      }
   }
}
