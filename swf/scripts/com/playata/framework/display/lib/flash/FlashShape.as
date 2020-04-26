package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.NotImplementedException;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class FlashShape extends FlashDisplayObject
   {
       
      
      public var _shape:Shape = null;
      
      protected var _container:Sprite = null;
      
      protected var _color:uint = 16777215;
      
      public function FlashShape(param1:TypedObject, param2:Shape = null)
      {
         if(param2)
         {
            _shape = param2;
         }
         else
         {
            _shape = new Shape();
         }
         _container = new Sprite();
         _container.addChild(_shape);
         super(_container);
         if(param1)
         {
            if(hasSetting("color",param1))
            {
               _color = getColorSetting("color",param1,16777215);
            }
         }
         applySettings(param1);
      }
      
      public static function fromNative(param1:Shape) : FlashShape
      {
         return new FlashShape(null,param1);
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
         redraw();
      }
      
      protected function drawShape(param1:Graphics) : void
      {
         throw new NotImplementedException();
      }
      
      protected function redraw() : void
      {
         var _loc1_:Graphics = _shape.graphics;
         _loc1_.beginFill(_color,1);
         drawShape(_loc1_);
         _loc1_.endFill();
      }
   }
}
