package com.playata.framework.physics
{
   import com.playata.framework.core.IDisposable;
   import flash.geom.Point;
   
   public interface IPhysicsObject extends IDisposable
   {
       
      
      function get id() : String;
      
      function get objectType() : String;
      
      function set world(param1:IPhysicsWorld) : void;
      
      function get world() : IPhysicsWorld;
      
      function update(param1:Number) : void;
      
      function intersectsWithPoint(param1:Point) : Boolean;
      
      function intersectsWithCircle(param1:Point, param2:Number) : Boolean;
   }
}
