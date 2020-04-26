package com.playata.framework.display
{
   import com.playata.framework.display.ui.Direction;
   
   public interface IQuad extends IDisplayObject
   {
       
      
      function setLinearGradient(param1:Direction, param2:uint, param3:uint, param4:Number = 1, param5:Number = 1) : void;
      
      function getVertexColor(param1:int) : uint;
      
      function setVertexColor(param1:int, param2:uint) : void;
      
      function getVertexAlpha(param1:int) : Number;
      
      function setVertexAlpha(param1:int, param2:Number) : void;
      
      function get color() : uint;
      
      function set color(param1:uint) : void;
   }
}
