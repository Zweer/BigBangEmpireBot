package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.ITexture;
   import com.playata.framework.display.ui.Direction;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FlashImage extends FlashDisplayObject implements IImage
   {
       
      
      public var _image:Bitmap = null;
      
      private var _container:Sprite = null;
      
      private var _color:uint = 0;
      
      public function FlashImage(param1:TypedObject, param2:Bitmap = null)
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         if(param2 !== null)
         {
            _image = param2;
         }
         else
         {
            _loc4_ = getStringSetting("texture",param1,null);
            _loc6_ = DisplayCore.getTexture(_loc4_) as FlashTexture;
            if(_loc6_)
            {
               _image = new Bitmap(_loc6_._texture);
            }
            else
            {
               _image = new Bitmap((DisplayCore.getTexture("darkener") as FlashTexture)._texture);
            }
            if(hasSetting("slice3",param1))
            {
               _loc3_ = getTypedObjectSetting("slice3",param1);
               try
               {
                  if(_loc3_.getData("direction") == Direction.HORIZONTAL)
                  {
                     _image.scale9Grid = new Rectangle(_loc3_.getNumber("centerStart"),0,_loc3_.getNumber("centerEnd"),_image.height);
                  }
                  else
                  {
                     _image.scale9Grid = new Rectangle(0,_loc3_.getNumber("centerStart"),_image.width,_loc3_.getNumber("centerEnd"));
                  }
               }
               catch(e:Error)
               {
               }
            }
            else if(hasSetting("slice9",param1))
            {
               _loc5_ = getTypedObjectSetting("slice9",param1);
               _image.scale9Grid = new Rectangle(_loc5_.getNumber("x"),_loc5_.getNumber("y"),_loc5_.getNumber("width"),_loc5_.getNumber("height"));
            }
         }
         _container = new Sprite();
         _container.addChild(_image);
         super(_container);
         interactionEnabled = false;
         applySettings(param1);
      }
      
      public static function fromBitmap(param1:Bitmap) : FlashImage
      {
         var _loc2_:FlashImage = new FlashImage(null,param1);
         return _loc2_;
      }
      
      public static function fromBitmapData(param1:BitmapData) : FlashImage
      {
         var _loc2_:Bitmap = new Bitmap(param1);
         return fromBitmap(_loc2_);
      }
      
      public function clone() : IImage
      {
         var _loc1_:Bitmap = new Bitmap(_image.bitmapData);
         var _loc2_:FlashImage = new FlashImage(null,_loc1_);
         _loc2_.x = this.x;
         _loc2_.y = this.y;
         if(this.pivotX != 0)
         {
            _loc2_.pivotX = this.pivotX;
         }
         if(this.pivotY != 0)
         {
            _loc2_.pivotY = this.pivotY;
         }
         _loc2_.width = this.width;
         _loc2_.height = this.height;
         if(this.scaleX != 1)
         {
            _loc2_.scaleX = this.scaleX;
         }
         if(this.scaleY != 1)
         {
            _loc2_.scaleY = this.scaleY;
         }
         if(this.skewX != 0)
         {
            _loc2_.skewX = this.skewX;
         }
         if(this.skewY != 0)
         {
            _loc2_.skewY = this.skewY;
         }
         _loc2_.alpha = this.alpha;
         _loc2_.visible = this.visible;
         if(this.rotation != 0)
         {
            _loc2_.rotation = this.rotation;
         }
         _loc2_.smoothing = this.smoothing;
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         _image = null;
         _container = null;
         super.dispose();
      }
      
      public function setTexCoords(param1:int, param2:Number, param3:Number) : void
      {
      }
      
      public function getTexCoords(param1:int, param2:Point = null) : Point
      {
         return null;
      }
      
      public function get texture() : ITexture
      {
         return FlashTexture.fromFlashTexture(_image.bitmapData);
      }
      
      public function set texture(param1:ITexture) : void
      {
         if(!param1)
         {
            _image.bitmapData = null;
         }
         else
         {
            _image.bitmapData = (param1 as FlashTexture)._texture;
         }
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
         _image.transform.colorTransform = new ColorTransform(param1 >> 16 & 1,param1 >> 8 & 1,param1 & 1);
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get smoothing() : String
      {
         return !!_image.smoothing?"default":"none";
      }
      
      public function set smoothing(param1:String) : void
      {
         _image.smoothing = param1 == "default";
      }
   }
}
