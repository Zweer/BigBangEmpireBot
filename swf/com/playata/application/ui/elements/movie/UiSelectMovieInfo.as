package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.Movie;
   import com.playata.application.ui.elements.generic.button.UiTextWithIconButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieSelectGeneric;
   
   public class UiSelectMovieInfo
   {
       
      
      private var _content:SymbolMovieSelectGeneric;
      
      private var _tooltip:UiTextTooltip;
      
      private var _cover:UiMovieCover;
      
      private var _coverLayer:InteractiveDisplayObject;
      
      private var _movie:Movie;
      
      private var _btnSelect:UiTextWithIconButton;
      
      private var _selectCallback:Function;
      
      public function UiSelectMovieInfo(param1:SymbolMovieSelectGeneric, param2:Function)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content.cover,"");
         _selectCallback = param2;
         _cover = new UiMovieCover(_content.cover);
         _coverLayer = new InteractiveDisplayObject(_content.cover);
         _coverLayer.onInteractionOver.add(onOver);
         _content.txtDateCaption.text = LocText.current.text("dialog/movie_history/date_caption");
         _content.txtSetCaption.text = LocText.current.text("dialog/movie_history/set_caption");
         _btnSelect = new UiTextWithIconButton(param1.btnSelect,LocText.current.text("dialog/select_movie/btnSelect"),"",onClickSelect,_content.btnSelect.checked);
         param1.addChild(_btnSelect);
      }
      
      private function onClickSelect(param1:InteractionEvent) : void
      {
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         _content.bringToTop();
      }
      
      public function get content() : SymbolMovieSelectGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Movie, param2:Boolean) : void
      {
         _movie = param1;
         _content.txtDate.text = param1.dateTime;
         _content.txtSet.text = LocText.current.text("movie/setting/" + param1.setIdentifier + "/name");
         _tooltip.text = param1.title;
         if(param2)
         {
            _btnSelect.caption = LocText.current.text("dialog/select_movie/btnSelected");
            _btnSelect.buttonEnabled = false;
            _content.btnSelect.checked.visible = true;
         }
         else
         {
            _btnSelect.caption = LocText.current.text("dialog/select_movie/btnSelect");
            _btnSelect.buttonEnabled = true;
            _content.btnSelect.checked.visible = false;
         }
         _cover.showWithSettings(param1.coverSettings);
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
      }
      
      public function get rotation() : Number
      {
         return _content.cover.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         _content.cover.rotation = param1;
      }
      
      public function get movie() : Movie
      {
         return _movie;
      }
   }
}
