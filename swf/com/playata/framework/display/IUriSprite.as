package com.playata.framework.display
{
   import flash.display.BitmapData;
   
   public interface IUriSprite extends ISprite
   {
       
      
      function clone(param1:Function) : IUriSprite;
      
      function get bitmapData() : BitmapData;
      
      function get uri() : String;
      
      function get smoothing() : Boolean;
      
      function get cacheAsBitmap() : Boolean;
      
      function get ignoreWidthHeight() : Boolean;
      
      function get allowMovieClipAnimations() : Boolean;
      
      function get assetName() : String;
      
      function load() : void;
      
      function get isDownloading() : Boolean;
      
      function get isDownloaded() : Boolean;
      
      function get isCompleted() : Boolean;
      
      function get hasFailed() : Boolean;
   }
}
