package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.data.user_story.UserStoryListContext;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardCharacterContent;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardGuildContent;
   import com.playata.application.ui.elements.user_story.UiUserStoryActiveUserStoryLine;
   import com.playata.application.ui.elements.user_story.UiUserStoryFilter;
   import com.playata.application.ui.elements.user_story.UiUserStoryHallOfFameListContent;
   import com.playata.application.ui.elements.user_story.UiUserStoryVotingListContent;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStoryGeneric;
   
   public class DialogUserStory extends UiDialog
   {
      
      public static const SCROLL_VALUE:int = 5;
      
      private static const TAB_VOTING:String = "Voting";
      
      private static const TAB_HALL_OF_FAME:String = "HallOfFame";
      
      private static var _votingListContext:UserStoryListContext = null;
      
      private static var _hallOfFameListContext:UserStoryListContext = null;
      
      private static var _activeTab:String = "Voting";
       
      
      private var _votingListContent:UiUserStoryVotingListContent = null;
      
      private var _hallOfFameListContent:UiUserStoryHallOfFameListContent = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _btnSettings:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnHelp:UiButton = null;
      
      private var _btnTabVoting:UiTabButton = null;
      
      private var _btnTabHallOfFame:UiTabButton = null;
      
      private var _btnReadUserStory:UiTextButton = null;
      
      private var _btnWriteUserStory:UiTextButton = null;
      
      private var _btnViewPlayer:UiButton = null;
      
      private var _btnUserStoryInfo:UiButton = null;
      
      private var _filter:UiUserStoryFilter = null;
      
      private var _activeUserStoryLine:UiUserStoryActiveUserStoryLine = null;
      
      public function DialogUserStory()
      {
         var _loc1_:SymbolDialogUserStoryGeneric = new SymbolDialogUserStoryGeneric();
         super(_loc1_);
         _loc1_.textTitle.text = LocText.current.text("dialog/user_story/title");
         if(!_votingListContext)
         {
            _votingListContext = new UserStoryListContext();
         }
         if(!_hallOfFameListContext)
         {
            _hallOfFameListContext = new UserStoryListContext();
         }
         _votingListContent = new UiUserStoryVotingListContent(_loc1_.votingContent,refreshButtons,refreshEndTime,onClickRead,_votingListContext);
         _hallOfFameListContent = new UiUserStoryHallOfFameListContent(_loc1_.hallOfFameContent,refreshButtons,refreshEndTime,onClickRead,_hallOfFameListContext);
         _loc1_.txtUserStoryInfo.htmlText = LocText.current.text("dialog/user_story/user_generated_content_info");
         _loc1_.txtUserStoryInfo.autoFontSize = true;
         _loc1_.txtWriteInfo.text = "";
         _btnFilter = new UiButton(_loc1_.btnFilter,"",onClickFilter);
         _btnSettings = new UiButton(_loc1_.btnSettings,"",onClickSettings);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnScrollUp,LocText.current.text("dialog/user_story/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnScrollDown,LocText.current.text("dialog/user_story/button_scroll_down"),onClickScrollDown);
         _btnHelp = new UiButton(_loc1_.btnHelp,LocText.current.text("dialog/user_story/button_help"),onClickHelp);
         _btnUserStoryInfo = new UiButton(_loc1_.txtUserStoryInfo,"",onClickHelp);
         _btnUserStoryInfo.interactionOverMode = "none";
         _btnTabVoting = new UiTabButton(_loc1_.btnTabVoting,LocText.current.text("dialog/user_story/button_tab_voting"),"",onClickTabVoting);
         _btnTabHallOfFame = new UiTabButton(_loc1_.btnTabHallOfFame,LocText.current.text("dialog/user_story/button_tab_hall_of_fame"),"",onClickTabHallOfFame);
         _btnReadUserStory = new UiTextButton(_loc1_.btnRead,LocText.current.text("dialog/user_story/button_read"),"",onClickRead);
         _btnWriteUserStory = new UiTextButton(_loc1_.btnWrite,LocText.current.text("dialog/user_story/button_write"),LocText.current.text("dialog/user_story/button_write_tooltip"),onClickWrite);
         _btnViewPlayer = new UiButton(_loc1_.btnViewCharacter,LocText.current.text("dialog/user_story/button_show_player_tooltip"),onClickViewPlayer);
         _btnSettings.visible = AppConfig.userStoryLocales.length > 0;
         _btnFilter.visible = AppConfig.userStoryLocales.length > 0;
         _activeUserStoryLine = new UiUserStoryActiveUserStoryLine(_loc1_.editLine);
         refreshActiveUserStory();
         onMouseWheel.add(handleMouseWheel);
         _filter = new UiUserStoryFilter(_loc1_.filter,onFilterChanged);
         onFilterChanged(false);
         if(_activeTab == "Voting")
         {
            onClickTabVoting(null);
         }
         else
         {
            onClickTabHallOfFame(null);
         }
      }
      
      public static function reset() : void
      {
         if(_votingListContext)
         {
            _votingListContext.reset();
         }
         if(_hallOfFameListContext)
         {
            _hallOfFameListContext.reset();
         }
      }
      
      override public function dispose() : void
      {
         _btnFilter.dispose();
         _btnFilter = null;
         _btnSettings.dispose();
         _btnSettings = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnTabVoting.dispose();
         _btnTabVoting = null;
         _btnTabHallOfFame.dispose();
         _btnTabHallOfFame = null;
         _btnViewPlayer.dispose();
         _btnViewPlayer = null;
         _btnReadUserStory.dispose();
         _btnReadUserStory = null;
         _btnWriteUserStory.dispose();
         _btnWriteUserStory = null;
         _activeUserStoryLine.dispose();
         _activeUserStoryLine = null;
         _btnUserStoryInfo.dispose();
         _btnUserStoryInfo = null;
         _filter.dispose();
         _filter = null;
         _votingListContent.dispose();
         _votingListContent = null;
         _hallOfFameListContent.dispose();
         _hallOfFameListContent = null;
         _btnHelp.dispose();
         _btnHelp = null;
         super.dispose();
      }
      
      private function onClickTabVoting(param1:InteractionEvent) : void
      {
         _activeTab = "Voting";
         _btnTabVoting.tabbed = true;
         _btnTabHallOfFame.tabbed = false;
         refreshContentButtons();
         _votingListContent.visible = _btnTabVoting.tabbed;
         _hallOfFameListContent.visible = _btnTabHallOfFame.tabbed;
         _votingListContent.show();
      }
      
      private function onClickTabHallOfFame(param1:InteractionEvent) : void
      {
         _activeTab = "HallOfFame";
         _btnTabVoting.tabbed = false;
         _btnTabHallOfFame.tabbed = true;
         refreshContentButtons();
         _votingListContent.visible = _btnTabVoting.tabbed;
         _hallOfFameListContent.visible = _btnTabHallOfFame.tabbed;
         _hallOfFameListContent.show();
      }
      
      private function refreshContentButtons() : void
      {
         if(_btnTabVoting.tabbed)
         {
            _btnViewPlayer.visible = false;
         }
         else if(_btnTabHallOfFame.tabbed)
         {
            _btnViewPlayer.visible = true;
         }
      }
      
      public function refreshActiveUserStory() : void
      {
         var _loc1_:SymbolDialogUserStoryGeneric = _vo as SymbolDialogUserStoryGeneric;
         _activeUserStoryLine.refresh();
         if(UserStories.getActiveUserStory())
         {
            _loc1_.txtWriteInfo.visible = false;
            _btnWriteUserStory.caption = LocText.current.text("dialog/user_story/button_edit");
            _btnWriteUserStory.tooltip = LocText.current.text("dialog/user_story/button_edit_tooltip");
         }
         else
         {
            _loc1_.txtWriteInfo.visible = true;
            _btnWriteUserStory.caption = LocText.current.text("dialog/user_story/button_write");
            _btnWriteUserStory.tooltip = LocText.current.text("dialog/user_story/button_write_tooltip");
         }
      }
      
      public function refreshContent() : void
      {
         if(_btnTabVoting.tabbed)
         {
            _votingListContent.show();
         }
         else if(_btnTabHallOfFame.tabbed)
         {
            _hallOfFameListContent.show();
         }
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_btnTabVoting.tabbed)
         {
            _votingListContent.scrollUp(param1,param2);
         }
         else if(_btnTabHallOfFame.tabbed)
         {
            _hallOfFameListContent.scrollUp(param1,param2);
         }
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_btnTabVoting.tabbed)
         {
            _votingListContent.scrollDown(param1,param2);
         }
         else if(_btnTabHallOfFame.tabbed)
         {
            _hallOfFameListContent.scrollDown(param1,param2);
         }
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _filter.toggle();
      }
      
      private function onClickSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStorySettings(onFilterChanged));
      }
      
      private function onFilterChanged(param1:Boolean) : void
      {
         var _loc2_:SymbolDialogUserStoryGeneric = _vo as SymbolDialogUserStoryGeneric;
         var _loc3_:Boolean = UiUserStoryFilter.isFilterActive;
         _loc2_.btnFilter.iconExclamationMark.visible = _loc3_;
         if(_filter.locales != _votingListContext.locales)
         {
            _votingListContext.reset();
         }
         if(_filter.locales != _hallOfFameListContext.locales)
         {
            _hallOfFameListContext.reset();
         }
         _votingListContext.locales = _filter.locales;
         _hallOfFameListContext.locales = _filter.locales;
         if(param1)
         {
            if(_btnTabVoting.tabbed)
            {
               _votingListContent.show();
            }
            else if(_btnTabHallOfFame.tabbed)
            {
               _hallOfFameListContent.show();
            }
         }
      }
      
      private function onClickViewPlayer(param1:InteractionEvent) : void
      {
         if(!_btnTabHallOfFame.tabbed)
         {
            return;
         }
         var _loc2_:int = _hallOfFameListContent.currentUserStory.characterId;
         var _loc3_:String = _hallOfFameListContent.currentUserStory.serverId;
         ViewManager.instance.loadCharacter(_loc2_,closeCallback,_loc3_);
      }
      
      private function onClickRead(param1:InteractionEvent) : void
      {
         var _loc3_:UserStory = null;
         var _loc2_:UserStoryListContext = null;
         if(_btnTabHallOfFame.tabbed)
         {
            _loc3_ = _hallOfFameListContent.currentUserStory;
            _loc2_ = _hallOfFameListContext;
         }
         else if(_btnTabVoting.tabbed)
         {
            _loc3_ = _votingListContent.currentUserStory;
            _loc2_ = _votingListContext;
         }
         Environment.panelManager.showDialog(new DialogUserStoryRead(_loc3_,_loc2_));
      }
      
      private function onClickWrite(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStoryWrite(UserStories.getActiveUserStory()));
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStoryUnlock());
      }
      
      private function closeCallback() : void
      {
         close();
      }
      
      private function refreshButtons() : void
      {
         if(_btnTabVoting && _btnTabVoting.tabbed)
         {
            _btnViewPlayer.buttonEnabled = false;
            _btnReadUserStory.buttonEnabled = _votingListContent.currentUserStory != null;
            _btnScrollUp.visible = _votingListContent.userStoryCount > UiLeaderboardCharacterContent.MAX_LINES;
            _btnScrollDown.visible = _votingListContent.userStoryCount > UiLeaderboardCharacterContent.MAX_LINES;
         }
         else if(_btnTabHallOfFame && _btnTabHallOfFame.tabbed)
         {
            _btnViewPlayer.buttonEnabled = _hallOfFameListContent.currentUserStory != null;
            _btnReadUserStory.buttonEnabled = _hallOfFameListContent.currentUserStory != null;
            _btnScrollUp.visible = _hallOfFameListContent.userStoryCount > UiLeaderboardGuildContent.MAX_LINES;
            _btnScrollDown.visible = _hallOfFameListContent.userStoryCount > UiLeaderboardGuildContent.MAX_LINES;
         }
      }
      
      private function refreshEndTime(param1:int) : void
      {
         var _loc2_:SymbolDialogUserStoryGeneric = _vo as SymbolDialogUserStoryGeneric;
         var _loc3_:String = "";
         if(TimeUtil.localDateTime.isToday(param1))
         {
            _loc3_ = AppDateTime.getFormattedDateTimeToday(param1);
         }
         else
         {
            _loc3_ = AppDateTime.getFormattedDateTime(param1,2);
         }
         _loc2_.txtWriteInfo.text = LocText.current.text("dialog/user_story/write_info",_loc3_);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnReadUserStory;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
