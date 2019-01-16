package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.generic.SymbolOptionsDialogGeneric;
   
   public class UiOptionsDialog extends UiOptionsBase
   {
       
      
      private var _content:SymbolOptionsDialogGeneric = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnCharacterSelection:UiOptionButton = null;
      
      private var _darkener:IQuad = null;
      
      private var _optionsContainer:Sprite = null;
      
      public function UiOptionsDialog(param1:IDisplayObjectContainer)
      {
         _content = new SymbolOptionsDialogGeneric();
         super(_content);
         _optionsContainer = new Sprite();
         _darkener = DisplayObjectFactory.createQuadFromSettings({
            "x":0,
            "y":0,
            "width":Environment.layout.appWidth,
            "height":Environment.layout.appHeight,
            "color":0,
            "alpha":0.5
         });
         _optionsContainer.addChild(_darkener);
         _optionsContainer.addChild(_content);
         param1.addChild(_optionsContainer);
         _btnClose = new UiButton(_content.btnClose,"",onClickClose);
         _btnCharacterSelection = new UiOptionButton(_content.iconAccountSwitch,LocText.current.text("dialog/character_selection/title"),onClickCharacterSelection);
         _content.iconAccountSwitch.caption.autoFontSize = true;
         _content.iconAccountSwitch.visible = !AppEnvironment.appPlatform.isNutaku;
         _btnInvite.extendClickArea(80,20,40,0);
         _btnAccountSettings.extendClickArea(80,20,40,0);
         _btnGameSettings.extendClickArea(80,20,40,0);
         _btnAudioSettings.extendClickArea(80,20,40,0);
         _btnVoucher.extendClickArea(80,20,40,0);
         _btnForum.extendClickArea(80,20,40,0);
         _btnSupport.extendClickArea(80,20,40,0);
         _btnLogout.extendClickArea(80,20,40,0);
         _btnCharacterSelection.extendClickArea(80,20,40,0);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnCharacterSelection.dispose();
         _btnCharacterSelection = null;
         super.dispose();
      }
      
      override public function refreshLocalization() : void
      {
         super.refreshLocalization();
         _btnCharacterSelection.caption = LocText.current.text("dialog/character_selection/title");
      }
      
      override public function refresh() : void
      {
         super.refresh();
         _content.txtInfo.text = clientInfo;
      }
      
      override public function show() : void
      {
         _content.x = Environment.layout.appWidth / 2;
         _content.y = Environment.layout.appHeight / 2;
         _darkener.width = Environment.layout.appWidth;
         _darkener.height = Environment.layout.appHeight;
         _optionsContainer.bringToTop();
         _optionsContainer.visible = true;
         refresh();
      }
      
      override public function hide() : void
      {
         _optionsContainer.visible = false;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         hide();
      }
   }
}
