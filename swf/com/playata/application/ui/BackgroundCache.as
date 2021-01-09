package com.playata.application.ui
{
   import com.playata.framework.display.IDisplayObjectContainer;
   
   public class BackgroundCache
   {
       
      
      private var _imageWidth:int = 0;
      
      private var _imageHeight:int = 0;
      
      private var _imageLow:IDisplayObjectContainer = null;
      
      private var _image:IDisplayObjectContainer = null;
      
      private var _soundUrl:String = null;
      
      private var _allowCustomPosition:Boolean = false;
      
      private var _scaleMode:int = 0;
      
      private var _scaleHeightOffset:int = 0;
      
      public function BackgroundCache(param1:int, param2:int, param3:IDisplayObjectContainer, param4:IDisplayObjectContainer, param5:String, param6:Boolean, param7:int, param8:int)
      {
         super();
         _imageWidth = param1;
         _imageHeight = param2;
         _imageLow = param3;
         _image = param4;
         _soundUrl = param5;
         _allowCustomPosition = param6;
         _scaleMode = param7;
         _scaleHeightOffset = param8;
      }
      
      public function get imageWidth() : int
      {
         return _imageWidth;
      }
      
      public function get imageHeight() : int
      {
         return _imageHeight;
      }
      
      public function get imageLow() : IDisplayObjectContainer
      {
         return _imageLow;
      }
      
      public function get image() : IDisplayObjectContainer
      {
         return _image;
      }
      
      public function get soundUrl() : String
      {
         return _soundUrl;
      }
      
      public function get allowCustomPosition() : Boolean
      {
         return _allowCustomPosition;
      }
      
      public function get scaleMode() : int
      {
         return _scaleMode;
      }
      
      public function get scaleHeightOffset() : int
      {
         return _scaleHeightOffset;
      }
   }
}
