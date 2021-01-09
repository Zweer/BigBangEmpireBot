package com.playata.application.task.assets
{
   public class UriDisplayObjectAssetDefinition
   {
       
      
      public var uri:String = null;
      
      public var width:Number = 0;
      
      public var height:Number = 0;
      
      public var smoothing:Boolean = false;
      
      public var cacheAsBitmap:Boolean = false;
      
      public var ignoreWidthHeight:Boolean = false;
      
      public var allowMovieClipAnimations:Boolean = true;
      
      public var useFadeIn:Boolean = true;
      
      public var onCompleted:Function = null;
      
      public function UriDisplayObjectAssetDefinition()
      {
         super();
      }
      
      public function isValid() : Boolean
      {
         if(!uri)
         {
            return false;
         }
         if(width <= 0)
         {
            return false;
         }
         if(height <= 0)
         {
            return false;
         }
         return true;
      }
      
      public function get cacheKey() : String
      {
         return uri + "_" + width.toString() + "_" + height.toString();
      }
      
      public function get settings() : Object
      {
         var _loc1_:Object = {
            "uri":uri,
            "width":width,
            "height":height,
            "smoothing":smoothing,
            "cacheAsBitmap":cacheAsBitmap,
            "ignoreWidthHeight":ignoreWidthHeight,
            "allowMovieClipAnimations":allowMovieClipAnimations,
            "useFadeIn":useFadeIn,
            "onCompleted":onCompleted,
            "cacheKey":cacheKey
         };
         return _loc1_;
      }
   }
}
