package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGuildMember;
   import com.playata.application.ui.dialogs.DialogMailCompose;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildMemberInfoTabGeneric;
   
   public class UiGuildMemberInfoTab extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 10;
      
      private static const SCROLL_VALUE:int = 5;
      
      private static var _instance:UiGuildMemberInfoTab = null;
       
      
      private var _content:SymbolGuildMemberInfoTabGeneric = null;
      
      private var _guild:Guild = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnProfile:UiButton = null;
      
      private var _btnMessage:UiButton = null;
      
      private var _btnOptions:UiButton = null;
      
      private var _btnTeamMessage:UiButton = null;
      
      private var _btnSortRank:UiGuildMemberListSortButton;
      
      private var _btnSortPremiumCurrency:UiGuildMemberListSortButton;
      
      private var _btnSortGameCurrency:UiGuildMemberListSortButton;
      
      private var _btnSortGuildCompetition:UiGuildMemberListSortButton;
      
      private var _line1:UiGuildMemberInfoLine = null;
      
      private var _line2:UiGuildMemberInfoLine = null;
      
      private var _line3:UiGuildMemberInfoLine = null;
      
      private var _line4:UiGuildMemberInfoLine = null;
      
      private var _line5:UiGuildMemberInfoLine = null;
      
      private var _line6:UiGuildMemberInfoLine = null;
      
      private var _line7:UiGuildMemberInfoLine = null;
      
      private var _line8:UiGuildMemberInfoLine = null;
      
      private var _line9:UiGuildMemberInfoLine = null;
      
      private var _line10:UiGuildMemberInfoLine = null;
      
      private var _selectedMembers:Vector.<GuildMember>;
      
      private var _offset:int = 0;
      
      private var _selectedLine:UiGuildMemberInfoLine = null;
      
      private var _sortMode:int = 0;
      
      public function UiGuildMemberInfoTab(param1:SymbolGuildMemberInfoTabGeneric)
      {
         _selectedMembers = new Vector.<GuildMember>();
         _instance = this;
         _content = param1;
         super(_content);
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnProfile = new UiButton(_content.btnProfile,LocText.current.text("screen/guild/member_info/button_profile_tooltip"),onClickProfile);
         _btnMessage = new UiButton(_content.btnMessage,LocText.current.text("screen/guild/member_info/button_message_tooltip"),onClickMessage);
         _btnOptions = new UiButton(_content.btnOptions,LocText.current.text("screen/guild/member_info/button_options_tooltip"),onClickOptions);
         _btnTeamMessage = new UiButton(_content.btnTeamMessage,LocText.current.text("screen/guild/member_info/button_team_mail_tooltip"),onClickTeamMessage);
         _btnSortRank = new UiGuildMemberListSortButton(_content.btnSortRank,0,LocText.current.text("screen/guild/member_info/button_sort_rank_tooltip"),onClickSort);
         _btnSortRank.toggled = true;
         _btnSortPremiumCurrency = new UiGuildMemberListSortButton(_content.btnSortPremiumCurrencySpent,1,LocText.current.text("screen/guild/member_info/button_sort_premium_currency_tooltip"),onClickSort);
         _btnSortGameCurrency = new UiGuildMemberListSortButton(_content.btnSortGameCurrencySpent,2,LocText.current.text("screen/guild/member_info/button_sort_game_currency_tooltip"),onClickSort);
         _btnSortGuildCompetition = new UiGuildMemberListSortButton(_content.btnSortGuildCompetition,3,LocText.current.text("screen/guild/member_info/button_sort_guild_competition_tooltip"),onClickSort);
         _line1 = new UiGuildMemberInfoLine(_content.line1,1,selectLine,doubleClickLine);
         _line2 = new UiGuildMemberInfoLine(_content.line2,2,selectLine,doubleClickLine);
         _line3 = new UiGuildMemberInfoLine(_content.line3,3,selectLine,doubleClickLine);
         _line4 = new UiGuildMemberInfoLine(_content.line4,4,selectLine,doubleClickLine);
         _line5 = new UiGuildMemberInfoLine(_content.line5,5,selectLine,doubleClickLine);
         _line6 = new UiGuildMemberInfoLine(_content.line6,6,selectLine,doubleClickLine);
         _line7 = new UiGuildMemberInfoLine(_content.line7,7,selectLine,doubleClickLine);
         _line8 = new UiGuildMemberInfoLine(_content.line8,8,selectLine,doubleClickLine);
         _line9 = new UiGuildMemberInfoLine(_content.line9,9,selectLine,doubleClickLine);
         _line10 = new UiGuildMemberInfoLine(_content.line10,10,selectLine,doubleClickLine);
         onMouseWheel.add(handleMouseWheel);
      }
      
      public static function get instance() : UiGuildMemberInfoTab
      {
         return _instance;
      }
      
      override public function dispose() : void
      {
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnProfile.dispose();
         _btnProfile = null;
         _btnMessage.dispose();
         _btnMessage = null;
         _btnOptions.dispose();
         _btnOptions = null;
         _btnTeamMessage.dispose();
         _btnTeamMessage = null;
         _btnSortRank.dispose();
         _btnSortRank = null;
         _btnSortPremiumCurrency.dispose();
         _btnSortPremiumCurrency = null;
         _btnSortGameCurrency.dispose();
         _btnSortGameCurrency = null;
         _btnSortGuildCompetition.dispose();
         _btnSortGuildCompetition = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _line6.dispose();
         _line6 = null;
         _line7.dispose();
         _line7 = null;
         _line8.dispose();
         _line8 = null;
         _line9.dispose();
         _line9 = null;
         _line10.dispose();
         _line10 = null;
         super.dispose();
      }
      
      public function refreshLocalization() : void
      {
         _btnProfile.tooltip = LocText.current.text("screen/guild/member_info/button_profile_tooltip");
         _btnMessage.tooltip = LocText.current.text("screen/guild/member_info/button_message_tooltip");
         _btnOptions.tooltip = LocText.current.text("screen/guild/member_info/button_options_tooltip");
         _btnTeamMessage.tooltip = LocText.current.text("screen/guild/member_info/button_team_mail_tooltip");
         _btnSortRank.tooltip = LocText.current.text("screen/guild/member_info/button_sort_rank_tooltip");
         _btnSortPremiumCurrency.tooltip = LocText.current.text("screen/guild/member_info/button_sort_premium_currency_tooltip");
         _btnSortGameCurrency.tooltip = LocText.current.text("screen/guild/member_info/button_sort_game_currency_tooltip");
         _btnSortGuildCompetition.tooltip = LocText.current.text("screen/guild/member_info/button_sort_guild_competition_tooltip");
      }
      
      public function resetOffset() : void
      {
         _offset = 0;
      }
      
      public function refresh(param1:Guild) : void
      {
         if(_guild != param1)
         {
            resetOffset();
         }
         _guild = param1;
         _btnOptions.buttonEnabled = param1.isOwnGuild;
         _btnTeamMessage.buttonEnabled = param1.isOwnGuild && param1.memberCount > 1;
         _btnSortRank.visible = param1.isOwnGuild;
         _btnSortPremiumCurrency.visible = param1.isOwnGuild;
         _btnSortGameCurrency.visible = param1.isOwnGuild;
         _btnSortGuildCompetition.visible = param1.isOwnGuild;
         if(_btnOptions.buttonEnabled)
         {
            _btnOptions.tooltip = LocText.current.text("screen/guild/member_info/button_options_tooltip");
         }
         else
         {
            _btnOptions.tooltip = "";
         }
         if(_btnTeamMessage.buttonEnabled)
         {
            _btnTeamMessage.tooltip = LocText.current.text("screen/guild/member_info/button_team_mail_tooltip");
         }
         else
         {
            _btnTeamMessage.tooltip = "";
         }
         refreshList(true);
         _btnProfile.visible = _btnProfile.visible && param1.status != 2;
         _btnMessage.visible = _btnMessage.visible && param1.status != 2;
         _btnOptions.visible = _btnOptions.visible && param1.status != 2;
         _btnTeamMessage.visible = _btnTeamMessage.visible && param1.status != 2;
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
      
      private function onClickSort(param1:int) : void
      {
         _btnSortRank.toggled = param1 == 0;
         _btnSortPremiumCurrency.toggled = param1 == 1;
         _btnSortGameCurrency.toggled = param1 == 2;
         _btnSortGuildCompetition.toggled = param1 == 3;
         _sortMode = param1;
         refreshList();
      }
      
      private function onClickProfile(param1:InteractionEvent) : void
      {
         doubleClickLine(_selectedLine);
      }
      
      private function onClickMessage(param1:InteractionEvent) : void
      {
         var _loc3_:String = "";
         var _loc5_:int = 0;
         var _loc4_:* = _selectedMembers;
         for each(var _loc2_ in _selectedMembers)
         {
            _loc3_ = _loc3_ + (_loc2_.name + ", ");
         }
         _loc3_ = _loc3_.substr(0,_loc3_.length - 2);
         Environment.panelManager.showDialog(new DialogMailCompose(_loc3_));
      }
      
      private function onClickOptions(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildMember(_selectedLine.member));
      }
      
      private function onClickTeamMessage(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogMailCompose(_guild.name,null,null,"team_mail",_guild.name));
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
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > currentMemberCount - 10)
         {
            _offset = currentMemberCount - 10;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get sortMode() : int
      {
         if(!_guild.isOwnGuild)
         {
            return 0;
         }
         return _sortMode;
      }
      
      private function get currentMemberCount() : int
      {
         return _guild.memberCount;
      }
      
      public function addSelectedMember(param1:GuildMember) : void
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         if(_selectedMembers.indexOf(param1) != -1)
         {
            _loc2_ = _selectedMembers.indexOf(param1);
            _selectedMembers.splice(_loc2_,1);
            return;
         }
         _selectedMembers.push(param1);
      }
      
      public function clearSelectedMembers() : void
      {
         _selectedMembers = new Vector.<GuildMember>();
      }
      
      private function get selectedMemberCount() : int
      {
         return _selectedMembers.length;
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:Number = NaN;
         if(_selectedLine != null && _selectedMembers.length == 0)
         {
            addSelectedMember(_selectedLine.member);
         }
         var _loc3_:Vector.<GuildMember> = _guild.getMembersSorted(sortMode);
         _btnScrollUp.visible = _loc3_.length > 10;
         _btnScrollDown.visible = _loc3_.length > 10;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentMemberCount - 10;
         _line1.refresh(_loc3_.length >= _offset + 1?_loc3_[_offset + 0]:null,1,sortMode);
         _line2.refresh(_loc3_.length >= _offset + 2?_loc3_[_offset + 1]:null,2,sortMode);
         _line3.refresh(_loc3_.length >= _offset + 3?_loc3_[_offset + 2]:null,3,sortMode);
         _line4.refresh(_loc3_.length >= _offset + 4?_loc3_[_offset + 3]:null,4,sortMode);
         _line5.refresh(_loc3_.length >= _offset + 5?_loc3_[_offset + 4]:null,5,sortMode);
         _line6.refresh(_loc3_.length >= _offset + 6?_loc3_[_offset + 5]:null,6,sortMode);
         _line7.refresh(_loc3_.length >= _offset + 7?_loc3_[_offset + 6]:null,7,sortMode);
         _line8.refresh(_loc3_.length >= _offset + 8?_loc3_[_offset + 7]:null,8,sortMode);
         _line9.refresh(_loc3_.length >= _offset + 9?_loc3_[_offset + 8]:null,9,sortMode);
         _line10.refresh(_loc3_.length >= _offset + 10?_loc3_[_offset + 9]:null,10,sortMode);
         if(sortMode != 0)
         {
            _loc4_ = Math.max(_line1.donationTextWidth,_line2.donationTextWidth,_line3.donationTextWidth,_line4.donationTextWidth,_line5.donationTextWidth,_line6.donationTextWidth,_line7.donationTextWidth,_line8.donationTextWidth,_line9.donationTextWidth,_line10.donationTextWidth);
            _loc2_ = 170 - _loc4_ - 21;
            _line1.refreshName(_loc2_);
            _line2.refreshName(_loc2_);
            _line3.refreshName(_loc2_);
            _line4.refreshName(_loc2_);
            _line5.refreshName(_loc2_);
            _line6.refreshName(_loc2_);
            _line7.refreshName(_loc2_);
            _line8.refreshName(_loc2_);
            _line9.refreshName(_loc2_);
            _line10.refreshName(_loc2_);
         }
         if(_selectedMembers.length > 0)
         {
            if(_selectedMembers.indexOf(_line1.member) != -1)
            {
               selectLine(_line1,false);
            }
            else if(_selectedMembers.indexOf(_line2.member) != -1)
            {
               selectLine(_line2,false);
            }
            else if(_selectedMembers.indexOf(_line3.member) != -1)
            {
               selectLine(_line3,false);
            }
            else if(_selectedMembers.indexOf(_line4.member) != -1)
            {
               selectLine(_line4,false);
            }
            else if(_selectedMembers.indexOf(_line5.member) != -1)
            {
               selectLine(_line5,false);
            }
            else if(_selectedMembers.indexOf(_line6.member) != -1)
            {
               selectLine(_line6,false);
            }
            else if(_selectedMembers.indexOf(_line7.member) != -1)
            {
               selectLine(_line7,false);
            }
            else if(_selectedMembers.indexOf(_line8.member) != -1)
            {
               selectLine(_line8,false);
            }
            else if(_selectedMembers.indexOf(_line9.member) != -1)
            {
               selectLine(_line9,false);
            }
            else if(_selectedMembers.indexOf(_line10.member) != -1)
            {
               selectLine(_line10,false);
            }
            else if(_line1.member != null && param1)
            {
               selectLine(_line1);
            }
         }
         else if(_line1.member != null && param1)
         {
            selectLine(_line1);
         }
      }
      
      private function selectLine(param1:UiGuildMemberInfoLine, param2:Boolean = true) : void
      {
         var _loc4_:Boolean = false;
         _selectedLine = param1;
         if(_selectedLine != null)
         {
            if(param2)
            {
               if(!InputCore.current.keyboard.isCtrlPressed)
               {
                  clearSelectedMembers();
               }
               addSelectedMember(_selectedLine.member);
            }
            _loc4_ = false;
            var _loc6_:int = 0;
            var _loc5_:* = _selectedMembers;
            for each(var _loc3_ in _selectedMembers)
            {
               if(_loc3_.isMe)
               {
                  _loc4_ = true;
                  break;
               }
            }
            _btnMessage.buttonEnabled = _selectedMembers.length > 0 && !_loc4_;
            _btnOptions.buttonEnabled = _guild.isOwnGuild && _selectedMembers.length == 1;
            _btnProfile.buttonEnabled = _selectedMembers.length == 1;
            if(_btnMessage.buttonEnabled)
            {
               _btnMessage.tooltip = LocText.current.text("screen/guild/member_info/button_message_tooltip");
            }
            else
            {
               _btnMessage.tooltip = "";
            }
         }
         _line1.highlight(_selectedMembers.indexOf(_line1.member) != -1);
         _line2.highlight(_selectedMembers.indexOf(_line2.member) != -1);
         _line3.highlight(_selectedMembers.indexOf(_line3.member) != -1);
         _line4.highlight(_selectedMembers.indexOf(_line4.member) != -1);
         _line5.highlight(_selectedMembers.indexOf(_line5.member) != -1);
         _line6.highlight(_selectedMembers.indexOf(_line6.member) != -1);
         _line7.highlight(_selectedMembers.indexOf(_line7.member) != -1);
         _line8.highlight(_selectedMembers.indexOf(_line8.member) != -1);
         _line9.highlight(_selectedMembers.indexOf(_line9.member) != -1);
         _line10.highlight(_selectedMembers.indexOf(_line10.member) != -1);
      }
      
      private function doubleClickLine(param1:UiGuildMemberInfoLine) : void
      {
         if(_selectedLine.member.id == User.current.character.id)
         {
            ViewManager.instance.showPanel("character");
            return;
         }
         ViewManager.instance.loadCharacter(_selectedLine.member.id,null);
      }
   }
}
