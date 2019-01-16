package org.casalib.util
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.SimpleButton;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.casalib.core.IDestroyable;
   
   public class DisplayObjectUtil
   {
       
      
      public function DisplayObjectUtil()
      {
         super();
      }
      
      public static function removeChildren(param1:DisplayObject, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(param1 is SimpleButton)
         {
            DisplayObjectUtil._removeButtonStates(param1 as SimpleButton,param2,param3);
            return;
         }
         if(param1 is Loader || !(param1 is DisplayObjectContainer))
         {
            return;
         }
         var _loc4_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         while(_loc4_.numChildren)
         {
            DisplayObjectUtil._checkChild(_loc4_.removeChildAt(0),param2,param3);
         }
      }
      
      public static function getChildren(param1:DisplayObjectContainer) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:int = -1;
         while(++_loc3_ < param1.numChildren)
         {
            _loc2_.push(param1.getChildAt(_loc3_));
         }
         return _loc2_;
      }
      
      public static function getOffsetPosition(param1:DisplayObject) : Point
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         var _loc3_:Point = new Point();
         _loc3_.x = param1.scaleX > 0?Number(_loc2_.left * param1.scaleX * -1):Number(_loc2_.right * param1.scaleX * -1);
         _loc3_.y = param1.scaleY > 0?Number(_loc2_.top * param1.scaleY * -1):Number(_loc2_.bottom * param1.scaleY * -1);
         return _loc3_;
      }
      
      protected static function _removeButtonStates(param1:SimpleButton, param2:Boolean, param3:Boolean) : void
      {
         if(param1.downState != null)
         {
            DisplayObjectUtil._checkChild(param1.downState,param2,param3);
            param1.downState = null;
         }
         if(param1.hitTestState != null)
         {
            DisplayObjectUtil._checkChild(param1.hitTestState,param2,param3);
            param1.hitTestState = null;
         }
         if(param1.overState != null)
         {
            DisplayObjectUtil._checkChild(param1.overState,param2,param3);
            param1.overState = null;
         }
         if(param1.upState != null)
         {
            DisplayObjectUtil._checkChild(param1.upState,param2,param3);
            param1.upState = null;
         }
      }
      
      protected static function _checkChild(param1:DisplayObject, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:IDestroyable = null;
         if(param2 && param1 is IDestroyable)
         {
            _loc4_ = param1 as IDestroyable;
            if(!_loc4_.destroyed)
            {
               _loc4_.destroy();
            }
         }
         if(param3)
         {
            DisplayObjectUtil.removeChildren(param1,param2,param3);
         }
      }
   }
}
