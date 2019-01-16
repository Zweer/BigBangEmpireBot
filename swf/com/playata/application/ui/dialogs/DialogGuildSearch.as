package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.dataobject.DOGuildListEntry;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildSearchResult;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.guild.UiGuildSearchLine;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildSearchGeneric;
   
   public class DialogGuildSearch extends UiDialog
   {
      
      public static const MAX_LINES:int = 12;
      
      public static const SCROLL_VALUE:int = 5;
      
      private static var _guilds:Vector.<GuildSearchResult> = new Vector.<GuildSearchResult>();
      
      private static var _guildsOpen:Vector.<GuildSearchResult>;
      
      private static var _guildsNotOpen:Vector.<GuildSearchResult>;
      
      private static var _currentGuild:GuildSearchResult = null;
      
      private static var _selectedLine:UiGuildSearchLine = null;
      
      private static var _offset:int = 0;
      
      private static var _autoOpen:Boolean = false;
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnTabOpen:UiTabButton = null;
      
      private var _btnTabNotOpen:UiTabButton = null;
      
      private var _btnView:UiTextButton = null;
      
      private var _btnApply:UiTextButton = null;
      
      private var _btnAllGuilds:UiTextButton = null;
      
      private var _line1:UiGuildSearchLine = null;
      
      private var _line2:UiGuildSearchLine = null;
      
      private var _line3:UiGuildSearchLine = null;
      
      private var _line4:UiGuildSearchLine = null;
      
      private var _line5:UiGuildSearchLine = null;
      
      private var _line6:UiGuildSearchLine = null;
      
      private var _line7:UiGuildSearchLine = null;
      
      private var _line8:UiGuildSearchLine = null;
      
      private var _line9:UiGuildSearchLine = null;
      
      private var _line10:UiGuildSearchLine = null;
      
      private var _line11:UiGuildSearchLine = null;
      
      private var _line12:UiGuildSearchLine = null;
      
      public function DialogGuildSearch()
      {
         var _loc1_:SymbolDialogGuildSearchGeneric = new SymbolDialogGuildSearchGeneric();
         super(_loc1_);
         _queued = false;
         _isOpen = true;
         _loc1_.txtNoGuilds.text = LocText.current.text("dialog/guild_search/no_guilds");
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/guild_search/title");
         _loc1_.txtNameCaption.htmlText = LocText.current.text("dialog/guild_search/column_name");
         _loc1_.txtMembersCaption.htmlText = LocText.current.text("dialog/guild_search/column_members");
         _loc1_.txtTotalPercentageCaption.htmlText = LocText.current.text("dialog/guild_search/column_total_percentage");
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnUp,LocText.current.text("dialog/leadboard/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnDown,LocText.current.text("dialog/leadboard/button_scroll_down"),onClickScrollDown);
         _btnView = new UiTextButton(_loc1_.btnView,LocText.current.text("dialog/guild_search/button_view"),LocText.current.text("dialog/guild_search/button_view_tooltip"),onClickView);
         _btnApply = new UiTextButton(_loc1_.btnApply,LocText.current.text("dialog/guild_search/button_apply"),LocText.current.text("dialog/guild_search/button_apply_tooltip"),onClickApply);
         _btnAllGuilds = new UiTextButton(_loc1_.btnAllGuilds,LocText.current.text("dialog/guild_search/button_all_guilds"),LocText.current.text("dialog/guild_search/button_all_guilds_tooltip"),onClickAllGuilds);
         _btnTabOpen = new UiTabButton(_loc1_.btnTabOpen,LocText.current.text("dialog/guild_search/button_tab_open"),"",onClickTabOpen);
         _btnTabOpen.visible = false;
         _btnTabNotOpen = new UiTabButton(_loc1_.btnTabNotOpen,LocText.current.text("dialog/guild_search/button_tab_not_open"),"",onClickTabNotOpen);
         _btnTabNotOpen.visible = false;
         _line1 = new UiGuildSearchLine(_loc1_.line1,1,selectLine,doubleClickLine);
         _line2 = new UiGuildSearchLine(_loc1_.line2,2,selectLine,doubleClickLine);
         _line3 = new UiGuildSearchLine(_loc1_.line3,3,selectLine,doubleClickLine);
         _line4 = new UiGuildSearchLine(_loc1_.line4,4,selectLine,doubleClickLine);
         _line5 = new UiGuildSearchLine(_loc1_.line5,5,selectLine,doubleClickLine);
         _line6 = new UiGuildSearchLine(_loc1_.line6,6,selectLine,doubleClickLine);
         _line7 = new UiGuildSearchLine(_loc1_.line7,7,selectLine,doubleClickLine);
         _line8 = new UiGuildSearchLine(_loc1_.line8,8,selectLine,doubleClickLine);
         _line9 = new UiGuildSearchLine(_loc1_.line9,9,selectLine,doubleClickLine);
         _line10 = new UiGuildSearchLine(_loc1_.line10,10,selectLine,doubleClickLine);
         _line11 = new UiGuildSearchLine(_loc1_.line11,11,selectLine,doubleClickLine);
         _line12 = new UiGuildSearchLine(_loc1_.line12,12,selectLine,doubleClickLine);
         onMouseWheel.add(handleMouseWheel);
         refreshList();
         if(_guilds.length == 0)
         {
            Environment.application.sendActionRequest("getGuildList",{},handleRequests);
         }
         else
         {
            updateButtons();
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public static function get autoOpen() : Boolean
      {
         return _autoOpen;
      }
      
      public static function set autoOpen(param1:Boolean) : void
      {
         _autoOpen = param1;
      }
      
      public static function reset() : void
      {
         _guilds = new Vector.<GuildSearchResult>();
         _guildsOpen = new Vector.<GuildSearchResult>();
         _guildsNotOpen = new Vector.<GuildSearchResult>();
         _currentGuild = null;
         _selectedLine = null;
         _offset = 0;
      }
      
      private function updateButtons() : void
      {
         if(!_btnClose)
         {
            return;
         }
         if(_guildsOpen.length > 0 && _guildsNotOpen.length > 0)
         {
            var _loc1_:Boolean = true;
            _btnTabOpen.visible = _loc1_;
            _btnTabNotOpen.visible = _loc1_;
         }
         if(_guildsOpen.length > 0)
         {
            onClickTabOpen(null);
         }
         else
         {
            onClickTabNotOpen(null);
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnView.dispose();
         _btnView = null;
         _btnApply.dispose();
         _btnApply = null;
         _btnAllGuilds.dispose();
         _btnAllGuilds = null;
         _btnTabOpen.dispose();
         _btnTabOpen = null;
         _btnTabNotOpen.dispose();
         _btnTabNotOpen = null;
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
         _line11.dispose();
         _line11 = null;
         _line12.dispose();
         _line12 = null;
         super.dispose();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function sortByRandom(param1:GuildSearchResult, param2:GuildSearchResult) : int
      {
         if(AppConfig.teamLocaleEnabled && param1.locale != param2.locale)
         {
            if(param1.locale == User.current.locale)
            {
               return -1;
            }
            if(param2.locale == User.current.locale)
            {
               return 1;
            }
         }
         return NumberUtil.randomInt(-1,1);
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
         if(_offset > currentGuildCount - 12)
         {
            _offset = currentGuildCount - 12;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentGuildCount() : int
      {
         return _guilds.length;
      }
      
      private function refreshList(param1:Boolean = false, param2:GuildSearchResult = null) : void
      {
         if(!_btnView)
         {
            return;
         }
         var _loc3_:SymbolDialogGuildSearchGeneric = _vo as SymbolDialogGuildSearchGeneric;
         _btnView.buttonEnabled = _guilds.length > 0;
         _btnApply.buttonEnabled = _guilds.length > 0;
         _btnAllGuilds.buttonEnabled = _guilds.length > 0;
         _loc3_.txtNoGuilds.visible = _guilds.length == 0;
         if(_selectedLine != null)
         {
            _currentGuild = _selectedLine.guild;
         }
         _btnScrollUp.visible = _guilds.length > 12;
         _btnScrollDown.visible = _guilds.length > 12;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentGuildCount - 12;
         _line1.refresh(_guilds.length >= _offset + 1?_guilds[_offset + 0]:null,1);
         _line2.refresh(_guilds.length >= _offset + 2?_guilds[_offset + 1]:null,2);
         _line3.refresh(_guilds.length >= _offset + 3?_guilds[_offset + 2]:null,3);
         _line4.refresh(_guilds.length >= _offset + 4?_guilds[_offset + 3]:null,4);
         _line5.refresh(_guilds.length >= _offset + 5?_guilds[_offset + 4]:null,5);
         _line6.refresh(_guilds.length >= _offset + 6?_guilds[_offset + 5]:null,6);
         _line7.refresh(_guilds.length >= _offset + 7?_guilds[_offset + 6]:null,7);
         _line8.refresh(_guilds.length >= _offset + 8?_guilds[_offset + 7]:null,8);
         _line9.refresh(_guilds.length >= _offset + 9?_guilds[_offset + 8]:null,9);
         _line10.refresh(_guilds.length >= _offset + 10?_guilds[_offset + 9]:null,10);
         _line11.refresh(_guilds.length >= _offset + 11?_guilds[_offset + 10]:null,11);
         _line12.refresh(_guilds.length >= _offset + 12?_guilds[_offset + 11]:null,12);
         if(_currentGuild != null && !param1)
         {
            if(_line1.guild == _currentGuild)
            {
               selectLine(_line1);
            }
            else if(_line2.guild == _currentGuild)
            {
               selectLine(_line2);
            }
            else if(_line3.guild == _currentGuild)
            {
               selectLine(_line3);
            }
            else if(_line4.guild == _currentGuild)
            {
               selectLine(_line4);
            }
            else if(_line5.guild == _currentGuild)
            {
               selectLine(_line5);
            }
            else if(_line6.guild == _currentGuild)
            {
               selectLine(_line6);
            }
            else if(_line7.guild == _currentGuild)
            {
               selectLine(_line7);
            }
            else if(_line8.guild == _currentGuild)
            {
               selectLine(_line8);
            }
            else if(_line9.guild == _currentGuild)
            {
               selectLine(_line9);
            }
            else if(_line10.guild == _currentGuild)
            {
               selectLine(_line10);
            }
            else if(_line11.guild == _currentGuild)
            {
               selectLine(_line11);
            }
            else if(_line12.guild == _currentGuild)
            {
               selectLine(_line12);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(param1 && param2 != null)
         {
            if(_line1.guild == param2)
            {
               selectLine(_line1);
            }
            else if(_line2.guild == param2)
            {
               selectLine(_line2);
            }
            else if(_line3.guild == param2)
            {
               selectLine(_line3);
            }
            else if(_line4.guild == param2)
            {
               selectLine(_line4);
            }
            else if(_line5.guild == param2)
            {
               selectLine(_line5);
            }
            else if(_line6.guild == param2)
            {
               selectLine(_line6);
            }
            else if(_line7.guild == param2)
            {
               selectLine(_line7);
            }
            else if(_line8.guild == param2)
            {
               selectLine(_line8);
            }
            else if(_line9.guild == param2)
            {
               selectLine(_line9);
            }
            else if(_line10.guild == param2)
            {
               selectLine(_line10);
            }
            else if(_line11.guild == param2)
            {
               selectLine(_line11);
            }
            else if(_line12.guild == param2)
            {
               selectLine(_line12);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(_line1.guild != null && param1)
         {
            selectLine(_line1);
         }
      }
      
      private function selectLine(param1:UiGuildSearchLine) : void
      {
         _selectedLine = param1;
         _line1.highlight(_line1 == _selectedLine);
         _line2.highlight(_line2 == _selectedLine);
         _line3.highlight(_line3 == _selectedLine);
         _line4.highlight(_line4 == _selectedLine);
         _line5.highlight(_line5 == _selectedLine);
         _line6.highlight(_line6 == _selectedLine);
         _line7.highlight(_line7 == _selectedLine);
         _line8.highlight(_line8 == _selectedLine);
         _line9.highlight(_line9 == _selectedLine);
         _line10.highlight(_line10 == _selectedLine);
         _line11.highlight(_line11 == _selectedLine);
         _line12.highlight(_line12 == _selectedLine);
      }
      
      private function doubleClickLine(param1:UiGuildSearchLine) : void
      {
         selectLine(param1);
         onClickView(null);
      }
      
      private function onClickView(param1:InteractionEvent) : void
      {
         if(!_selectedLine || !_selectedLine.guild)
         {
            return;
         }
         if(_selectedLine.guild.id == User.current.character.guildId)
         {
            ViewManager.instance.showPanel("guild");
            return;
         }
         Environment.application.sendActionRequest("getGuild",{"guild_id":_selectedLine.guild.id},handleRequests);
      }
      
      private function onClickApply(param1:InteractionEvent) : void
      {
         if(!_selectedLine || _selectedLine.guild == null)
         {
            return;
         }
         if(_btnTabOpen.tabbed)
         {
            Environment.panelManager.showDialog(new DialogGuildJoinInfo(_selectedLine.guild.id,_selectedLine.guild.name,close));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogMailCompose(_selectedLine.guild.leaderName,LocText.current.text("screen/guild/guild_info/apply_mail_subject_text",_selectedLine.guild.name),LocText.current.text("screen/guild/guild_info/apply_mail_body_text"),"guild_application"));
         }
      }
      
      private function onClickAllGuilds(param1:InteractionEvent) : void
      {
         _autoOpen = false;
         close();
         DialogLeaderboard.activeLeaderboard = 2;
         Environment.panelManager.showDialog(new DialogLeaderboard());
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         _autoOpen = false;
         close();
      }
      
      private function onClickTabOpen(param1:InteractionEvent) : void
      {
         if(_btnTabOpen.tabbed && !_btnTabNotOpen.tabbed)
         {
            return;
         }
         _btnTabOpen.tabbed = true;
         _btnTabNotOpen.tabbed = false;
         _btnApply.caption = LocText.current.text("dialog/guild_search/button_join");
         _btnApply.tooltip = LocText.current.text("dialog/guild_search/button_join_tooltip");
         _offset = 0;
         _guilds = _guildsOpen;
         refreshList(true);
      }
      
      private function onClickTabNotOpen(param1:InteractionEvent) : void
      {
         if(!_btnTabOpen.tabbed && _btnTabNotOpen.tabbed)
         {
            return;
         }
         _btnTabOpen.tabbed = false;
         _btnTabNotOpen.tabbed = true;
         _btnApply.caption = LocText.current.text("dialog/guild_search/button_apply");
         _btnApply.tooltip = LocText.current.text("dialog/guild_search/button_apply_tooltip");
         _offset = 0;
         _guilds = _guildsNotOpen;
         refreshList(true);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "getGuildList":
               if(param1.error == "")
               {
                  _guildsOpen = new Vector.<GuildSearchResult>();
                  _guildsNotOpen = new Vector.<GuildSearchResult>();
                  _loc6_ = 0;
                  var _loc5_:* = param1.appResponse.guild_entries;
                  for each(var _loc2_ in param1.appResponse.guild_entries)
                  {
                     _loc3_ = new GuildSearchResult(_loc2_);
                     if(_loc3_.isOpen)
                     {
                        _guildsOpen.push(_loc3_);
                     }
                     else
                     {
                        _guildsNotOpen.push(_loc3_);
                     }
                  }
                  _guildsOpen.sort(sortByRandom);
                  _guildsNotOpen.sort(sortByRandom);
                  updateButtons();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc4_ = Guild.fromData(param1.data);
                  ViewManager.instance.showGuild(_loc4_);
                  _autoOpen = true;
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
