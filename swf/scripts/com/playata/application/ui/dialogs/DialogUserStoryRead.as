package com.playata.application.ui.dialogs
{
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.data.user_story.UserStoryListContext;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.UiLabelScrollContainer;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUserStoryReadGeneric;
   
   public class DialogUserStoryRead extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabBriefing:UiTabButton = null;
      
      private var _btnTabOutro:UiTabButton = null;
      
      private var _btnPreviousUserStory:UiButton = null;
      
      private var _btnNextUserStory:UiButton = null;
      
      private var _btnReport:UiTextButton = null;
      
      private var _tagTooltip:UiTextTooltip = null;
      
      private var _userStory:UserStory = null;
      
      private var _userStoryListContext:UserStoryListContext = null;
      
      private var _backgroundDefaultHight:Number = 0;
      
      private var _reportButtonVisible:Boolean = true;
      
      private var _briefingOutroScrollContainer:UiLabelScrollContainer = null;
      
      public function DialogUserStoryRead(param1:UserStory, param2:UserStoryListContext, param3:Boolean = true)
      {
         var _loc4_:SymbolDialogUserStoryReadGeneric = new SymbolDialogUserStoryReadGeneric();
         super(_loc4_);
         _queued = false;
         _userStoryListContext = param2;
         _reportButtonVisible = param3;
         _btnTabBriefing = new UiTabButton(_loc4_.btnTabBriefing,LocText.current.text("dialog/user_story_read/btn_tab_briefing"),"",onClickTabBriefing);
         _btnTabOutro = new UiTabButton(_loc4_.btnTabOutro,LocText.current.text("dialog/user_story_read/btn_tab_outro"),"",onClickTabOutro);
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnReport = new UiTextButton(_loc4_.btnReport,LocText.current.text("dialog/user_story_report/button_report"),"",onClickReport);
         _btnReport.visible = false;
         _btnPreviousUserStory = new UiButton(_loc4_.btnPreviousUserStory,"",onClickPreviousUserStory);
         _btnNextUserStory = new UiButton(_loc4_.btnNextUserStory,"",onClickNextUserStory);
         _tagTooltip = new UiTextTooltip(_loc4_.iconTag,"",requestTagTootip);
         _loc4_.txtCaptionDate.text = LocText.current.text("dialog/user_story_read/caption_date");
         _loc4_.txtTitle.autoFontSize = true;
         _btnTabBriefing.tabbed = true;
         _btnTabOutro.tabbed = false;
         _backgroundDefaultHight = _loc4_.background.height;
         _briefingOutroScrollContainer = new UiLabelScrollContainer(_loc4_.txtBriefingOutro,Direction.VERTICAL,true,false,true,false,true);
         setUserStory(param1);
      }
      
      override public function dispose() : void
      {
         _btnTabBriefing.dispose();
         _btnTabBriefing = null;
         _btnTabOutro.dispose();
         _btnTabOutro = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnPreviousUserStory.dispose();
         _btnPreviousUserStory = null;
         _btnNextUserStory.dispose();
         _btnNextUserStory = null;
         _btnReport.dispose();
         _btnReport = null;
         _tagTooltip.dispose();
         _tagTooltip = null;
         _briefingOutroScrollContainer.dispose();
         _briefingOutroScrollContainer = null;
         _userStory = null;
         _userStoryListContext = null;
         super.dispose();
      }
      
      private function requestTagTootip() : String
      {
         if(!_userStory)
         {
            return "";
         }
         return _userStory.tagName + "\n\n" + _userStory.tagTooltip;
      }
      
      private function setUserStory(param1:UserStory) : void
      {
         var _loc2_:SymbolDialogUserStoryReadGeneric = _vo as SymbolDialogUserStoryReadGeneric;
         _loc2_.txtTitle.text = "";
         _loc2_.txtDate.text = "";
         _loc2_.txtStage.text = "";
         _loc2_.txtAuthor.text = "";
         _briefingOutroScrollContainer.text = "";
         _btnPreviousUserStory.visible = false;
         _btnNextUserStory.visible = false;
         _loc2_.txtAuthor.visible = false;
         _loc2_.iconGenderMale.visible = false;
         _loc2_.iconGenderFemale.visible = false;
         _loc2_.iconServer.visible = false;
         _loc2_.txtServerId.visible = false;
         _loc2_.iconLocale.visible = false;
         _loc2_.iconTag.visible = false;
         if(!param1)
         {
            return;
         }
         _btnReport.visible = _reportButtonVisible && param1.canBeReported();
         if(_btnReport.visible)
         {
            _loc2_.background.height = _backgroundDefaultHight;
         }
         else
         {
            _loc2_.background.height = _backgroundDefaultHight - 50;
         }
         if(!param1.hasData("briefing") || !param1.hasData("ts_creation"))
         {
            Environment.application.sendActionRequest("getUserStory",{"user_story_id":param1.id},handleRequests);
            return;
         }
         _userStory = param1;
         init();
      }
      
      public function init() : void
      {
         if(!_userStory)
         {
            return;
         }
         var _loc1_:SymbolDialogUserStoryReadGeneric = _vo as SymbolDialogUserStoryReadGeneric;
         _loc1_.txtTitle.text = _userStory.title;
         _loc1_.txtDate.text = _userStory.dateTime;
         _loc1_.txtStage.text = _userStory.stageName;
         if(_userStory.status == 3)
         {
            _loc1_.txtAuthor.text = _userStory.characterName;
            _loc1_.txtAuthor.visible = true;
            _loc1_.iconGenderMale.visible = _userStory.isMale;
            _loc1_.iconGenderFemale.visible = _userStory.isFemale;
            if(!_userStory.isOwnServer)
            {
               _loc1_.txtServerId.visible = true;
               _loc1_.txtServerId.text = _userStory.serverId;
               _loc1_.iconServer.visible = true;
               _loc1_.iconServer.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(ServerInfo.getLocaleFromServer(_userStory.serverId)));
               _loc1_.iconGenderFemale.x = -85;
               _loc1_.iconGenderMale.x = -86;
            }
            else
            {
               _loc1_.iconGenderFemale.x = -13;
               _loc1_.iconGenderMale.x = -12;
            }
            _loc1_.txtStage.y = _loc1_.txtAuthor.y + 30;
         }
         else
         {
            _loc1_.txtStage.y = _loc1_.txtAuthor.y;
         }
         _loc1_.iconTag.y = _loc1_.txtStage.y + 12;
         _loc1_.iconLocale.y = _loc1_.txtStage.y + 3;
         var _loc2_:* = _loc1_.txtStage.y + 57;
         _loc1_.btnTabOutro.y = _loc2_;
         _loc1_.btnTabBriefing.y = _loc2_;
         _loc1_.txtBriefingOutro.y = _loc1_.btnTabOutro.y + 33;
         _loc2_ = _loc1_.txtBriefingOutro.y + 182;
         _loc1_.txtDate.y = _loc2_;
         _loc1_.txtCaptionDate.y = _loc2_;
         _loc1_.btnReport.y = _loc1_.txtCaptionDate.y + 54;
         _loc1_.iconLocale.visible = true;
         _loc1_.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_userStory.locale));
         _loc1_.iconTag.visible = true;
         _loc1_.iconTag.gotoAndStop(_userStory.tag);
         _loc1_.iconTag.x = _loc1_.txtStage.x - _loc1_.iconTag.width / 2 - 5;
         _loc1_.iconLocale.x = _loc1_.iconTag.x - _loc1_.iconTag.width / 2 - _loc1_.iconLocale.width - 5;
         if(_btnTabBriefing.tabbed == true)
         {
            onClickTabBriefing(null);
         }
         else
         {
            onClickTabOutro(null);
         }
         if(_userStoryListContext && _userStoryListContext.userStoryIds.indexOf(_userStory.id) >= 0)
         {
            _btnPreviousUserStory.visible = true;
            _btnNextUserStory.visible = true;
            _btnPreviousUserStory.enabled = _userStoryListContext.userStoryIds.indexOf(_userStory.id) > 0;
            _btnNextUserStory.enabled = _userStoryListContext.userStoryIds[_userStoryListContext.userStoryIds.length - 1] != _userStory.id;
         }
         _btnReport.visible = _reportButtonVisible && _userStory.canBeReported();
         _loc1_.background.height = _backgroundDefaultHight;
         if(_userStory.status != 3)
         {
            _loc1_.background.height = _loc1_.background.height - 30;
         }
         if(!_btnReport.visible)
         {
            _loc1_.background.height = _loc1_.background.height - 50;
         }
      }
      
      private function onClickTabBriefing(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogUserStoryReadGeneric = _vo as SymbolDialogUserStoryReadGeneric;
         _btnTabBriefing.tabbed = true;
         _btnTabOutro.tabbed = false;
         _briefingOutroScrollContainer.text = _userStory.briefing;
      }
      
      private function onClickTabOutro(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogUserStoryReadGeneric = _vo as SymbolDialogUserStoryReadGeneric;
         _btnTabBriefing.tabbed = false;
         _btnTabOutro.tabbed = true;
         _briefingOutroScrollContainer.text = _userStory.outro;
      }
      
      private function onClickPreviousUserStory(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_userStoryListContext && _userStoryListContext.userStoryIds.indexOf(_userStory.id) >= 0)
         {
            _loc2_ = _userStoryListContext.userStoryIds.indexOf(_userStory.id);
            if(_loc2_ > 0)
            {
               setUserStory(UserStories.getUserStory(_userStoryListContext.userStoryIds[_loc2_ - 1]));
            }
         }
      }
      
      private function onClickNextUserStory(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_userStoryListContext && _userStoryListContext.userStoryIds.indexOf(_userStory.id) >= 0)
         {
            _loc2_ = _userStoryListContext.userStoryIds.indexOf(_userStory.id);
            if(_loc2_ < _userStoryListContext.userStoryIds.length - 1)
            {
               setUserStory(UserStories.getUserStory(_userStoryListContext.userStoryIds[_loc2_ + 1]));
            }
         }
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogReportUserStory(_userStory,onUserStoryReported));
      }
      
      private function onUserStoryReported() : void
      {
         setUserStory(_userStory);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("getUserStory" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            setUserStory(UserStories.getUserStory(param1.appResponse.user_story.id));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
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
