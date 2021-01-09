package com.playata.framework.display.lib.flash
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.ObjectUtil;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.flash.FlashDisplayUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class FlashUriSprite extends FlashDisplayObjectContainer implements IUriSprite
   {
       
      
      private var _uri:String = null;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var _smoothing:Boolean = false;
      
      private var _cacheAsBitmap:Boolean = false;
      
      private var _ignoreWidthHeight:Boolean = false;
      
      private var _allowMovieClipAnimations:Boolean = true;
      
      private var _isDownloading:Boolean = false;
      
      private var _isDownloaded:Boolean = false;
      
      private var _hasFailed:Boolean = false;
      
      private var _content:Sprite = null;
      
      private var _loader:Loader = null;
      
      private var _isClass:Boolean = false;
      
      private var _onCompleted:Function = null;
      
      private var _contentBytes:ByteArray = null;
      
      public function FlashUriSprite(param1:TypedObject = null)
      {
         if(param1)
         {
            _uri = param1.getString("uri");
            _width = param1.getNumber("width");
            _height = param1.getNumber("height");
            _smoothing = param1.getBoolean("smoothing");
            _cacheAsBitmap = param1.getBoolean("cacheAsBitmap");
            _onCompleted = param1.getFunction("onCompleted");
            _ignoreWidthHeight = param1.getBoolean("ignoreWidthHeight");
            _allowMovieClipAnimations = param1.getBoolean("allowMovieClipAnimations");
         }
         _content = new Sprite();
         super(_content);
      }
      
      private static function smoothMovieClip(param1:MovieClip) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = param1.getChildAt(_loc3_);
            if(_loc2_ is MovieClip)
            {
               smoothMovieClip(_loc2_ as MovieClip);
            }
            else if(_loc2_ is Bitmap)
            {
               (_loc2_ as Bitmap).smoothing = true;
            }
            _loc3_++;
         }
      }
      
      private static function hasFrames(param1:MovieClip) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(param1.totalFrames > 1)
         {
            return true;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = param1.getChildAt(_loc3_);
            if(_loc2_ is MovieClip)
            {
               if(hasFrames(_loc2_ as MovieClip))
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      override public function dispose() : void
      {
      }
      
      public function load() : void
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            _loc4_ = ObjectUtil.instantiateByClassName(uri);
            _loc1_ = null;
            if(_loc4_ is BitmapData)
            {
               _loc2_ = new Bitmap(_loc4_ as BitmapData);
               _loc3_ = new Sprite();
               _loc3_.addChild(_loc2_);
               _loc1_ = _loc3_;
            }
            else
            {
               _loc1_ = _loc4_ as DisplayObjectContainer;
            }
            if(_loc1_ != null)
            {
               _isDownloaded = true;
               _isClass = true;
               if(_width == -1)
               {
                  _width = _loc1_.width;
               }
               else
               {
                  _loc1_.width = _width;
               }
               if(_height == -1)
               {
                  _height = _loc1_.height;
               }
               else
               {
                  _loc1_.height = _height;
               }
               if(_smoothing && _loc1_ is MovieClip)
               {
                  smoothMovieClip(_loc1_ as MovieClip);
               }
               _content.addChild(_loc1_);
               if(_cacheAsBitmap)
               {
                  _content.cacheAsBitmap = true;
               }
               return;
            }
         }
         catch(e:Error)
         {
         }
         _loader = new Loader();
         startLoad();
         _content.addChild(_loader);
      }
      
      public function clone(param1:Function) : IUriSprite
      {
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc4_:FlashUriSprite = new FlashUriSprite();
         _loc4_._uri = _uri;
         _loc4_._width = _width;
         _loc4_._height = _height;
         _loc4_._ignoreWidthHeight = _ignoreWidthHeight;
         _loc4_._allowMovieClipAnimations = _allowMovieClipAnimations;
         _loc4_._cacheAsBitmap = _cacheAsBitmap;
         _loc4_._smoothing = _smoothing;
         _loc4_._isDownloaded = true;
         _loc4_._isDownloading = false;
         _loc4_._isClass = _isClass;
         _loc4_._hasFailed = false;
         _loc4_._onCompleted = param1;
         if(_isClass)
         {
            _loc7_ = ObjectUtil.instantiateByClassName(_uri);
            _loc2_ = null;
            if(_loc7_ is BitmapData)
            {
               _loc3_ = new Bitmap(_loc7_ as BitmapData);
               _loc5_ = new Sprite();
               _loc5_.addChild(_loc3_);
               _loc2_ = _loc5_;
            }
            else
            {
               _loc2_ = _loc7_ as DisplayObjectContainer;
            }
            if(_loc2_ != null)
            {
               _loc4_._content.addChild(_loc2_);
               _loc4_._content.width = _width;
               _loc4_._content.height = _height;
            }
         }
         else if(_loader.content is MovieClip)
         {
            _loc4_.loadFromFromBytes(_contentBytes);
         }
         else
         {
            _loc8_ = _loader.content as Bitmap;
            _loc6_ = new Bitmap();
            _loc6_.bitmapData = _loc8_.bitmapData;
            _loc6_.smoothing = _smoothing;
            _loc4_._content.addChild(_loc6_);
            _loc4_._content.width = _width;
            _loc4_._content.height = _height;
            _loc4_._content.cacheAsBitmap = _cacheAsBitmap;
         }
         if(!(_loader != null && _loader.content is MovieClip))
         {
            if(_loc4_._onCompleted != null)
            {
               _loc4_._onCompleted(_loc4_);
            }
         }
         return _loc4_;
      }
      
      public function get bitmapData() : BitmapData
      {
         if(_loader.content is Bitmap)
         {
            return (_loader.content as Bitmap).bitmapData;
         }
         if(_loader.content is MovieClip)
         {
            return FlashDisplayUtil.getFlashDisplayObjectAsBitmap(_loader.content).bitmapData;
         }
         return null;
      }
      
      public function get uri() : String
      {
         return _uri;
      }
      
      override public function get height() : Number
      {
         if(super.height != 0 || _ignoreWidthHeight)
         {
            return super.height;
         }
         return _height;
      }
      
      override public function get width() : Number
      {
         if(super.width != 0 || _ignoreWidthHeight)
         {
            return super.width;
         }
         return _width;
      }
      
      override public function get alpha() : Number
      {
         if(realLoader)
         {
            return realLoader.alpha;
         }
         return super.alpha;
      }
      
      public function get smoothing() : Boolean
      {
         return _smoothing;
      }
      
      public function get cacheAsBitmap() : Boolean
      {
         return _cacheAsBitmap;
      }
      
      public function get ignoreWidthHeight() : Boolean
      {
         return _ignoreWidthHeight;
      }
      
      public function get allowMovieClipAnimations() : Boolean
      {
         return _allowMovieClipAnimations;
      }
      
      public function get assetName() : String
      {
         if(!_uri)
         {
            return "unknown";
         }
         var _loc1_:int = _uri.lastIndexOf("/");
         if(_loc1_ != -1)
         {
            return _uri.substring(_loc1_ + 1);
         }
         return _uri;
      }
      
      public function get isDownloading() : Boolean
      {
         return _isDownloading;
      }
      
      public function get isDownloaded() : Boolean
      {
         return _isDownloaded;
      }
      
      public function get isCompleted() : Boolean
      {
         return isDownloaded && !isTweening && alpha >= 1;
      }
      
      public function get hasFailed() : Boolean
      {
         return _hasFailed;
      }
      
      public function get realLoader() : Loader
      {
         return _loader;
      }
      
      private function loadFromFromBytes(param1:ByteArray) : void
      {
         _isDownloaded = false;
         _isDownloading = true;
         _loader = new Loader();
         _loader.contentLoaderInfo.addEventListener("complete",completeMovieClipCopy);
         _loader.contentLoaderInfo.addEventListener("ioError",ioErrorHandler);
         _loader.contentLoaderInfo.addEventListener("securityError",securityErrorHandler);
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.allowCodeImport = true;
         _loc2_.imageDecodingPolicy = "onLoad";
         _loader.loadBytes(param1,_loc2_);
         _content.addChild(_loader);
      }
      
      private function startLoad() : void
      {
         _loader.contentLoaderInfo.addEventListener("complete",completeHandler);
         _loader.contentLoaderInfo.addEventListener("ioError",ioErrorHandler);
         _loader.contentLoaderInfo.addEventListener("securityError",securityErrorHandler);
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.imageDecodingPolicy = "onLoad";
         if(UriSprite.checkPolicyFile)
         {
            _loc2_.checkPolicyFile = true;
         }
         var _loc1_:URLRequest = new URLRequest(_uri);
         _loader.load(_loc1_,_loc2_);
         _isDownloading = true;
         Logger.debug("[Asset:" + assetName + "] Loading uri asset: " + _uri);
      }
      
      private function endLoad() : void
      {
         _loader.contentLoaderInfo.removeEventListener("complete",completeHandler);
         _loader.contentLoaderInfo.removeEventListener("ioError",ioErrorHandler);
         _loader.contentLoaderInfo.removeEventListener("securityError",securityErrorHandler);
      }
      
      private function completeHandler(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:Boolean = false;
         var _loc2_:* = null;
         try
         {
            if(_loader.content is MovieClip)
            {
               _contentBytes = _loader.contentLoaderInfo.bytes;
            }
            endLoad();
            if(!_ignoreWidthHeight)
            {
               _loader.content.width = _width;
               _loader.content.height = _height;
            }
            tweenFrom(0.5,{"alpha":0});
            if(_loader.content is Bitmap && _smoothing)
            {
               _loc4_ = Bitmap(_loader.content);
               _loc4_.smoothing = true;
            }
            else if(_loader.content is MovieClip && _smoothing)
            {
               smoothMovieClip(_loader.content as MovieClip);
            }
            if(_loader.content is MovieClip && !_allowMovieClipAnimations)
            {
               _loc3_ = _loader.content as MovieClip;
               _loc5_ = hasFrames(_loc3_);
               if(_loc5_)
               {
                  _loc2_ = FlashDisplayUtil.getFlashDisplayObjectAsBitmap(_loader.content);
                  _content.addChild(_loc2_);
                  _loader.content.visible = false;
                  _cacheAsBitmap = true;
               }
            }
            if(_loader.content is MovieClip)
            {
               addChild(FlashMovieClip.fromNative(_loader.content as MovieClip));
            }
            if(_cacheAsBitmap)
            {
               _content.cacheAsBitmap = true;
            }
            _isDownloading = false;
            _isDownloaded = true;
            if(_onCompleted != null)
            {
               _onCompleted(this);
            }
         }
         catch(e:Error)
         {
            Environment.reportError("FlashUriSprite loading error: " + _uri,null,false,true);
         }
         Logger.debug("[Asset:" + assetName + "] Download OK");
      }
      
      private function completeMovieClipCopy(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc2_:* = null;
         _isDownloaded = true;
         _isDownloading = false;
         if(_loader.content is MovieClip && !_allowMovieClipAnimations)
         {
            _loc3_ = _loader.content as MovieClip;
            _loc4_ = hasFrames(_loc3_);
            if(_loc4_)
            {
               _loc2_ = FlashDisplayUtil.getFlashDisplayObjectAsBitmap(_loader.content);
               _content.addChild(_loc2_);
               _loader.content.visible = false;
               _cacheAsBitmap = true;
            }
         }
         if(_loader.content is MovieClip)
         {
            addChild(FlashMovieClip.fromNative(_loader.content as MovieClip));
         }
         if(_cacheAsBitmap)
         {
            _content.cacheAsBitmap = true;
         }
         endLoad();
         _loader.content.width = _width;
         _loader.content.height = _height;
         if(_onCompleted != null)
         {
            _onCompleted(this);
         }
         Logger.debug("[Asset:" + assetName + "] Copy OK");
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         endLoad();
         _isDownloading = false;
         _hasFailed = true;
         Logger.error("[Asset:" + assetName + "] Download failed -> IO error (" + _uri + "): " + param1.text);
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         endLoad();
         _isDownloading = false;
         _hasFailed = true;
         Logger.error("[Asset:" + assetName + "] Download failed -> security erorr (" + _uri + "): " + param1.text);
      }
   }
}
