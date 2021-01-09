package com.playata.framework.display.layout
{
   public interface ILayout
   {
       
      
      function get appWidth() : uint;
      
      function set appWidth(param1:uint) : void;
      
      function get appHeight() : uint;
      
      function set appHeight(param1:uint) : void;
      
      function get appDefaultWidth() : uint;
      
      function get appDefaultHeight() : uint;
      
      function get allowResize() : Boolean;
      
      function get keepAspectRatio() : Boolean;
      
      function get scaleMode() : LayoutScaleMode;
      
      function get activeVariation() : String;
      
      function set activeVariation(param1:String) : void;
      
      function get variations() : Vector.<String>;
      
      function get orientation() : Orientation;
      
      function onOrientationChanging(param1:Orientation) : Boolean;
      
      function onOrientationChange(param1:Orientation) : void;
   }
}
