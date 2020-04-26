package com.playata.application.ui.elements.user_story
{
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.dialogs.DialogReportUserStory;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.user_story.SymbolUserStoryHallOfFameListLineGeneric;
   
   public class UiUserStoryHallOfFameListLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolUserStoryHallOfFameListLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _userStory:UserStory = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _tagTooltip:UiTextTooltip = null;
      
      private var _btnReport:UiButton = null;
      
      public function UiUserStoryHallOfFameListLine(param1:SymbolUserStoryHallOfFameListLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         _tagTooltip = new UiTextTooltip(_content.iconTag,"",requestTagTootip);
         _btnReport = new UiButton(_content.btnReport,LocText.current.text("dialog/user_story_report/button_report"),onClickReport);
         _btnReport.visible = false;
         useHandCursor = false;
         _content.txtServerId.autoFontSize = true;
         _content.txtName.autoFontSize = true;
         _content.txtStage.autoFontSize = true;
         _content.txtDate.autoFontSize = true;
      }
      
      private function requestTagTootip() : String
      {
         if(!_userStory)
         {
            return "";
         }
         return _userStory.tagName + "\n\n" + _userStory.tagTooltip;
      }
      
      override public function dispose() : void
      {
         _tagTooltip.dispose();
         _tagTooltip = null;
         _btnReport.dispose();
         _btnReport = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get userStory() : UserStory
      {
         return _userStory;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         _index = param2;
         _userStory = UserStories.getUserStory(param1);
         if(_userStory == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         if(!_userStory.isOwnServer)
         {
            _content.txtServerId.text = _userStory.serverId;
            _content.txtServerId.visible = true;
            _content.txtName.x = 90;
            _content.txtName.width = 89;
            _content.iconServer.visible = true;
            _content.iconServer.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(ServerInfo.getLocaleFromServer(_userStory.serverId)));
         }
         else
         {
            _content.txtServerId.visible = false;
            _content.txtName.x = 26;
            _content.txtName.width = 153;
            _content.iconServer.visible = false;
         }
         _content.iconLocale.visible = true;
         _content.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_userStory.locale));
         _content.txtName.setTextToFit(_userStory.characterName,"...");
         _content.txtName.textColor = !!_userStory.isMe?245728:Number(!!_userStory.isMyGuildMember?16711908:14342874);
         _content.iconGenderMale.visible = _userStory.isMale;
         _content.iconGenderFemale.visible = _userStory.isFemale;
         _content.iconTag.gotoAndStop(_userStory.tag);
         _content.txtStage.text = _userStory.stageName;
         _content.txtTitle.setTextToFit(_userStory.title,"...");
         _content.txtDate.text = _userStory.dateTime;
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
         _btnReport.visible = _userStory.canBeReported();
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogReportUserStory(_userStory,null,true));
      }
   }
}
