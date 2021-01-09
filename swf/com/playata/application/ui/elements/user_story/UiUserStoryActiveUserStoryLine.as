package com.playata.application.ui.elements.user_story
{
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.InteractiveDisplayObject;
   import visuals.ui.elements.user_story.SymbolActiveUserStoryLineGeneric;
   
   public class UiUserStoryActiveUserStoryLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolActiveUserStoryLineGeneric = null;
      
      private var _userStory:UserStory = null;
      
      private var _tagTooltip:UiTextTooltip = null;
      
      public function UiUserStoryActiveUserStoryLine(param1:SymbolActiveUserStoryLineGeneric)
      {
         _content = param1;
         super(_content);
         _tagTooltip = new UiTextTooltip(_content.iconTag,"",requestTagTootip);
         _content.txtStage.autoFontSize = true;
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
         super.dispose();
      }
      
      public function refresh() : void
      {
         _userStory = UserStories.getActiveUserStory();
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
      }
   }
}
