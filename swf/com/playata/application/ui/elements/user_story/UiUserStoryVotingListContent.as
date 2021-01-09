package com.playata.application.ui.elements.user_story
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.data.user_story.UserStoryListContext;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingListContentGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingListLineGeneric;
   
   public class UiUserStoryVotingListContent
   {
      
      public static var MAX_LINES:int = 10;
       
      
      private var _content:SymbolUserStoryVotingListContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _refreshEndTime:Function = null;
      
      private var _onClick:Function = null;
      
      private var _context:UserStoryListContext = null;
      
      private var _selectedLine:UiUserStoryVotingListLine = null;
      
      private var _userStoryLines:Vector.<UiUserStoryVotingListLine> = null;
      
      public function UiUserStoryVotingListContent(param1:SymbolUserStoryVotingListContentGeneric, param2:Function, param3:Function, param4:Function, param5:UserStoryListContext)
      {
         var _loc6_:int = 0;
         super();
         _content = param1;
         _refreshButtons = param2;
         _refreshEndTime = param3;
         _onClick = param4;
         _context = param5;
         param1.txtCaptionTag.text = LocText.current.text("dialog/user_story/column_tag");
         param1.txtCaptionStage.text = LocText.current.text("dialog/user_story/column_stage");
         param1.txtCaptionTitle.text = LocText.current.text("dialog/user_story/column_title");
         param1.txtCaptionDate.text = LocText.current.text("dialog/user_story/column_date");
         _userStoryLines = new Vector.<UiUserStoryVotingListLine>();
         _loc6_ = 1;
         while(_loc6_ <= MAX_LINES)
         {
            _userStoryLines.push(new UiUserStoryVotingListLine(param1.getChildByName("line" + _loc6_) as SymbolUserStoryVotingListLineGeneric,_loc6_,selectLine,doubleClickLine));
            param1.getChildByName("line" + _loc6_).visible = false;
            _loc6_++;
         }
         param1.txtNoUserStories.text = LocText.current.text("dialog/user_story/no_user_stories",CConstant.user_story_hall_of_fame_limit);
         param1.txtNoUserStories.visible = false;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _userStoryLines.length)
         {
            _userStoryLines[_loc1_].dispose();
            _loc1_++;
         }
         _userStoryLines = null;
         _selectedLine = null;
      }
      
      public function show() : void
      {
         if(!TimeUtil.serverDateTime.isToday(_context.lastRefresh))
         {
            _context.reset(false);
         }
         if(_context.maxUserStories == -1)
         {
            retrieveUserStoryList();
         }
         else
         {
            refreshList();
         }
      }
      
      public function get currentUserStory() : UserStory
      {
         return _context.curentUserStory;
      }
      
      public function get userStoryCount() : int
      {
         return _context.userStoryIds.length;
      }
      
      private function selectLine(param1:UiUserStoryVotingListLine) : void
      {
         var _loc2_:int = 0;
         _selectedLine = param1;
         if(_selectedLine != null)
         {
            _context.curentUserStory = _selectedLine.userStory;
         }
         else
         {
            _context.curentUserStory = null;
         }
         _loc2_ = 0;
         while(_loc2_ < _userStoryLines.length)
         {
            _userStoryLines[_loc2_].highlight(_userStoryLines[_loc2_] == _selectedLine);
            _loc2_++;
         }
      }
      
      private function doubleClickLine(param1:UiUserStoryVotingListLine) : void
      {
         selectLine(param1);
      }
      
      public function refreshList() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(!_userStoryLines)
         {
            return;
         }
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedLine != null)
         {
            _context.curentUserStory = _selectedLine.userStory;
         }
         var _loc1_:int = _context.offset;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         _loc2_ = 0;
         while(_loc2_ < _userStoryLines.length)
         {
            _userStoryLines[_loc2_].refresh(_context.userStoryIds.length >= _loc1_ + _loc2_ + 1?_context.userStoryIds[_loc1_ + _loc2_]:0,_loc2_ + 1);
            _loc2_++;
         }
         if(_context.curentUserStory)
         {
            _loc3_ = false;
            _loc2_ = 0;
            while(_loc2_ < _userStoryLines.length)
            {
               if(_userStoryLines[_loc2_].userStory && _userStoryLines[_loc2_].userStory.id == _context.curentUserStory.id)
               {
                  selectLine(_userStoryLines[_loc2_]);
                  _loc3_ = true;
                  break;
               }
               _loc2_++;
            }
            if(!_loc3_)
            {
               selectLine(null);
            }
         }
         else
         {
            selectLine(null);
         }
         _content.txtNoUserStories.visible = false;
         if(_context.userStoryIds.length <= 0)
         {
            if(UiUserStoryFilter.areAllLocalesSelected)
            {
               _content.txtNoUserStories.text = LocText.current.text("dialog/user_story/no_user_stories",CConstant.user_story_hall_of_fame_limit);
            }
            else
            {
               _content.txtNoUserStories.text = LocText.current.text("dialog/user_story/no_user_stories_filtered",CConstant.user_story_hall_of_fame_limit);
            }
            _content.txtNoUserStories.visible = true;
         }
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         _context.offset = _context.offset - param1;
         if(_context.offset < 0)
         {
            _context.offset = 0;
            if(_context.userStoryIds.length == 0)
            {
               return;
            }
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         _context.offset = _context.offset + param1;
         if(_context.offset > userStoryCount - MAX_LINES)
         {
            _context.offset = userStoryCount - MAX_LINES;
            if(_context.userStoryIds.length == 0)
            {
               return;
            }
            if(_context.userStoryIds.length >= _context.maxUserStories)
            {
               refreshList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            retrieveUserStoryList();
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function retrieveUserStoryList() : void
      {
         Environment.application.sendActionRequest("getUserStoryList",{
            "voting_list":true,
            "offset":_context.userStoryIds.length,
            "locales":_context.getJsonLocales()
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = param1.action;
         if("getUserStoryList" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_userStoryLines)
            {
               return;
            }
            _context.lastRefresh = TimeUtil.now;
            _loc4_ = 0;
            var _loc3_:* = param1.appResponse.user_story_ids;
            for each(var _loc2_ in param1.appResponse.user_story_ids)
            {
               if(_context.userStoryIds.indexOf(_loc2_) < 0)
               {
                  _context.userStoryIds.push(_loc2_);
               }
            }
            _context.maxUserStories = param1.appResponse.user_story_count;
            _refreshEndTime(param1.appResponse.user_stories_end_timestamp);
            refreshList();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
   }
}
