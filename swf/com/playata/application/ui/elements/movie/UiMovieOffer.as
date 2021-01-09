package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.Movie;
   import com.playata.application.ui.elements.generic.UiHeadlineTextTooltip;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieOfferGeneric;
   
   public class UiMovieOffer
   {
       
      
      private var _content:SymbolMovieOfferGeneric;
      
      private var _btnStart:UiTextButton;
      
      private var _movieId:int;
      
      private var _callback:Function;
      
      private var _tooltipRewards:UiMovieOfferTooltip;
      
      private var _tooltipSetting:UiHeadlineTextTooltip;
      
      private var _tooltipStat:UiTextTooltip;
      
      private var _tooltipDuration:UiTextTooltip;
      
      public function UiMovieOffer(param1:SymbolMovieOfferGeneric, param2:Function)
      {
         super();
         _content = param1;
         _callback = param2;
         _btnStart = new UiTextButton(param1.btnStartMovie,LocText.current.text("screen/movie_offers/btn_start_movie"),"",onStartMovieClicked);
         _content.txtSetting.autoFontSize = true;
         _tooltipDuration = new UiTextTooltip(param1.tooltipDuration,"");
         _tooltipStat = new UiTextTooltip(param1.tooltipStat,"");
         _tooltipSetting = new UiHeadlineTextTooltip(param1.tooltipSetting);
         _tooltipRewards = new UiMovieOfferTooltip(new InteractiveDisplayObject(param1.rewards));
      }
      
      public function refresh(param1:Movie) : void
      {
         _content.txtSetting.text = LocText.current.text("movie/setting/" + param1.setIdentifier + "/name");
         _content.txtSetting.y = 142 - _content.txtSetting.height;
         _content.txtDuration.text = LocText.current.text("screen/movie_offers/duration",TimeUtil.secondsToStringFormat(param1.duration,"H:m"));
         _content.iconStatCriticalHit.visible = param1.stat == 3;
         _content.iconStatDodgeRating.visible = param1.stat == 4;
         _content.iconStatStamina.visible = param1.stat == 1;
         _content.iconStatStrength.visible = param1.stat == 2;
         _movieId = param1.id;
         _tooltipRewards.refresh(param1);
         _tooltipSetting.title = LocText.current.text("movie/setting/" + param1.setIdentifier + "/name");
         _tooltipSetting.text = LocText.current.text("movie/setting/" + param1.setIdentifier + "/description");
         switch(int(param1.stat) - 1)
         {
            case 0:
               _tooltipStat.text = LocText.current.text("screen/movie_offers/offer_stamina");
               break;
            case 1:
               _tooltipStat.text = LocText.current.text("screen/movie_offers/offer_strength");
               break;
            case 2:
               _tooltipStat.text = LocText.current.text("screen/movie_offers/offer_critical_rating");
               break;
            case 3:
               _tooltipStat.text = LocText.current.text("screen/movie_offers/offer_dodge_rating");
         }
         _tooltipDuration.text = LocText.current.text("screen/movie_offers/duration_tooltip",TimeUtil.secondsToString(param1.duration));
         _content.image.setUriSprite(param1.offerImageUrl,246,287,true,3);
      }
      
      private function onStartMovieClicked(param1:InteractionEvent) : void
      {
      }
      
      public function refreshPanelLocalization() : void
      {
         _btnStart.caption = LocText.current.text("screen/movie_offers/btn_start_movie");
      }
      
      public function dispose() : void
      {
         _tooltipDuration.dispose();
         _tooltipRewards.dispose();
         _tooltipSetting.dispose();
         _tooltipStat.dispose();
         _btnStart.dispose();
         _btnStart = null;
      }
   }
}
