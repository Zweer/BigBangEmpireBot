package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.IUpdatable;
   
   public class FlashUpdatable
   {
       
      
      private var _updatable:IUpdatable;
      
      public function FlashUpdatable(param1:IUpdatable)
      {
         super();
         _updatable = param1;
      }
      
      public function get updatable() : IUpdatable
      {
         return _updatable;
      }
      
      public function onUpdate(param1:Number) : void
      {
         _updatable.update(param1);
      }
   }
}
