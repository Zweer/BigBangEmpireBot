package com.playata.framework.display
{
   import flash.geom.Point;
   
   public interface IImage extends IDisplayObject
   {
       
      
      function clone() : IImage;
      
      function setTexCoords(param1:int, param2:Number, param3:Number) : void;
      
      function getTexCoords(param1:int, param2:Point = null) : Point;
      
      function set color(param1:uint) : void;
      
      function get color() : uint;
      
      function get texture() : ITexture;
      
      function set texture(param1:ITexture) : void;
      
      function get smoothing() : String;
      
      function set smoothing(param1:String) : void;
   }
}
