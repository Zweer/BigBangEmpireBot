package com.playata.application.ui.elements.user_story
{
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingGeneric;
   
   public class UiUserStoryVoting
   {
       
      
      private var _content:SymbolUserStoryVotingGeneric = null;
      
      private var _votingStars:Vector.<UiUserStoryVotingStar>;
      
      private var _onStarSelected:Function = null;
      
      private var _userStoryStars:int = 0;
      
      public function UiUserStoryVoting(param1:SymbolUserStoryVotingGeneric, param2:Function)
      {
         _votingStars = new Vector.<UiUserStoryVotingStar>();
         super();
         _content = param1;
         _onStarSelected = param2;
         _votingStars.push(new UiUserStoryVotingStar(_content.votingStar1,onVotingStarOver,onVotingStarOut,onVotingStarClick));
         _votingStars.push(new UiUserStoryVotingStar(_content.votingStar2,onVotingStarOver,onVotingStarOut,onVotingStarClick));
         _votingStars.push(new UiUserStoryVotingStar(_content.votingStar3,onVotingStarOver,onVotingStarOut,onVotingStarClick));
         _votingStars.push(new UiUserStoryVotingStar(_content.votingStar4,onVotingStarOver,onVotingStarOut,onVotingStarClick));
         _votingStars.push(new UiUserStoryVotingStar(_content.votingStar5,onVotingStarOver,onVotingStarOut,onVotingStarClick));
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _votingStars.length)
         {
            _votingStars[_loc1_].dispose();
            _loc1_++;
         }
         _votingStars.length = 0;
         _votingStars = null;
      }
      
      private function onVotingStarOver(param1:InteractionEvent) : void
      {
         var _loc3_:int = 0;
         if(_userStoryStars > 0)
         {
            return;
         }
         var _loc4_:UiUserStoryVotingStar = param1.target as UiUserStoryVotingStar;
         var _loc2_:int = _votingStars.indexOf(_loc4_);
         _loc3_ = 0;
         while(_loc3_ < _votingStars.length)
         {
            _votingStars[_loc3_].refresh(_loc3_ <= _loc2_);
            _loc3_++;
         }
      }
      
      private function onVotingStarOut(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_userStoryStars > 0)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _votingStars.length)
         {
            _votingStars[_loc2_].refresh(false);
            _loc2_++;
         }
      }
      
      private function onVotingStarClick(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:UiUserStoryVotingStar = param1.target as UiUserStoryVotingStar;
         _userStoryStars = _votingStars.indexOf(_loc3_) + 1;
         _loc2_ = 0;
         while(_loc2_ < _votingStars.length)
         {
            _votingStars[_loc2_].refresh(_loc2_ < _userStoryStars);
            _loc2_++;
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
      
      public function get userStoryStars() : int
      {
         return _userStoryStars;
      }
   }
}
