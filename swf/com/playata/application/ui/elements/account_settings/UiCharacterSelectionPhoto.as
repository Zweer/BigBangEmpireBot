package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.character.CharacterSelectionEntry;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.tween.Tween;
   import visuals.ui.elements.character_selection.SymbolCharacterSelectionPhotoGeneric;
   
   public class UiCharacterSelectionPhoto extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolCharacterSelectionPhotoGeneric = null;
      
      private var _character:CharacterSelectionEntry = null;
      
      private var _onClickCallback:Function = null;
      
      private var _blockerEffect:ScaleInOutEffect = null;
      
      private var _mouseLayer:InteractiveDisplayObject;
      
      public function UiCharacterSelectionPhoto(param1:SymbolCharacterSelectionPhotoGeneric, param2:Function)
      {
         _onClickCallback = param2;
         _content = param1;
         super(_content);
         _mouseLayer = new InteractiveDisplayObject(_content.mouseLayer);
         _mouseLayer.onClick.add(handleClick);
         _blockerEffect = new ScaleInOutEffect(_content.loading,0.5,1.2);
         refresh(null,null);
         this.onClick.add(handleClick);
      }
      
      override public function dispose() : void
      {
         _blockerEffect.dispose();
         _blockerEffect = null;
         super.dispose();
      }
      
      public function get content() : SymbolCharacterSelectionPhotoGeneric
      {
         return _content;
      }
      
      public function get character() : CharacterSelectionEntry
      {
         return _character;
      }
      
      public function refresh(param1:CharacterSelectionEntry, param2:CharacterSelectionEntry) : void
      {
         _character = param1;
         _content.visible = _character != null;
         if(!_character)
         {
            return;
         }
         _content.txtLevel.text = _character.level.toString();
         _content.txtLevel.autoFontSize = true;
         _content.txtName.text = _character.name;
         _content.txtName.autoFontSize = true;
         _content.txtServer.text = param1.serverId;
         _content.active.visible = param1 == param2;
         _content.iconEmail.visible = param1.isEmailAccount;
         _content.iconFacebook.visible = param1.isFacebookAccount;
         _content.iconMobile.visible = param1.isMobileAccount;
         _content.localeIcon.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(param1.locale));
         refreshImage(_character.characterImage);
      }
      
      public function refreshImage(param1:IImage) : void
      {
         if(!_character)
         {
            return;
         }
         if(!_blockerEffect)
         {
            return;
         }
         var _loc2_:Boolean = _content.loading.visible;
         _content.loading.visible = param1 == null;
         if(_content.loading.visible)
         {
            _blockerEffect.play();
         }
         else
         {
            _blockerEffect.stop();
         }
         _content.avatarImage.removeAllChildren();
         if(param1)
         {
            if(_loc2_)
            {
               param1.alpha = 1;
               Tween.from(param1,0.5,{"alpha":0});
            }
            _content.avatarImage.addChild(param1);
         }
         else
         {
            _character.loadPreviewImage(refreshImage);
         }
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
   }
}
