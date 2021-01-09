package starling.textures
{
   import flash.display.BitmapData;
   import flash.display3D.textures.TextureBase;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import starling.core.Starling;
   import starling.utils.MathUtil;
   import starling.utils.execute;
   
   class ConcretePotTexture extends ConcreteTexture
   {
      
      private static var sMatrix:Matrix = new Matrix();
      
      private static var sRectangle:Rectangle = new Rectangle();
      
      private static var sOrigin:Point = new Point();
      
      private static var sAsyncUploadEnabled:Boolean = false;
       
      
      private var _textureReadyCallback:Function;
      
      function ConcretePotTexture(param1:flash.display3D.textures.Texture, param2:String, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean = false, param8:Number = 1)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8);
         if(param3 != MathUtil.getNextPowerOfTwo(param3))
         {
            throw new ArgumentError("width must be a power of two");
         }
         if(param4 != MathUtil.getNextPowerOfTwo(param4))
         {
            throw new ArgumentError("height must be a power of two");
         }
      }
      
      static function get asyncUploadEnabled() : Boolean
      {
         return sAsyncUploadEnabled;
      }
      
      static function set asyncUploadEnabled(param1:Boolean) : void
      {
         sAsyncUploadEnabled = param1;
      }
      
      override public function dispose() : void
      {
         base.removeEventListener("textureReady",onTextureReady);
         super.dispose();
      }
      
      override protected function createBase() : TextureBase
      {
         return Starling.context.createTexture(nativeWidth,nativeHeight,format,optimizedForRenderTexture);
      }
      
      override public function uploadBitmapData(param1:BitmapData, param2:* = null) : void
      {
         var _loc4_:* = 0;
         var _loc8_:* = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc9_:BitmapData = null;
         var _loc6_:Boolean = param2 is Function || param2 === true;
         if(param2 is Function)
         {
            _textureReadyCallback = param2 as Function;
         }
         if(param1.width != nativeWidth || param1.height != nativeHeight)
         {
            _loc9_ = new BitmapData(nativeWidth,nativeHeight,true,0);
            _loc9_.copyPixels(param1,param1.rect,sOrigin);
            param1 = _loc9_;
         }
         upload(param1,0,_loc6_);
         if(mipMapping && param1.width > 1 && param1.height > 1)
         {
            _loc4_ = param1.width >> 1;
            _loc8_ = param1.height >> 1;
            _loc5_ = 1;
            _loc3_ = new BitmapData(_loc4_,_loc8_,true,0);
            _loc7_ = sRectangle;
            _loc10_ = sMatrix;
            _loc10_.setTo(0.5,0,0,0.5,0,0);
            while(_loc4_ >= 1 || _loc8_ >= 1)
            {
               _loc7_.setTo(0,0,_loc4_,_loc8_);
               _loc3_.fillRect(_loc7_,0);
               _loc3_.draw(param1,_loc10_,null,null,null,true);
               _loc5_++;
               upload(_loc3_,_loc5_,false);
               _loc10_.scale(0.5,0.5);
               _loc4_ = _loc4_ >> 1;
               _loc8_ = _loc8_ >> 1;
            }
            _loc3_.dispose();
         }
         if(_loc9_)
         {
            _loc9_.dispose();
         }
         setDataUploaded();
      }
      
      override public function get isPotTexture() : Boolean
      {
         return true;
      }
      
      override public function uploadAtfData(param1:ByteArray, param2:int = 0, param3:* = null) : void
      {
         var _loc4_:Boolean = param3 is Function || param3 === true;
         if(param3 is Function)
         {
            _textureReadyCallback = param3 as Function;
            base.addEventListener("textureReady",onTextureReady);
         }
         potBase.uploadCompressedTextureFromByteArray(param1,param2,_loc4_);
         setDataUploaded();
      }
      
      private function upload(param1:BitmapData, param2:uint, param3:Boolean) : void
      {
         if(param3)
         {
            uploadAsync(param1,param2);
            base.addEventListener("textureReady",onTextureReady);
            base.addEventListener("error",onTextureReady);
         }
         else
         {
            potBase.uploadFromBitmapData(param1,param2);
         }
      }
      
      private function uploadAsync(param1:BitmapData, param2:uint) : void
      {
         if(sAsyncUploadEnabled)
         {
            try
            {
               base["uploadFromBitmapDataAsync"](param1,param2);
            }
            catch(error:Error)
            {
               if(error.errorID == 3708 || error.errorID == 1069)
               {
                  sAsyncUploadEnabled = false;
               }
               else
               {
                  throw error;
               }
            }
         }
         if(!sAsyncUploadEnabled)
         {
            setTimeout(base.dispatchEvent,1,new Event("textureReady"));
            potBase.uploadFromBitmapData(param1);
         }
      }
      
      private function onTextureReady(param1:Event) : void
      {
         base.removeEventListener("textureReady",onTextureReady);
         base.removeEventListener("error",onTextureReady);
         execute(_textureReadyCallback,this,param1 as ErrorEvent);
         _textureReadyCallback = null;
      }
      
      private function get potBase() : flash.display3D.textures.Texture
      {
         return base as flash.display3D.textures.Texture;
      }
   }
}
