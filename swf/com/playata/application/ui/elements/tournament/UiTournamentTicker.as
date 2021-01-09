package com.playata.application.ui.elements.tournament
{
   import visuals.ui.elements.tournament.SymbolTournamentTickerGeneric;
   
   public class UiTournamentTicker
   {
       
      
      protected var _content:SymbolTournamentTickerGeneric = null;
      
      protected var _elements:Vector.<UiTournamentTickerElement>;
      
      public function UiTournamentTicker(param1:SymbolTournamentTickerGeneric)
      {
         _elements = new Vector.<UiTournamentTickerElement>();
         super();
         _content = param1;
         _content.elements.removeAllChildren();
      }
      
      public static function create(param1:SymbolTournamentTickerGeneric) : UiTournamentTicker
      {
         return new UiTournamentTickerAnimated(param1);
      }
      
      public function dispose() : void
      {
         clear();
      }
      
      public function clear() : void
      {
         stop();
         var _loc3_:int = 0;
         var _loc2_:* = _elements;
         for each(var _loc1_ in _elements)
         {
            _content.elements.removeChild(_loc1_.content);
         }
         _elements = new Vector.<UiTournamentTickerElement>();
      }
      
      public function addElement(param1:String) : void
      {
      }
      
      public function start() : void
      {
      }
      
      public function stop() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _elements;
         for each(var _loc1_ in _elements)
         {
            _loc1_.content.killTweens();
         }
      }
   }
}
