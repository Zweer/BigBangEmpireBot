package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.leaderboard.GuildCompetitionLeaderboardContext;
   import com.playata.application.data.leaderboard.SoloGuildCompetitionLeaderboardContext;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildCompetitionContainerGeneric;
   
   public class UiLeaderboardGuildCompetitionContainer
   {
       
      
      private var _content:SymbolLeaderboardGuildCompetitionContainerGeneric = null;
      
      private var _btnTabSoloGuildCompetition:UiTabButton;
      
      private var _btnTabGuildCompetition:UiTabButton;
      
      private var _guildCompetitionContent:UiLeaderboardGuildCompetitionContent;
      
      private var _soloGuildCompetitionContent:UiLeaderboardSoloGuildCompetitionContent;
      
      private var _refreshContentButtons:Function = null;
      
      private var _shown:Boolean = false;
      
      public function UiLeaderboardGuildCompetitionContainer(param1:SymbolLeaderboardGuildCompetitionContainerGeneric, param2:Function, param3:Function, param4:Function, param5:Function, param6:GuildCompetitionLeaderboardContext, param7:SoloGuildCompetitionLeaderboardContext)
      {
         super();
         _content = param1;
         _refreshContentButtons = param5;
         _btnTabSoloGuildCompetition = new UiTabButton(_content.tabSoloGuildCompetition,LocText.current.text("dialog/leadboard/guild_competition/button_tab_solo_guild_competition"),"",onClickTabTournament);
         _btnTabGuildCompetition = new UiTabButton(_content.tabGuildCompetition,LocText.current.text("dialog/leadboard/guild_competition/button_tab_guild_competition"),"",onClickTabTournament);
         _btnTabSoloGuildCompetition.gray = true;
         _btnTabGuildCompetition.gray = true;
         _content.txtTournamentInfo.visible = false;
         _content.iconTournamentInfo.visible = false;
         _guildCompetitionContent = new UiLeaderboardGuildCompetitionContent(param1.guildCompetitionContent,param2,param3,refreshTicker,param6);
         _soloGuildCompetitionContent = new UiLeaderboardSoloGuildCompetitionContent(param1.soloGuildCompetitionContent,param2,param3,refreshTicker,param4,param7);
         clickTabTournament(_btnTabSoloGuildCompetition);
      }
      
      public static function getTournamentEndDateTime(param1:int) : String
      {
         if(TimeUtil.localDateTime.isToday(param1))
         {
            return AppDateTime.getFormattedDateTimeToday(param1);
         }
         return AppDateTime.getFormattedDateTime(param1,2);
      }
      
      public function dispose() : void
      {
         _btnTabSoloGuildCompetition.dispose();
         _btnTabSoloGuildCompetition = null;
         _btnTabGuildCompetition.dispose();
         _btnTabGuildCompetition = null;
         _guildCompetitionContent.dispose();
         _guildCompetitionContent = null;
         _soloGuildCompetitionContent.dispose();
         _soloGuildCompetitionContent = null;
      }
      
      private function onClickTabTournament(param1:InteractionEvent) : void
      {
         clickTabTournament(param1.target);
      }
      
      private function clickTabTournament(param1:IInteractionTarget) : void
      {
         _btnTabSoloGuildCompetition.tabbed = _btnTabSoloGuildCompetition == param1;
         _btnTabGuildCompetition.tabbed = _btnTabGuildCompetition == param1;
         _guildCompetitionContent.visible = _btnTabGuildCompetition.tabbed;
         _soloGuildCompetitionContent.visible = _btnTabSoloGuildCompetition.tabbed;
         if(_shown)
         {
            if(isGuildCompetition)
            {
               _guildCompetitionContent.show();
            }
            else if(isSoloGuildCompetition)
            {
               _soloGuildCompetitionContent.show();
            }
            _refreshContentButtons();
            refreshTicker();
         }
      }
      
      public function show() : void
      {
         _shown = true;
         if(isGuildCompetition)
         {
            _guildCompetitionContent.show();
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.show();
         }
      }
      
      private function refreshTicker() : void
      {
         var _loc1_:int = 0;
         if(isGuildCompetition)
         {
            _loc1_ = _guildCompetitionContent.context.endTimestamp;
         }
         else if(isSoloGuildCompetition)
         {
            _loc1_ = _soloGuildCompetitionContent.context.endTimestamp;
         }
         var _loc2_:* = _loc1_ > 0;
         _content.txtTournamentInfo.visible = _loc2_;
         _content.iconTournamentInfo.visible = _loc2_;
         _content.txtTournamentInfo.htmlText = LocText.current.text("dialog/leadboard_guild_competition/end_datetime",getTournamentEndDateTime(_loc1_ + 1));
      }
      
      public function scrollToTop() : void
      {
         if(isGuildCompetition)
         {
            _guildCompetitionContent.scrollToTop();
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.scrollToTop();
         }
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         if(isGuildCompetition)
         {
            _guildCompetitionContent.refreshGuildList(param1);
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.refreshCharacterList(param1);
         }
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         if(isGuildCompetition)
         {
            _guildCompetitionContent.scrollUp(param1,param2);
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.scrollUp(param1,param2);
         }
      }
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         if(isGuildCompetition)
         {
            _guildCompetitionContent.scrollDown(param1,param2);
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.scrollDown(param1,param2);
         }
      }
      
      public function search(param1:String) : void
      {
         if(isGuildCompetition)
         {
            _guildCompetitionContent.search(param1);
         }
         else if(isSoloGuildCompetition)
         {
            _soloGuildCompetitionContent.search(param1);
         }
      }
      
      public function get isGuildCompetition() : Boolean
      {
         return _btnTabGuildCompetition.tabbed;
      }
      
      public function get isSoloGuildCompetition() : Boolean
      {
         return _btnTabSoloGuildCompetition.tabbed;
      }
      
      public function get guildCompetitionContent() : UiLeaderboardGuildCompetitionContent
      {
         return _guildCompetitionContent;
      }
      
      public function get soloGuildCompetitionContent() : UiLeaderboardSoloGuildCompetitionContent
      {
         return _soloGuildCompetitionContent;
      }
      
      public function get currentGuildId() : int
      {
         if(isGuildCompetition && _guildCompetitionContent.currentGuild)
         {
            return _guildCompetitionContent.currentGuild.id;
         }
         if(isSoloGuildCompetition)
         {
            return _soloGuildCompetitionContent.currentCharacter.guildId;
         }
         return 0;
      }
      
      public function get currentCharacterId() : int
      {
         if(isSoloGuildCompetition && _soloGuildCompetitionContent.currentCharacter)
         {
            return _soloGuildCompetitionContent.currentCharacter.id;
         }
         return 0;
      }
   }
}
