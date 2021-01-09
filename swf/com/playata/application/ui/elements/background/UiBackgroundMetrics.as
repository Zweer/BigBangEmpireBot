package com.playata.application.ui.elements.background
{
   public class UiBackgroundMetrics
   {
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function UiBackgroundMetrics(param1:Number, param2:Number)
      {
         super();
         _width = param1;
         _height = param2;
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function get height() : Number
      {
         return _height;
      }
      
      public function get minX() : Number
      {
         return 900 - width;
      }
      
      public function get minY() : Number
      {
         return 630 - height;
      }
   }
}
