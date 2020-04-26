package com.playata.application.ui.elements.citymap.animations
{
   import visuals.ui.elements.citymap.SymbolCloudsLocation1Generic;
   
   public class SymbolCloudsLocation1Animation implements ICitymapButtonClouds
   {
       
      
      private var _displayObject:SymbolCloudsLocation1Generic = null;
      
      public function SymbolCloudsLocation1Animation(param1:SymbolCloudsLocation1Generic)
      {
         super();
         _displayObject = param1;
      }
      
      public function locked() : void
      {
      }
      
      public function available() : void
      {
      }
      
      public function showing() : void
      {
      }
   }
}
