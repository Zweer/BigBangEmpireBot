package com.playata.application.ui.dialogs
{
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutfitSettingsGeneric;
   
   public class DialogOutfitSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiTextButton = null;
      
      private var _ckbBattle:UiCheckBox = null;
      
      private var _ckbStamina:UiCheckBox = null;
      
      private var _ckbStrength:UiCheckBox = null;
      
      private var _ckbCriticalRating:UiCheckBox = null;
      
      private var _ckbDodgeRating:UiCheckBox = null;
      
      private var _ckbGuildAttack:UiCheckBox = null;
      
      private var _ckbGuildDefense:UiCheckBox = null;
      
      private var _ckbMovieCover:UiCheckBox = null;
      
      private var _ckbPhoto:UiCheckBox = null;
      
      private var _tooltipBattle:UiTextTooltip = null;
      
      private var _tooltipStamina:UiTextTooltip = null;
      
      private var _tooltipStrength:UiTextTooltip = null;
      
      private var _tooltipCriticalRating:UiTextTooltip = null;
      
      private var _tooltipDodgeRating:UiTextTooltip = null;
      
      private var _tooltipGuildAttack:UiTextTooltip = null;
      
      private var _tooltipGuildDefense:UiTextTooltip = null;
      
      private var _tooltipMovieCover:UiTextTooltip = null;
      
      private var _tooltipPhoto:UiTextTooltip = null;
      
      private var _outfit:Outfit;
      
      private var _onChangeSettingsFunction:Function;
      
      public function DialogOutfitSettings(param1:Outfit, param2:Function)
      {
         var _loc3_:SymbolDialogOutfitSettingsGeneric = new SymbolDialogOutfitSettingsGeneric();
         super(_loc3_);
         _queued = false;
         _outfit = param1;
         _onChangeSettingsFunction = param2;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/outfit_settings/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/outfit_settings/info");
         _loc3_.txtBattle.text = LocText.current.text("dialog/outfit_settings/option_battle");
         _loc3_.txtStamina.text = LocText.current.text("dialog/outfit_settings/option_stamina");
         _loc3_.txtStrength.text = LocText.current.text("dialog/outfit_settings/option_strength");
         _loc3_.txtCriticalRating.text = LocText.current.text("dialog/outfit_settings/option_critical_rating");
         _loc3_.txtDodgeRating.text = LocText.current.text("dialog/outfit_settings/option_dodge_rating");
         _loc3_.txtGuildAttack.text = LocText.current.text("dialog/outfit_settings/option_guild_attack");
         _loc3_.txtGuildDefense.text = LocText.current.text("dialog/outfit_settings/option_guild_defense");
         _loc3_.txtMovieCover.text = LocText.current.text("dialog/outfit_settings/option_movie_cover");
         _loc3_.txtPhoto.text = LocText.current.text("dialog/outfit_settings/option_photo");
         _tooltipBattle = new UiTextTooltip(_loc3_.txtBattle,LocText.current.text("dialog/outfit_settings/option_battle_tooltip"));
         _tooltipStamina = new UiTextTooltip(_loc3_.txtStamina,LocText.current.text("dialog/outfit_settings/option_stamina_tooltip"));
         _tooltipStrength = new UiTextTooltip(_loc3_.txtStrength,LocText.current.text("dialog/outfit_settings/option_strength_tooltip"));
         _tooltipCriticalRating = new UiTextTooltip(_loc3_.txtCriticalRating,LocText.current.text("dialog/outfit_settings/option_critical_rating_tooltip"));
         _tooltipDodgeRating = new UiTextTooltip(_loc3_.txtDodgeRating,LocText.current.text("dialog/outfit_settings/option_dodge_rating_tooltip"));
         _tooltipGuildAttack = new UiTextTooltip(_loc3_.txtGuildAttack,LocText.current.text("dialog/outfit_settings/option_guild_attack_tooltip"));
         _tooltipGuildDefense = new UiTextTooltip(_loc3_.txtGuildDefense,LocText.current.text("dialog/outfit_settings/option_guild_defense_tooltip"));
         _tooltipMovieCover = new UiTextTooltip(_loc3_.txtMovieCover,LocText.current.text("dialog/outfit_settings/option_movie_cover_tooltip"));
         _tooltipPhoto = new UiTextTooltip(_loc3_.txtPhoto,LocText.current.text("dialog/outfit_settings/option_photo_tooltip"));
         _ckbBattle = new UiCheckBox(_loc3_.checkBattle,_outfit.hasSetting(1),_tooltipBattle.text,null,null,_loc3_.txtBattle);
         _ckbStamina = new UiCheckBox(_loc3_.checkStamina,_outfit.hasSetting(2),_tooltipStamina.text,null,null,_loc3_.txtStamina);
         _ckbStrength = new UiCheckBox(_loc3_.checkStrength,_outfit.hasSetting(3),_tooltipStrength.text,null,null,_loc3_.txtStrength);
         _ckbCriticalRating = new UiCheckBox(_loc3_.checkCriticalRating,_outfit.hasSetting(4),_tooltipCriticalRating.text,null,null,_loc3_.txtCriticalRating);
         _ckbDodgeRating = new UiCheckBox(_loc3_.checkDodgeRating,_outfit.hasSetting(5),_tooltipDodgeRating.text,null,null,_loc3_.txtDodgeRating);
         _ckbGuildAttack = new UiCheckBox(_loc3_.checkGuildAttack,_outfit.hasSetting(6),_tooltipGuildAttack.text,null,null,_loc3_.txtGuildAttack);
         _ckbGuildDefense = new UiCheckBox(_loc3_.checkGuildDefense,_outfit.hasSetting(7),_tooltipGuildDefense.text,null,null,_loc3_.txtGuildDefense);
         _ckbMovieCover = new UiCheckBox(_loc3_.checkMovieCover,_outfit.hasSetting(8),_tooltipMovieCover.text,null,null,_loc3_.txtMovieCover);
         _ckbPhoto = new UiCheckBox(_loc3_.checkPhoto,_outfit.hasSetting(9),_tooltipPhoto.text,null,null,_loc3_.txtPhoto);
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnSave = new UiTextButton(_loc3_.btnSave,LocText.current.text("dialog/outfit_settings/button_save"),"",onClickSave);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _tooltipBattle.dispose();
         _tooltipBattle = null;
         _tooltipStamina.dispose();
         _tooltipStamina = null;
         _tooltipStrength.dispose();
         _tooltipStrength = null;
         _tooltipCriticalRating.dispose();
         _tooltipCriticalRating = null;
         _tooltipDodgeRating.dispose();
         _tooltipDodgeRating = null;
         _tooltipGuildAttack.dispose();
         _tooltipGuildAttack = null;
         _tooltipGuildDefense.dispose();
         _tooltipGuildDefense = null;
         _tooltipMovieCover.dispose();
         _tooltipMovieCover = null;
         _tooltipPhoto.dispose();
         _tooltipPhoto = null;
         _ckbBattle.dispose();
         _ckbBattle = null;
         _ckbStamina.dispose();
         _ckbStamina = null;
         _ckbStrength.dispose();
         _ckbStrength = null;
         _ckbCriticalRating.dispose();
         _ckbCriticalRating = null;
         _ckbDodgeRating.dispose();
         _ckbDodgeRating = null;
         _ckbGuildAttack.dispose();
         _ckbGuildAttack = null;
         _ckbGuildDefense.dispose();
         _ckbGuildDefense = null;
         _ckbMovieCover.dispose();
         _ckbMovieCover = null;
         _ckbPhoto.dispose();
         _ckbPhoto = null;
         super.dispose();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         if(_ckbBattle.checked == _outfit.hasSetting(1) && _ckbStamina.checked == _outfit.hasSetting(2) && _ckbStrength.checked == _outfit.hasSetting(3) && _ckbCriticalRating.checked == _outfit.hasSetting(4) && _ckbDodgeRating.checked == _outfit.hasSetting(5) && _ckbGuildAttack.checked == _outfit.hasSetting(6) && _ckbGuildDefense.checked == _outfit.hasSetting(7) && _ckbMovieCover.checked == _outfit.hasSetting(8) && _ckbPhoto.checked == _outfit.hasSetting(9))
         {
            close();
            return;
         }
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         if(_ckbBattle.checked)
         {
            _loc2_.push(1);
         }
         if(_ckbStamina.checked)
         {
            _loc2_.push(2);
         }
         if(_ckbStrength.checked)
         {
            _loc2_.push(3);
         }
         if(_ckbCriticalRating.checked)
         {
            _loc2_.push(4);
         }
         if(_ckbDodgeRating.checked)
         {
            _loc2_.push(5);
         }
         if(_ckbGuildAttack.checked)
         {
            _loc2_.push(6);
         }
         if(_ckbGuildDefense.checked)
         {
            _loc2_.push(7);
         }
         if(_ckbMovieCover.checked)
         {
            _loc2_.push(8);
         }
         if(_ckbPhoto.checked)
         {
            _loc2_.push(9);
         }
         _onChangeSettingsFunction(_loc2_);
         close();
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
