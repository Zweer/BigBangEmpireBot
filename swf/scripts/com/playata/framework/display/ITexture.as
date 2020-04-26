package com.playata.framework.display
{
   import com.playata.framework.assets.IAsset;
   import flash.geom.Rectangle;
   
   public interface ITexture extends IAsset
   {
       
      
      function get frame() : Rectangle;
      
      function get width() : Number;
      
      function get height() : Number;
      
      function get nativeWidth() : Number;
      
      function get nativeHeight() : Number;
      
      function get scale() : Number;
   }
}
