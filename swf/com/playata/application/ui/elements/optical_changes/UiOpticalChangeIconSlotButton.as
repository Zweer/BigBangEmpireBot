package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.optical_changes.OpticalChange;
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogActivateOpticalChange;
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeSlotButtonGeneric;
   
   public class UiOpticalChangeIconSlotButton
   {
       
      
      private var _content:SymbolOpticalChangeSlotButtonGeneric;
      
      private var _dialog:DialogOpticalChanges;
      
      private var _previewAvatar:UiAvatarPreview;
      
      private var _tooltip:UiTextTooltip;
      
      private var _displayObject:InteractiveDisplayObject;
      
      private var _opticalChange:OpticalChange;
      
      private var _icon:UiOpticalChangeIconSlot;
      
      public function UiOpticalChangeIconSlotButton(param1:SymbolOpticalChangeSlotButtonGeneric, param2:DialogOpticalChanges, param3:UiAvatarPreview)
      {
         super();
         _content = param1;
         _dialog = param2;
         _previewAvatar = param3;
         _tooltip = new UiTextTooltip(_content,"");
         _displayObject = new InteractiveDisplayObject(_content);
         _displayObject.onClick.add(onClick);
         if(_previewAvatar)
         {
            _displayObject.onInteractionOver.add(onOver);
            _displayObject.onInteractionOut.add(onOut);
         }
         _icon = new UiOpticalChangeIconSlot(_content.slot);
      }
      
      private function onClick(param1:InteractionEvent) : void
      {
         if(_opticalChange.type != 101)
         {
            Environment.panelManager.showDialog(new DialogActivateOpticalChange(_opticalChange,_dialog));
         }
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(_opticalChange.type == 101)
         {
            _loc2_ = getCharacterSettings(User.current.character);
            _previewAvatar.show(_loc2_);
         }
      }
      
      private function onOut(param1:InteractionEvent) : void
      {
         if(_opticalChange.type == 101)
         {
            _previewAvatar.hide();
         }
      }
      
      private function getCharacterSettings(param1:Character) : AppearanceSettings
      {
         var _loc3_:AppearanceSettings = param1.getCurrentSettings();
         if(_opticalChange.type != 101)
         {
            return _loc3_;
         }
         var _loc2_:CItemTemplate = CItemTemplate.fromId(_opticalChange.identifier);
         if(_loc2_.type == 1)
         {
            _loc3_.show_head_item = true;
            _loc3_.head = _opticalChange.identifier;
         }
         else if(_loc2_.type == 2)
         {
            _loc3_.show_chest_item = true;
            _loc3_.chest = _opticalChange.identifier;
         }
         else if(_loc2_.type == 3)
         {
            _loc3_.show_belt_item = true;
            _loc3_.belt = _opticalChange.identifier;
         }
         else if(_loc2_.type == 4)
         {
            _loc3_.show_legs_item = true;
            _loc3_.legs = _opticalChange.identifier;
         }
         else if(_loc2_.type == 5)
         {
            _loc3_.show_boots_item = true;
            _loc3_.boots = _opticalChange.identifier;
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         _content = null;
         _dialog = null;
         _tooltip.dispose();
         _tooltip = null;
         _displayObject.dispose();
         _displayObject = null;
         _icon.dispose();
         _icon = null;
      }
      
      public function refresh(param1:OpticalChangeCategorie, param2:OpticalChange) : void
      {
         _opticalChange = param2;
         _icon.refresh(param2);
         _tooltip.text = !!Environment.info.isTouchScreen?"":param2.tooltip;
         _content.checkmark.visible = param2.isUsed;
         _content.iconLock.visible = !param2.isUnlocked;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
   }
}
