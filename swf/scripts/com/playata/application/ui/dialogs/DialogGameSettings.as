package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.fullscreen.UiFullscreenBackground;
   import com.playata.application.ui.elements.generic.UiSlider;
   import com.playata.application.ui.elements.generic.UiSliderButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGameSettingsGeneric;
   
   public class DialogGameSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _ckbShowFriendbar:UiCheckBox = null;
      
      private var _ckbShowStorygoals:UiCheckBox = null;
      
      private var _sldQuality:UiSlider = null;
      
      private var _ckbShowShopPreview:UiCheckBox = null;
      
      private var _ckbShowItemPattern:UiCheckBox = null;
      
      private var _ckbHighlightMovieButton:UiCheckBox = null;
      
      private var _ckbFullscreen:UiCheckBox = null;
      
      private var _ckbShowGuildBattles:UiCheckBox = null;
      
      private var _ckbShowDuelBattles:UiCheckBox = null;
      
      private var _ckbShowFightMissionBattles:UiCheckBox = null;
      
      private var _ckbShowDungeonBattles:UiCheckBox = null;
      
      private var _ckbShowMovienBattles:UiCheckBox = null;
      
      private var _ckbShowStoryDungeonBattles:UiCheckBox = null;
      
      private var _ckbShowDungeonStatAnimation:UiCheckBox = null;
      
      private var _ckbShowMovieStatAnimation:UiCheckBox = null;
      
      private var _ckbShowQuestStatAnimation:UiCheckBox = null;
      
      private var _ckbShowDatingStatAnimation:UiCheckBox = null;
      
      private var _btnTabGeneral:UiTabButton = null;
      
      private var _btnTabBattleAnimation:UiTabButton = null;
      
      private var _btnTabStatAnimation:UiTabButton = null;
      
      public function DialogGameSettings()
      {
         var _loc2_:SymbolDialogGameSettingsGeneric = new SymbolDialogGameSettingsGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/game_settings/title");
         _btnTabGeneral = new UiTabButton(_loc2_.btnGeneralSettings,LocText.current.text("dialog/game_settings/btn_general_settings"),"",onClickGeneralSettings);
         _btnTabGeneral.tabbed = true;
         _btnTabBattleAnimation = new UiTabButton(_loc2_.btnBattleAnimationSettings,LocText.current.text("dialog/game_settings/btn_battle_animation_settings"),"",onClickBattleAnimationSettings);
         _btnTabBattleAnimation.tabbed = false;
         _btnTabStatAnimation = new UiTabButton(_loc2_.btnStatAnimationSettings,LocText.current.text("dialog/game_settings/btn_stat_animation_settings"),"",onClickStatAnimationSettings);
         _btnTabStatAnimation.tabbed = false;
         _loc2_.battleAnimationSettings.visible = false;
         _loc2_.statAnimationSettings.visible = false;
         _loc2_.generalSettings.txtHighAnimationQuality.text = LocText.current.text("dialog/account_settings/animation_quality");
         _loc2_.generalSettings.sldQuality.qualityLow.text = LocText.current.text("dialog/account_settings/animation_quality/low");
         _loc2_.generalSettings.sldQuality.qualityMedium.text = LocText.current.text("dialog/account_settings/animation_quality/medium");
         _loc2_.generalSettings.sldQuality.qualityHigh.text = LocText.current.text("dialog/account_settings/animation_quality/high");
         _sldQuality = new UiSlider(_loc2_.generalSettings.sldQuality,_loc2_.generalSettings.sldQuality.barSlider,new UiSliderButton(_loc2_.generalSettings.sldQuality.btnSlider,""),"",1,3,2);
         _sldQuality.barCorrection = 12;
         _sldQuality.onValueChanged.add(handleQualityChange);
         _sldQuality.value = User.current.clientAnimationQuality;
         _loc2_.generalSettings.txtShowFriendbar.text = LocText.current.text("dialog/account_settings/show_friendbar");
         _ckbShowFriendbar = new UiCheckBox(_loc2_.generalSettings.checkShowFriendbar,User.current.showFriendbar,"",onShowFriendbarChanged,null,_loc2_.generalSettings.txtShowFriendbar);
         _loc2_.generalSettings.txtShowStorygoals.text = LocText.current.text("dialog/account_settings/show_storygoals");
         _ckbShowStorygoals = new UiCheckBox(_loc2_.generalSettings.checkShowStorygoals,User.current.showStorygoals,"",onShowStorygoalsChanged,null,_loc2_.generalSettings.txtShowStorygoals);
         _loc2_.generalSettings.txtShowShopPreview.text = LocText.current.text("dialog/account_settings/show_shop_preview");
         _loc2_.generalSettings.txtShowShopPreview.autoFontSize = true;
         _ckbShowShopPreview = new UiCheckBox(_loc2_.generalSettings.checkShowShopPreview,User.current.showShopPreview,"",onShowShopPreviewChanged,null,_loc2_.generalSettings.txtShowShopPreview);
         _loc2_.generalSettings.txtShowItemPattern.text = LocText.current.text("dialog/account_settings/show_item_pattern");
         _loc2_.generalSettings.txtShowItemPattern.autoFontSize = true;
         _ckbShowItemPattern = new UiCheckBox(_loc2_.generalSettings.checkShowItemPattern,User.current.showItemPattern,"",onShowItemPatternChanged,null,_loc2_.generalSettings.txtShowItemPattern);
         _loc2_.generalSettings.txtHighlightMovieButton.text = LocText.current.text("dialog/account_settings/highlight_movies_button");
         _loc2_.generalSettings.txtHighlightMovieButton.autoFontSize = true;
         _ckbHighlightMovieButton = new UiCheckBox(_loc2_.generalSettings.checkHighlightMovieButton,User.current.highlightMovieButton,LocText.current.text("dialog/account_settings/highlight_movies_button_tooltip"),onHighlightMovieButtonChanged,null,_loc2_.generalSettings.txtHighlightMovieButton);
         _loc2_.generalSettings.txtFullscreen.text = LocText.current.text("dialog/account_settings/activate_fullscreen");
         _loc2_.generalSettings.txtFullscreen.autoFontSize = true;
         _ckbFullscreen = new UiCheckBox(_loc2_.generalSettings.checkFullscreen,UiFullscreenBackground.isFullscreen(),"",onToggleFullscreen,null,_loc2_.generalSettings.txtFullscreen);
         _loc2_.battleAnimationSettings.txtShowGuildBattles.text = LocText.current.text("dialog/account_settings/show_guild_battles");
         _loc2_.battleAnimationSettings.txtShowGuildBattles.autoFontSize = true;
         _ckbShowGuildBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowGuildBattles,User.current.showGuildBattles,"",onShowGuildBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowGuildBattles);
         _loc2_.battleAnimationSettings.txtShowDuelBattles.text = LocText.current.text("dialog/account_settings/show_duel_battles");
         _loc2_.battleAnimationSettings.txtShowDuelBattles.autoFontSize = true;
         _ckbShowDuelBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowDuelBattles,User.current.showDuelBattles,"",onShowDuelBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowDuelBattles);
         _loc2_.battleAnimationSettings.txtShowFightMissionBattles.text = LocText.current.text("dialog/account_settings/show_fight_mission_battles");
         _loc2_.battleAnimationSettings.txtShowFightMissionBattles.autoFontSize = true;
         _ckbShowFightMissionBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowFightMissionBattles,User.current.showFightMissionBattles,"",onShowFightMissionBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowFightMissionBattles);
         _loc2_.battleAnimationSettings.txtShowDungeonBattles.text = LocText.current.text("dialog/account_settings/show_dungeon_battles");
         _loc2_.battleAnimationSettings.txtShowDungeonBattles.autoFontSize = true;
         _ckbShowDungeonBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowDungeonBattles,User.current.showDungeonBattles,"",onShowDungeonBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowDungeonBattles);
         _loc2_.battleAnimationSettings.txtShowMovieBattles.text = LocText.current.text("dialog/account_settings/show_movie_battles");
         _loc2_.battleAnimationSettings.txtShowMovieBattles.autoFontSize = true;
         _ckbShowMovienBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowMovieBattles,User.current.showMovieBattles,"",onShowMovieBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowMovieBattles);
         _loc2_.battleAnimationSettings.txtShowStoryDungeonBattles.text = LocText.current.text("dialog/account_settings/show_story_dungeon_battles");
         _loc2_.battleAnimationSettings.txtShowStoryDungeonBattles.autoFontSize = true;
         _ckbShowStoryDungeonBattles = new UiCheckBox(_loc2_.battleAnimationSettings.checkShowStoryDungeonBattles,User.current.showStoryDungeonBattles,"",onShowStoryDungeonBattlesChanged,null,_loc2_.battleAnimationSettings.txtShowStoryDungeonBattles);
         _loc2_.statAnimationSettings.txtShowDungeonStatAnimation.text = LocText.current.text("dialog/account_settings/show_dungeon_stat_animation");
         _loc2_.statAnimationSettings.txtShowDungeonStatAnimation.autoFontSize = true;
         _ckbShowDungeonStatAnimation = new UiCheckBox(_loc2_.statAnimationSettings.checkShowDungeonStatAnimation,User.current.showDungeonStatAnimation,"",onShowDungeonStatAnimationChanged,null,_loc2_.statAnimationSettings.txtShowDungeonStatAnimation);
         _loc2_.statAnimationSettings.txtShowMovieStatAnimation.text = LocText.current.text("dialog/account_settings/show_movie_stat_animation");
         _loc2_.statAnimationSettings.txtShowMovieStatAnimation.autoFontSize = true;
         _ckbShowMovieStatAnimation = new UiCheckBox(_loc2_.statAnimationSettings.checkShowMovieStatAnimation,User.current.showMovieStatAnimation,"",onShowMovieStatAnimationChanged,null,_loc2_.statAnimationSettings.txtShowMovieStatAnimation);
         _loc2_.statAnimationSettings.txtShowQuestStatAnimation.text = LocText.current.text("dialog/account_settings/show_quest_stat_animation");
         _loc2_.statAnimationSettings.txtShowQuestStatAnimation.autoFontSize = true;
         _ckbShowQuestStatAnimation = new UiCheckBox(_loc2_.statAnimationSettings.checkShowQuestStatAnimation,User.current.showQuestStatAnimation,"",onShowQuestStatAnimationChanged,null,_loc2_.statAnimationSettings.txtShowQuestStatAnimation);
         _loc2_.statAnimationSettings.txtShowDatingStatAnimation.text = LocText.current.text("dialog/account_settings/show_dating_stat_animation");
         _loc2_.statAnimationSettings.txtShowDatingStatAnimation.autoFontSize = true;
         _ckbShowDatingStatAnimation = new UiCheckBox(_loc2_.statAnimationSettings.checkShowDatingStatAnimation,User.current.showDatingStatAnimation,"",onShowDatingStatAnimationChanged,null,_loc2_.statAnimationSettings.txtShowDatingStatAnimation);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         var _loc1_:Boolean = AppEnvironment.appPlatform.isSSO;
         if(_loc1_)
         {
            _loc2_.generalSettings.txtShowFriendbar.visible = false;
            _loc2_.generalSettings.checkShowFriendbar.visible = false;
         }
         if(!Environment.info.isFullscreenAllowed)
         {
            _loc2_.generalSettings.txtFullscreen.visible = false;
            _loc2_.generalSettings.checkFullscreen.visible = false;
         }
         else if(!_loc2_.generalSettings.txtShowFriendbar.visible)
         {
            _loc2_.generalSettings.txtFullscreen.y = _loc2_.generalSettings.txtShowFriendbar.y;
            _loc2_.generalSettings.checkFullscreen.y = _loc2_.generalSettings.checkShowFriendbar.y;
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _ckbShowFriendbar.dispose();
         _ckbShowFriendbar = null;
         _sldQuality.dispose();
         _sldQuality = null;
         _ckbShowStorygoals.dispose();
         _ckbShowStorygoals = null;
         _ckbShowShopPreview.dispose();
         _ckbShowShopPreview = null;
         _ckbShowItemPattern.dispose();
         _ckbShowItemPattern = null;
         _ckbHighlightMovieButton.dispose();
         _ckbHighlightMovieButton = null;
         _ckbFullscreen.dispose();
         _ckbFullscreen = null;
         _ckbShowGuildBattles.dispose();
         _ckbShowGuildBattles = null;
         _ckbShowDuelBattles.dispose();
         _ckbShowDuelBattles = null;
         _ckbShowFightMissionBattles.dispose();
         _ckbShowFightMissionBattles = null;
         _ckbShowDungeonBattles.dispose();
         _ckbShowDungeonBattles = null;
         _ckbShowMovienBattles.dispose();
         _ckbShowMovienBattles = null;
         _ckbShowStoryDungeonBattles.dispose();
         _ckbShowStoryDungeonBattles = null;
         _ckbShowDungeonStatAnimation.dispose();
         _ckbShowDungeonStatAnimation = null;
         _ckbShowMovieStatAnimation.dispose();
         _ckbShowMovieStatAnimation = null;
         _ckbShowQuestStatAnimation.dispose();
         _ckbShowQuestStatAnimation = null;
         _ckbShowDatingStatAnimation.dispose();
         _ckbShowDatingStatAnimation = null;
         _btnTabGeneral.dispose();
         _btnTabGeneral = null;
         _btnTabBattleAnimation.dispose();
         _btnTabBattleAnimation = null;
         _btnTabStatAnimation.dispose();
         _btnTabStatAnimation = null;
         super.dispose();
      }
      
      private function onClickGeneralSettings(param1:InteractionEvent) : void
      {
         _btnTabGeneral.tabbed = true;
         _btnTabBattleAnimation.tabbed = false;
         _btnTabStatAnimation.tabbed = false;
         var _loc2_:SymbolDialogGameSettingsGeneric = _vo as SymbolDialogGameSettingsGeneric;
         _loc2_.generalSettings.visible = true;
         _loc2_.battleAnimationSettings.visible = false;
         _loc2_.statAnimationSettings.visible = false;
      }
      
      private function onClickBattleAnimationSettings(param1:InteractionEvent) : void
      {
         _btnTabGeneral.tabbed = false;
         _btnTabBattleAnimation.tabbed = true;
         _btnTabStatAnimation.tabbed = false;
         var _loc2_:SymbolDialogGameSettingsGeneric = _vo as SymbolDialogGameSettingsGeneric;
         _loc2_.generalSettings.visible = false;
         _loc2_.battleAnimationSettings.visible = true;
         _loc2_.statAnimationSettings.visible = false;
      }
      
      private function onClickStatAnimationSettings(param1:InteractionEvent) : void
      {
         _btnTabGeneral.tabbed = false;
         _btnTabBattleAnimation.tabbed = false;
         _btnTabStatAnimation.tabbed = true;
         var _loc2_:SymbolDialogGameSettingsGeneric = _vo as SymbolDialogGameSettingsGeneric;
         _loc2_.generalSettings.visible = false;
         _loc2_.battleAnimationSettings.visible = false;
         _loc2_.statAnimationSettings.visible = true;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function handleQualityChange(param1:Number) : void
      {
         var _loc2_:int = User.current.clientAnimationQuality;
         var _loc3_:int = param1;
         User.current.setSettingValue("animation_quality",_loc3_);
         ViewManager.instance.setClientAnimationQuality(_loc3_);
         if(_loc2_ == 1 && (_loc3_ == 2 || _loc3_ == 3) || _loc3_ == 1 && (_loc2_ == 2 || _loc2_ == 3))
         {
            ViewManager.instance.backgroundFader.clearCache();
            ViewManager.instance.backgroundFader.reloadBackground();
         }
      }
      
      private function onShowFriendbarChanged(param1:Boolean) : void
      {
         User.current.showFriendbar = param1;
         if(param1)
         {
            AppEnvironment.friendBar.show();
            AppEnvironment.friendBar.login(User.current.id,User.current.sessionId);
         }
         else
         {
            AppEnvironment.friendBar.hide();
         }
      }
      
      private function onShowStorygoalsChanged(param1:Boolean) : void
      {
         User.current.showStorygoals = param1;
      }
      
      private function onShowShopPreviewChanged(param1:Boolean) : void
      {
         User.current.showShopPreview = param1;
      }
      
      private function onShowItemPatternChanged(param1:Boolean) : void
      {
         User.current.showItemPattern = param1;
      }
      
      private function onHighlightMovieButtonChanged(param1:Boolean) : void
      {
         User.current.highlightMovieButton = param1;
      }
      
      private function onToggleFullscreen(param1:Boolean) : void
      {
         if(UiFullscreenBackground.isFullscreen())
         {
            Environment.display.displayContext.nativeStage.displayState = "normal";
         }
         else
         {
            Environment.display.displayContext.nativeStage.displayState = "fullScreenInteractive";
         }
      }
      
      private function onShowGuildBattlesChanged(param1:Boolean) : void
      {
         User.current.showGuildBattles = param1;
      }
      
      private function onShowDuelBattlesChanged(param1:Boolean) : void
      {
         User.current.showDuelBattles = param1;
      }
      
      private function onShowFightMissionBattlesChanged(param1:Boolean) : void
      {
         User.current.showFightMissionBattles = param1;
      }
      
      private function onShowDungeonBattlesChanged(param1:Boolean) : void
      {
         User.current.showDungeonBattles = param1;
      }
      
      private function onShowMovieBattlesChanged(param1:Boolean) : void
      {
         User.current.showMovieBattles = param1;
      }
      
      private function onShowStoryDungeonBattlesChanged(param1:Boolean) : void
      {
         User.current.showStoryDungeonBattles = param1;
      }
      
      private function onShowDungeonStatAnimationChanged(param1:Boolean) : void
      {
         User.current.showDungeonStatAnimation = param1;
      }
      
      private function onShowMovieStatAnimationChanged(param1:Boolean) : void
      {
         User.current.showMovieStatAnimation = param1;
      }
      
      private function onShowQuestStatAnimationChanged(param1:Boolean) : void
      {
         User.current.showQuestStatAnimation = param1;
      }
      
      private function onShowDatingStatAnimationChanged(param1:Boolean) : void
      {
         User.current.showDatingStatAnimation = param1;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
