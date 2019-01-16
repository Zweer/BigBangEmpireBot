package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.movie.LeaderboardMovie;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardMovieLineGeneric;
   
   public class UiLeaderboardMovieLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolLeaderboardMovieLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _movie:LeaderboardMovie = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _tooltipMovie:UiLeaderboardMovieTooltip;
      
      private var _tooltipXP:UiTextTooltip = null;
      
      private var _tooltipStatPoints:UiTextTooltip = null;
      
      private var _tooltipPremium:UiTextTooltip = null;
      
      public function UiLeaderboardMovieLine(param1:SymbolLeaderboardMovieLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtCharacterName);
         _tooltipMovie = new UiLeaderboardMovieTooltip(_content.txtName);
         _tooltipXP = new UiTextTooltip(_content.iconRewardXP,"");
         _tooltipStatPoints = new UiTextTooltip(_content.iconRewardStatPoint,"");
         _tooltipPremium = new UiTextTooltip(_content.iconRewardPremium,"");
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      override public function dispose() : void
      {
         _onlinePoint.dispose();
         _onlinePoint = null;
         _tooltipMovie.dispose();
         _tooltipMovie = null;
         _tooltipXP.dispose();
         _tooltipXP = null;
         _tooltipStatPoints.dispose();
         _tooltipStatPoints = null;
         _tooltipPremium.dispose();
         _tooltipPremium = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get movie() : LeaderboardMovie
      {
         return _movie;
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
      
      public function refresh(param1:LeaderboardMovie, param2:int) : void
      {
         _index = param2;
         _movie = param1;
         if(_movie == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtRank.text = LocText.current.formatHugeNumber(_movie.visibleRank);
         _tooltipMovie.refresh(param1);
         if(_movie.visibleRank <= 500)
         {
            updateTooltips(_movie.visibleRank);
            _content.iconRewardPremium.visible = getRewardForRank(_movie.visibleRank,2) > 0;
            _content.iconRewardStatPoint.visible = getRewardForRank(_movie.visibleRank,3) > 0;
            _content.iconRewardXP.visible = getRewardForRank(_movie.visibleRank,4) > 0;
         }
         else
         {
            _content.iconRewardPremium.visible = false;
            _content.iconRewardStatPoint.visible = false;
            _content.iconRewardXP.visible = false;
         }
         _content.txtName.setTextToFit(_movie.title,"...");
         var _loc3_:Boolean = _content.txtCharacterName.setTextToFit(_movie.characterName,"...");
         _content.iconGenderMale.visible = _movie.isCharacterMale;
         _content.iconGenderFemale.visible = _movie.isCharacterFemale;
         _onlinePoint.refresh(_movie.isCharacterOnline,_movie.characterNameWithTitle,!!_loc3_?4:8);
         _content.txtCharacterName.textColor = !!_movie.isPlayer?245728:Number(!!_movie.isMyGuildMember?16711908:14342874);
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
      }
      
      private function updateTooltips(param1:int) : void
      {
         var _loc4_:int = getRewardForRank(param1,4);
         var _loc3_:int = getRewardForRank(param1,3);
         var _loc2_:int = getRewardForRank(param1,2);
         _tooltipXP.text = GameUtil.getXpString(_loc4_);
         _tooltipStatPoints.text = GameUtil.getStatPointString(_loc3_);
         _tooltipPremium.text = GameUtil.getPremiumCurrencyString(_loc2_);
      }
      
      private function getRewardForRank(param1:int, param2:int) : int
      {
         if(param1 <= 1)
         {
            param1 = 1;
         }
         else if(param1 <= 2)
         {
            param1 = 2;
         }
         else if(param1 <= 3)
         {
            param1 = 3;
         }
         else if(param1 <= 10)
         {
            param1 = 10;
         }
         else if(param1 <= 100)
         {
            param1 = 100;
         }
         else if(param1 <= 250)
         {
            param1 = 250;
         }
         else if(param1 <= 500)
         {
            param1 = 500;
         }
         else
         {
            return 0;
         }
         if(param2 == 4)
         {
            return Constants.current.getInt("movie_vote_reward_rank_" + param1 + "_xp");
         }
         if(param2 == 3)
         {
            return Constants.current.getInt("movie_vote_reward_rank_" + param1 + "_statpoints");
         }
         if(param2 == 2)
         {
            return Constants.current.getInt("movie_vote_reward_rank_" + param1 + "_premium");
         }
         return 0;
      }
   }
}
