package com.playata.application.ui.elements.user_story
{
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.ui.dialogs.DialogReportUserStory;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingListLineGeneric;
   
   public class UiUserStoryVotingListLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolUserStoryVotingListLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _userStory:UserStory = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _tagTooltip:UiTextTooltip = null;
      
      private var _btnReport:UiButton = null;
      
      public function UiUserStoryVotingListLine(param1:SymbolUserStoryVotingListLineGeneric, param2:int, param3:Function, param4:Function)
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
         _content.iconLocale.visible = true;
         _content.iconLocale.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(_userStory.locale));
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
