package com.playata.application.ui.elements.tournament
{
   import visuals.ui.elements.tournament.SymbolTournamentTickerElementGeneric;
   
   public class UiTournamentTickerElement
   {
       
      
      private var _content:SymbolTournamentTickerElementGeneric = null;
      
      private var _offset:Number = 0;
      
      public function UiTournamentTickerElement(param1:String)
      {
         super();
         _content = new SymbolTournamentTickerElementGeneric();
         _content.txtTicker.htmlText = param1;
      }
      
      public function dispose() : void
      {
         _content = null;
      }
      
      public function get content() : SymbolTournamentTickerElementGeneric
      {
         return _content;
      }
      
      public function get width() : Number
      {
         return _content.txtTicker.textWidth + 5;
      }
      
      public function get offset() : Number
      {
         return _offset;
      }
      
      public function set offset(param1:Number) : void
      {
         _offset = param1;
         _content.x = param1;
         _content.y = 2;
      }
   }
}
