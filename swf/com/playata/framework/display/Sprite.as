package com.playata.framework.display
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.display.ui.controls.ITextField;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Sprite extends com.playata.framework.display.DisplayObject implements ISprite
   {
       
      
      protected var _scrollRect:Rectangle = null;
      
      protected var _scrollRectMask:IQuad = null;
      
      protected var _sprite:ISprite;
      
      public function Sprite(param1:Object = null, param2:ISprite = null)
      {
         var _loc3_:TypedObject = param1 is TypedObject?param1 as TypedObject:new TypedObject(param1);
         if(param2)
         {
            _sprite = param2;
            _sprite.applySettings(new TypedObject({"wrapper_instance":this}));
         }
         else
         {
            if(!_loc3_)
            {
               _loc3_ = TypedObject.empty;
            }
            _loc3_.setData("wrapper_instance",this);
            _sprite = DisplayObjectFactory.createSpriteFromSettings(_loc3_);
         }
         super(_sprite);
      }
      
      public function setTextFieldGlow(param1:ITextField, param2:uint, param3:Number = 0, param4:Number = 0) : void
      {
      }
      
      public function setRoundedMask(param1:IDisplayObject, param2:Vector.<String>, param3:Number = 15) : void
      {
         var _loc5_:flash.display.Sprite = FlashDisplayObject.getNativeDisplayObject(this) as flash.display.Sprite;
         var _loc4_:flash.display.Sprite = FlashDisplayObject.getNativeDisplayObject(param1) as flash.display.Sprite;
         _loc4_.visible = false;
         var _loc6_:flash.display.Sprite = new flash.display.Sprite();
         _loc6_.graphics.lineStyle(0,0,0);
         _loc6_.graphics.beginFill(0,1);
         _loc6_.graphics.drawRoundRect(0,0,_loc4_.width,_loc4_.height,param3,param3);
         _loc6_.graphics.endFill();
         _loc6_.x = _loc4_.x;
         _loc6_.y = _loc4_.y;
         _loc5_.addChild(_loc6_);
         var _loc8_:flash.display.DisplayObject = null;
         var _loc10_:int = 0;
         var _loc9_:* = param2;
         for each(var _loc7_ in param2)
         {
            _loc8_ = _loc5_.getChildByName(_loc7_);
            if(_loc8_)
            {
               _loc8_.mask = _loc6_;
            }
         }
      }
      
      public function set scrollRect(param1:Rectangle) : void
      {
         _scrollRect = param1;
         if(!_scrollRectMask)
         {
            if(param1.width === 0)
            {
               param1.width = 0.01;
            }
            if(param1.height === 0)
            {
               param1.height = 0.01;
            }
            _scrollRectMask = DisplayObjectFactory.createQuadFromSettings({
               "x":param1.x,
               "y":param1.y,
               "width":param1.width,
               "height":param1.height
            });
            this.addChild(_scrollRectMask);
            this.mask = _scrollRectMask;
         }
         _scrollRectMask.x = param1.x;
         _scrollRectMask.y = param1.y;
         _scrollRectMask.width = param1.width;
         _scrollRectMask.height = param1.height;
      }
      
      public function get scrollRect() : Rectangle
      {
         return _scrollRect;
      }
      
      public function setUriSprite(param1:String, param2:Number, param3:Number, param4:Boolean = false, param5:int = 1, param6:Function = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = true) : Boolean
      {
         return UriSprite.setAsChild(this,param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function get centerPoint() : Point
      {
         return new Point(x + width / 2,y + height / 2);
      }
      
      override public function get width() : Number
      {
         if(_scrollRectMask)
         {
            return _scrollRectMask.width;
         }
         return _sprite.width;
      }
      
      override public function get height() : Number
      {
         if(_scrollRectMask)
         {
            return _scrollRectMask.height;
         }
         return _sprite.height;
      }
      
      public function contains(param1:IDisplayObject) : Boolean
      {
         return _sprite.contains(param1);
      }
      
      public function addChild(param1:IDisplayObject) : IDisplayObject
      {
         return _sprite.addChild(param1);
      }
      
      public function addChildAt(param1:IDisplayObject, param2:int) : IDisplayObject
      {
         return _sprite.addChildAt(param1,param2);
      }
      
      public function removeChild(param1:IDisplayObject, param2:Boolean = false) : IDisplayObject
      {
         return _sprite.removeChild(param1,param2);
      }
      
      public function removeChildAt(param1:int, param2:Boolean = false) : IDisplayObject
      {
         return _sprite.removeChildAt(param1,param2);
      }
      
      public function removeChildByName(param1:String, param2:Boolean = false) : IDisplayObject
      {
         return _sprite.removeChildByName(param1,param2);
      }
      
      public function removeChildren(param1:int = 0, param2:int = -1, param3:Boolean = false) : void
      {
         _sprite.removeChildren(param1,param2,param3);
      }
      
      public function getChildAt(param1:int) : IDisplayObject
      {
         return _sprite.getChildAt(param1);
      }
      
      public function getChildByName(param1:String) : IDisplayObject
      {
         return _sprite.getChildByName(param1);
      }
      
      public function getChildIndex(param1:IDisplayObject) : int
      {
         return _sprite.getChildIndex(param1);
      }
      
      public function setChildIndex(param1:IDisplayObject, param2:int) : void
      {
         _sprite.setChildIndex(param1,param2);
      }
      
      public function swapChildren(param1:IDisplayObject, param2:IDisplayObject) : void
      {
         _sprite.swapChildren(param1,param2);
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         _sprite.swapChildrenAt(param1,param2);
      }
      
      public function get numChildren() : int
      {
         return _sprite.numChildren;
      }
      
      public function removeAllChildren(param1:Boolean = false) : void
      {
         return _sprite.removeAllChildren(param1);
      }
   }
}
