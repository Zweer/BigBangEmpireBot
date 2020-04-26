package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.ITexture;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class FlashTexture extends FlashObject implements ITexture
   {
      
      private static var _textureInstances:GenericMap = new GenericMap();
       
      
      public var _texture:BitmapData = null;
      
      public function FlashTexture(param1:TypedObject)
      {
         var _loc2_:* = null;
         super();
         if(param1)
         {
            _loc2_ = getStringSetting("name",param1,null);
            _texture = (DisplayCore.getTexture(_loc2_) as FlashTexture)._texture;
         }
      }
      
      public static function fromFlashTexture(param1:BitmapData) : FlashTexture
      {
         if(_textureInstances.exists(param1))
         {
            return _textureInstances.getData(param1);
         }
         var _loc2_:FlashTexture = new FlashTexture(null);
         _loc2_._texture = param1;
         _textureInstances.setData(param1,_loc2_);
         return _loc2_;
      }
      
      public function get frame() : Rectangle
      {
         return _texture.rect;
      }
      
      public function get width() : Number
      {
         return _texture.width;
      }
      
      public function get height() : Number
      {
         return _texture.height;
      }
      
      public function get nativeWidth() : Number
      {
         return _texture.width;
      }
      
      public function get nativeHeight() : Number
      {
         return _texture.height;
      }
      
      public function get scale() : Number
      {
         return 1;
      }
      
      public function dispose() : void
      {
         _texture.dispose();
      }
   }
}
