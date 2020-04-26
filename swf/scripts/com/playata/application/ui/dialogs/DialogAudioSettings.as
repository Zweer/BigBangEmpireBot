package com.playata.application.ui.dialogs
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiSlider;
   import com.playata.application.ui.elements.generic.UiSliderButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogAudioSettingsGeneric;
   
   public class DialogAudioSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnVolumeDown:UiButton = null;
      
      private var _btnVolumeUp:UiButton = null;
      
      private var _ckbBackground:UiCheckBox = null;
      
      private var _ckbNotifications:UiCheckBox = null;
      
      private var _ckbGui:UiCheckBox = null;
      
      private var _ckbGuildNotifications:UiCheckBox = null;
      
      private var _user:User = null;
      
      private var _sldSoundPackage:UiSlider;
      
      public function DialogAudioSettings()
      {
         _user = User.current;
         var _loc1_:SymbolDialogAudioSettingsGeneric = new SymbolDialogAudioSettingsGeneric();
         super(_loc1_);
         _loc1_.txtSoundPackage.text = LocText.current.text("dialog/sound_settings/sound_package");
         _loc1_.sldSoundPackage.package1.text = LocText.current.text("dialog/sound_settings/sound_package/package_1");
         _loc1_.sldSoundPackage.package2.text = LocText.current.text("dialog/sound_settings/sound_package/package_2");
         _sldSoundPackage = new UiSlider(_loc1_.sldSoundPackage,_loc1_.sldSoundPackage.barSlider,new UiSliderButton(_loc1_.sldSoundPackage.btnSlider,""),LocText.current.text("dialog/sound_settings/sound_package/tooltip"),0,1,1);
         _sldSoundPackage.barCorrection = 10;
         _sldSoundPackage.onValueChanged.add(handleSoundPackageChange);
         _sldSoundPackage.value = User.current.soundPackage;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/sound_settings/title");
         _loc1_.txtSoundAmbiences.text = LocText.current.text("screen/sound_settings/background_sounds");
         _loc1_.txtSoundNotifications.text = LocText.current.text("screen/sound_settings/nofitication_sounds");
         _loc1_.txtSoundUi.text = LocText.current.text("screen/sound_settings/gui_sounds");
         _loc1_.txtGuildNotifications.text = LocText.current.text("screen/sound_settings/guild_sounds");
         _loc1_.txtVolumeCaption.text = LocText.current.text("screen/sound_settings/volume_caption");
         _ckbBackground = new UiCheckBox(_loc1_.checkSoundAmbiences,_user.playBackgroundSounds,"",onBackgroundChanged,null,_loc1_.txtSoundAmbiences);
         _ckbNotifications = new UiCheckBox(_loc1_.checkSoundNotifications,_user.playNotificationSounds,"",onNotificationChanged,null,_loc1_.txtSoundNotifications);
         _ckbGui = new UiCheckBox(_loc1_.checkSoundUi,_user.playGuiSounds,"",onGuiChanged,null,_loc1_.txtSoundUi);
         _ckbGuildNotifications = new UiCheckBox(_loc1_.checkGuildNotifications,_user.playGuildSounds,"",onGuildNotificationChanged,null,_loc1_.txtGuildNotifications);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnVolumeDown = new UiButton(_loc1_.btnVolumeDown,LocText.current.text("screen/sound_settings/button_decrease"),onClickVolumeDown);
         _btnVolumeUp = new UiButton(_loc1_.btnVolumeUp,LocText.current.text("screen/sound_settings/button_increase"),onClickVolumeUp);
         refreshVolume();
      }
      
      private function onBackgroundChanged(param1:Boolean) : void
      {
         _user.playBackgroundSounds = param1;
         if(!param1)
         {
            Environment.audio.stopMusic();
         }
         else
         {
            ViewManager.instance.backgroundFader.playCurrentBackgroundMusic();
         }
      }
      
      private function onNotificationChanged(param1:Boolean) : void
      {
         _user.playNotificationSounds = param1;
         if(!param1)
         {
            Environment.audio.stopAllFX();
         }
      }
      
      private function onGuiChanged(param1:Boolean) : void
      {
         _user.playGuiSounds = param1;
      }
      
      private function onGuildNotificationChanged(param1:Boolean) : void
      {
         _user.playGuildSounds = param1;
      }
      
      private function handleSoundPackageChange(param1:Number) : void
      {
         var _loc2_:int = param1;
         User.current.setSettingValue("sound_package",_loc2_);
         Environment.audio.soundProvider.soundPackage = _loc2_;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnVolumeDown.dispose();
         _btnVolumeDown = null;
         _btnVolumeUp.dispose();
         _btnVolumeUp = null;
         _sldSoundPackage.dispose();
         _sldSoundPackage = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickVolumeDown(param1:InteractionEvent) : void
      {
         adjustVolume(-0.1);
      }
      
      private function onClickVolumeUp(param1:InteractionEvent) : void
      {
         adjustVolume(0.1);
      }
      
      private function adjustVolume(param1:Number) : void
      {
         var _loc2_:* = Number(_user.soundVolumne);
         _loc2_ = Number(_loc2_ + param1);
         _loc2_ = Number(NumberUtil.roundDecimal(_loc2_,1));
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         Environment.audio.volumeMaster = _loc2_;
         _user.soundVolumne = _loc2_;
         refreshVolume();
      }
      
      private function refreshVolume() : void
      {
         var _loc1_:SymbolDialogAudioSettingsGeneric = _vo as SymbolDialogAudioSettingsGeneric;
         _loc1_.txtVolumeValue.text = Math.round(Environment.audio.volumeMaster * 100).toString() + "%";
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
