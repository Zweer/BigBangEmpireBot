package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.MovieVoteItem;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class UiMovieVoteItem
   {
       
      
      protected var _container:SymbolMovieItemGeneric = null;
      
      protected var _tooltip:UiTextTooltip = null;
      
      public function UiMovieVoteItem(param1:SymbolMovieItemGeneric)
      {
         super();
         _container = param1;
         _tooltip = new UiTextTooltip(_container,"");
         _container.itemPos.removeAllChildren();
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function set movieVotes(param1:int) : void
      {
         var _loc2_:MovieVoteItem = new MovieVoteItem(param1);
         _container.itemPos.removeAllChildren();
         _container.itemPos.addChild(_loc2_.icon);
         _tooltip.text = _loc2_.name + "\n\n" + _loc2_.description;
      }
   }
}
