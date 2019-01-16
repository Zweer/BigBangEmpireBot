package com.playata.framework.physics
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.geom.Vector2D;
   import flash.geom.Point;
   
   public interface IPhysicsWorld extends IDisposable
   {
       
      
      function update(param1:Number) : void;
      
      function get id() : String;
      
      function set gravity(param1:Vector2D) : void;
      
      function get gravity() : Vector2D;
      
      function add(param1:IPhysicsObject) : void;
      
      function remove(param1:IPhysicsObject) : void;
      
      function clear(param1:String = null) : void;
      
      function hasObjectUnderPoint(param1:Point, param2:String = null) : Boolean;
      
      function hasObjectUnderCircle(param1:Point, param2:Number, param3:String = null) : Boolean;
      
      function showDebugObjects(param1:Boolean, param2:uint = 0, param3:IDisplayObject = null) : void;
   }
}
