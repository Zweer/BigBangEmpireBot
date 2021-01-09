package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.WindowsApplication;
   import com.playata.application.data.character.CharacterSelection;
   import com.playata.application.data.character.CharacterSelectionEntry;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.account_settings.UiCharacterSelectionPhoto;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCharacterSelectionGeneric;
   
   public class DialogCharacterSelection extends UiDialog
   {
       
      
      private const NEW_SELECTION_ENABLED:Boolean = true;
      
      private const MAX_CHARS:int = 3;
      
      private var _btnClose:UiButton = null;
      
      private var _btnLeft:UiButton = null;
      
      private var _btnRight:UiButton = null;
      
      private var _btnAddCharacter:UiButton = null;
      
      private var _btnRemoveCharacter:UiButton = null;
      
      private var _btnChange:UiTextButton = null;
      
      private var _character1:UiCharacterSelectionPhoto = null;
      
      private var _character2:UiCharacterSelectionPhoto = null;
      
      private var _character3:UiCharacterSelectionPhoto = null;
      
      private var _characterSelection:CharacterSelection = null;
      
      private var _currentCharacter:CharacterSelectionEntry = null;
      
      private var _photoOffset:int = 0;
      
      private var _loadingEffect:ScaleInOutEffect = null;
      
      public function DialogCharacterSelection()
      {
         var _loc1_:SymbolDialogCharacterSelectionGeneric = new SymbolDialogCharacterSelectionGeneric();
         super(_loc1_);
         _loadingEffect = new ScaleInOutEffect(_loc1_.loading,0.5,1.2);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/character_selection/title");
         _loc1_.btnAddCharacter.txtName.text = LocText.current.text("dialog/character_selection_add/add_character");
         _loc1_.btnAddCharacter.txtName.autoFontSize = true;
         _loc1_.btnAddCharacter.txtName.visible = true;
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnLeft = new UiButton(_loc1_.btnLeft,"",onClickLeft);
         _btnRight = new UiButton(_loc1_.btnRight,"",onClickRight);
         _btnAddCharacter = new UiButton(_loc1_.btnAddCharacter,LocText.current.text("dialog/character_selection/add_character_tooltip"),onClickAddCharacter);
         _btnRemoveCharacter = new UiButton(_loc1_.btnRemove,LocText.current.text("dialog/character_selection/remove_character_tooltip"),onClickRemoveCharacter);
         _btnChange = new UiTextButton(_loc1_.btnChange,LocText.current.text("dialog/character_selection/change_character"),"",onClickChangeCharacter);
         _btnLeft.visible = false;
         _btnRight.visible = false;
         _btnAddCharacter.visible = false;
         _btnRemoveCharacter.visible = false;
         _btnChange.visible = false;
         _character1 = new UiCharacterSelectionPhoto(_loc1_.character3,onSelectedCharacterChange);
         _character2 = new UiCharacterSelectionPhoto(_loc1_.character2,onSelectedCharacterChange);
         _character3 = new UiCharacterSelectionPhoto(_loc1_.character1,onSelectedCharacterChange);
         _loadingEffect.play();
         _characterSelection = new CharacterSelection();
         _characterSelection.load(onCharacterSelectionLoaded);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnLeft.dispose();
         _btnLeft = null;
         _btnRight.dispose();
         _btnRight = null;
         _btnAddCharacter.dispose();
         _btnAddCharacter = null;
         _btnRemoveCharacter.dispose();
         _btnRemoveCharacter = null;
         _btnChange.dispose();
         _btnChange = null;
         _character1.dispose();
         _character1 = null;
         _character2.dispose();
         _character2 = null;
         _character3.dispose();
         _character3 = null;
         super.dispose();
      }
      
      public function refresh() : void
      {
         if(!_btnClose)
         {
            return;
         }
         var _loc1_:SymbolDialogCharacterSelectionGeneric = _vo as SymbolDialogCharacterSelectionGeneric;
         _loc1_.loading.visible = false;
         _loadingEffect.stop();
         if(_characterSelection.characterCount == 0)
         {
            _character1.visible = false;
            _character2.visible = false;
            _character3.visible = false;
         }
         else if(_characterSelection.characterCount == 1)
         {
            _character1.visible = true;
            _character2.visible = false;
            _character3.visible = false;
         }
         else if(_characterSelection.characterCount == 2)
         {
            _character1.visible = true;
            _character2.visible = true;
            _character3.visible = false;
         }
         else if(_characterSelection.characterCount >= 3)
         {
            _character1.visible = true;
            _character2.visible = true;
            _character3.visible = true;
         }
         if(_characterSelection.characterCount > 0)
         {
            _btnChange.visible = true;
            _btnChange.buttonEnabled = false;
         }
         _btnLeft.visible = _characterSelection.characterCount > 3;
         _btnRight.visible = _characterSelection.characterCount > 3;
         _btnAddCharacter.visible = ServerInfo.defaultServerSelectionData.availableServerSelectionCount > _characterSelection.characterCount;
         refreshPhotos();
      }
      
      private function onCharacterSelectionLoaded() : void
      {
         _currentCharacter = _characterSelection.getCharacterByServerId(ServerInfo.serverId);
         if(_currentCharacter)
         {
            _photoOffset = _characterSelection.getCharacterIndex(_currentCharacter);
         }
         refresh();
      }
      
      private function onSelectedCharacterChange(param1:CharacterSelectionEntry) : void
      {
         _currentCharacter = param1;
         refreshPhotos();
      }
      
      private function refreshPhotos() : void
      {
         _btnChange.buttonEnabled = _currentCharacter != null?_currentCharacter.serverId != ServerInfo.serverId:false;
         _btnRemoveCharacter.visible = true;
         _btnRemoveCharacter.buttonEnabled = _currentCharacter != null?_currentCharacter.serverId != ServerInfo.serverId:false;
         if(_characterSelection.characterCount != 0)
         {
            if(_characterSelection.characterCount == 1)
            {
               _character1.refresh(_characterSelection.getCharacterEntry(0,_photoOffset),_currentCharacter);
            }
            else if(_characterSelection.characterCount == 2)
            {
               _character1.refresh(_characterSelection.getCharacterEntry(0,_photoOffset),_currentCharacter);
               _character2.refresh(_characterSelection.getCharacterEntry(1,_photoOffset),_currentCharacter);
            }
            else if(_characterSelection.characterCount >= 3)
            {
               _character1.refresh(_characterSelection.getCharacterEntry(0,_photoOffset),_currentCharacter);
               _character2.refresh(_characterSelection.getCharacterEntry(1,_photoOffset),_currentCharacter);
               _character3.refresh(_characterSelection.getCharacterEntry(2,_photoOffset),_currentCharacter);
            }
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickLeft(param1:InteractionEvent) : void
      {
         _photoOffset = Number(_photoOffset) - 1;
         if(_photoOffset < 0)
         {
            _photoOffset = _characterSelection.characterCount - 1;
         }
         refreshPhotos();
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
         _photoOffset = Number(_photoOffset) + 1;
         if(_photoOffset >= _characterSelection.characterCount)
         {
            _photoOffset = 0;
         }
         refreshPhotos();
      }
      
      private function onClickAddCharacter(param1:InteractionEvent) : void
      {
         close();
         if(true && (Environment.info.isNativeMobile || Environment.platform.isSteam || Environment.application is WindowsApplication))
         {
            Environment.panelManager.showDialog(new DialogCharacterSelectionAdd(_characterSelection.usedServerIds));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogNewCharacter(_characterSelection.usedServerIds));
         }
      }
      
      private function onClickRemoveCharacter(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/character_selection/title"),LocText.current.text("dialog/character_selection/remove_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickRemoveYes));
      }
      
      private function onClickRemoveYes() : void
      {
         _characterSelection.remove(_currentCharacter);
         onCharacterSelectionLoaded();
      }
      
      private function onClickChangeCharacter(param1:InteractionEvent) : void
      {
         close();
         (Environment.application as Application).onCharacterSelectionChange(_currentCharacter.locale,_currentCharacter.serverId,_currentCharacter);
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
