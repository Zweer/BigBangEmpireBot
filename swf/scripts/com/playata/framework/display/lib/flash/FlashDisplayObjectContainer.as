package com.playata.framework.display.lib.flash
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class FlashDisplayObjectContainer extends FlashDisplayObject implements IDisplayObjectContainer
   {
       
      
      var _displayObjectContainer:DisplayObjectContainer = null;
      
      public function FlashDisplayObjectContainer(param1:DisplayObjectContainer)
      {
         _displayObjectContainer = param1;
         super(_displayObjectContainer);
      }
      
      override public function dispose() : void
      {
      }
      
      public function contains(param1:IDisplayObject) : Boolean
      {
         var _loc2_:DisplayObject = FlashDisplayObject.getNativeDisplayObject(param1);
         if(_loc2_)
         {
            return _displayObjectContainer.contains(_loc2_);
         }
         return false;
      }
      
      public function addChild(param1:IDisplayObject) : IDisplayObject
      {
         var _loc2_:DisplayObject = FlashDisplayObject.getNativeDisplayObject(param1);
         if(_loc2_)
         {
            if(_displayObjectContainer.addChild(_loc2_) != null)
            {
               return param1;
            }
         }
         return null;
      }
      
      public function addChildAt(param1:IDisplayObject, param2:int) : IDisplayObject
      {
         var _loc3_:DisplayObject = FlashDisplayObject.getNativeDisplayObject(param1);
         if(_loc3_)
         {
            if(_displayObjectContainer.addChildAt(_loc3_,param2) != null)
            {
               return param1;
            }
         }
         return null;
      }
      
      public function removeChild(param1:IDisplayObject, param2:Boolean = false) : IDisplayObject
      {
         var _loc3_:DisplayObject = FlashDisplayObject.getNativeDisplayObject(param1);
         if(_loc3_)
         {
            if(_displayObjectContainer.removeChild(_loc3_) != null)
            {
               return param1;
            }
         }
         return null;
      }
      
      public function removeChildAt(param1:int, param2:Boolean = false) : IDisplayObject
      {
         var _loc3_:DisplayObject = _displayObjectContainer.removeChildAt(param1);
         if(_loc3_)
         {
            if(FlashDisplayObject.LOOKUP_DO.exists(_loc3_))
            {
               return FlashDisplayObject.LOOKUP_DO.getData(_loc3_);
            }
         }
         return null;
      }
      
      public function removeChildByName(param1:String, param2:Boolean = false) : IDisplayObject
      {
         var _loc3_:IDisplayObject = getChildByName(param1);
         if(_loc3_)
         {
            removeChild(_loc3_,param2);
         }
         return this;
      }
      
      public function removeChildren(param1:int = 0, param2:int = -1, param3:Boolean = false) : void
      {
         _displayObjectContainer.removeChildren(param1,param2);
      }
      
      public function removeAllChildren(param1:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         _loc4_ = 0;
         while(_loc4_ < _displayObjectContainer.numChildren)
         {
            _loc3_.push(_displayObjectContainer.getChildAt(_loc4_));
            _loc4_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _displayObjectContainer.removeChild(_loc2_);
         }
      }
      
      public function getChildAt(param1:int) : IDisplayObject
      {
         var _loc2_:DisplayObject = null;
         try
         {
            _loc2_ = _displayObjectContainer.getChildAt(param1);
         }
         catch(e:Error)
         {
            var _loc4_:* = null;
            return _loc4_;
         }
         if(_loc2_)
         {
            if(FlashDisplayObject.LOOKUP_DO.exists(_loc2_))
            {
               return FlashDisplayObject.LOOKUP_DO.getData(_loc2_);
            }
         }
         return null;
      }
      
      public function getChildByName(param1:String) : IDisplayObject
      {
         var _loc2_:DisplayObject = _displayObjectContainer.getChildByName(param1);
         if(_loc2_)
         {
            if(FlashDisplayObject.LOOKUP_DO.exists(_loc2_))
            {
               return FlashDisplayObject.LOOKUP_DO.getData(_loc2_);
            }
         }
         return null;
      }
      
      public function getChildIndex(param1:IDisplayObject) : int
      {
         var _loc2_:DisplayObject = FlashDisplayObject.getNativeDisplayObject(param1);
         if(_loc2_)
         {
            try
            {
               var _loc4_:* = _displayObjectContainer.getChildIndex(_loc2_);
               return _loc4_;
            }
            catch(e:Error)
            {
               var _loc5_:int = -1;
               return _loc5_;
            }
            return -1;
         }
         return -1;
      }
      
      public function setChildIndex(param1:IDisplayObject, param2:int) : void
      {
         _displayObjectContainer.setChildIndex(FlashDisplayObject.getNativeDisplayObject(param1),param2);
      }
      
      public function swapChildren(param1:IDisplayObject, param2:IDisplayObject) : void
      {
         _displayObjectContainer.swapChildren(FlashDisplayObject.getNativeDisplayObject(param1),FlashDisplayObject.getNativeDisplayObject(param2));
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         _displayObjectContainer.swapChildrenAt(param1,param2);
      }
      
      public function get numChildren() : int
      {
         return _displayObjectContainer.numChildren;
      }
   }
}
