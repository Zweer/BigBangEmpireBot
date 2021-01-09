package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   
   public class UriSpriteDefinition
   {
       
      
      public var uri:String = null;
      
      public var width:Number = 0;
      
      public var height:Number = 0;
      
      public var smoothing:Boolean = false;
      
      public var cacheAsBitmap:Boolean = false;
      
      public var ignoreWidthHeight:Boolean = false;
      
      public var allowMovieClipAnimations:Boolean = true;
      
      public var onCompleted:Function = null;
      
      public function UriSpriteDefinition()
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
      
      public function get settings() : TypedObject
      {
         var _loc1_:TypedObject = new TypedObject({
            "uri":uri,
            "width":width,
            "height":height,
            "smoothing":smoothing,
            "cacheAsBitmap":cacheAsBitmap,
            "ignoreWidthHeight":ignoreWidthHeight,
            "allowMovieClipAnimations":allowMovieClipAnimations,
            "onCompleted":onCompleted,
            "cacheKey":cacheKey
         });
         return _loc1_;
      }
   }
}
