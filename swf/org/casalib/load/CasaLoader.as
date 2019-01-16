package org.casalib.load
{
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SecurityErrorEvent;
   import flash.system.LoaderContext;
   
   public class CasaLoader extends LoadItem
   {
      
      public static const FLASH_CONTENT_TYPE:String = "application/x-shockwave-flash";
      
      public static const JPEG_CONTENT_TYPE:String = "image/jpeg";
      
      public static const GIF_CONTENT_TYPE:String = "image/gif";
      
      public static const PNG_CONTENT_TYPE:String = "image/png";
       
      
      protected var _context:LoaderContext;
      
      public function CasaLoader(param1:*, param2:LoaderContext = null)
      {
         super(new Loader(),param1);
         this._context = param2;
         this._initListeners(this.loaderInfo);
      }
      
      public function get loader() : Loader
      {
         return this._loadItem as Loader;
      }
      
      public function get content() : DisplayObject
      {
         if(!this.loaded)
         {
            throw new Error("Cannot access an external asset until the SWF has loaded.");
         }
         return this.loader.content;
      }
      
      public function get loaderInfo() : LoaderInfo
      {
         return this._loadItem.contentLoaderInfo;
      }
      
      override public function get bytesTotal() : Number
      {
         return this._loadItem.contentLoaderInfo.bytesTotal == 0 && this.bytesLoaded != 0?Number(Number.POSITIVE_INFINITY):Number(this._loadItem.contentLoaderInfo.bytesTotal);
      }
      
      override public function get bytesLoaded() : uint
      {
         return this._loadItem.contentLoaderInfo.bytesLoaded;
      }
      
      override public function destroy() : void
      {
         this._dispatcher.removeEventListener(Event.INIT,this.dispatchEvent);
         this._dispatcher.removeEventListener(Event.UNLOAD,this.dispatchEvent);
         this._dispatcher.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this._onHttpStatus);
         this._dispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.dispatchEvent);
         super.destroy();
      }
      
      override protected function _load() : void
      {
         this._loadItem.load(this._request,this._context);
      }
      
      override protected function _initListeners(param1:IEventDispatcher) : void
      {
         super._initListeners(param1);
         this._dispatcher.addEventListener(Event.INIT,this.dispatchEvent,false,0,true);
         this._dispatcher.addEventListener(Event.UNLOAD,this.dispatchEvent,false,0,true);
         this._dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS,this._onHttpStatus,false,0,true);
         this._dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.dispatchEvent,false,0,true);
      }
   }
}
