package com.playata.application.ui.elements.tournament
{
   import com.greensock.easing.Linear;
   import visuals.ui.elements.tournament.SymbolTournamentTickerGeneric;
   
   public class UiTournamentTickerAnimated extends UiTournamentTicker
   {
       
      
      private const TICK_SPEED:Number = 50;
      
      private var _currentElement:UiTournamentTickerElement = null;
      
      public function UiTournamentTickerAnimated(param1:SymbolTournamentTickerGeneric)
      {
         super(param1);
      }
      
      override public function clear() : void
      {
         super.clear();
         _currentElement = null;
      }
      
      override public function addElement(param1:String) : void
      {
         if(_elements.length > 0)
         {
            _elements[0].content.txtTicker.htmlText = _elements[0].content.txtTicker.htmlText + (" " + param1);
            _elements[0].content.txtTicker.width = _elements[0].content.txtTicker.textWidth + 5;
            return;
         }
         var _loc2_:UiTournamentTickerElement = new UiTournamentTickerElement(param1);
         _loc2_.offset = Math.ceil(_content.background.width);
         _elements.push(_loc2_);
         _content.elements.addChild(_loc2_.content);
      }
      
      override public function start() : void
      {
         if(_elements.length == 0)
         {
            return;
         }
         var newElement:UiTournamentTickerElement = new UiTournamentTickerElement(_elements[0].content.txtTicker.htmlText);
         newElement.content.txtTicker.width = newElement.content.txtTicker.textWidth + 5;
         newElement.offset = Math.ceil(_content.background.width);
         _elements.push(newElement);
         _content.elements.addChild(newElement.content);
         _currentElement = _elements[0];
         var onUpdateTicker:Function = null;
         var onCompleteTicker:Function = null;
         onUpdateTicker = function():void
         {
            if(_currentElement.content.x < -(_currentElement.content.width - _content.background.width))
            {
               _currentElement = _currentElement == _elements[0]?_elements[1]:_elements[0];
               _currentElement.content.tweenTo(50,{
                  "x":-_currentElement.width,
                  "ease":Linear.easeNone,
                  "onUpdate":onUpdateTicker,
                  "onComplete":onCompleteTicker
               });
            }
         };
         onCompleteTicker = function():void
         {
            var _loc1_:UiTournamentTickerElement = _currentElement == _elements[0]?_elements[1]:_elements[0];
            _loc1_.content.x = _loc1_.offset;
         };
         _currentElement.content.tweenTo(50,{
            "x":-_currentElement.width,
            "ease":Linear.easeNone,
            "onUpdate":onUpdateTicker,
            "onComplete":onCompleteTicker
         });
      }
   }
}
