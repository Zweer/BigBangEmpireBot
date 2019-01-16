package com.playata.framework.display
{
   public interface IDisplayObjectContainer extends IDisplayObject
   {
       
      
      function contains(param1:IDisplayObject) : Boolean;
      
      function addChild(param1:IDisplayObject) : IDisplayObject;
      
      function addChildAt(param1:IDisplayObject, param2:int) : IDisplayObject;
      
      function removeChild(param1:IDisplayObject, param2:Boolean = false) : IDisplayObject;
      
      function removeChildAt(param1:int, param2:Boolean = false) : IDisplayObject;
      
      function removeChildByName(param1:String, param2:Boolean = false) : IDisplayObject;
      
      function removeChildren(param1:int = 0, param2:int = -1, param3:Boolean = false) : void;
      
      function removeAllChildren(param1:Boolean = false) : void;
      
      function getChildAt(param1:int) : IDisplayObject;
      
      function getChildByName(param1:String) : IDisplayObject;
      
      function getChildIndex(param1:IDisplayObject) : int;
      
      function setChildIndex(param1:IDisplayObject, param2:int) : void;
      
      function swapChildren(param1:IDisplayObject, param2:IDisplayObject) : void;
      
      function swapChildrenAt(param1:int, param2:int) : void;
      
      function get numChildren() : int;
   }
}
