package com.playata.application.ui.dialogs
{
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogUseResourceUpgradableGeneric;
   
   public class DialogUseResourceUpgradable extends DialogUseResourceBase
   {
       
      
      private var _btnBuyPremiumCurrency:UiButton = null;
      
      public function DialogUseResourceUpgradable(param1:int, param2:Boolean, param3:String)
      {
         var _loc5_:SymbolDialogUseResourceUpgradableGeneric = new SymbolDialogUseResourceUpgradableGeneric();
         super(_loc5_,param1,param2,param3);
         var _loc4_:ResourceFeature = new ResourceFeature(_featureType);
         _loc5_.txtUpgradeInfo.text = _loc4_.useDialogUpgradeInfoText;
         _btnBuyPremiumCurrency = new UiButton(_loc5_.btnUpgrade,"",onClickBuyPremiumCurrency);
      }
      
      private function onClickBuyPremiumCurrency(param1:InteractionEvent) : void
      {
         ViewManager.instance.showBuyCurrencyDialog();
         close();
      }
   }
}
