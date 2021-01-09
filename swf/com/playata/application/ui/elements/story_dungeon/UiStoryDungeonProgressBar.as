package com.playata.application.ui.elements.story_dungeon
{
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonProgressBarGeneric;
   
   public class UiStoryDungeonProgressBar
   {
       
      
      private var _progressBar:SymbolStoryDungeonProgressBarGeneric = null;
      
      public function UiStoryDungeonProgressBar(param1:SymbolStoryDungeonProgressBarGeneric)
      {
         super();
         _progressBar = param1;
         reset();
      }
      
      public function dispose() : void
      {
         _progressBar = null;
      }
      
      public function reset() : void
      {
         _progressBar.fill.x = calculateFillPosition(0);
      }
      
      public function set value(param1:Number) : void
      {
         _progressBar.fill.x = calculateFillPosition(param1);
      }
      
      private function calculateFillPosition(param1:Number) : Number
      {
         var _loc2_:Number = _progressBar.m.x - _progressBar.fill.width;
         var _loc3_:Number = param1 / 100 * _progressBar.m.width;
         return _loc2_ + _loc3_;
      }
   }
}
