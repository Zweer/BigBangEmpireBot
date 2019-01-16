package spine.flash
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import spine.atlas.AtlasPage;
   import spine.atlas.AtlasRegion;
   import spine.atlas.TextureLoader;
   
   public class FlashTextureLoader implements TextureLoader
   {
       
      
      public var bitmapDatas:Object;
      
      public var singleBitmapData:BitmapData;
      
      public function FlashTextureLoader(param1:Object)
      {
         var _loc4_:* = undefined;
         var _loc3_:* = null;
         bitmapDatas = {};
         super();
         if(param1 is BitmapData)
         {
            singleBitmapData = BitmapData(param1);
            return;
         }
         if(param1 is Bitmap)
         {
            singleBitmapData = Bitmap(param1).bitmapData;
            return;
         }
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for(var _loc2_ in param1)
         {
            _loc4_ = param1[_loc2_];
            if(_loc4_ is BitmapData)
            {
               _loc3_ = BitmapData(_loc4_);
            }
            else if(_loc4_ is Bitmap)
            {
               _loc3_ = Bitmap(_loc4_).bitmapData;
            }
            else
            {
               throw new ArgumentError("Object for path \"" + _loc2_ + "\" must be a Bitmap or BitmapData: " + _loc4_);
            }
            bitmapDatas[_loc2_] = _loc3_;
         }
      }
      
      public function loadPage(param1:AtlasPage, param2:String) : void
      {
         var _loc3_:BitmapData = singleBitmapData || bitmapDatas[param2];
         if(!_loc3_)
         {
            throw new ArgumentError("BitmapData not found with name: " + param2);
         }
         param1.rendererObject = _loc3_;
         param1.width = _loc3_.width;
         param1.height = _loc3_.height;
      }
      
      public function loadRegion(param1:AtlasRegion) : void
      {
      }
      
      public function unloadPage(param1:AtlasPage) : void
      {
         BitmapData(param1.rendererObject).dispose();
      }
   }
}
