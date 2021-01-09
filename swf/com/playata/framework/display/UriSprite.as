package com.playata.framework.display
{
   public class UriSprite
   {
      
      private static var _cache:UriSpriteCache = new UriSpriteCache();
      
      private static var _checkPolicyFile:Boolean = false;
       
      
      public function UriSprite()
      {
         super();
      }
      
      public static function get cache() : UriSpriteCache
      {
         return _cache;
      }
      
      public static function set checkPolicyFile(param1:Boolean) : void
      {
         _checkPolicyFile = param1;
      }
      
      public static function get checkPolicyFile() : Boolean
      {
         return _checkPolicyFile;
      }
      
      public static function setAsChild(param1:IDisplayObjectContainer, param2:String, param3:Number, param4:Number, param5:Boolean = false, param6:int = 1, param7:Function = null, param8:Boolean = false, param9:Boolean = false, param10:Boolean = true) : Boolean
      {
         var _loc11_:* = null;
         try
         {
            if(param1.numChildren == 1)
            {
               _loc11_ = param1.getChildAt(0);
               if(_loc11_ is IUriSprite)
               {
                  if(IUriSprite(_loc11_).uri == param2)
                  {
                     if(param7 != null && IUriSprite(_loc11_).isCompleted)
                     {
                        param7(_loc11_);
                     }
                     var _loc13_:Boolean = false;
                     return _loc13_;
                  }
               }
            }
            param1.removeAllChildren(true);
            param1.addChild(load(param2,param3,param4,param5,param6,param7,param8,param9,param10));
         }
         catch(e:Error)
         {
         }
         return true;
      }
      
      public static function load(param1:String, param2:Number, param3:Number, param4:Boolean = false, param5:int = 1, param6:Function = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = true) : IUriSprite
      {
         var _loc10_:UriSpriteDefinition = new UriSpriteDefinition();
         _loc10_.uri = param1;
         _loc10_.width = param2;
         _loc10_.height = param3;
         _loc10_.smoothing = param4;
         _loc10_.cacheAsBitmap = param7;
         _loc10_.ignoreWidthHeight = param8;
         _loc10_.allowMovieClipAnimations = param9;
         _loc10_.onCompleted = param6;
         return _cache.getUriSprite(_loc10_,param5);
      }
   }
}
