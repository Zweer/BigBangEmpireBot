package com.playata.application.ui.elements.user_story
{
   import com.playata.framework.display.InteractiveDisplayObject;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingStarGeneric;
   
   public class UiUserStoryVotingStar extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolUserStoryVotingStarGeneric = null;
      
      public function UiUserStoryVotingStar(param1:SymbolUserStoryVotingStarGeneric, param2:Function, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         onInteractionOver.add(param2);
         onInteractionOut.add(param3);
         this.onClick.add(param4);
         _content.fill.alpha = 0;
      }
      
      override public function dispose() : void
      {
         onInteractionOver.removeAll();
         onInteractionOut.removeAll();
         onClick.removeAll();
         super.dispose();
      }
      
      public function refresh(param1:Boolean) : void
      {
         _content.fill.killTweens();
         if(param1)
         {
            _content.fill.tweenTo(0.3,{"alpha":1});
         }
         else
         {
            _content.fill.tweenTo(0.3,{"alpha":0});
         }
      }
   }
}
