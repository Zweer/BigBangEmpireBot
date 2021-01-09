package org.casalib.load
{
   import flash.display.AVM1Movie;
   import flash.display.MovieClip;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import org.casalib.util.ClassUtil;
   
   public class SwfLoad extends CasaLoader
   {
       
      
      protected var _classRequest:Class;
      
      public function SwfLoad(param1:*, param2:LoaderContext = null)
      {
         super(param1,param2);
      }
      
      public function get contentAsMovieClip() : MovieClip
      {
         if(this.loaderInfo.contentType != CasaLoader.FLASH_CONTENT_TYPE)
         {
            throw new Error("Cannot convert content to a MovieClip.");
         }
         return this.content as MovieClip;
      }
      
      public function get contentAsAvm1Movie() : AVM1Movie
      {
         if(this.loaderInfo.contentType != CasaLoader.FLASH_CONTENT_TYPE)
         {
            throw new Error("Cannot convert content to an AVM1Movie.");
         }
         return this.content as AVM1Movie;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(!this.loaded)
         {
            throw new Error("Cannot access an external asset until the SWF has loaded.");
         }
         return this.loaderInfo.applicationDomain.getDefinition(param1);
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         if(!this.loaded)
         {
            throw new Error("Cannot access an external asset until the SWF has loaded.");
         }
         return this.loaderInfo.applicationDomain.hasDefinition(param1);
      }
      
      public function getClassByName(param1:String) : Class
      {
         return this.getDefinition(param1) as Class;
      }
      
      public function createClassByName(param1:String, param2:Array = null) : *
      {
         param2 = param2 || new Array();
         param2.unshift(this.getClassByName(param1));
         return ClassUtil.construct.apply(null,param2);
      }
      
      override protected function _load() : void
      {
         if(this._classRequest == null)
         {
            this._loadItem.load(this._request,this._context);
         }
         else
         {
            this._loadItem.loadBytes(new this._classRequest() as ByteArray,this._context);
         }
      }
      
      override protected function _createRequest(param1:*) : void
      {
         if(param1 is Class)
         {
            this._classRequest = param1;
         }
         else
         {
            super._createRequest(param1);
         }
      }
   }
}
