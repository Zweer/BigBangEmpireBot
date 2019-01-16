package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiSlider;
   import com.playata.application.ui.elements.generic.UiSliderButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
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
      
      private var _ckbShowGuildBattles:UiCheckBox = null;
      
      private var _ckbShowDuelBattles:UiCheckBox = null;
      
      private var _ckbShowFightMissionBattles:UiCheckBox = null;
      
      private var _ckbShowDungeonBattles:UiCheckBox = null;
      
      private var _ckbShowMovienBattles:UiCheckBox = null;
      
      private var _ckbShowStoryDungeonBattles:UiCheckBox = null;
      
      public function DialogGameSettings()
      {
         var _loc2_:SymbolDialogGameSettingsGeneric = new SymbolDialogGameSettingsGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/game_settings/title");
         _loc2_.txtHighAnimationQuality.text = LocText.current.text("dialog/account_settings/animation_quality");
         _loc2_.sldQuality.qualityLow.text = LocText.current.text("dialog/account_settings/animation_quality/low");
         _loc2_.sldQuality.qualityMedium.text = LocText.current.text("dialog/account_settings/animation_quality/medium");
         _loc2_.sldQuality.qualityHigh.text = LocText.current.text("dialog/account_settings/animation_quality/high");
         _sldQuality = new UiSlider(_loc2_.sldQuality,_loc2_.sldQuality.barSlider,new UiSliderButton(_loc2_.sldQuality.btnSlider,""),"",1,3,2);
         _sldQuality.barCorrection = 12;
         _sldQuality.onValueChanged.add(handleQualityChange);
         _sldQuality.value = User.current.clientAnimationQuality;
         _loc2_.txtShowFriendbar.text = LocText.current.text("dialog/account_settings/show_friendbar");
         _ckbShowFriendbar = new UiCheckBox(_loc2_.checkShowFriendbar,User.current.showFriendbar,"",onShowFriendbarChanged,null,_loc2_.txtShowFriendbar);
         _loc2_.txtShowStorygoals.text = LocText.current.text("dialog/account_settings/show_storygoals");
         _ckbShowStorygoals = new UiCheckBox(_loc2_.checkShowStorygoals,User.current.showStorygoals,"",onShowStorygoalsChanged,null,_loc2_.txtShowStorygoals);
         _loc2_.txtShowShopPreview.text = LocText.current.text("dialog/account_settings/show_shop_preview");
         _loc2_.txtShowShopPreview.autoFontSize = true;
         _ckbShowShopPreview = new UiCheckBox(_loc2_.checkShowShopPreview,User.current.showShopPreview,"",onShowShopPreviewChanged,null,_loc2_.txtShowShopPreview);
         _loc2_.txtShowItemPattern.text = LocText.current.text("dialog/account_settings/show_item_pattern");
         _loc2_.txtShowItemPattern.autoFontSize = true;
         _ckbShowItemPattern = new UiCheckBox(_loc2_.checkShowItemPattern,User.current.showItemPattern,"",onShowItemPatternChanged,null,_loc2_.txtShowItemPattern);
         _loc2_.txtShowGuildBattles.text = LocText.current.text("dialog/account_settings/show_guild_battles");
         _loc2_.txtShowGuildBattles.autoFontSize = true;
         _ckbShowGuildBattles = new UiCheckBox(_loc2_.checkShowGuildBattles,User.current.showGuildBattles,"",onShowGuildBattlesChanged,null,_loc2_.txtShowGuildBattles);
         _loc2_.txtShowDuelBattles.text = LocText.current.text("dialog/account_settings/show_duel_battles");
         _loc2_.txtShowDuelBattles.autoFontSize = true;
         _ckbShowDuelBattles = new UiCheckBox(_loc2_.checkShowDuelBattles,User.current.showDuelBattles,"",onShowDuelBattlesChanged,null,_loc2_.txtShowDuelBattles);
         _loc2_.txtShowFightMissionBattles.text = LocText.current.text("dialog/account_settings/show_fight_mission_battles");
         _loc2_.txtShowFightMissionBattles.autoFontSize = true;
         _ckbShowFightMissionBattles = new UiCheckBox(_loc2_.checkShowFightMissionBattles,User.current.showFightMissionBattles,"",onShowFightMissionBattlesChanged,null,_loc2_.txtShowFightMissionBattles);
         _loc2_.txtShowDungeonBattles.text = LocText.current.text("dialog/account_settings/show_dungeon_battles");
         _loc2_.txtShowDungeonBattles.autoFontSize = true;
         _ckbShowDungeonBattles = new UiCheckBox(_loc2_.checkShowDungeonBattles,User.current.showDungeonBattles,"",onShowDungeonBattlesChanged,null,_loc2_.txtShowDungeonBattles);
         _loc2_.txtShowMovieBattles.text = LocText.current.text("dialog/account_settings/show_movie_battles");
         _loc2_.txtShowMovieBattles.autoFontSize = true;
         _ckbShowMovienBattles = new UiCheckBox(_loc2_.checkShowMovieBattles,User.current.showMovieBattles,"",onShowMovieBattlesChanged,null,_loc2_.txtShowMovieBattles);
         _loc2_.txtShowStoryDungeonBattles.text = LocText.current.text("dialog/account_settings/show_story_dungeon_battles");
         _loc2_.txtShowStoryDungeonBattles.autoFontSize = true;
         _ckbShowStoryDungeonBattles = new UiCheckBox(_loc2_.checkShowStoryDungeonBattles,User.current.showStoryDungeonBattles,"",onShowStoryDungeonBattlesChanged,null,_loc2_.txtShowStoryDungeonBattles);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         var _loc1_:Boolean = AppEnvironment.appPlatform.isSSO;
         if(_loc1_)
         {
            _loc2_.txtShowFriendbar.visible = false;
            _loc2_.checkShowFriendbar.visible = false;
            _loc2_.txtShowGuildBattles.y = _loc2_.txtShowFriendbar.y;
            _loc2_.checkShowGuildBattles.y = _loc2_.checkShowFriendbar.y;
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
         super.dispose();
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
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
