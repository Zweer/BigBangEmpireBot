package com.playata.framework.physics
{
   import com.playata.framework.core.IEnvironmentModule;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.geom.Vector2D;
   
   public interface IPhysicsCore extends IEnvironmentModule
   {
       
      
      function update(param1:Number) : void;
      
      function createWorld(param1:String, param2:Vector2D) : IPhysicsWorld;
      
      function getWorld(param1:String) : IPhysicsWorld;
      
      function get defaultWorld() : IPhysicsWorld;
      
      function registerObject(param1:String, param2:Class) : void;
      
      function createObject(param1:String, param2:String, param3:TypedObject, param4:IPhysicsWorld = null) : IPhysicsObject;
   }
}
