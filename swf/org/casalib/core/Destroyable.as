package org.casalib.core
{
   public class Destroyable implements IDestroyable
   {
       
      
      protected var _isDestroyed:Boolean;
      
      public function Destroyable()
      {
         super();
      }
      
      public function get destroyed() : Boolean
      {
         return this._isDestroyed;
      }
      
      public function destroy() : void
      {
         this._isDestroyed = true;
      }
   }
}
