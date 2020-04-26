package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.advertisement.provider.IAdProvider;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogOfferwallSelectionGeneric;
   import visuals.ui.elements.offerwall.SymbolButtonOfferwallOptionGeneric;
   
   public class DialogOfferwallSelection extends UiDialog
   {
      
      private static var OFFERWALL_PROVIDERS:Vector.<IAdProvider> = new Vector.<IAdProvider>(0);
       
      
      private var _btnClose:UiButton = null;
      
      public function DialogOfferwallSelection()
      {
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc4_:SymbolDialogOfferwallSelectionGeneric = new SymbolDialogOfferwallSelectionGeneric();
         super(_loc4_);
         _queued = false;
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         Environment.application.advertisment.getAdProvidersForType(AdType.OFFERWALL,OFFERWALL_PROVIDERS);
         Logger.info("[PanelBilling] Adding offerwalls ",[OFFERWALL_PROVIDERS]);
         var _loc5_:* = 0;
         var _loc6_:* = 100;
         _loc7_ = 0;
         while(_loc7_ < OFFERWALL_PROVIDERS.length)
         {
            _loc3_ = OFFERWALL_PROVIDERS[_loc7_];
            _loc1_ = new SymbolButtonOfferwallOptionGeneric();
            _loc1_.image.setUriSprite(Assets.assetURL("offerwalls/" + _loc3_.key + ".png"),424,108);
            _loc2_ = new UiButton(_loc1_,"",handleOfferwallClick);
            _loc2_.x = 0;
            _loc2_.y = _loc7_ * 129 - 30;
            _loc2_.tag = _loc3_;
            _loc6_ = Number(_loc6_ + 129);
            _vo.addChild(_loc2_);
            _loc7_++;
         }
         _loc4_.dialogBackground.height = _loc6_;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function handleOfferwallClick(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var adProvider:IAdProvider = (interactionEvent.target as UiButton).tag as IAdProvider;
         panelManager.locked = true;
         adProvider.showOfferwall(function(param1:Boolean):void
         {
            panelManager.locked = false;
         },onOfferwallReward);
      }
      
      private function onOfferwallReward(param1:int) : void
      {
         Environment.application.sendActionRequest("refreshUser",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("refreshUser" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
