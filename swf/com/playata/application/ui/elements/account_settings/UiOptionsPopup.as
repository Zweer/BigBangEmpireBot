package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.generic.SymbolOptionsPopupGeneric;
   
   public class UiOptionsPopup extends UiOptionsBase
   {
       
      
      private var _hiddenCorrectionY:int = 650;
      
      private var _shownCorrectionY:int = 310;
      
      private var _content:SymbolOptionsPopupGeneric = null;
      
      private var _btnUsername:UiButton = null;
      
      private var _tooltipServer:UiTextTooltip = null;
      
      private var _tooltipLayer:InteractiveDisplayObject = null;
      
      public function UiOptionsPopup(param1:SymbolOptionsPopupGeneric)
      {
         _content = param1;
         super(_content);
         _btnUsername = new UiButton(_content.usernameLayer,LocText.current.text("general/base_panel/change_character"),onClickCharacterSelection);
         _content.usernameLayer.alpha = 0;
         _hiddenCorrectionY = _hiddenCorrectionY + 35 * (_buttonSlots - _shownSlots);
         _shownCorrectionY = _shownCorrectionY + 35 * (_buttonSlots - _shownSlots);
         _content.y = _hiddenCorrectionY;
         _tooltipLayer = new InteractiveDisplayObject(_content);
         _tooltipLayer.onInteractionOut.add(handleInteractionOut);
         _tooltipServer = new UiTextTooltip(_content.tooltipServer,"",requestServerInfoTooltip);
      }
      
      override public function refreshLocalization() : void
      {
         super.refreshLocalization();
         _btnUsername.tooltip = LocText.current.text("general/base_panel/change_character");
      }
      
      override public function refresh() : void
      {
         super.refresh();
         _btnUsername.visible = AppEnvironment.appPlatform.isCharacterSelectionAllowed;
      }
      
      override public function show() : void
      {
         finished = function():void
         {
            _btnLogout.interactionEnabled = true;
            _btnAccountSettings.interactionEnabled = true;
            _btnGameSettings.interactionEnabled = true;
            _btnAudioSettings.interactionEnabled = true;
            _btnVoucher.interactionEnabled = true;
            _btnForum.interactionEnabled = true;
            _btnSupport.interactionEnabled = true;
            _btnInvite.interactionEnabled = true;
         };
         _content.bringToTop();
         _btnLogout.interactionEnabled = false;
         _btnAccountSettings.interactionEnabled = false;
         _btnGameSettings.interactionEnabled = false;
         _btnAudioSettings.interactionEnabled = false;
         _btnVoucher.interactionEnabled = false;
         _btnForum.interactionEnabled = false;
         _btnSupport.interactionEnabled = false;
         _btnInvite.interactionEnabled = false;
         var appHeightCorrection:Number = Environment.layout.appHeight - Environment.layout.appDefaultHeight;
         var newY:Number = _shownCorrectionY + appHeightCorrection;
         if(AppEnvironment.appPlatform.isSSO)
         {
            newY = _shownCorrectionY + 25;
         }
         _content.tweenTo(0.5,{
            "y":newY,
            "onComplete":finished
         });
      }
      
      override public function hide() : void
      {
         var _loc2_:Number = Environment.layout.appHeight - Environment.layout.appDefaultHeight;
         var _loc1_:Number = _hiddenCorrectionY + _loc2_;
         _content.tweenTo(0.5,{"y":_loc1_});
      }
      
      private function requestServerInfoTooltip() : String
      {
         return clientInfo;
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         hide();
      }
      
      override public function dispose() : void
      {
         _tooltipLayer.dispose();
         _btnUsername.dispose();
         _tooltipServer.dispose();
         _btnUsername = null;
         _tooltipServer = null;
         super.dispose();
      }
   }
}
