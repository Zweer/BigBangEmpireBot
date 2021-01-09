package com.playata.application.ui.dialogs
{
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangesContent;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangesCurrencyProgressBar;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangesShopContent;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOpticalChangesGeneric;
   
   public class DialogOpticalChanges extends UiDialog
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnOptions:UiButton = null;
      
      private var _btnTabShop:UiTabButton;
      
      private var _btnTabOpticalChanges:UiTabButton;
      
      private var _shopContent:UiOpticalChangesShopContent = null;
      
      private var _opticalChangesContent:UiOpticalChangesContent = null;
      
      private var _opticalChangeCurrencyPanel:UiOpticalChangesCurrencyProgressBar = null;
      
      public function DialogOpticalChanges(param1:Boolean = true)
      {
         var _loc2_:SymbolDialogOpticalChangesGeneric = new SymbolDialogOpticalChangesGeneric();
         super(_loc2_);
         _queued = false;
         _shopContent = new UiOpticalChangesShopContent(_loc2_.shopContent,this);
         _opticalChangesContent = new UiOpticalChangesContent(_loc2_.opticalChanges,this);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnHelp = new UiButton(_loc2_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnOptions = new UiButton(_loc2_.btnOptions,LocText.current.text("dialog/optical_changes/button_settings_tooltip"),onClickOptions);
         _btnTabShop = new UiTabButton(_loc2_.btnTabShop,LocText.current.text("dialog/optical_changes/tab_button_shop"),LocText.current.text("dialog/optical_changes/tab_button_shop_tooltip"),onClickTabSewingMachine);
         _btnTabOpticalChanges = new UiTabButton(_loc2_.btnTabOpticalChanges,LocText.current.text("dialog/optical_changes/tab_button_optical_changes"),LocText.current.text("dialog/optical_changes/tab_button_optical_changes_tooltip"),onClickTabSewingMachine);
         _opticalChangeCurrencyPanel = new UiOpticalChangesCurrencyProgressBar(_loc2_.opticalChangeResource);
         _opticalChangeCurrencyPanel.refresh(User.current.character);
         _btnTabShop.setTextSize(15,2);
         _btnTabOpticalChanges.setTextSize(15,2);
         _loc2_.iconCount.caption.text = "!";
         _loc2_.iconCount.bringToTop();
         refresh();
         if(param1)
         {
            clickTabOpticalChanges(_btnTabShop);
         }
         else
         {
            clickTabOpticalChanges(_btnTabOpticalChanges);
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnTabShop.dispose();
         _btnTabShop = null;
         _btnTabOpticalChanges.dispose();
         _btnTabOpticalChanges = null;
         _shopContent.dispose();
         _shopContent = null;
         _opticalChangesContent.dispose();
         _opticalChangesContent = null;
         _btnOptions.dispose();
         _btnOptions = null;
         _opticalChangeCurrencyPanel.dispose();
         _opticalChangeCurrencyPanel = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         if(OpticalChanges.instance.hasUnopenedChests)
         {
            panelManager.showDialog(new DialogOpenOpticalChangeChests(OpticalChanges.instance.allAvailableChests,this));
         }
         if(!User.current.character.hasTutorialFlag("optical_change"))
         {
            showTutorialDialog();
         }
      }
      
      private function onClickTabSewingMachine(param1:InteractionEvent) : void
      {
         clickTabOpticalChanges(param1.target);
      }
      
      private function clickTabOpticalChanges(param1:IInteractionTarget) : void
      {
         _btnTabShop.tabbed = param1 === _btnTabShop;
         _btnTabOpticalChanges.tabbed = param1 === _btnTabOpticalChanges;
         if(_btnTabShop.tabbed)
         {
            _shopContent.show();
            _opticalChangesContent.hide();
         }
         else
         {
            _opticalChangesContent.show();
            _shopContent.hide();
         }
      }
      
      private function onClickOptions(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogOpticalChangeSettings());
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_shopContent)
         {
            return;
         }
         close();
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/optical_change/title"),LocText.current.text("dialog/tutorial/optical_change/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("optical_change");
      }
      
      override public function onEscape() : void
      {
         if(!_shopContent)
         {
            return;
         }
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         super.close(param1);
      }
      
      public function refresh() : void
      {
         if(!_shopContent)
         {
            return;
         }
         var _loc1_:SymbolDialogOpticalChangesGeneric = _vo as SymbolDialogOpticalChangesGeneric;
         _loc1_.iconCount.visible = OpticalChanges.instance.hasCollectableOpticalChangeValues;
         _opticalChangesContent.refreshList();
         _shopContent.refresh();
      }
      
      public function refreshOpticalChangeResource() : void
      {
         if(!_opticalChangeCurrencyPanel)
         {
            return;
         }
         _opticalChangeCurrencyPanel.refresh(User.current.character);
      }
   }
}
