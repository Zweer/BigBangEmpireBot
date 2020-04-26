package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.Movie;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiTooltipMovieOfferGeneric;
   
   public class UiMovieOfferTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiTooltipMovieOfferGeneric;
      
      private static var _star1:UiMovieStarTooltipReward;
      
      private static var _star2:UiMovieStarTooltipReward;
      
      private static var _star3:UiMovieStarTooltipReward;
      
      private static var _currentMovie:Movie;
       
      
      private var _movie:Movie;
      
      private var _height:Number;
      
      public function UiMovieOfferTooltip(param1:IInteractiveDisplayObject)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiTooltipMovieOfferGeneric();
            _tooltipContent.title.autoFontSize = true;
            _star1 = new UiMovieStarTooltipReward(_tooltipContent.star1,1);
            _star2 = new UiMovieStarTooltipReward(_tooltipContent.star2,2);
            _star3 = new UiMovieStarTooltipReward(_tooltipContent.star3,3);
         }
         super(param1,_tooltipContent);
      }
      
      override public function onAssigned() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 13;
         if(_currentMovie == _movie)
         {
            return;
         }
         _currentMovie = _movie;
         if(_movie == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.title.text = LocText.current.text("screen/movie_offers/offer_tooltip_title");
         _star1.refresh(_movie.getRewardForStars(1));
         _star2.refresh(_movie.getRewardForStars(2));
         _star3.refresh(_movie.getRewardForStars(3));
         _tooltipContent.fans.txtTitle.text = LocText.current.text("screen/movie_offers/offer_tooltip_fans_title");
         _tooltipContent.fans.txtFans.text = LocText.current.text("screen/movie_offers/offer_tooltip_fans",LocText.current.formatHugeNumber(_movie.fans));
         _tooltipContent.fans.txtInfo.text = LocText.current.text("screen/movie_offers/offer_tooltip_fans_info");
         _tooltipContent.star2.y = _tooltipContent.star1.y + _star1.height + 13;
         _tooltipContent.star3.y = _tooltipContent.star2.y + _star2.height + 13;
         _tooltipContent.fans.y = _tooltipContent.star3.y + _star3.height + 13;
         var _loc2_:Number = _tooltipContent.fans.y + 105;
         _tooltipContent.background.height = _loc2_;
         _height = _loc2_;
      }
      
      public function refresh(param1:Movie) : void
      {
         _movie = param1;
      }
      
      override public function get height() : Number
      {
         return _height * scale;
      }
   }
}
